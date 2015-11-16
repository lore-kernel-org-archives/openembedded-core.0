Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B96DB76E04
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 09:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAG98KZ9031920 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 09:08:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lRCR7Ku6F2Qk
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 09:08:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAG98SQR031924
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 09:08:39 GMT
Message-ID: <1447664908.21491.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 09:08:28 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Correct gcc-cross dependency
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
X-List-Received-Date: Mon, 16 Nov 2015 09:08:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The dependency listed in layer.conf is incorrect, gcc-cross DEPENDS
on ${TARGET_PREFIX}libc-for-gcc, not virtual/libc. These happen to
resolve the same values however they may not always both be built.

The result of this was that gcc-cross gets a different task hash
depending on whether virtual/libc was included in the build.
Specifically "bitbake m4" and "bitbake virtual/kernel" would result
in different task checksums.

The fix is to use the correct dependency name.

[YOCTO #8692]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9773632..82d9c41 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -41,7 +41,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  gcc-cross-${TARGET_ARCH}->virtual/libc \
+  gcc-cross-${TARGET_ARCH}->virtual/${TARGET_PREFIX}libc-for-gcc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
   ppp-dialin->ppp \
   resolvconf->bash \



