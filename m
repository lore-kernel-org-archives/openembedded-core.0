Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 08ADA6E9D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 16:46:06 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x13so4140693wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Mar 2014 08:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kd9fDtuStPAwCIhUbonxk02nbIMdEY60bLTF559antc=;
	b=Y8v+92TzI0tWzfUbMWVqwvcaN3YqGPueE9tnQ96NlWoHgsgHvr25ZQzCtYKBusdMgy
	wFUsPJZ4fte3nx1ZVFXwvvDqFeNXmRhi72F0ZQswSpyhVJHB72+NxkHUXWGOtop1Qn3Z
	+jyFZn2WiUDNtUQNrUrUudpSUpVWwkejXForwtWLFzf+F9IcKSAriIv9CadDxS935dHi
	muiM2FzAU7meYmyTXw4JvSS/oYbs3dbQA42HSvJTRSuuOhC3tA9repgHY4F+rkCzoiPl
	UgrwtH/yknJJ3EGzTBBDOUZhJZxppvLSrAKlH/o2/+wRjMjkONquZLmWpk8XpZcthg+r
	ph/A==
X-Gm-Message-State: ALoCoQl7As1kuGo1d6fFsOfdpUhUjDOcuy2o8IhVlhhCvjCsYSKyEj6hMVfsc0TA8pmMBzlOFnKJ
X-Received: by 10.195.12.5 with SMTP id em5mr579220wjd.77.1393951566988;
	Tue, 04 Mar 2014 08:46:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uq2sm54540928wjc.5.2014.03.04.08.46.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 08:46:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 16:46:00 +0000
Message-Id: <1393951562-14251-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] lib/oe: drop custom implementation of oe.path.relative
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
X-List-Received-Date: Tue, 04 Mar 2014 16:46:09 -0000

As we now require Python 2.7 and os.path.relpath() was added in 2.6 we can now
drop the reimplementation in oe.path.

oe.path.relative is simple now a wrapper that changes the order of the arguments
and it's use discouraged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/path.py |   18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 46783f8..413ebfb 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -21,23 +21,7 @@ def relative(src, dest):
     foo/bar
     """
 
-    if hasattr(os.path, "relpath"):
-        return os.path.relpath(dest, src)
-    else:
-        destlist = os.path.normpath(dest).split(os.path.sep)
-        srclist = os.path.normpath(src).split(os.path.sep)
-
-        # Find common section of the path
-        common = os.path.commonprefix([destlist, srclist])
-        commonlen = len(common)
-
-        # Climb back to the point where they differentiate
-        relpath = [ os.path.pardir ] * (len(srclist) - commonlen)
-        if commonlen < len(destlist):
-            # Add remaining portion
-            relpath += destlist[commonlen:]
-
-        return os.path.sep.join(relpath)
+    return os.path.relpath(dest, src)
 
 def make_relative_symlink(path):
     """ Convert an absolute symlink to a relative one """
-- 
1.7.10.4


