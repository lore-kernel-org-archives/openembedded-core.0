Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32346C54EFD
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.30426.1649039458865713705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fr/zDWdu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id kw18so1233622pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ikzyBsJOOjNAtzjtq5iQ+YRNYJrN0iYvWaKE/oLGcmg=;
        b=fr/zDWduI9Ho1sSYZSN2CSKE394TPCFlLpk8rLMnvW6G5HJ2aaAEmG8Cc3/nt5ckix
         AMJUihvZ2lhQheeKorQM40l/h1/kYeGYRXUe4nno3OfAc52A9dXDE06YqiU+TiS921xq
         m+6VnZ5TgZGj70hf1HL5TNtn8gVOSMnGEZzNjs+GVk/8a1UrQUY8Nmh4xDPZJopuZBaF
         Z7D2F0OWv5xTA+G5vRanqIDJGXwbTcDpgdcGf2EgmvbuQ3uGqIv/j7mNU5756Tbompdf
         tNNKqRsKyrZa+q+EfRg9NyaGYazOAnNNL+C66mbizvuEjPWNfgOpNqzXyqPQ3S4fq9Mp
         rBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ikzyBsJOOjNAtzjtq5iQ+YRNYJrN0iYvWaKE/oLGcmg=;
        b=ZRqG4E6PgEWCTPI93hkUn4cjrJgBl7BsYPZkJV2GlGlp27mJfDOCCgIjZe1DOVKPuK
         FLUKnskZUoMXT2Kw7+jqLGWIIdvnMcmhLP6TmraP1QIzO9lsxRlJnpblacl229z27CnY
         oYeoTn5DJJ7H5ct1btLAxRYlphzuqrv5Sf9M60fIbC2ElyHNPJvnjVn9h56CaaSliytt
         t8xmE4s6nrBYR4w6HbeC4/ssFckThwE4Z/m4/bFHLuUOMKgUJdMcXkOrxCX+V/8DdN4C
         6epy99mSalQXBpopl1UeqOy92vxeb2lthbXpm1aoVyoJuQAIqIbSpPzUFFDsZinFo5Tu
         nRiw==
X-Gm-Message-State: AOAM531V+hcdEqxCdITjtoOiOj6CW4A3jsLum7wTG5joVDVBI9qboR3J
	Jjc8BK4ehUNL9WRHJSOY5mAtgh1wyO2qH6Tk+IQ=
X-Google-Smtp-Source: 
 ABdhPJxg1bIDO19DCjgFKGZt9cMyh4NFT7229oM0AIcBJRKbY9yuWG7/z/fWIExhp3lk7aLzyBPC2Q==
X-Received: by 2002:a17:90b:38c9:b0:1c7:1ffb:533b with SMTP id
 nn9-20020a17090b38c900b001c71ffb533bmr24278805pjb.220.1649039457917;
        Sun, 03 Apr 2022 19:30:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.30.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:30:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] grub: ignore CVE-2021-46705
Date: Sun,  3 Apr 2022 16:30:22 -1000
Message-Id: 
 <10e12faf6172f399da7b3d73a33bd908aa8f32b3.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163973

From: Ross Burton <ross@burtonini.com>

This is specific to SUSE Linux.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 594baef3b08d40fbbf1899f4cadeb9931c035c1a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 75ef31f249..0d3f6d05da 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -15,6 +15,8 @@ CVE_PRODUCT = "grub2"
 
 # Applies only to RHEL
 CVE_CHECK_WHITELIST += "CVE-2019-14865"
+# Applies only to SUSE
+CVE_CHECK_WHITELIST += "CVE-2021-46705"
 
 SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
-- 
2.25.1


