Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 854EB61750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PQKw1LwRz40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582322244;
	bh=FH6jTYYszj6X5BAsBCDaLWl739miMliShyWSPrMUjGM=;
	h=From:To:Subject:Date:From;
	b=oh+rJw1v1SQA1RQBwgEQ7Io2vSp86PVoyRZi3+GgdFwr+dwALCSoYyFoNEP4xNiLm
	oDc2uUCyMGDfsDMNX/MPWHarODcy+CHMlIDLKucu5oJT4fXOru8+FbbM+B+hSVmEj9
	3hLMqTE7/nOYjNig558EHVQ7TghZ13s0YmvXDhWnvyX+Kl7Xz2kj0vQq+uISu0+7bE
	0MNIlFlldsxH8vLBX/Yx8N6unf4AszPBAj0HR3wXGH6HL0/aeBOJWMt0qsir6QvMxS
	8WG2bMzqnzCI1F/CthhbgmDwIddInSU/ejLyCZPfn3TgksO2NQrEWNh4QwMaiwSLLV
	X6/mj5nKrfHClMeurbfJUg0rDYnvfeZ3C1FrdpQsktpOdvvjiKaif0rfN1ZiGk9bH7
	lFBFwoQVjo+k3G2Izr1ZZS9e8AuNW6qhki7yue+Zcgm736nZEthIHW93kf3v+IhvZe
	QQQH5mpb8h3xpdSM30Zh6Q6Mn8hvhPrLgnleiug7+N9IqR/d0tqDWgFbcaydKSjUAU
	WL/E9D4anCiUfSJJeKefw07HsQH176nyOlg2cIJgRzh8I8QNJk0o55QU7fRR1q4wQn
	SV6EBk4D1+CowCF/t4JVjFLe4nE4rjhUJcIyXdUNYTViejbmy1MKg8CakdyupPdUt3
	QIPvJ+a8abMx4ZDO51yP9Ml8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:57:22 +0200
Message-Id: <20200221215723.4233-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH 1/2] libxml2: fix CVE-2020-7595
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
X-List-Received-Date: Fri, 21 Feb 2020 21:57:23 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
new file mode 100644
index 0000000000..facfefd362
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
@@ -0,0 +1,36 @@
+From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Thu, 12 Dec 2019 17:30:55 +0800
+Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
+
+When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
+return NULL which cause a infinite loop in xmlStringLenDecodeEntities
+
+Found with libFuzzer.
+
+Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/0e1a49c89076]
+CVE: CVE-2020-7595
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index d1c31963..a34bb6cd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+     else
+         c = 0;
+     while ((c != 0) && (c != end) && /* non input consuming loop */
+-	   (c != end2) && (c != end3)) {
++           (c != end2) && (c != end3) &&
++           (ctxt->instate != XML_PARSER_EOF)) {
+ 
+ 	if (c == 0) break;
+         if ((c == '&') && (str[1] == '#')) {
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 67c2d4fafb..618f307214 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-CVE-2018-14404.patch \
            file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
            file://fix-CVE-2019-19956.patch \
+           file://CVE-2020-7595.patch \
            "
 
 SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-- 
2.17.1


