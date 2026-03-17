Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7654CFB5E96
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65250.1773705820188542398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VN8SESik;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97b333673eso239856466b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705818; x=1774310618; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPf/V94lFEk6e772LqQe/vDb6RywCzY8qv34drg5/pY=;
        b=VN8SESikBAsI7H/xTTzMDcd++zCMpadA3663xdLrJRXp4GC9Gz2uC7gAf4tOUfmJbq
         /B6R9/ufD89K8BnO2EZ5oZcJn1A4t02Kmjq6V4ltU3jhKDCqWnp4inZf7Vgrhpjvq4NW
         SurBemQzQgcAFfAWohsboQ4j+P9kM6Ki8I9z3xo4Q7v2U5j+KXyqHPkiAvXpqkIDXB7D
         8+1Fg3z7pJJwhYlMICsgAcgSbCbSOIcXbUbfMUZngguiPe93xU4SPiYUsgZB2x0riwdb
         vaeQl3m8LrnrMYJcRk4TR/Amg7bjKHJUgVRjt5F6boD4iuPOnFRm+ITXxpWNV+BGvQVc
         9qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705818; x=1774310618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPf/V94lFEk6e772LqQe/vDb6RywCzY8qv34drg5/pY=;
        b=gz4y0F5txJm8ojEH/NtWTydFi3HwDwvlDREJJZ4T8D5mRpfpACBn746Hd+P4WUv4Ny
         /t3pySsOP6tkk5jVjMIa8yocnbl6t0//TcWqLcoJvLV+KdaXe3FHN7hB+2R9nzQQwkkY
         W2MlvbpMYOS9U7OATQejDdlP/EamGvUFwCmubROy2RN4asAlxYyDBGzKN32LzzhEJY+g
         zCPZvHAuxlmjj7ubqumqfltT7m+WI6x1I/XEn+SspKzd7XniorrsCQIfRfMiGBK4iuoB
         lJBHb/P0SjZAaw4KKRugB4h3MXtHGBe0DrpciIRrmyGopjZrX4lCjZT5b7zC41LiMRJn
         SWgw==
X-Gm-Message-State: AOJu0Yz2n4tdBfEKWTNtWzfTJ/yk5lP/dFkGE+WBFa3tIX6t8sdJYA2O
	sijm3+Czm6lrPKtH4YhnWNG10uUC4cwDBnGTEqEBOhfPlmQXgfRcW5W+
X-Gm-Gg: ATEYQzxSfyg6u/241CmlOwsCf1LovapdKB5EnSAcMyA6hnEm/lpmcC7VkZg7mMWl4Td
	MMlRj1BtR/nCS2Juax53flAa/fisM2SpjlMorHMBmRamV6LlRhVA+9Bq+mDTekmsgmMzvfqLpsP
	nBoCjlOqoRxdmzggtLryuxpSrMkoEB5qgYPn+d16GSaH30YMRCuYIl5FI1Y7Bo9HiD4D+wci/FR
	Qem5fn8JvO3iHf8Qb1r5h00MhhasW4um+S1ckl4m/dUMJrXDh0YO8RP9WD/10emipBQeI4k5MYR
	xJLcq2r2myoh0H84K3HOgjnycd68kuY5247S9d9w8aTDnL07q48dT3z2Yc+5WOv4DvtF31IgG7o
	KrZtLW1rffTNgc9Gf4V5CNOymEn5v+LMlHY221fvZnwuYMdQtYtaO1QwwvqzYosYJXtla8VNQHD
	Ii/dEPJ5Zpj1zVEmMf2pQ3IerSvNSyowPWxcyzfAOkEjfc83RnoX2QhQg=
X-Received: by 2002:a17:907:7fa2:b0:b97:ad82:973f with SMTP id a640c23a62f3a-b97ad829ee0mr395515966b.13.1773705818537;
        Mon, 16 Mar 2026 17:03:38 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:38 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:12 +0100
Subject: [PATCH v2 08/12] systemtap: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-8-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233281

While in this case `RDEPENDS:${PN}:class-target +=` wouldn't result in
any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_5.4.bb b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
index 254bac4d6f..f319aa54fd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.4.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
@@ -52,7 +52,7 @@ FILES:${PN}-runtime = "\
  ${bindir}/stapsh \
  ${libexecdir}/${BPN}/stapio \
 "
-RDEPENDS:${PN}:class-target += "${PN}-runtime"
+RDEPENDS:${PN}:append:class-target = " ${PN}-runtime"
 
 PACKAGES =+ "${PN}-examples"
 FILES:${PN}-examples = "${datadir}/${BPN}/examples/"

-- 
2.53.0


