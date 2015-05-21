Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id DF9BE60168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 11:22:27 +0000 (UTC)
Received: by wichy4 with SMTP id hy4so10162722wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rq4M/yvLo43/lzKGrTVX50ZL7KbN0dMvOCPDx4dfszI=;
	b=FLNeEokRTQ+D2v0lMZvBXTZZaTTJMEk7k5HdV1tXsznrtGVWLgk3MU2/90cutx/YGi
	ManECymVfCsXx9agxI6T/rdX9YxwdYbA254C2sWFBEwwXfRYqL3Iw/KQnFDpHTFzzwJM
	9sgByOR10JMGs94AEpbWsKQMIAGfKBFhZlHQSGFRQ3LewtQeQ3Kv5qhwMsGUPmLbtjyM
	DpRvClJKWnhmBEC6n1FMk0rOynxPn7TKzSlZaKUksCYqlJUq2HLzQ9TsdUPI0Pam/hUN
	0VY/2hvg19MS53H+1ob9P1kEvbGJEHMnMSOVUviqNy8X6R4OmSzi3RN4qIKu6JwzOUZw
	n0QA==
X-Received: by 10.180.231.41 with SMTP id td9mr51284007wic.69.1432207348269;
	Thu, 21 May 2015 04:22:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id g8sm31632172wjn.18.2015.05.21.04.22.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 04:22:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:22:36 +0200
Message-Id: <1432207356-31191-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [PATCH] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Thu, 21 May 2015 11:22:28 -0000

* it's useful for debugging corrupt squashfs images from mksquashfs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
index d36f0fe..19d555e1 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
@@ -27,11 +27,12 @@ SPDX_S = "${WORKDIR}/squashfs${PV}"
 EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
 
 do_compile() {
-        oe_runmake mksquashfs
+	oe_runmake mksquashfs unsquashfs
 }
 do_install () {
         install -d ${D}${sbindir}
         install -m 0755 mksquashfs ${D}${sbindir}/
+	install -m 0755 unsquashfs ${D}${sbindir}/
 }
 
 ARM_INSTRUCTION_SET = "arm"
-- 
2.4.1


