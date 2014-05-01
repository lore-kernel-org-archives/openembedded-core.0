Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D708E61EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 14:40:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41Eefgp002510 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:40:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vxm03UF0INJz
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 15:40:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41Eeko6002513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:40:48 +0100
Message-ID: <1398955240.30460.81.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2014 15:40:40 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Exclude gcc-cross dependencies from checksums
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
X-List-Received-Date: Thu, 01 May 2014 14:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gcc-cross technically depends on the C library however we can use
one toolchain for multiple different tunes within a given architecture.

Manually remove these dependencies so that gcc-cross isn't rebuild with
every tune change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 18609dd..dbcb653 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -31,3 +31,10 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   packagegroup-x11-xserver \
   systemd-serialgetty \
 "
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  gcc-cross-${TARGET_ARCH}->eglibc \
+  gcc-cross-${TARGET_ARCH}->uclibc \
+  gcc-cross-${TARGET_ARCH}->linux-libc-headers \
+"
+



