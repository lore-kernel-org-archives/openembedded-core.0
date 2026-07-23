Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1AEC531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:48:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6272.1784839724901956916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 13:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UdNn37vg;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so1195008a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784839724; x=1785444524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbARJDX9edSa7gz13qCT52GxXM1QCCskCgf6cOChOTc=;
        b=UdNn37vg2g238B6YfMBDZ3RMglr02P4B2Zz5+6RKPm3EnDqsAt6CcJS2JoD1XCtFVA
         5sr6c8844u730hguaFetxbHusVFYYEdDswM8N/ojgdtOLrGCcYnUL4v22OfFlf/EBu1c
         wq2ELPhKnlcQXDLlF0JgG496eem6FHCIXfMiQwEsIWX65h6kABYbFzod210lrY4T5mjm
         PW7VwSkcYvxfhl/ZVXzk/aMhJFSik79MlnPXQbTnjphoZwiYtTGnqDvtJD4fMpDYQid+
         kND0+jWDZIDkDrlpQkhcK0APqpOqQDmRMbjOhFKGANF8PQgeC/tCrdTqlWKT4tiUCn71
         Unjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784839724; x=1785444524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbARJDX9edSa7gz13qCT52GxXM1QCCskCgf6cOChOTc=;
        b=euhcE8whjbexY+H9Sff2W7YRigy7f0D0dXcrHKos4DXGdow0tiMlW4PJXqK+9TipAk
         Z2LZmJGJSGQQ5S9S/1JdUBDuLsjURIXiXNxmeHwk0bbvXTaVSP8T6juWXyV+EP0bnj9r
         9NhVxlRvQnxN/UuHlt66XlA2vbqe6Bh4VuFSGfAoP5LCg87QuzmoMgzaswvoOn0IANzR
         5K4J2t1L+MsJJMXPjVOWK19O2v8w1sknb2efgtYnca3e7H79yaEdibCgQ1LUunQ5yHMt
         6aygvEHd5aeb48ZQ5gJAleR+uP3+pl4r3RdzM5NWOMwLqHLf7PSvqClfaF14m8wSGO6f
         FJ3g==
X-Gm-Message-State: AOJu0Yz4zmjOg+YGShFGmnypQDStPawDMbe3mXb25mvYXf3jCWFR9jKU
	tVysTyBZbJfkZNTa5P3vCwyuJcRNRLfVLGAcmCNkRETLXHX8MM08vT2AoYZaOQ==
X-Gm-Gg: AR+sD105QF9xr+tQkw6UJ+v6YA06jQkwsHghEpQtvrT9/AuWNqDMgihDGNLGLVpwRbB
	+ZvuJSGp0Tuoaz7y0RvpuqXTmNXsYetnI5fmKcvueLPNEZMQjy2jtru7SeaONSGVge2Ij/3PVgc
	9IrAwtPO16pFYBbeFyB2mNI/PAfn+Nh28smhsXFG2iUYHvQwCExSkdGYe/R58B2kupxTRrQvWEf
	orLqfO+hx2qZFPAzJu/hy0raIyb3gUo7PTYXNDHGr8+eV7616PVxaq0z63M4RNkBEaFm3/eB3dc
	Kpf/cpJX3qKtl6OvyC4ubvQe5S3WXCXzdri+OtgZR2ckXEFaKafNRPmOn08sUJfMc3GcUVIalxK
	rx7C7iUvtWcEYGOtgweQNH5Pg8pggX1h5I0JXMnXCBLlX9aYj1WVPidgZ5Y5QJyUYamOef6mONV
	EFmOgQtlMgFoke2SsLV0qBpNUnRpYI80FMF2rJXLgU4PSZiVB8EoowghXZP23Y75YD5yxEYJ1tb
	PCzGAL53xlH
X-Received: by 2002:a17:90b:254b:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38ec658a132mr4789603a91.18.1784839724057;
        Thu, 23 Jul 2026 13:48:44 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eabesm438508a91.6.2026.07.23.13.48.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jul 2026 13:48:42 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] sbom-cve-check-update-cvelist-native: -> 2026-07-23
Date: Thu, 23 Jul 2026 13:48:32 -0700
Message-ID: <20260723204833.43562-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723204833.43562-1-tim.orling@konsulko.com>
References: <20260723204833.43562-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 20:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241872

The diff is quite large, but a partial comparison can be seen:
https://github.com/CVEProject/cvelistV5/compare/2026-06-24_baseline..2026-07-23_baseline

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...24.bb => sbom-cve-check-update-cvelist-native_2026-07-23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-06-24.bb => sbom-cve-check-update-cvelist-native_2026-07-23.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
index ef61eb4628..0ada6e89f3 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix=;tag=${PV}_baseline"
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
+SRCREV = "7a274ec07043f54c07d0a3b5c7fc89ba5793f023"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
-- 
2.55.0


