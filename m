Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6211861780
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PP4L0n7dz4c
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318834;
	bh=TUlP+PDYKQVvEOU99OBVw6kDVLmY1enYJLEBY5ahRxI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lYs3qX/mJ8MqKDgCQBEHyFRH7rDhXi5JYS7SfYtWWYL/XNkAkaTO+Kp6K/XQ4haC0
	V0GfMsN682T6DQgg6+XNOAE4juLJFLDYw6E40pcLjeK80dxBqnuQHlyvLb/r2vnY+H
	4l+Cx8Oxx1UvVVr47ahqaE4rwTRDkqjae3Og0Lsn32dPynxXSp0J6TzSfnIJ9mUhwx
	WMY0sk7Q0TBEXhzjmLiFVNopUeRidpGk4vY3IMW6LZxNClNLg3ZDn60ak2PzyoNLm7
	Ykp7RerET39p7iHogOLjNdY5woVhdetuS3rip8b/SAAV10jjHX/V6rNCmaqTBpCfq0
	O00D11uQuGzrW0AHN5ZCW1TZMWR7CyxE9LigoAVvE8dQf/X7qnozdhV73iwv4CgdvT
	zCGSt4DOMp9RJI6oZidQ8n1dkoo4G3KQRONRsU24mvthTfAIHtc6kuelyIEulwt6a6
	jAGq9GKxfNDYrbjpe85ZaDfc4xPCG3QKtWlBDAjTqlza7L4l9SQRNKxwGaLpvAKOlY
	UzQG7XD+JyqIPyKzeg6Om8uTNgh19BdvwCt3qNQjeWKA9GuX+HKIHzTH5MYlT+9pLK
	2kxnvraM8fxXo46M0ATuZ357/KeJefxY5VhagUUtvGs5+2rNjlzfsYg9e6e0ACGqVe
	djqcSd4SSjln6fLrHCG8cDI0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:00:32 +0200
Message-Id: <20200221210032.3414-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221210032.3414-1-bunk@stusta.de>
References: <20200221210032.3414-1-bunk@stusta.de>
Subject: [zeus][PATCH 2/2] libxml2: Fix CVE-2019-20388
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
X-List-Received-Date: Fri, 21 Feb 2020 21:00:33 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

see:
https://gitlab.gnome.org/GNOME/libxml2/merge_requests/68

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libxml/libxml2/CVE-2019-20388.patch       | 37 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.9.bb     |  1 +
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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
index 5797dd6bee..1d898ab020 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-execution-of-ptests.patch \
            file://Fix-CVE-2019-19956.patch \
            file://CVE-2020-7595.patch \
+           file://CVE-2019-20388.patch \
            "
 
 SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
-- 
2.17.1


