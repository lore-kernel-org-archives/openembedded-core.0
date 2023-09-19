Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56204CE79AE
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.22622.1695159987703922771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RGsnzQWc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-32008e339adso3122692f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159986; x=1695764786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3u2/ZLsTJAU69eSBUEVc18IotitlL1CRKAYmXm9t6rw=;
        b=RGsnzQWc9WGz5islKwG2f/UI2MMRm7fBdzPMA7ymWxcPajZ4DsutghENszIfj3V4Ur
         1KunrcqXp0YiPZzlT/IBachCoVM0kbnQrvtRlO7b9MFgFXAblA68zkKyZpCghZsGC9dM
         NzazasijQnuQLJHfTWcsRtn0hqs6dAp5wxj/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159986; x=1695764786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u2/ZLsTJAU69eSBUEVc18IotitlL1CRKAYmXm9t6rw=;
        b=u8lO31UmbdvtSrbYVA4DyuxEEc70Y3uwP+5mwba7DirqUonOa5BnccwNLlgOlus8Rn
         0xjfbFlAwKXHk+xvVRk10xqgRi7FfBrq3/KHE2HzUyEw1I0uTN2nNRcoqjAEvvFoAPVk
         Ot+W4QcWHgVZ77t/iUtSyHShn3uhCwPRejgP4TNKJbpjqepZFqy2X1Le3hy5po8MrGR5
         P+i3/fwH0a3yc6bLVNDzwtEz8LAuC1aYzBWYpPwQ2wp8b7kus4bsz5iXeIwvxQZYxPlY
         pZNplUk8SduhISCirqFv4uOzH/w87rGrppeIzgimzqLjbEQOD2H9UOnv49HZK342wcNz
         Hhpw==
X-Gm-Message-State: AOJu0YzeSQEXjNh18jORp33dlHLTRGD15E6clAFQOXmz7cXkLZOPMSE6
	KusjzldhOuqyLTiU4SLqmAB7hlQ8hLs1euA8a6M=
X-Google-Smtp-Source: AGHT+IHZs/YxGDFdsAZI4qn05RyWya3bm5QRK1UMcuMZq/A9pZVNPr8+CxrMbDv0eIa6/1VZRM3seQ==
X-Received: by 2002:a5d:6711:0:b0:31f:fa6a:936e with SMTP id o17-20020a5d6711000000b0031ffa6a936emr797586wru.17.1695159985911;
        Tue, 19 Sep 2023 14:46:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] elfutils: Fix reproducibility issue with bunzip2
Date: Tue, 19 Sep 2023 22:46:19 +0100
Message-Id: <20230919214621.903967-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
References: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187881

bunzip2 is only detected/needed for "make check" tests however if left floating,
the generated makefiles used in the ptests are not deterministic. Force a value
to avoid this.

[YOCTO #15209]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.189.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index 236f8cef92d..d6352de5cf5 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -32,6 +32,9 @@ inherit autotools gettext ptest pkgconfig
 
 EXTRA_OECONF = "--program-prefix=eu-"
 
+# Only used at runtime for make check but we want deterministic makefiles for ptest so hardcode
+CACHED_CONFIGUREVARS += "ac_cv_prog_HAVE_BUNZIP2=yes"
+
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
-- 
2.39.2


