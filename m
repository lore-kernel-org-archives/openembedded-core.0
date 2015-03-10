Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA12739CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:11:06 +0000 (UTC)
Received: by igdh15 with SMTP id h15so29035826igd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PGjfCFP9jhDKMhI6dp2YIwXTrpmzJsdDUHngw8N0HZk=;
	b=jBkkrm+Yq2Ik6Mfoqc6An9fny9WiQ2ezTgN0Qs2tlCSi2At7jSOohxAfV6woJlAJF9
	LncZdGyh0Dyh0wJfnXMpTJU6vM+g5YTMgbQfHcQaZIVKeJAFP5kCvEuJ+VKvNUPJxgbv
	oSeSaXPvW+Yup0pGEVeWI7ayds8aAddgKr1ICo7ypeNtH4l9xAf9lYqyC/Ob0baYAxzR
	UhyrSFiZ57Domo7WPacS2geTIKrvmDlwVC9zTDzG4brYfLOvgMFOrN5r14TR3Xb/ytZr
	uR7TKp7fT3cnHMhuxxW8SoL2qa007MJediCdR8PyX0wjbjtRcPznL7gRej1WW/F1mbSD
	rJvg==
X-Gm-Message-State: ALoCoQki7FUgSr75tWGDTJbG/JJQXmrYoyP/nMACLPqhsqT0PwGigD3eaXZOPWBMS4V7KVT/ubxX
X-Received: by 10.43.69.68 with SMTP id yb4mr21141633icb.96.1425982267535;
	Tue, 10 Mar 2015 03:11:07 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8F5CE.dip0.t-ipconnect.de.
	[93.232.245.206])
	by mx.google.com with ESMTPSA id k9sm225110ige.6.2015.03.10.03.11.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 03:11:06 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 11:10:49 +0100
Message-Id: <1425982249-17652-3-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
References: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH 2/2] combo-layer: exclude files
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
X-List-Received-Date: Tue, 10 Mar 2015 10:11:06 -0000

Some combined repos intentionally do not include certain files.
For example, Poky does not include bitbake's setup files and
OE-core's sample files under meta/conf.

When these files get modified in the upstream repository, applying the
patches fails and requires manual intervention. That is merely a
nuisance for someone familiar with the problem, but a real show
stopper when having the import run automatically or by someone less
experienced.

Therefore this change introduces "file_exclude", a new per-repo list
of file patterns which removes all matching files when initializing or
updating a combined repository. Because fnmatch is used under the hood
to match full path strings, removing entire directories must be done
with a pattern ending in a '/*' (in contrast to file_filter).

For Poky, the additional configuration looks like this:

[bitbake]
...
file_exclude = classes/base.bbclass
	conf/bitbake.conf
	.gitignore
	MANIFEST.in
	setup.py
	TODO

[openembedded-core]
...
file_exclude = meta/conf/bblayers.conf.sample
	meta/conf/local.conf.sample
	meta/conf/local.conf.sample.extended
	meta/conf/site.conf.sample
---
 scripts/combo-layer              | 41 +++++++++++++++++++++++++++++++++++++++-
 scripts/combo-layer.conf.example | 14 ++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index fb3fb50..b121c99 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -20,6 +20,7 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
+import fnmatch
 import os, sys
 import optparse
 import logging
@@ -208,7 +209,18 @@ def action_init(conf, args):
             else:
                 extract_dir = os.getcwd()
             file_filter = repo.get('file_filter', "")
-            runcmd("git archive %s | tar -x -C %s %s" % (initialrev, extract_dir, file_filter), ldir)
+            files = runcmd("git archive %s | tar -x -v -C %s %s" % (initialrev, extract_dir, file_filter), ldir)
+            exclude_patterns = repo.get('file_exclude', '').split()
+            if exclude_patterns:
+                # Implement file removal by letting tar create the
+                # file and then deleting it in the file system
+                # again. Uses the list of files created by tar (easier
+                # than walking the tree).
+                for file in files.split('\n'):
+                    for pattern in exclude_patterns:
+                        if fnmatch.fnmatch(file, pattern):
+                            os.unlink(os.path.join(extract_dir, file))
+                            break
             if not lastrev:
                 lastrev = runcmd("git rev-parse %s" % initialrev, ldir).strip()
                 conf.update(name, "last_revision", lastrev, initmode=True)
@@ -423,6 +435,33 @@ def action_update(conf, args):
                 runcmd("%s %s %s %s" % (repo['hook'], patch, revlist[count], name))
                 count=count-1
 
+        # Step 3a: Filter out unwanted files and patches.
+        exclude = repo.get('file_exclude', '')
+        if exclude:
+            filter = ['filterdiff', '-p1']
+            for path in exclude.split():
+                filter.append('-x')
+                filter.append(path)
+            for patch in patchlist[:]:
+                filtered = patch + '.tmp'
+                with open(filtered, 'w') as f:
+                    runcmd(filter + [patch], out=f)
+                # Now check for empty patches.
+                if runcmd(['filterdiff', '--list', filtered]):
+                    # Possibly modified.
+                    os.unlink(patch)
+                    os.rename(filtered, patch)
+                else:
+                    # Empty, ignore it. Must also remove from revlist.
+                    fromline = open(patch, 'r').readline()
+                    m = re.match(r'''^From ([0-9a-fA-F]+) .*\n''', fromline)
+                    rev = m.group(1)
+                    logger.debug('skipping empty patch %s = %s' % (patch, rev))
+                    os.unlink(patch)
+                    os.unlink(filtered)
+                    patchlist.remove(patch)
+                    revlist.remove(rev)
+
         # Step 4: write patch list and revision list to file, for user to edit later
         patchlist_file = os.path.join(os.getcwd(), patch_dir, "patchlist-%s" % name)
         repo['patchlist'] = patchlist_file
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 8ad8615..0ef80cb 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -38,6 +38,20 @@ last_revision =
 #   file_filter = src/*.c : only include the src *.c file
 #   file_filter = src/main.c src/Makefile.am : only include these two files
 
+# file_exclude: filter out these file(s)
+# file_exclude = [path] [path] ...
+#
+# Each entry must match a file name. In contrast do file_filter, matching
+# a directory has no effect. To achieve that, use append a * wildcard
+# at the end.
+#
+# Wildcards are applied to the complete path and also match slashes.
+#
+# example:
+#   file_exclude = src/foobar/*  : exclude everything under src/foobar
+#   file_exclude = src/main.c : filter out main.c after including it with file_filter = src/*.c
+#   file_exclude = *~ : exclude backup files
+
 # hook: if provided, the tool will call the hook to process the generated
 #     patch from upstream, and then apply the modified patch to the combo
 #     repo.
-- 
2.1.4


