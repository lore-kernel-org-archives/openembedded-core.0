Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F94C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 19:33:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.20059.1658691208690686647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BCt6X5f6;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id b26so13286457wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UTcBgsBHWzaHlnwRdXn+x7k299EoUKvjy+jVqCHtw3Q=;
        b=BCt6X5f6tB+bGKiyd02EvdvkDY/92h04qOIL1IU500xAPz6QCvjXYXQClipbqCCEGa
         ijeymVgm0h+8+Kewtwf/TA7aP5iAmCqRdpXFwp4/3SljQbVeRnrSDLsOAGGHyutte2NZ
         IruVRL23nIIxTMxRP/boBuNdccTSyx3eYYWEK6Uoumwn6jQBYDtmamfMauxvI0eJ42pm
         YpuKq9G+hkTVcUCCisdZvhq1U8EQkLnL8bo/g17ADVgOX2thqHDd/GfjOgYfk2Oeoamu
         YbcBGxLLj5N2OIxSKlw5DR0y/ZrWkRkHGc+ywG7Fj4eJY8TZt4KBhp1FyBfUZGsflWK1
         HzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UTcBgsBHWzaHlnwRdXn+x7k299EoUKvjy+jVqCHtw3Q=;
        b=bldy+m9L7IRo+P39Kzuiqn1xyPyuSQLj3doCoeBX0BibcUbu4Zhd+Yct/05qWbJ+qU
         RyqTtwm0j9VcTE7qnVou5KzzfmfH63+bHAWjLG15msp+Ke/9Fw351XqJiGwcjeLUi17K
         rJ9STwQm3WAuSbR5JmfAa1Ec0A5ee6iBl3RBSoTCiiGQyuolDeHkcCeqErE1Y90+0qtp
         6qlQR62MwSI4KlVB0IeyZArkoM44J66DM3uK/DW8d56tXlq283qP1RbHqDyPk66NBDDh
         q1rwAHQnDp6upwMSfMGZ34xiW2Zy/awTjgdyE/Gwyq5nHKq2/ZaLT7qNzpIBSRAEGNTR
         yvKQ==
X-Gm-Message-State: AJIora8Ijnr1mAEh8FmIdT6nYbZkvTU8F227R4+miu5tAKDMWV4TRCfr
	KgtTyupfciWewKcUHvlHCJLvzAFqq38=
X-Google-Smtp-Source: 
 AGRyM1sHQUhmF9xeMY/Bk1zeyQKPc+nCcAQDGjvZe3EwB4+vkUN6qO5SsB9oNGtz/zPIiY1kPktrpQ==
X-Received: by 2002:a05:6000:178c:b0:21d:b6fe:73be with SMTP id
 e12-20020a056000178c00b0021db6fe73bemr6089656wrg.56.1658691207080;
        Sun, 24 Jul 2022 12:33:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003a30fbde91dsm17398340wms.20.2022.07.24.12.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 12:33:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] kernel.bbclass: pass LD also in savedefconfig
Date: Sun, 24 Jul 2022 21:33:05 +0200
Message-Id: <20220724193305.817056-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724193305.817056-1-Martin.Jansa@gmail.com>
References: <20220724193305.817056-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 19:33:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168465

* similar to:
  https://git.openembedded.org/openembedded-core/commit/?id=66c1f4b0abd3483759f9e4141a80f982eaf8ccfd
  https://git.openembedded.org/openembedded-core/commit/?id=36fe2efc91fec5a52374a2dc4814a69076a2d28e
  but for savedefconfig task
* otherwise with ld-is-gold it will fail with:
  gold linker is not supported as it is not capable of linking the kernel proper.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2036226fb0..3ae5e6c9f9 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -629,7 +629,7 @@ kernel_do_configure() {
 
 do_savedefconfig() {
 	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} savedefconfig
+	oe_runmake -C ${B} LD='${KERNEL_LD}' savedefconfig
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-- 
2.35.1


