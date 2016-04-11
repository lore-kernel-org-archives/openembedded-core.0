Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5D66011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3B7TSU0000574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:29 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:15 -0700
Message-ID: <56fdccd83cb59b32fff604cb2ffbc987709a7444.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/14] python3: fix building nativesdk-python3
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:28 -0000
Content-Type: text/plain

From: Juro Bystricky <juro.bystricky@intel.com>

When the class nativesdk.bbclass is inherited, it redefines TARGET_CC_ARCH,
in the case of python3, this enables debug, causing an error while linking.
Since we don't enable debug during configure some functions are not declared.
This patch makes sure we keep debug disabled, fixing the linking errors.

[YOCTO #9357]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index f61d278..4f4e79c 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -61,6 +61,7 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
+SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
 
-- 
2.7.4


