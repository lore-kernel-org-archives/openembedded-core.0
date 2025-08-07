Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C05C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:45:02 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3813.1754592297209568940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U+WaS1M8;
 spf=pass (domain: konsulko.com, ip: 209.85.210.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76bee58e01cso1774525b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754592296; x=1755197096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfKM5xNfEZ6R6L/DftIhn+AAsa9cVJt6OiIWQmUHAXU=;
        b=U+WaS1M8ximAjiXP+kpmRiBG8ZqiT7Phk4MmbxBJLwuVzEwPf4+nEPmGJpNEYt4M2a
         fYuHRD4PGdG8+SMPpgrgNtYHUhLhfLXTQOVkiuN+WXad/3skpwK2x/b/VDEgKzEpnfCb
         FwiFEY4OMKgQwC3ty7DR7dnisqgOsURxdxQIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754592296; x=1755197096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfKM5xNfEZ6R6L/DftIhn+AAsa9cVJt6OiIWQmUHAXU=;
        b=eTeTga1FaT2Jr2Z/WfP27CPvdFJ+OB1dbLYlAvci5wHBAlbiUTfSiAdjqYbrd1oue/
         Mj5qH69QERPwUg1mbJkJ7HxvJa3dscVG536BdaGNPdxIm8+LQwuKkFAAX5jKmHLyHoU7
         QwyPysidTQzYnu+kO8YG0I1+e29AesfBy6lU92NRIhE1z5DUfyNnWQJib08iAtMG+l2N
         plgszbnpZFEWIWpqsxa4m8e2gW22iksipH5Uac40CZ/5lvqs2hTmhyrNSc5PETEeRfbU
         aTfXTX+jfw2/bOVOs/n9Ua9rqB+ReQ4bBr1ahUbgjojf9MNxgngWXrpbj/Lp70jDWjPJ
         XkwA==
X-Gm-Message-State: AOJu0YxINKbh7neGSOnR9cTTw95ZoO9Tz2kJ4QXb0v2/+2GdHWliLV00
	FMGDSWMf7BY7umbi45T+E323oQR5ZK8Ms9ucU5BB/X9XO8QhXZIV1tlq5xYdGnBNlXYtK8aZmLh
	UBgwszNU=
X-Gm-Gg: ASbGnctZdDzYZlpscmvRSOqSIMIFnBAe96qQC5CKkQx2wCD2Or6t7Cjx8rfh4b4bjPw
	u/sHzRRqiZQH0OhwIshYp2lKhGR3tFISKSJeSV6Z2TfVdHwaiiBsNLalyNhyABBn7DUwtHKn2PG
	6Id6hEzoNDSNLW6lLruu/ptfbS6lm4ubp6bAkUqXld/FI6wAY+cGhCSWnRRSZeywenwPIsp8x1z
	dgOiFX5zhUVZgOfrqDznJ8P+VwgmpLnK88Z/LK3PtCvl08i8RrGSmVmPVmesqpGMSTTtEHPwS8D
	V1c3qxX1PI+DdDaG+5VhX9bmG8/D1ko66+0OX2cAtpNK3/NW+vitfMLUgAXzivOsHUChIhhGp8y
	uhgIY0HOy/ubSfwpzFh7sA39XIgSpkVt/CAXWaN1l8hPyPgGq9YCMiy1EVI03/w==
X-Google-Smtp-Source: AGHT+IG4OPqqNh+wFt/QzA29YtAyseiM3hqh+5w2hYssF2BHGeNzgdrRSUaFtI1nd5ERDLVHm2q6Ow==
X-Received: by 2002:a05:6a20:1591:b0:240:2421:b912 with SMTP id adf61e73a8af0-2403314251cmr11776130637.37.1754592296176;
        Thu, 07 Aug 2025 11:44:56 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8960dsm18625818b3a.34.2025.08.07.11.44.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:44:55 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-certifi: upgrade 2025.7.9 -> 2025.8.3
Date: Thu,  7 Aug 2025 11:44:40 -0700
Message-ID: <6eeb03c45f5237af6f3450af8bba06aa73c1be0b.1754591996.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754591996.git.tim.orling@konsulko.com>
References: <cover.1754591996.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221581

From: Tim Orling <tim.orling@konsulko.com>

2025.08.03:
https://github.com/certifi/python-certifi/pull/362
https://github.com/certifi/python-certifi/pull/362/commits/4c1bfa53ef5aad0339d9ae7bbcefc32872a95f6d

2025.07.14:
https://github.com/certifi/python-certifi/pull/359
https://github.com/certifi/python-certifi/pull/359/commits/1c50d2bb6a10403300c0f1c17cff1b6277cb88d1

Comparing changes:
https://github.com/certifi/python-certifi/compare/2025.07.09...2025.08.03

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...{python3-certifi_2025.7.9.bb => python3-certifi_2025.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.7.9.bb => python3-certifi_2025.8.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb b/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
index 709346486aa..d3e842b4bd6 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "c1d2ec05395148ee10cf672ffc28cd37ea0ab0d99f9cc74c43e588cbd111b079"
+SRC_URI[sha256sum] = "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


