Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55F5D6BCDC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 11:00:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8AB0Wqm007474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 04:00:42 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 10 Sep 2019 04:00:09 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2019 19:00:08 +0800
Message-ID: <20190910110008.38639-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] python-numpy: fix build for libn32
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
X-List-Received-Date: Tue, 10 Sep 2019 11:00:51 -0000
Content-Type: text/plain

Fix do_compile failure for libn32. To reproduce, use the following config.

  MACHINE = "qemumips64"
  require conf/multilib.conf
  MULTILIB_GLOBAL_VARIANTS_append = " libn32"
  MULTILIBS ?= "multilib:lib32 multilib:libn32"
  DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
  DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"

The error message is as following.

  numpy/core/include/numpy/npy_common.h:206:10: error: #error Unsupported size for type off_t

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../python-numpy/files/mipsarchn32eb/_numpyconfig.h              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
index 8e2b5d0940..debb390094 100644
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
+++ b/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
@@ -12,6 +12,7 @@
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_NO_SMP 0
 #define NPY_HAVE_DECL_ISNAN
 #define NPY_HAVE_DECL_ISINF
-- 
2.17.1


