Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5156FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 23:45:38 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l126so16045085wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EXxpiuSiojQMUWUthGrdVeUdEdzPQB9Qf9qOVvSKhx8=;
	b=pE2T1hImINY7cEYjiiuuKGcT1+V3vpva/JnEoWex3fBtzq/GEuh4ROM0nn7DdEW2AU
	dsER3ySoB3IoanZgS++c2qhND2fA44o/PphrbkwxKF28Z+e1KBBBd57CibZpVfTE6yZ+
	2ZROUtNKWlrydnG1WMmydcSkoAqXPyPsN5N4iwJgoM4Okq1JGp8i8r6sXJsEFXjMIDtN
	Fhl8qsG5j0+1ohe2e5UJPhwD2IvpPGy341gOrCFOTv3dbaW5zSguAEovaAosxl8Opw6r
	+SuasLFOy7T18wvUzI9aPLwzGjBLW3lnHrjNsQvN2FFM7ifiWOtFVSwTjQXWzc1o6ZmG
	dQQQ==
X-Received: by 10.28.128.65 with SMTP id b62mr7547647wmd.97.1450223138616;
	Tue, 15 Dec 2015 15:45:38 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	197sm23120867wmt.19.2015.12.15.15.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 15:45:37 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Dec 2015 16:45:27 -0700
Message-Id: <1450223127-21699-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] buildhistory-collect-srcrevs: hide empty sections
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 23:45:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/buildhistory-collect-srcrevs | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 58a2708..f3eb76b 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -18,7 +18,9 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import os, sys
+import collections
+import os
+import sys
 import optparse
 import logging
 
@@ -65,16 +67,13 @@ def main():
     else:
         forcevariable = ''
 
-    lastdir = ''
+    all_srcrevs = collections.defaultdict(list)
     for root, dirs, files in os.walk(options.buildhistory_dir):
         if '.git' in dirs:
             dirs.remove('.git')
         for fn in files:
             if fn == 'latest_srcrev':
                 curdir = os.path.basename(os.path.dirname(root))
-                if lastdir != curdir:
-                    print('# %s' % curdir)
-                    lastdir = curdir
                 fullpath = os.path.join(root, fn)
                 pn = os.path.basename(root)
                 srcrev = None
@@ -98,11 +97,20 @@ def main():
                             name = splitval[0].split('_')[1].strip()
                             srcrevs[name] = value
                 if srcrev and (options.reportall or srcrev != orig_srcrev):
-                    print('SRCREV_pn-%s%s = "%s"' % (pn, forcevariable, srcrev))
+                    all_srcrevs[curdir].append((pn, None, srcrev))
                 for name, value in srcrevs.items():
                     orig = orig_srcrevs.get(name, orig_srcrev)
                     if options.reportall or value != orig:
-                        print('SRCREV_%s_pn-%s%s = "%s"' % (name, pn, forcevariable, value))
+                        all_srcrevs[curdir].append((pn, name, srcrev))
+
+    for curdir, srcrevs in sorted(all_srcrevs.iteritems()):
+        if srcrevs:
+            print('# %s' % curdir)
+            for pn, name, srcrev in srcrevs:
+                if name:
+                    print('SRCREV_%s_pn-%s%s = "%s"' % (name, pn, forcevariable, srcrev))
+                else:
+                    print('SRCREV_pn-%s%s = "%s"' % (pn, forcevariable, srcrev))
 
 
 if __name__ == "__main__":
-- 
2.2.1


