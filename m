Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9596FD16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 16:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8TGiNHD008658 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:44:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eG5anSQfT5Uo
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:44:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8TGiKRJ008654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:44:21 +0100
Message-ID: <1412009093.6893.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Sep 2014 17:44:53 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] meta-environment: Two critical fixes to unbreak toolchains
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
X-List-Received-Date: Mon, 29 Sep 2014 16:45:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Firstly, when multilib builds were being used, the same output files
were used in each case, being overwritten each time due to the fact that
REAL_MULTIMACH_TARGET_SYS has been expanded. Instead of immediate
expansion, just use assignment. This overrides the problematic define
in toolchain-scripts.bbclass but allows the multilib code to work.

Secondly, the target sysroot was being defined incorrectly which
this patch fixes. This was breaking the toolchains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index c6d3bb8..bd90f9f 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -6,14 +6,14 @@ PR = "r8"
 
 EXCLUDE_FROM_WORLD = "1"
 
-REAL_MULTIMACH_TARGET_SYS := "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 inherit toolchain-scripts
 TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
-SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
+SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 inherit cross-canadian
 



