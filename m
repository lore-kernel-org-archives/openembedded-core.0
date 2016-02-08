Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id F05AA7328A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 06:57:03 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 9so186567604iom.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Feb 2016 22:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HIguRZe+CVFR9ZkVjWaZFNqPg7fOcy8gvpu4gzUhLpM=;
	b=fUKA8+OfgIzpsaz0WpbJ08Kj9pbtagbHZ4xdTXFPKdCrU8Iuuz05o6LAdg7ekylNC8
	c3Ryb4KS2EP8m4fRR+uJ7FDmhhNQsQaW8c12WbT6OzrxchVwD3sifrVsR1JPRUNV3fqO
	YWwapMr6NA/oN+U1K11w10HKAzMQVolpgo+4aSyVO3AFCkXOTcJ5mJ0b3HcnWXzhRHY5
	62QPAgZC6Mmnky9BLhgAKe7gwKd8WJmsMGyaGgtKjPwi1l9z+cs+jAg8jKv5Wp2KcOcB
	MC9jtv6rm6MvLbm+8zk2lu0YJnbau1uB5Id6vjHXZ1+7gbGgjHi68kTP3mfTQqjMKTyt
	QU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HIguRZe+CVFR9ZkVjWaZFNqPg7fOcy8gvpu4gzUhLpM=;
	b=mMMJCfUXUqNZDZqxwl1YfZtdDfjMav40NMHZr4dvTPookkBUAJHXSRvoyzlR/bUabF
	+c8IWfJLYdw12uCZEcrDeZqwWGLdkWmW7kUwwI5CA6dp2SD1xdb05KH9N30Abpi5TbR6
	qrzLaaZJ6UbTefz0d0eSk1ceeEjF84vVRJGmTZTvi8hqX11CY1JSMNiZ4ZhYTZPwoxTd
	QC8d42hC10rekLC0p2doEw/RSnBDrEAEdUpj1x6qXNer3ZjFcKzVsQMhVfYDxzduvi5i
	LLuEHGF1LpZ5nm58C+mhuaR4QavMYNukREGxkGG6SeAG2E+6clAmNXyr5XMewYD/7x3m
	RqQg==
X-Gm-Message-State: AG10YOS58JB+dWPshJv0e+R080xdHVkyGG7aB/ELro+FvhkeBp66yGLwFm7mPkT+6YLBl2qz
X-Received: by 10.107.186.87 with SMTP id k84mr28188304iof.91.1454914624680;
	Sun, 07 Feb 2016 22:57:04 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A57FB6.dip0.t-ipconnect.de.
	[87.165.127.182]) by smtp.gmail.com with ESMTPSA id
	nq10sm4711949igb.2.2016.02.07.22.57.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 22:57:03 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 07:56:57 +0100
Message-Id: <1454914617-2042-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: paul.eggleton@intel.com
Subject: [PATCH] buildhistory.bbclass: remove out-dated information on request
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
X-List-Received-Date: Mon, 08 Feb 2016 06:57:05 -0000

buildhistory.bbclass by design is incremental: each build adds or
updates information. Information is never removed.

Sometimes it can be useful to reduce the information only to those
recipes that were build during a specific bitbake invocation, for
example when the invocation does a full world build.

This is now possible by invoking bitbake with:
   BB_ENV_EXTRAWHITE=BUILDHISTORY_REMOVE_OLD BUILDHISTORY_REMOVE_OLD=1 bitbake

In this mode, buildhistory.bbclass first moves all existing
information into a temporary directory called "old" inside the build
history directory. There the information is used for the "version
going backwards QA check". Then when the build is complete and before
(potentially) committing to git, the temporary directory gets deleted.

Because information that has not changed during the build will be
reconstructed, a git log will then only show real updates, additions
and removals.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory.bbclass | 43 +++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3c4647a..1fadd2e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -11,6 +11,12 @@ BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
+# Setting this to non-empty will remove the old content of the buildhistory as part of
+# the current bitbake invocation and replace it with information about what was built
+# during the build.
+BUILDHISTORY_REMOVE_OLD ?= ""
+BUILDHISTORY_OLD_DIR = "${BUILDHISTORY_DIR}/${@ "old" if "${BUILDHISTORY_REMOVE_OLD}" else ""}"
+BUILDHISTORY_OLD_DIR_PACKAGE = "${BUILDHISTORY_OLD_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}${SDK_EXT}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/bblayers.conf conf/auto.conf conf/locked-sigs.inc conf/devtool.conf"
@@ -49,6 +55,7 @@ python buildhistory_emit_pkghistory() {
     import errno
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE', True)
 
     class RecipeInfo:
         def __init__(self, name):
@@ -139,7 +146,7 @@ python buildhistory_emit_pkghistory() {
 
     def getlastpkgversion(pkg):
         try:
-            histfile = os.path.join(pkghistdir, pkg, "latest")
+            histfile = os.path.join(oldpkghistdir, pkg, "latest")
             return readPackageInfo(pkg, histfile)
         except EnvironmentError:
             return None
@@ -722,17 +729,35 @@ END
 
 python buildhistory_eventhandler() {
     if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
-        if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
-            bb.note("Writing buildhistory")
-            localdata = bb.data.createCopy(e.data)
-            localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
-            interrupted = getattr(e, '_interrupted', 0)
-            localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
-            bb.build.exec_func("buildhistory_commit", localdata)
+        remove = e.data.getVar("BUILDHISTORY_REMOVE_OLD", True)
+        olddir = e.data.getVar("BUILDHISTORY_OLD_DIR", True)
+        if isinstance(e, bb.event.BuildStarted):
+            if remove:
+                import shutil
+                # Clean up after potentially interrupted build.
+                if os.path.isdir(olddir):
+                    shutil.rmtree(olddir)
+                rootdir = e.data.getVar("BUILDHISTORY_DIR", True)
+                entries = [ x for x in os.listdir(rootdir) if not x.startswith('.') ]
+                bb.utils.mkdirhier(olddir)
+                for entry in entries:
+                    os.rename(os.path.join(rootdir, entry),
+                              os.path.join(olddir, entry))
+        elif isinstance(e, bb.event.BuildCompleted):
+            if remove:
+                import shutil
+                shutil.rmtree(olddir)
+            if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
+                bb.note("Writing buildhistory")
+                localdata = bb.data.createCopy(e.data)
+                localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
+                interrupted = getattr(e, '_interrupted', 0)
+                localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
+                bb.build.exec_func("buildhistory_commit", localdata)
 }
 
 addhandler buildhistory_eventhandler
-buildhistory_eventhandler[eventmask] = "bb.event.BuildCompleted"
+buildhistory_eventhandler[eventmask] = "bb.event.BuildCompleted bb.event.BuildStarted"
 
 
 # FIXME this ought to be moved into the fetcher
-- 
2.1.4


