Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B869F65D3E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 00:24:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R0OdDW015406 for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:24:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VNbntCmskNjE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:24:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R0OaBd015403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:24:37 +0100
Message-ID: <1398558271.16672.285.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Apr 2014 01:24:31 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-common/gcc-configure-common: Move gnu-configize to its own shared task
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
X-List-Received-Date: Sun, 27 Apr 2014 00:24:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This command modifies ${S} and can race against other tasks running do_configure and
having the scripts disappear from under them. To avoid this move to its own
task and work on the shared work directory as a common task.

It needs to be a python task to avoid lots of shell exported variables as
dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index d4bdc11..68564a1 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -91,17 +91,20 @@ SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}-${PR}"
 do_fetch[stamp-base] = "${SS}"
 do_unpack[stamp-base] = "${SS}"
 do_patch[stamp-base] = "${SS}"
+do_preconfigure[stamp-base] = "${SS}"
 SSCLEAN = "${TMPDIR}/stamps/work-shared/gcc-[0-9]*-*"
 do_fetch[stamp-base-clean] = "${SSCLEAN}"
 do_unpack[stamp-base-clean] = "${SSCLEAN}"
 do_unpack[umask] = "022"
 do_patch[stamp-base-clean] = "${SSCLEAN}"
+do_preconfigure[stamp-base-clean] = "${SSCLEAN}"
 
 # SW means Shared Work directory
 SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 WORKDIR_task-unpack = "${SW}"
 WORKDIR_task-patch = "${SW}"
+WORKDIR_task-preconfigure = "${SW}"
 
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 7ff1a10..8bd251d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -93,6 +93,13 @@ _EOF
 	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
 }
 
+python do_preconfigure () {
+    import subprocess
+    cmd = d.expand('PATH=${PATH} cd ${S} && gnu-configize')
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+}
+addtask do_preconfigure after do_patch before do_configure
+
 do_configure () {
 	# Setup these vars for cross building only
 	# ... because foo_FOR_TARGET apparently gets misinterpreted inside the
@@ -120,7 +127,7 @@ do_configure () {
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
+
 
 	oe_runconf
 }



