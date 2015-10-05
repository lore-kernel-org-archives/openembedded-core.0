Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 23BDE76E4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 19:26:22 +0000 (UTC)
Received: by igxx6 with SMTP id x6so64999185igx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=F93j1BRDMbKc1ST25aLNPTvurXGKlOmOGawD+oOFXvY=;
	b=ng4W9oeM8ILvpNsR8PRsiq7JY57FKkbnV7e2PSVcMjfT8HJud45LUEvINY6u4Sq+c4
	4uty8pkEdHZ9srGtdFU8mqn6EI8tcva+iHXdvWC8RaLKt7xbFuMAmi42Vq0Wy1kEXOZV
	WMPnYgIz8ixNtCez0QW31eMV1Mvsozbg9TbsKE/jrDLHIE5xsyX3fTyyc2JqpEn+oBe1
	Vdy9p4QygxKDTrdAwhbbvw0aonfP/Vj1R8daPi7gau/eoQyuQFqMRY4gdfuL+FawgCAV
	c4FRlmRsGHro9m/J20TZbkUhHQNzwTDMIS5MOB7GeJD2Xq8Nwms5CDkrHDVWp6g4Rr9s
	m6Rw==
X-Received: by 10.50.111.231 with SMTP id il7mr9955560igb.34.1444073182701;
	Mon, 05 Oct 2015 12:26:22 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	10sm10806397ios.28.2015.10.05.12.26.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 12:26:21 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 12:26:11 -0700
Message-Id: <1444073171-31453-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox.inc: remove redundant @DATADIR@ replacement
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
X-List-Received-Date: Mon, 05 Oct 2015 19:26:23 -0000

The busybox defconfig doesn't contain a @DATADIR@ marker, so
the attempt to replace it in do_prepare_config is redundant.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index ed8f9fe..4d4709a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -103,9 +103,8 @@ python () {
 }
 
 do_prepare_config () {
-	sed -e 's#@DATADIR@#${datadir}#g' \
+	sed -e '/CONFIG_STATIC/d' \
 		< ${WORKDIR}/defconfig > ${S}/.config
-	sed -i -e '/CONFIG_STATIC/d' .config
 	echo "# CONFIG_STATIC is not set" >> .config
 	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
 		${S}/.config
-- 
1.9.1


