Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 48ABC75803
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 10:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5JAPPXU012322 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:25:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iUr5X5bz6F43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:25:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5JAPCl1012303
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:25:23 +0100
Message-ID: <1434709512.14710.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jun 2015 11:25:12 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] meta-environment: Ensure we append to the default TOOLCHAIN_NEED_CONFIGSITE_CACHE
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
X-List-Received-Date: Fri, 19 Jun 2015 10:25:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The toolchain-scripts class was changed to assign to the variable using ??=
which allows users to override it. We therefore need to _append instead
of += to have the change take effect as intended.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 5d72e38..49d45f6 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -11,7 +11,7 @@ MODIFYTOS = "0"
 REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 inherit toolchain-scripts
-TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE_append = " zlib"
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"



