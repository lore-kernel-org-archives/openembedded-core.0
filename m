Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 36B79606CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 17:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NH5K3E006567 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:05:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v0BwMBlT1pJL
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:05:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NH5GqH006562
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:05:17 +0100
Message-ID: <1474650316.30475.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 18:05:16 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] buildtools/uninative-tarball: Fix deployment overlap issues
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
X-List-Received-Date: Fri, 23 Sep 2016 17:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We still have problems where deploying SDKMACHINE=i686 can cause removal
of SDKMACHINE=x86_64 artefacts.

The reason is that x86_64 is a BUILD_ARCH as well as an SDK_ARCH and 
the manifest namespaces overlap. To fix this, set PACKAGE_ARCH and 
the stamp-extra-into to include SDK_OS. SDK_OS may not be entirely correct
but it is what sstate.bbclass uses for nativesdk and fixing that is
a separate issue.

This is confirmed to resolve artefact problems on the AB which have been 
delaying a new uninative release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index da18c09..5808c95 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -27,7 +27,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-PACKAGE_ARCH = "${SDK_ARCH}"
+PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
 PACKAGE_ARCHS = ""
 TARGET_ARCH = "none"
 TARGET_OS = "none"
@@ -52,7 +52,7 @@ deltask package
 deltask packagedata
 deltask populate_sysroot
 
-do_populate_sdk[stamp-extra-info] = "${SDKMACHINE}"
+do_populate_sdk[stamp-extra-info] = "${PACKAGE_ARCH}"
 
 REAL_MULTIMACH_TARGET_SYS = "none"
 
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 0dad974..e203a83 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -17,7 +17,7 @@ TOOLCHAIN_HOST_TASK = "\
 INHIBIT_DEFAULT_DEPS = "1"
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-PACKAGE_ARCH = "${SDK_ARCH}"
+PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
 PACKAGE_ARCHS = ""
 TARGET_ARCH = "none"
 TARGET_OS = "none"
@@ -37,7 +37,7 @@ deltask package
 deltask packagedata
 deltask populate_sysroot
 
-do_populate_sdk[stamp-extra-info] = "${SDKMACHINE}"
+do_populate_sdk[stamp-extra-info] = "${PACKAGE_ARCH}"
 
 SDK_DEPENDS += "patchelf-native"
 



