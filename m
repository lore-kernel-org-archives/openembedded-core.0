Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id E75DA744AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fZ4KMKgXtK6Bv6jSDtunJm1RYDaoD64L327Y6bL27fY=;
	b=1pFOzZpy9CZYdQTox8LjnH49j7
	bKJJ6Cu/KAZgwhfaovoClrXnQpF0WqDWScFvd7rGxCFnwRdPXuME0AS/ohVrBxXnzSCt/+N82iytv
	+NWOIt+iJlm71uL/6p/MCMpJOnTZ+9nH4sq7/5jbWDKpGNH3pp3/cgGYixWYdRidWmMp03qaAEDFf
	gYXvXKSDjZ7q3gVuQvC9Gvw1sEKnnGpKkZC2Dwqs38JpmeUH4ieW5D1Q0t57YvUkHfnh/vP7agt9v
	Y2rpX7Z1Bn08zukblY1oIBq/Xj3wP0tYZXHWlf86CtEz2WeGaX6fwo0e/3NeFk+aXORVhrdQ9QPTp
	Ad+CWBuQ==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1g4kZz-00041T-J2; Tue, 25 Sep 2018 13:28:32 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1g4kZo-0000Dg-0V; Tue, 25 Sep 2018 13:28:20 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 13:28:13 +0300
Message-Id: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.1
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH RFC] insane.bbclass: add buildpaths_cmake and buildpaths_pkgconfig checks
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
X-List-Received-Date: Tue, 25 Sep 2018 10:28:34 -0000

And enable them by default as ERROR_QA. Reason is that
absolute build directory paths in CMake .cmake modules
and in pkg-config .pc files cause recipe builds to escape
their recipe specific sysroots and triggers hard to debug
and timing sensitive build failures. It's better to fail
early.

A failure from sumo version of libical looks like:

ERROR: libical-2.0.0-r0 do_package_qa: QA Issue: CMake module /work/i586-poky-linux/libical/2.0.0-r0/packages-split/libical-dev/usr/lib/cmake/LibIcal/LibIcalTargets-noconfig.cmake contains reference to tmpdir which causes build raceconditions between recipes [buildpaths_cmake]
ERROR: libical-2.0.0-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: libical-2.0.0-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/builder/src/yocto/poky/build/tmp/work/i586-poky-linux/libical/2.0.0-r0/temp/log.do_package_qa.4934
NOTE: recipe libical-2.0.0-r0: task do_package_qa: Failed
ERROR: Task (/home/builder/src/yocto/poky/meta/recipes-support/libical/libical_2.0.0.bb:do_package_qa) failed with exit code '1'

For some reason libical from poky master branch is not affected.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/insane.bbclass | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index eb2d967..a69e3f8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -33,7 +33,8 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
-            license-checksum dev-elf file-rdeps \
+            license-checksum dev-elf file-rdeps buildpaths_cmake \
+            buildpaths_pkgconfig \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -516,9 +517,30 @@ def package_qa_hash_style(path, name, d, elf, messages):
     if has_syms and not sane:
         package_qa_add_message(messages, "ldflags", "No GNU_HASH in the elf binary: '%s'" % path)
 
+QAPATHTEST[buildpaths_cmake] = "package_qa_check_buildpaths_cmake"
+def package_qa_check_buildpaths_cmake(path, name, d, elf, messages):
+    """
+    Check for build paths inside target CMake files which cause build
+    race conditions between recipes sysroots.
+    """
+    if path.lower().endswith(".cmake"):
+        message = "CMake module %s contains reference to tmpdir which causes build raceconditions between recipes" % package_qa_clean_path(path,d)
+        package_qa_check_buildpaths(path, name, d, elf, messages, qacheck="buildpaths_cmake", qamessage=message)
+
+
+QAPATHTEST[buildpaths_pkgconfig] = "package_qa_check_buildpaths_pkgconfig"
+def package_qa_check_buildpaths_pkgconfig(path, name, d, elf, messages):
+    """
+    Check for build paths inside target pkg-config files which cause build
+    race conditions between recipe sysroots.
+    """
+    if path.lower().endswith(".pc"):
+        message = "pkg-config file %s contains reference to tmpdir which causes build raceconditions between recipes" % package_qa_clean_path(path,d)
+        package_qa_check_buildpaths(path, name, d, elf, messages, qacheck="buildpaths_pkgconfig", qamessage=message)
+
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
-def package_qa_check_buildpaths(path, name, d, elf, messages):
+def package_qa_check_buildpaths(path, name, d, elf, messages, qacheck="buildpaths", qamessage=None):
     """
     Check for build paths inside target files and error if not found in the whitelist
     """
@@ -538,7 +560,9 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     with open(path, 'rb') as f:
         file_content = f.read()
         if tmpdir in file_content:
-            package_qa_add_message(messages, "buildpaths", "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
+            if not qamessage:
+                qamessage = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
+            package_qa_add_message(messages, qacheck, qamessage)
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
-- 
1.9.1


