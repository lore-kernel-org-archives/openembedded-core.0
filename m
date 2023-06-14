Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC776EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:43 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7483.1686734982739007222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lnjh7o4E;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-98220bb31c6so84067566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734981; x=1689326981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CbkoFXQf2UksfuopEMjWDmVYrfTXj3OjmWBmPCpyws=;
        b=lnjh7o4E+47uFxyGniXKXBYou6S+1R4obB+ISp4iW38VbQXe+bM/74KxMxDVLjJmmZ
         YD73Uv7OnP2zQjXSyT1x/JRJofmO7FlWuQ1qrdkUI1fzONFBKx1m/qlBTZwsLCqCAIep
         1Kpk23t5q34eHUFJoYkJ3ti5eogZiWrIhZo5EP2R5vJBJkKYTr5MvCJjCaDDoe22PXCI
         un74+dE3Q9KvdGftH2A0M7J9dwp5e4HwT9j73EK2gysBa0HaslnSP9cR2vVBDwUUBaLi
         dg5z2uquKhdshryEba9xAt719DNXOkalX6rbA7SDy13uGXFiymiu4wsT6ozzOhP1SYh9
         VMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734981; x=1689326981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CbkoFXQf2UksfuopEMjWDmVYrfTXj3OjmWBmPCpyws=;
        b=aon0vgu7HkxgUBS62IkFH0WuzLbo/2XzRlM8GkP/PSV7R3UDg88QCV5M3xidPTYFfa
         Jgyq5JlSZX8lKc1uuDRN/qRbMyk9Lf1rs8VXfFqSbcAyYYOQL4cVMCaAdKZcbo0YRpDG
         FX05V9skMoGWYJqdsHjnKIbZ71K3elKNDQlHhAZ6G+o3pvP8XIhdgixCN6XzXI24w8qV
         ercNHwXMFsZPjHVLEO3SBDq1eEZG03QphtNS6CTL8IEnpY3+fFo+kbr09P8+Vo9jn5hh
         lMHjpSLd6bNDaTx+58iwy7HxRHHVrx8+adH6phnyqngHpfCw+rszB57SKptQhU10M5No
         w+ZQ==
X-Gm-Message-State: AC+VfDxIVoCzP4i8rsJM5ADLMIqQNyKr5ifsHXYcy5GbwZ0GKxLH3HS6
	HtCRAKED9YxDlalMTYGcCEEcuKDFu4E=
X-Google-Smtp-Source: ACHHUZ4PGRVCGIrk3ECOtpkCbMjoHlJ5hIbA6k24iaAE7S6r/ZSjJxeOFaZyfIsyHCrY11XtIz8e7g==
X-Received: by 2002:a17:907:6e12:b0:977:ab43:731f with SMTP id sd18-20020a1709076e1200b00977ab43731fmr18932184ejc.66.1686734981176;
        Wed, 14 Jun 2023 02:29:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/55] libx11: upgrade 1.8.4 -> 1.8.5
Date: Wed, 14 Jun 2023 11:28:48 +0200
Message-Id: <20230614092918.4065570-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182770

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
index 9058c1844ec..cf2e29471a9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
+SRC_URI[sha256sum] = "e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561"
 
 inherit gettext
 
-- 
2.30.2


