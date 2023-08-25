Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D869EE49A0
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:02 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5803.1692931676009299246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X9fVg3uF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68a3e943762so459241b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931675; x=1693536475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifkWKqlttr0rJLULj6fwyoyWaUubN9yP0KpQOo+awcE=;
        b=X9fVg3uFLXlgvZ04QMoKFNHjbLdZvdGtrfQq1zZcw7C6JYaIylkOEXdXPiBvcp76ae
         F0iDYAoijGyRns/LfM+221MlNSBELVWB93Pvr9UaHH6NIfif5V33ysz0NJ7mqjqTxG/7
         m54dHjBrJ5kE3vFmOWWN4Pf486Vo6ihzfDxJ03nkaws/jaxVBzLw6T18Z/6DHEqK4ZQj
         SBRffpNLw4YGGRv+VKeIgV6SlsyQE2aSUy+hU18oxdL37vMTSNLaLY2aya+dXJrtavZG
         t//mFp5JCsAeb9G/IRM3HguHjfy5G6V6bEmZZ6QklwyCDEvKTwVX8/Bbe8iBi4J1N5kq
         RCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931675; x=1693536475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifkWKqlttr0rJLULj6fwyoyWaUubN9yP0KpQOo+awcE=;
        b=iMTNb8t/EoR97sXIBAn2q5xLasTU5hhT0AC+vHfV9nfqUKe9fMIbU8ycsWGzEmydvF
         64nMqf9e3kTS8IVd2N0FxGsVyFCbMRj1SFoF0ud04gkSgc01PRpmMR/hlITipRnGjS5r
         JoGs25JwVye6BI7csGCDSN4ImZVYedbORiDlcoOONjmIy/6tbbUEXE/2VdLkzXIKlxOs
         ubXfDD43SZCDfy3kFkJ9dZ4gNSjmdW7Zr1y4UAK2pV3GMG38w2WkXZbBdMjhmAZPBVav
         vlsPTpszoVw/GD5IXrEsfxvS9762pkauPwT4tRyIpk/OcWdHar1zazwAz/OaAbDsEzkz
         58gg==
X-Gm-Message-State: AOJu0Yyhtp21177Yctd3E69htL2MRcuvA6sN5TPJixSWwR3Uxlos+MkA
	qoKC8nOPPbRSXb/zrIpkzbJ74QOOdbjnG7Mx4b8=
X-Google-Smtp-Source: AGHT+IGXtQDC9adzrddpWobYxlYQwhnnBcgfCpgac8InQsaytiq9kDlVJMZY08qIg/1+nVtpR+6GCQ==
X-Received: by 2002:a05:6a00:2d83:b0:68a:366d:5ae3 with SMTP id fb3-20020a056a002d8300b0068a366d5ae3mr17335806pfb.27.1692931675059;
        Thu, 24 Aug 2023 19:47:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] libnss-nis: upgrade 3.1 -> 3.2
Date: Thu, 24 Aug 2023 16:47:29 -1000
Message-Id: <c0b1ebefec20e67189931f881af7ac26bdf92df8.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186678

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Do not call malloc_usable_size

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cd967503c0574f45b814572da9503182556b431)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index 984cc98fc2..0ec64544be 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2"
 
-SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
+SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
-- 
2.34.1


