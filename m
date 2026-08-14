Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0F6C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:20:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10007.1786702812332042306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Aqq4ox4Y;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e04df8c46so816820b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786702812; x=1787307612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDuPHzxT14M+ICVjxBLT6JrvMN9kA+jX4UAq/kwRS1s=;
        b=Aqq4ox4YPYRw6UK6EMd4HSP4V/m/uFNCgxF6BtLK7IvS7ostqkRqeNEvIhryFYcpu4
         GQGjozZNPNC8I2B9Lpfo2tQIYJNKUmCYFSqqy36FKk6jZIzgs6z5+CjfA9j0vqdGRVek
         M6N49drzWcU75ci499O0iBFMAGZJM/UvI19Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702812; x=1787307612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDuPHzxT14M+ICVjxBLT6JrvMN9kA+jX4UAq/kwRS1s=;
        b=lN/J0bqfUCfL6C0hNbEjmuARRQQ1apTP3tSpvnPvHlRPx3PbfLw+tb7jDPH+OIXqFt
         03Gi9S5umFPGt4UXzg0Ob5nAuulH6287bivSiKpZQk1YRg9b7yZQ7cKRIui8C7e2cXmR
         vHm2S75wm7+WYm53nhBo9ZB/BzBlPYVGk/rMCEFsj/eB861Sl5/MKX/JXHCZaYVkd2Gh
         C5pgN2z8r+p4nSozY6FwEd49wet4GdACFqd4S5cUgUiG1QuLhuv5Osx3un1oltnhG05E
         cjvaDfZiGno0+kacoHwD9/i05rN2/NuhCuVwG9uLFl57ebOWUfXCTeuCOgqxq5/nKhXI
         TwnQ==
X-Gm-Message-State: AOJu0YxMRq/4/xf3T1fsYmJQXrmf0qO/MR/WTUu98BLdryb38RQu0JaF
	TesAwo4H6uo43wKvkT4eqPx1Z86kCrn2PziwihSqd7ZGUA3jdyB6ykdVAK78EGBtBrluamhC3fj
	+kGNTHW8=
X-Gm-Gg: AR+sD13ERNaxn18fegW/M8+Cr/XNHEogKadrdtDGjQojU0drTBoORQdf5wwGYpWRPrc
	nc7EiRfBVT7cPkxd9fNFvrcuvkX0U7Q3PL9q91sBomU+t6j+rIDKDBS0b1cdrmescIT94GiUW2j
	v/PHqFlZMLknRz0DA4EUBJLfi0RNUzLTmIiMkn6Bcot25pcKy7EElV3bgBCkWBmOn4rSb0VmagV
	dshQlo81sfxGyVGpuRLWFHExInjZHvph3vlhhZgjUWxnyjEsArOsUVIf5LOyhZst5jtqmk2PBgt
	jnXEnKmhquWrwOnvtl0z9AH4MnDkMR4QXwXP8AD4FT0gstWyZaV1mj89INP201LUn3itdTVAroe
	CjMDyj65E2BdIP0xGGxm6v06Qj9uRfiu8O3CAnUPHcokhWdj+ogM08/x82pDcHILETRCqoSvUiW
	9O/JplUPicLeUY9p/AT65YsNxwDHRm11bfqLdFb4zyfAo1rOWeDwAlIllF4mHu2SW71fAoF+4gu
	0saSx7Be71ZLw0=
X-Received: by 2002:a05:6a21:6f02:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cc719c7b6fmr5864112637.5.1786702811646;
        Fri, 14 Aug 2026 03:20:11 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:a7de:e349:c3d5:7c44:1c80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm7889333c88.0.2026.08.14.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:20:10 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5
Date: Fri, 14 Aug 2026 15:49:41 +0530
Message-ID: <20260814101941.873295-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814101941.873295-1-vanusuri@mvista.com>
References: <20260814101941.873295-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243434

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5

0.26.5 (stable)
* rpc: guard against overflow when decoding nested attributes (CVE-2026-18938) [PR#777]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb} (98%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
similarity index 98%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
index 9219e9eefc..8229cf96c9 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=
            "
 SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV}"
-SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
+SRCREV = "120050e353e8f43d7c40bbcc047f667f903f4de5"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.43.0


