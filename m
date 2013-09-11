Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6D16007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 22:30:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BMhuR4020753 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 23:43:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5U_Uvqjxs3BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 23:43:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BMhpDj020697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 23:43:53 +0100
Message-ID: <1378938601.3484.215.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 23:30:01 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_rpm: Ensure empty strings aren't passed to attemponly rpm code
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
X-List-Received-Date: Wed, 11 Sep 2013 22:30:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If empty strings are passed to the rpm attemptonly code, it breaks. This
ensures we don't do that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index dd5f39a..9caa6f6 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -41,7 +41,7 @@ populate_sdk_rpm () {
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${TARGET_VENDOR}-${TARGET_OS}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_TARGET_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="$(echo '${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}' | tr -d ' ')"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	# We don't need any of these runtime items for the SDK, so
 	# just make the system assume they exist.
@@ -98,7 +98,7 @@ populate_sdk_rpm () {
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}"
 	export INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${SDK_VENDOR}-${SDK_OS}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_HOST_ATTEMPTONLY}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="$(echo '${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}' | tr -d ' ')"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"



