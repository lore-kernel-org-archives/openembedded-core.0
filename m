Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 490396E245
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:34:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFGXwE0021243 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:33:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gHa1zleaOt94
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:33:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFGXqh0021239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:33:53 GMT
Message-ID: <1387125227.20901.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Dec 2013 16:33:47 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] nativesdk: Set LIBCOVERRIDE to a value
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
X-List-Received-Date: Sun, 15 Dec 2013 16:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

nativesdk was just unsetting LIBCOVERRIDE however that causes some build failures
for xorg-libs which used a libc override. This adds in a mechanism to force
nativesdk to glibc and give the option of allowing another selection like
uclibc if anyone ever does the work to make it operational.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 21a69c7..7f94258 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -4,8 +4,9 @@ EXCLUDE_FROM_WORLD = "1"
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
 
-# we dont want libc-uclibc or libc-glibc to kick in for nativesdk recipes
-LIBCOVERRIDE = ""
+# libc for the SDK can be different to that of the target
+NATIVESDKLIBC ?= "libc-glibc"
+LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-nativesdk"
 
 #



