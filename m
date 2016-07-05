Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDEA6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 06:43:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u656hvhk014511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2016 23:43:57 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jul 2016 23:43:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 23:43:51 -0700
Message-ID: <2ca41a5d4552ee1fb239f0e248822fecf762d42e.1467700975.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1467700975.git.liezhi.yang@windriver.com>
References: <cover.1467700975.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] gcc: make sure header path is set correctly
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
X-List-Received-Date: Tue, 05 Jul 2016 06:43:56 -0000
Content-Type: text/plain

From: Anuj Mittal <anujx.mittal@intel.com>

We're setting the native header paths in do_configure_prepend,
and don't need to set them again here.

This results in gcc-target not being able to locate the headers
and not being able to detect glibc version, which in turn
results in SSP support not getting detected even though it's available
in libc.

(From OE-Core master rev: 85630aa894278e7818c867179dc19ca2fbd994fc)

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index d62c15a..9cc0c3f 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -4,7 +4,6 @@ require gcc-configure-common.inc
 EXTRA_OECONF_PATHS = "\
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
-    --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
 "
 
-- 
2.8.0


