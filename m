Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63621E909BC
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:39:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37945.1771861174717223619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=AODapIDj;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8fb8858537so44744766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771861173; x=1772465973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjT76JCRCUDK2cjdM9BYxGjzGp4t38KLO/eHfeeeCxU=;
        b=AODapIDjLniIsPWFDPkmsLGTxamS/8kbfMmAfcxuk8ZU2Nj3FxnwJpE/m9wEoyWJuv
         ZPdZv13P6JObPVR8+fGDQluAI0oHkw4wROp/ST3DOuJlfCwi+3Uu7PbB/U+Tphr17YTU
         RAPxmlM3HkFi/3U5NYCmaD+fTH7KZoZJxSHOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861173; x=1772465973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjT76JCRCUDK2cjdM9BYxGjzGp4t38KLO/eHfeeeCxU=;
        b=NJdDd55HyFfLuxFwyRpk5lP0dy6UKk/3TrUs7p0kAsG+hTmDRRJyv4tXd6aLraGiwq
         icC+OwDt6r7naTvTx461agF128lN07kbdB+Im5U9+QfaTnF7yVrMosGPQgXbD5mFdLEA
         /M9zGRFwgyt7skg3sMuTXgYsiAT6M0zGQkZgXI4sQ+4+4asqFvolxUxEc6xr7/oyLgTk
         ZGx/jB+09kequuV3mc3bYEQL2/QmOWtGCpJRx/ZdYzYR/viKabulw7wrcqmQrabb3eMA
         ABq/zOqljNxcHda/x7lTlLFzPWeucoMrF4kBv137PTp5tRymFbnFuTuEtN4IeE3ySh0Y
         kFaQ==
X-Gm-Message-State: AOJu0Yz/jRJA+BqV42cJPIUNgSDtzVQ1ty2MQOmVutYnjpORSmtBCIsV
	dPNcYnXOJu6LYtLIOOXJ2MkDsDmCnL2fRscLyp4qAXPp3Ap6+xSQGmtBHgimTw7RHWhZ3YOqGvV
	WMeGL8lw=
X-Gm-Gg: AZuq6aJWHsvg53nFYRdRGv7NuOYm6Vm4yIXTginrW9Vuv6TRayRMSx9e/OQJ8K0Wgjc
	o49dMkhrRdjt3VGIDNVyZqwT0+hhfeS2udr7Wr/tm8wx1ZVNN74Azw0DvB9al0yfJSjUBlcSt2L
	LEsCoIX4yam/qWIvtc5YiU7Fn9171LK0rNXgKDT2hPbC1NeaHlRM+zGtGLYd1nHRz8fJ8QAt/TR
	rCkY7R6VxZnBFZXMGLZsj6G0f/vxsgl4h02SYZEF3fVbwYd/NDOE5KHcgSuJ4AtTTcqmu2FZDPt
	0E5FfCu53ucNq1cdr1XQjyPrh5ym9p/gvo67sa62HjVqQ7NyLceW7dhhjIr23N2kHq3Lk9SV2Yk
	DOjbdl7WXLeRE+5t/PuGsMBNS06ripJUJR7UUYRGMWKw5xosRRR1a/WX4r11poyIEqTgyYdy1Zv
	+6CiO/6PJiY060P4IjIFQCtgXAmhJc15NDvK/LqnBlh+rzT2NA+sUKLAs17EBEVwKhQ15hXUQTr
	/KS3dbey81LR3k7n5nPRhKaA9rzdds2Cw1j7srZkEBkWscKf4ZBiGUtz43vmm6Sz1/qmw==
X-Received: by 2002:a17:907:3f1b:b0:b87:2099:9f6b with SMTP id a640c23a62f3a-b9081b3b183mr313175766b.3.1771861173093;
        Mon, 23 Feb 2026 07:39:33 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm33643666b.28.2026.02.23.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:39:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v5 4/8] libsolv: explicitly enable comps for rpm packageconfig
Date: Mon, 23 Feb 2026 16:39:25 +0100
Message-ID: <20260223153929.2641007-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231676

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index ef348de904..f9a2571d48 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.53.0


