Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD1EC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:51:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.28060.1658155858265152909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NziaTTwZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so18411395pjr.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=q3FMdemEa/tEtqviFrmf81dEI/l6OSTFG135dG0vvVY=;
        b=NziaTTwZIoEjHPOAXZDu4FFyakrMluzzTJHpxd2IkNWGw3WvK9YKdcZeTXIu3jkfU7
         FQFbzCn1UcrMCaRRZiv+9dct1nprnbNlZGaQmT6mlUeqscixpHOVsHpuriZk234KL9dF
         xJenXtPrgCwN58lcYz02GDta+3pqa+w3XSekxOOKqFos415ePv3zH+SriGD5ove5EkWn
         GFdBtsytYOT56z3nbOvDUdCd9VNnFnnQAEISjNyi6Q0l8oOuMrdXL0pFTzIjPk2fSRIo
         dbqzYX5qKh+f4aBMm1gMqf0Vh08OP3zWe6jjjlDsa5qVZkaVQ42ZR+mXiB8hZ7hdSoVo
         h09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q3FMdemEa/tEtqviFrmf81dEI/l6OSTFG135dG0vvVY=;
        b=3Tm5Jk58uSof3a+tA40TTPXaiTm61H3BD5yfyPAuN1XwYw/GiiE1AP50WV/Z3AYWqA
         x6nOLSXSauzvQdFF3pWwElKTHDVJhQLUIeRA8P7rtX1VGfqJlmAkGBaLzCWsSJOsjTvS
         GowmD+v/wD0tHIUicuk8jpjjjpDc5Mfs9L2xVHaHMmFDpgoqu7yZ8kRsRSMueOHI4fSK
         rMHFGXAWZ+mYKKKl4o5e3sdw8k07s2erMGQQBrvS1hHh7ZmDHTYhXEod1JktQGSvkw6I
         jYlv7xaM9gWNTsXIt96A9ZyS/rxDJxzyd5ckn6IEaqUXl5DOjOIdjRi0hCiTYUdYMxhA
         QHPw==
X-Gm-Message-State: AJIora8J16N7DLzumnQhtl3BJTx8mU+wvj29wKZvHbU4LLNnQ7zJ24dp
	qZ4x/stQHzNRLu24Zd4mUNl2GM00JOlMa27p
X-Google-Smtp-Source: 
 AGRyM1urJVwNBvjX+5N83ZYCVcYWKwRAZSPRyjIIzlE1S/V8ZU97BLjSrPm5BYFXJpnr5i+Thje0pA==
X-Received: by 2002:a17:90b:4d11:b0:1f0:414b:586e with SMTP id
 mw17-20020a17090b4d1100b001f0414b586emr39659310pjb.111.1658155857189;
        Mon, 18 Jul 2022 07:50:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/35] gcc-runtime: Fix missing MLPREFIX in debug
 mappings
Date: Mon, 18 Jul 2022 04:48:56 -1000
Message-Id: 
 <3bb7abe545be6c92b2bd4f184536b0b0e871aac6.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:51:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168231

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes reproducibility issues with multilibs were a different recipe
specific sysroot is used which was leaking into debug symbols in libraries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f442edf51e256bd315bd8e4ac4d9fa12b8e9e092)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index dc903c2b88..c85b5888d4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -53,7 +53,7 @@ RUNTIMETARGET:libc-newlib = "libstdc++-v3"
 REL_S = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 DEBUG_PREFIX_MAP:class-target = " \
-   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot= \
+   -fdebug-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
    -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
    -fdebug-prefix-map=${S}=${REL_S} \
    -fdebug-prefix-map=${S}/include=${REL_S}/libstdc++-v3/../include \
-- 
2.25.1


