Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DF7C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:10 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.17.1660081867133567081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tMGJyDFM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id a8so12939726pjg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3J5NNsrHRu+3k6bXPcbmUy3GoMTaE9nlIzAgWL6ihoY=;
        b=tMGJyDFMYn8twDj5AiLrQURLA0bFLDNnM5WwsvYKwKJYMfyHv/P6WMoojV3dIC38ou
         KqzU4WqmkBYPUoAOccL7Xll53M3St7ymoKQWDIDFWqSBwcUpBrh79u6JfvroVw5VvGny
         NBKAkpxsPJwMO9sNaOAYiNWx10wu/7L5nBlnxb/9GGQtDXWsQkzJQQ/mlMDx0/GIO/5W
         8fZyt+3PHJscpftGQ1AANTO6WPjTtfuIY4WUFTWoajTXXEiIS1nVBC661Dv8E3eInL6E
         A0IzyLDzWOl2GrvJRvUVXLyQwF6U1V3VUADFjMNsuGTqxS79I1iPzv1n+vIYFx9XITJx
         g/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3J5NNsrHRu+3k6bXPcbmUy3GoMTaE9nlIzAgWL6ihoY=;
        b=2inNiRfm+KZWSQjRJemTKgRZ604VnrqOfzlkaM+d09ccNmlkWKGfHS8W4a8jDj0KgX
         NE6M2b0yUiRkjejKWqRP2tT7O2jmzFwHFExVjzUIyUct/tfSB9z3TLyAaiUPg0E4gYRs
         vQ4tJzAZqjY4w9NNOcYN6UcrBpQ7r1ABsnGLfo0GnDc31PPVb+kQ+ullGgbTlSSK/ZdO
         MQ8GQlCgNNF+EZZzKXqdEFldy9Y89lZr0SwnWvJ+d0s6mH76U7vo4wN5NqQ2f61qyadZ
         3VUYbEFGxfbjAhuvJNTvFzBFEu3vYcKdPJRUMyErCTQTSclLZ3HdWn3bmSm6c7TnTtq6
         JVwg==
X-Gm-Message-State: ACgBeo1unv0tFgqhSEcYHyCKP8budxm2rB7D/gMLbbUIsVJg0lKLpPFs
	zLi3j7o9RPZyHfA7CxNS7g1j9CP9Pxg2uO0c
X-Google-Smtp-Source: 
 AA6agR7Q+v7QfHrOzfzlKArqSK9/48wzxXBLdGRAlh2eR2i4ODg74VeQC75o9mnfrd8WX9MIPSLFiw==
X-Received: by 2002:a17:90b:4d12:b0:1f7:a6d1:24c1 with SMTP id
 mw18-20020a17090b4d1200b001f7a6d124c1mr480466pjb.15.1660081866115;
        Tue, 09 Aug 2022 14:51:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.51.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:51:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] linux-yocto-rt/5.15: update to -rt48 (and
 fix -stable merge)
Date: Tue,  9 Aug 2022 11:50:35 -1000
Message-Id: 
 <2bca0a8c74359359308a4569ce0476f170053f8d.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660081510.git.steve@sakoman.com>
References: <cover.1660081510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169177

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    6bc08dd702bb 'Linux 5.15.55-rt48'
    9a1a3c0162ef sched/core: Always flush pending blk_plug
    f178a16e9368 crypto/cryptd: fix leftover hunks from 2a30446f4
    0e01a5c5a80e 'Linux 5.15.49-rt47'
    2aa2253a0595 'Linux 5.15.44-rt46'
    c94ef3468bef 'Linux 5.15.43-rt45'
    264141c33af3 'Linux 5.15.41-rt44'
    9934b33b68d9 'Linux 5.15.40-rt43'
    ca63907ee4b7 'Linux 5.15.39-rt42'
    238b266d7aa8 sched/deadline: fixup -stable / -rt merge

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a95f9299cc178b2b7607c312086b768ddf322a56)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ef47daab6e..7560ce8241 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2a966fea899c00cf90fa1b79b9449e4ea384e9e4"
+SRCREV_machine ?= "6bc08dd702bb8993f84d81ad426fd9acad26cede"
 SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.25.1


