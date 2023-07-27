Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418DAC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 06:58:38 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.2003.1690441113184955129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 23:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NE6EzodE;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-403a85eb723so4229841cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 23:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690441112; x=1691045912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOMyh053qhKUMUicLxFzmDnHEj51zIuiZ46u3HQR914=;
        b=NE6EzodECFIsvoGHxg38u+TE/XHA8vBy6lxRA8yqE2/AdxrusJk0Wtd/QX1kWzXgqP
         r6kEPaqLREv5sgYrNkoVzkU4wVc93v92OtwqyHMYzZ9NyBmBc8SJxd8hNMKaqQDD5x9v
         RWE3XHETRVZYLoG3UNcpPC+5mDPF5XNvOMhMcgCMiEfRllYBJ458HtfMNOl0q/xhojMC
         55OY/Uw3brhwSlSihXhp3kAg8xeCHX9AAmURaiDmqeSPVbvvjrOcLAv64LgneO+Co/p0
         LfqJPM4PlXevO5wY1X5eQFaOW9be+FyVs+ws8vHoO3dPbwoPEhRSFTaHSGKHxIn2BIjT
         kusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441112; x=1691045912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOMyh053qhKUMUicLxFzmDnHEj51zIuiZ46u3HQR914=;
        b=at/+KgsVaxjQVY5x7DUnFRm9YCE+/EKdJ3gJ8os940N2kbFcfULhSN4Hg8fkNoDqRG
         lnUj+7+6ph/adoMNiUQQK4RCapTtlBgAH2cIeZGDH934GxXEKNdZDlYFAzt/cHQIKaJu
         eUJxZWgFLIO0P8DPbiTN1VUmr9mpSYcu0uYdftgY5On65+sO7/wuFc+5FIlGKVDNjYpL
         BNPL/fPVdFBNp4EXyDKjvM3fkeaoOPbPNRk1uQyhQ78iBWyygU5zurAPrdsvb1I3w1PF
         uBw/CMVpA7qtGRY9baJlRHkUZ2zQuYB/Mk5t7g6RohpW66Q9d2r4fOzhlvPIABOsatEo
         ap2Q==
X-Gm-Message-State: ABy/qLYYrwPs70gC+PqyAKU67IqqyCL8UZAJo1UymZ2AVSMwHb9OJO6e
	eloXFlWZM13INtyh4xySyfyeFnF4XOyKbA==
X-Google-Smtp-Source: APBJJlGIJlf4rpUWXsrY6AKikyt5DGn9ZyCjPThV5olxzxtjtV4THiZ04SlTfcl6/tGy/SRGFh/6Tg==
X-Received: by 2002:ac8:59d0:0:b0:403:b9d6:c070 with SMTP id f16-20020ac859d0000000b00403b9d6c070mr5655085qtf.23.1690441111872;
        Wed, 26 Jul 2023 23:58:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::37f0])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a01de00b00268032f6a64sm2352294pjd.25.2023.07.26.23.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 23:58:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ffmpeg: Use bfd linker on i386 when lld is distro linker default
Date: Wed, 26 Jul 2023 23:58:27 -0700
Message-ID: <20230727065827.2710834-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727065827.2710834-1-raj.khem@gmail.com>
References: <20230727065827.2710834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 06:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184913

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index 181c17d9d68..1d80fd92949 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -133,6 +133,7 @@ EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
 
 LDFLAGS:append:x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS:append:x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd ', '', d)}"
 
 EXTRA_OEMAKE = "V=1"
 
-- 
2.41.0


