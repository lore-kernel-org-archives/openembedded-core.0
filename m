Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 91A4275D07
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 11:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68BvpBL001350 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 12:57:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SDNNGIYX-XK6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 12:57:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68Bvd13001336
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 12:57:50 +0100
Message-ID: <1436356659.27597.211.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Jul 2015 12:57:39 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Add BUILD_ARCH and SSTATE_PKGARCH to HASHBASE whitelist
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
X-List-Received-Date: Wed, 08 Jul 2015 11:57:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As Chris Larson points out in the bug, "BUILD_ARCH changing doesn't change
native/cross sstate checksums, because its calculated in ${@}, so just its
unexpanded form is in the signature. But BUILD_ARCH ends up included in the
sstate filenames, so changes to BUILD_ARCH will result in rebuilds of
native/cross but not rebuilds of the target recipes which depend on
them, which is just what we want."

However it does mean we can't easily test 32 and 64 bit signatures. In order
to make the tests work, we need to add BUILD_ARCH to the HASHBASE whitelist.
BUILD_ARCH is used in the workdir paths and so on so changing it does still
rebuild when we need it to.

With improvements to function dependency tracking, a dependency on SSTATE_PKGARCH
was also introduced causing problems for 32/64 bit build signature equivalence.
Since this is reflected in the sstate filenames, we can safely whitelist this too.

[YOCTO #5970]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d426ee3..e25cccf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -772,7 +772,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
-    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR"
+    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"



