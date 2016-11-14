Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24DBD71978
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:34:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAEEY8sH025875
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:34:08 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 14 Nov 2016 06:34:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2016 06:34:03 -0800
Message-ID: <04ded58ccc9845b09f502358a0ef3e362beb8c37.1479133967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479133967.git.liezhi.yang@windriver.com>
References: <cover.1479133967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] populate_sdk_ext.bbclass: use weak assignment for TOOLCHAINEXT_OUTPUTNAME
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
X-List-Received-Date: Mon, 14 Nov 2016 14:34:09 -0000
Content-Type: text/plain

The TOOLCHAINEXT_OUTPUTNAME is different from TOOLCHAIN_OUTPUTNAME, it
is used for eSDK only, so that it doesn't mix with SDK, use "?=" for it
so that other conf file can define it.

If we don't use "?=" here, then we need use forcevariable to redfine it:
TOOLCHAINEXT_OUTPUTNAME_forcevariable = "foo"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a0856d4..2c9def6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -77,7 +77,7 @@ COREBASE_FILES ?= " \
 
 SDK_DIR_task-populate-sdk-ext = "${WORKDIR}/sdk-ext"
 B_task-populate-sdk-ext = "${SDK_DIR}"
-TOOLCHAINEXT_OUTPUTNAME = "${SDK_NAME}-toolchain-ext-${SDK_VERSION}"
+TOOLCHAINEXT_OUTPUTNAME ?= "${SDK_NAME}-toolchain-ext-${SDK_VERSION}"
 TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${TOOLCHAINEXT_OUTPUTNAME}"
 
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
-- 
2.10.2


