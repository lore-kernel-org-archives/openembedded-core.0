Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 006E061756
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PQKw4RKNz4c
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582322244;
	bh=GeFUJJI1bnZxqtl8BqKZ37hRTJBTzVrG/6vdaf4aRb8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jgAg4zzihekrlOhpu2NLYDs6wwPHU9+eYUDZFaU9spQMhOLReeueVAcc4EofgY/UE
	pPEZ+MOiT65FDwPXPHfDBvZ5EADM9WN8zkhnlS4xOjjtwhU9QGPeS0cS0rTija3e5G
	/NbUJVuHmDDBbUPTQ7rc7rkaB2JtnEbl0wi4y5Efo0i0eedV5hINCzbfDLvTImHAmR
	KvoyTIfUuND7gXa3Uq4hKaeqt4eWO7zh9z6f2CTkpOW4aaJXBvNlUGSdCK3oUVCVX6
	EwdpktjwLLRKUYSYXENvNBheymOfzv9lrdvrpREtuuymZ+XyTik4esNuf8IEkImN4j
	FuiZVAKjgagJsIfvR3l8P4WmM+1OK0Gm4858kjMqwdqhXIZzvpAyy7cP4pD5U22WLq
	UqHRB9B6ToHYu1sjJ4jwN+qWhE6KvQxhxdOjusWZvKMSNvH0fmClWkT+jfHH7Mrg/i
	9BCdVB1luNArGMWrZW/giiopwFg9OThGBuW3VPtkPDjk0T7vxobnEtzmm2zDxzN/4h
	TwoODXb1Bnd31TGhwYitAuFq2t2xk3vtgvH8M4WoKMuVlAkcQ5vhZ3+5J93DlhiU4L
	Gr/1hk6G9nS8hhczvUD+3cS2ZHHbmfBnG0F+4pyY0CZTH0cerUspVwdSoBZJXVMSJ7
	LRmVpZJ3zfx/NLf1xbhFtaIE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:57:23 +0200
Message-Id: <20200221215723.4233-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221215723.4233-1-bunk@stusta.de>
References: <20200221215723.4233-1-bunk@stusta.de>
Subject: [warrior][PATCH 2/2] libxml2: Fix CVE-2019-20388
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
X-List-Received-Date: Fri, 21 Feb 2020 21:57:24 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

see:
https://gitlab.gnome.org/GNOME/libxml2/merge_requests/68

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libxml/libxml2/CVE-2019-20388.patch       | 37 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch b/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
new file mode 100644
index 0000000000..4ee2d4fe62
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
@@ -0,0 +1,37 @@
+From 7ffcd44d7e6c46704f8af0321d9314cd26e0e18a Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Tue, 20 Aug 2019 16:33:06 +0800
+Subject: [PATCH] Fix memory leak in xmlSchemaValidateStream
+
+When ctxt->schema is NULL, xmlSchemaSAXPlug->xmlSchemaPreRun
+alloc a new schema for ctxt->schema and set vctxt->xsiAssemble
+to 1. Then xmlSchemaVStart->xmlSchemaPreRun initialize
+vctxt->xsiAssemble to 0 again which cause the alloced schema
+can not be freed anymore.
+
+Found with libFuzzer.
+
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/libxml2/commit/7ffcd44d7e6c46704f8af0321d9314cd26e0e18a]
+CVE: CVE-2019-20388
+
+Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ xmlschemas.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/xmlschemas.c b/xmlschemas.c
+index 301c8449..39d92182 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -28090,7 +28090,6 @@ xmlSchemaPreRun(xmlSchemaValidCtxtPtr vctxt) {
+     vctxt->nberrors = 0;
+     vctxt->depth = -1;
+     vctxt->skipDepth = -1;
+-    vctxt->xsiAssemble = 0;
+     vctxt->hasKeyrefs = 0;
+ #ifdef ENABLE_IDC_NODE_TABLES_TEST
+     vctxt->createIDCNodeTables = 1;
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 618f307214..ab47a50c56 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
            file://fix-CVE-2019-19956.patch \
            file://CVE-2020-7595.patch \
+           file://CVE-2019-20388.patch \
            "
 
 SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-- 
2.17.1


