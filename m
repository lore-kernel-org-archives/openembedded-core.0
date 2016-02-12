Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id CE93A73206
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 08:37:25 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ik10so5966332igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 00:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C9fuPadJMO1mjo/yBYJO+ZH43/B0lqkr5B+a0q2US5Q=;
	b=bNjLKCowM2VCBrejFBUwQZZXaqv9LOS9ljtfRTR08O3d2kQssN27JCzOWfvojfUbYf
	yUsx/6IGMhENA/ghcrg92x/52BV0oT2mHtg+pAlqYWjmsBJPRcqtQeN5TF6XACs3tJOK
	W8jOjaiMSASyBe5IR+fxIVb9eyWdF4iOJ+RU7Fh8n9gzMhQFA5+GHs0bBzGKf3kSuFsk
	HxyENZO/pmrujDWgxJZyFCB8YYeY8vyZYatWHXaeS6rF7ZnBbEuJdMvr/ADhWLQa3Q2l
	Y8JOYuRHmPHhJ+/kRbfGrYlWuVukGqZORcSzwsEVs1QJ35vKqyLznvWJjJ3kFXY2NQyA
	p6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C9fuPadJMO1mjo/yBYJO+ZH43/B0lqkr5B+a0q2US5Q=;
	b=YuUeZe3nd+xJMUHINjXjX8YTEp2Qc1dnVG/jtHBABEwSF3yXVJEkFZPEAKoQaIKQ1R
	OOXrZmAZ+2yXgN9Ffto5GZNnx314ThcqbbRp5J5G7mZjxyjFeqJBg+MkTnpz6cm75muV
	Db9q5XkCwQqmlZc/B2desadF0qr/UyGJ/zItVldSbnCYvStgBFi9C3+v7R8TX4VM4auJ
	TXES3EFb0il9wH+3Y4ESljps7Jn5CaGYZM87S5D3KLLw02uK+l7CgolyELTzpiCKSgu2
	sq+X3Uym63Hq9VnQTRMq1+YkAirdP8dv7Z0spY99RLJKWGSf595OdZEbK62wqpOPVMFa
	eGnQ==
X-Gm-Message-State: AG10YORfsx7JFRt6hO8Nc+i277iHeQdXq//fBPjqpqZSNsOvigS2LwWQxLyEbkoOzumhX7As
X-Received: by 10.50.13.101 with SMTP id g5mr2840381igc.31.1455266245847;
	Fri, 12 Feb 2016 00:37:25 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8D0EA.dip0.t-ipconnect.de.
	[93.232.208.234])
	by smtp.gmail.com with ESMTPSA id yq4sm653833igb.14.2016.02.12.00.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 00:37:25 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 09:37:15 +0100
Message-Id: <1455266235-18240-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6866081.X0YIs6bN8t@peggleto-mobl.ger.corp.intel.com>
References: <6866081.X0YIs6bN8t@peggleto-mobl.ger.corp.intel.com>
Cc: paul.eggleton@intel.com
Subject: [PATCH v2] buildhistory.bbclass: remove out-dated information on request
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
X-List-Received-Date: Fri, 12 Feb 2016 08:37:25 -0000

buildhistory.bbclass by design is incremental: each build adds or
updates information. Information is never removed.

Sometimes it can be useful to reduce the information only to those
recipes that were build during a specific bitbake invocation, for
example when the invocation does a full world build.

This is now possible by setting BUILDHISTORY_RESET as explained in the
modified class. The comment on the variable also mentions the caveats
associated with using this mode.

In this mode, buildhistory.bbclass first moves all existing
information into a temporary directory called "old" inside the build
history directory. There the information is used for the "version
going backwards" QA check. Then when the build is complete and before
(potentially) committing to git, the temporary directory gets deleted.

Because information that has not changed during the build will be
reconstructed during full world rebuilds, a git log will then only
show real updates, additions and removals.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory.bbclass | 60 +++++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3c4647a..b18fb84 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -11,6 +11,29 @@ BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
+
+# Setting this to non-empty will remove the old content of the buildhistory as part of
+# the current bitbake invocation and replace it with information about what was built
+# during the build.
+#
+# This is meant to be used in continuous integration (CI) systems when invoking bitbake
+# for full world builds. The effect in that case is that information about packages
+# that no longer get build also gets removed from the buildhistory, which is not
+# the case otherwise.
+#
+# The advantage over manually cleaning the buildhistory outside of bitbake is that
+# the "version-going-backwards" check still works. When relying on that, be careful
+# about failed world builds: they will lead to incomplete information in the
+# buildhistory because information about packages that could not be built will
+# also get removed. A CI system should handle that by discarding the buildhistory
+# of failed builds.
+#
+# The expected usage is via auto.conf, but passing via the command line also works
+# with: BB_ENV_EXTRAWHITE=BUILDHISTORY_RESET BUILDHISTORY_RESET=1
+BUILDHISTORY_RESET ?= ""
+
+BUILDHISTORY_OLD_DIR = "${BUILDHISTORY_DIR}/${@ "old" if "${BUILDHISTORY_RESET}" else ""}"
+BUILDHISTORY_OLD_DIR_PACKAGE = "${BUILDHISTORY_OLD_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}${SDK_EXT}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/bblayers.conf conf/auto.conf conf/locked-sigs.inc conf/devtool.conf"
@@ -49,6 +72,7 @@ python buildhistory_emit_pkghistory() {
     import errno
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE', True)
 
     class RecipeInfo:
         def __init__(self, name):
@@ -139,7 +163,7 @@ python buildhistory_emit_pkghistory() {
 
     def getlastpkgversion(pkg):
         try:
-            histfile = os.path.join(pkghistdir, pkg, "latest")
+            histfile = os.path.join(oldpkghistdir, pkg, "latest")
             return readPackageInfo(pkg, histfile)
         except EnvironmentError:
             return None
@@ -722,17 +746,35 @@ END
 
 python buildhistory_eventhandler() {
     if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
-        if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
-            bb.note("Writing buildhistory")
-            localdata = bb.data.createCopy(e.data)
-            localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
-            interrupted = getattr(e, '_interrupted', 0)
-            localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
-            bb.build.exec_func("buildhistory_commit", localdata)
+        reset = e.data.getVar("BUILDHISTORY_RESET", True)
+        olddir = e.data.getVar("BUILDHISTORY_OLD_DIR", True)
+        if isinstance(e, bb.event.BuildStarted):
+            if reset:
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
+            if reset:
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


