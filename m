Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E28E471E5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeOdf022768; Wed, 25 Jan 2017 11:40:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k4p_1oyzFZoG; Wed, 25 Jan 2017 11:40:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeL2x022746
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 11:40:22 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWLw5-0001NL-S3; Wed, 25 Jan 2017 11:40:21 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 11:40:17 +0000
Message-Id: <1485344418-5237-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] gcc/gcc-source: Move libcc1 manipulation into gcc-source
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
X-List-Received-Date: Wed, 25 Jan 2017 11:40:26 -0000

Currently there is a race where if you build -cross-canadian without building gcc (target)
you see QA errors about RPATHS. I've tracked this down to this manipulation where the
target gcc recipe changes libcc1 in the shared sources directory. As long as you build
things in the right order, the problem doesn't occur.

Since its changing ${S} move it to gcc-source and avoid the race, saving RP
some head scratching about why unrelated changes failed to build cleanly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 5 +++++
 meta/recipes-devtools/gcc/gcc_5.4.bb     | 6 ------
 meta/recipes-devtools/gcc/gcc_6.3.bb     | 6 ------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 0d0edb5..fab99f2 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -26,6 +26,11 @@ python do_preconfigure () {
     bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
     cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+
+    # Easiest way to stop bad RPATHs getting into the library since we have a
+    # broken libtool here (breaks cross-canadian and target at least)
+    cmd = d.expand("sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure")
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 }
 addtask do_preconfigure after do_patch
 do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"
diff --git a/meta/recipes-devtools/gcc/gcc_5.4.bb b/meta/recipes-devtools/gcc/gcc_5.4.bb
index b0a523c..2c618df 100644
--- a/meta/recipes-devtools/gcc/gcc_5.4.bb
+++ b/meta/recipes-devtools/gcc/gcc_5.4.bb
@@ -6,10 +6,4 @@ require gcc-target.inc
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
 ARM_INSTRUCTION_SET_armv4 = "arm"
 
-do_configure_prepend() {
-	# Easiest way to stop bad RPATHs getting into the library since we have a
-	# broken libtool here
-	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
-}
-
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/gcc_6.3.bb b/meta/recipes-devtools/gcc/gcc_6.3.bb
index b0a523c..2c618df 100644
--- a/meta/recipes-devtools/gcc/gcc_6.3.bb
+++ b/meta/recipes-devtools/gcc/gcc_6.3.bb
@@ -6,10 +6,4 @@ require gcc-target.inc
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
 ARM_INSTRUCTION_SET_armv4 = "arm"
 
-do_configure_prepend() {
-	# Easiest way to stop bad RPATHs getting into the library since we have a
-	# broken libtool here
-	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
-}
-
 BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


