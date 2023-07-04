Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90759EB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.61488.1688484610874961772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5TZBBIqG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-66c729f5618so4630940b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484610; x=1691076610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgLKd3BHo8Wc2WdwhaqKy/RILI8VtkYm1tfFQ8kKnlQ=;
        b=5TZBBIqGj1VnDnyRE3298Coco+UsN2DcPxpRp2M6T9Xmz8rNdKyuoLFA8oB5oSS4ox
         rrueJ5fNBLIRVHOX9Wluo+c9GNqDmAyZO2eUDHQPj1YAfpMAQ0ST/DlzdStGVAfieiMp
         G0xd/Q/kY2ErPcIRnbl1YDJIHg++Jqh9im+RlPuLVLDpm9QzkvVNLWYuUWlOTfHutqSF
         Tiue4J9cgPuamYfT5P9avderp/TxIUbLpPKlc87j58HC9Rgds7c2CBIrO0aRa1at+tnD
         zFYsARwm/qVYnZ6+1ViS456ADMepApy3W18lrp2t3zsnk9JZwZX5cNncZRBO92qDzFvu
         VtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484610; x=1691076610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgLKd3BHo8Wc2WdwhaqKy/RILI8VtkYm1tfFQ8kKnlQ=;
        b=SBD+NPxBZQzdE416aA00uenB0LcQ2LnedwpmSxl0iKBuxWucuTyZSSNc0zTEwsVrau
         CTHqe4fQgRRgL3q2O0HzBcaJxQtYREV3omlsiGh883uhJwD4sJX8J4HWAYgOdChlrUUo
         B/r+GVW44UTm8hEYix6yxBF2f0tpS9BhujxKfN1dY+UD4gEiBAWpORuFBcVURbZ9+DXD
         G0yRq5TD9hNw4RUdWPBionOvV2j1+KYz/6Xvi5RcVK8MipLGrxKJrTfPkNUcAIMoBFON
         uKDcH2zYT1FymZP/rWWhT0SDikswFjIswjWb+ORYxbIZUVVbq7LYox+nb4ZBrlsqdDNM
         w3Og==
X-Gm-Message-State: AC+VfDwZrd1Zr68ANiQtfyUU/6I7uKgXvdcIQuC/DDPSAfIo756p62Iw
	sb9yLgviZ2k/efZDaTdRBZBuoNtK4+4dmLrUpjPwgg==
X-Google-Smtp-Source: ACHHUZ5yK+HzktL548FQZDFREYYdt1n5wSt2Zuip0HC3xFDrZYZpeZyVgCpCaPXNwhShI2FAooDtrg==
X-Received: by 2002:a05:6a20:559:b0:10d:6dc6:32c8 with SMTP id 25-20020a056a20055900b0010d6dc632c8mr14055941pzq.32.1688484609720;
        Tue, 04 Jul 2023 08:30:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/30] sdk.py: error out when moving file fails
Date: Tue,  4 Jul 2023 05:29:17 -1000
Message-Id: <3a195a2da81755c2a030b5b0354ef177d826bdb2.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183850

From: Chen Qi <Qi.Chen@windriver.com>

Instead of printing an error message and continuing, we should just
error out when moving file fails.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12aecd9da94b5f27041982c661e8bab316d365d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 81fcf15371..3dc3672210 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -70,7 +70,7 @@ class Sdk(object, metaclass=ABCMeta):
         #FIXME: using umbrella exc catching because bb.utils method raises it
         except Exception as e:
             bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
-            bb.error("unable to place %s in final SDK location" % sourcefile)
+            bb.fatal("unable to place %s in final SDK location" % sourcefile)
 
     def mkdirhier(self, dirpath):
         try:
-- 
2.34.1


