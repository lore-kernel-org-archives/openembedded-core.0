Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCA2EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 17:22:37 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3152.1694452952937685864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 10:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IOgUTD82;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68fac346f6aso1703789b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694452952; x=1695057752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3Ep2c0NPHrFhTyOWMOzVUUcTl8tMCS7VD1C8KpdiaI=;
        b=IOgUTD82AO6kcTkgZPwIbnSXWHEKg+P+fJygMKt85oifPFKXL31brx/oLg0Qta5bdt
         ViuR+QFglo5Qa94TF01BD0nSpY0GCxTd3vq2IawqNTPBEgee2fBbL6tEi0hfSzee33mx
         z80n8FK9hDSHaj+4cCqb+s6rM4AkCfUAiHm0Vwg0NUHaSXOtT0xcg0/z4ZWH7zAy8Y8c
         I/Rm5mj/PepyBM8sOfHEQ6wxsklNEP+9Vtxt1WAasHNEPZbS4g6pzIpiwlppmob2WbJZ
         8oGGLUnjjOmVD0YAKsjpmqmWT3PjLJOV8/v2DW85Upen5cSGMSPxwm6ILX/pnux4CI5D
         fYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694452952; x=1695057752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3Ep2c0NPHrFhTyOWMOzVUUcTl8tMCS7VD1C8KpdiaI=;
        b=oBeJXa/KcbpaEABTQpYTSwAylGzkB7+pe4vr8D0/M8r+fJmTnxIehnIHiCcwKJGFdK
         7DFcz59GAxm5mT/0oKXfDvlwzk9wHPXaiQ/t+ayRmicufkAb8VmO1Z4FCVwBMDk9CMcP
         SV63d8rJWb/F8stIP9NOZ+oYfFqldDDXA3px2xLxR8Oe2o9GDN5p5BtxRPcysQbx64Em
         YKqz9MasRtXYzbbUqLNvPM0xzEVK2qRZVpSo8SLDAXCwC5RJivQh5gIoW6Y2P2I8XUld
         G9lw+ASUPIK4Ts6SjZXBO1JlVOdDovZUcTEyQczdN12LlqiSQ0rrX/pjN5mUC7KQczAl
         N3xg==
X-Gm-Message-State: AOJu0Yx+ZTpd8NNjZ1mM0Kf6+ZHq309TyHtX1UiTyXFrJqMnAyvCaKfV
	fWbNf3MGYgA/8/YeYFHtUyaac4hiP2+Stw==
X-Google-Smtp-Source: AGHT+IHsxJZ+g7hxMqymo2nzBGswHoqf9+K9BQX2WYki16YGJW4xTOIQjlAQBRfFLGWLVEIfoDapwQ==
X-Received: by 2002:a05:6a00:4514:b0:68f:d1a7:1a3a with SMTP id cw20-20020a056a00451400b0068fd1a71a3amr1819043pfb.8.1694452952089;
        Mon, 11 Sep 2023 10:22:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id ce7-20020a056a002a0700b0068fc48fcaa8sm2204803pfb.155.2023.09.11.10.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 10:22:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gettext: Add missing dependency on gawk autoconf
Date: Mon, 11 Sep 2023 10:22:29 -0700
Message-ID: <20230911172229.2242627-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 17:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187496

Needed for additional tests e.g. autopoint-1 which are otherwise skipped

Make locale-base-de-de and locale-base-fr-fw rdep unconditional as
musl-locales do provide these locales

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.22.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.bb
index 71e84521b0d..f5290ac0e44 100644
--- a/meta/recipes-core/gettext/gettext_0.22.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.bb
@@ -182,7 +182,7 @@ do_install_ptest() {
     fi
 }
 
-RDEPENDS:${PN}-ptest += "make xz bash"
+RDEPENDS:${PN}-ptest += "make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
     glibc-gconv-big5 \
     glibc-charmap-big5 \
@@ -202,8 +202,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
     glibc-charmap-euc-jp \
     glibc-gconv-gb18030 \
     glibc-charmap-gb18030 \
-    locale-base-de-de \
-    locale-base-fr-fr \
 "
 
 RRECOMMENDS:${PN}-ptest:append:libc-glibc = "\
-- 
2.42.0


