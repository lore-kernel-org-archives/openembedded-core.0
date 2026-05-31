Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884FACD4F54
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16954.1780186688863252675
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HYuHW11D;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf18c30bb2so16344385ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186688; x=1780791488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEcByo29ut9yse3HWFG8PySY4onpvSCN1fE7Sj3sKaA=;
        b=HYuHW11Dpkqij/jZI2qTNmb6shqmWn2MdyxdZ7bol0XcdnYydXwOpLm6Xx7BvFY9PV
         hOnLowrJA4dO8x9BPtH0znDZvlqOdElqUfDbC/17azDuQH6LIbHC88aR84PbfzdRBYnj
         Evh53JXNT7jNdYvqWxotZNr4A4HvBZQfcPIBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186688; x=1780791488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEcByo29ut9yse3HWFG8PySY4onpvSCN1fE7Sj3sKaA=;
        b=knDTNGgcKAB083EX2rtA1oeSECQ9X0Uw7+Fo0aFpRNBnNhUgc+LgreIbcIrCndPuia
         knyCzspFTCL9rokZj4xuy07KPF22pJYF+02TyAuZ5FRPrqRM7ZYkRMdKdz2kpldPEpKH
         M4YeNSaIDUbSGwUiKiRAII9lmCfvS1FKi+qBk/Yixu9pJPXzgwezI2UfNa2N/E1R5cSv
         tyfZj1IMh4ask+lrDSPSAccS6NeE015j0kSRosT6J/fx8Cm1btIO7VLbGLYDROdDJyop
         YgieMiPIGaQCbRrAsHpk08Kx6ddrhG+QyI27toYN2uWsirUyolEDhRRNKo76r24qJwM9
         wAAA==
X-Gm-Message-State: AOJu0YxsLMzGdRAoZs+x1XdClgL8A/j5RiwJqMIY3w9U7GwzBMc0x3gT
	pyToARHCt2jvs/awWs/iZv9gIb4V/X796/sdHkQlu0ehc1uGY8ViVhV5d15UVUqYMiWCjztwJCZ
	jyRCN
X-Gm-Gg: Acq92OGphPPo5u84GykUAKo+io+TE5jXJ/d67EP+C/s6IeCMgwZoWfbhpT66LfZgD0I
	nAgYKt98UwPtdDUyUSKxCzVDlfdZhl/RuSYZXhrn4stcrczTfQCaQzOvEt1PvNJ89lg5BxQ18vE
	QIEwZ1yapdwJI07DvDbC1TC7g+6InrDQGHvKsIWKIxar/VjE5PRnS8QxhjZNRTIIjyjPRQv2R/l
	YF2OixSjUi+LMVFx8O42LQu3NILWRelLr5Ivpbsj0Q459toolnjgYWWujn6dVki2IO3hvpR1w35
	e5m7Uvn5bWoyO3j3wXMbKAIhDIf728Wt+HZQs83gh3oedbenIMV6pjj4zT34XVL3dkg/6PrZ35l
	cWwjA2CNcNR10FiAznybb7YWtrPY88TpW5KRAk8E+Q8gtPI2bYBN5eg/672fOCsLgXrwCs1xmoI
	+0DMWoVtrvlqrEbvzQoFxvTxHDlShn3dd+JreJrlNt9VzixDseI5+eRtHr/CUdANle+ZczA/sQ5
	A==
X-Received: by 2002:a17:902:d4ce:b0:2b9:e82f:bfef with SMTP id d9443c01a7336-2bf3682ad2dmr66479405ad.21.1780186688211;
        Sat, 30 May 2026 17:18:08 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3aac0sm58277735ad.72.2026.05.30.17.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:07 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/9] python3-certifi: upgrade 2026.4.22 -> 2026.5.20
Date: Sat, 30 May 2026 17:17:49 -0700
Message-ID: <20260531001756.1582306-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237781

From: Tim Orling <tim.orling@konsulko.com>

* Removes [1]:
  Issuer: O=Chunghwa Telecom Co., Ltd. OU=ePKI Root Certification Authority
  Subject: O=Chunghwa Telecom Co., Ltd. OU=ePKI Root Certification Authority
  Label: "ePKI Root Certification Authority"
  Serial: 28956088682735189655030529057352760477
  MD5 Fingerprint: 1b:2e:00:ca:26:06:90:3d:ad:fe:6f:15:68:d3:6b:b3
  SHA1 Fingerprint: 67:65:0d:f1:7e:8e:7e:5b:82:40:a4:f4:56:4b:cf:e2:3d:69:c6:f0
  SHA256 Fingerprint: c0:a6:f4:dc:63:a2:4b:fd:cf:54:ef:2a:6a:08:2a:0a:72:de:35:80:3e:2f:f5:ff:52:7a:e5:d8:72:06:df:d5

[1] https://github.com/certifi/python-certifi/compare/2026.04.22...2026.05.20

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-certifi_2026.4.22.bb => python3-certifi_2026.5.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.4.22.bb => python3-certifi_2026.5.20.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
index 990e37d801..bfeaeb965b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
+SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


