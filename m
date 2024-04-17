Return-Path: <daniel.klauer@gin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CC6C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:25:02 +0000 (UTC)
Received: from good-out-30.clustermail.de (good-out-30.clustermail.de [212.223.161.5])
 by mx.groups.io with SMTP id smtpd.web11.10457.1713353100289323496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 04:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gin.de, ip: 212.223.161.5, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.5] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.96.1)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1rx3PN-000459-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2024 13:24:57 +0200
Received: from [62.157.191.2] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
	(Exim 4.97.1)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1rx3PN-000000003Ft-2muh
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2024 13:24:57 +0200
Received: from daniel-desktop2.gin-domain.local (10.176.8.60) by
 Win2012-02.gin-domain.local (10.160.128.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.48; Wed, 17 Apr 2024 13:24:57 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cmake.bbclass: Add ${COREBASE}/scripts to CMAKE_FIND_ROOT_PATH
Date: Wed, 17 Apr 2024 13:24:44 +0200
Message-ID: <20240417112444.395440-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.176.8.60]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
X-EsetResult: clean, is OK
X-EsetId: 37303A29342AA850647C64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 11:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198462

${COREBASE}/scripts contains a "git" wrapper disabling fakeroot/pseudo.
This patch allows CMake to find ${COREBASE}/scripts/git instead of
${HOSTTOOLS_DIR}/git. This is needed for git invocations during do_install,
since do_install is a fakeroot task, and otherwise all git commands fail
with "fatal: detected dubious ownership in repository ...".

I don't know how common it is for CMake projects to invoke git during the
install phase intentionally. It's probably more common to do this during
the configure phase. However, the install step may re-run the configure
step, if some dependencies changed.

In my case, this happened in incremental Yocto builds which reran
do_install and repopulated parts of the recipe-sysroot during that,
without first rerunning do_configure or do_compile. One of the dependencies
changed (but only changing a file in some unrelated sub-package of it which
was not even installed into the recipe-sysroot), causing the dependant's
recipe-sysroot to be repopulated during do_install and thus causing the
CMake project to be reconfigured during do_install.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 meta/classes-recipe/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 3d3781ef33..e1c3d7ddb5 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -124,7 +124,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${COREBASE}/scripts ${HOSTTOOLS_DIR} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-- 
2.34.1


