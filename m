Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E1DCD98F2
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4349.1763070466193529617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/UE9PdU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2984dfae043so11776375ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070465; x=1763675265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqoHIAOMP/FKT/9VT/hqQELvOIqQD/vYIqYYxJUp824=;
        b=R/UE9PdUoY2WOImFc/EZVfxEAILyempKOCsb+T7ZP4Xn1CZSose/hMGKsuQqMVRBXH
         oMoeXqTWIruLaYQMBGlhTt1UKHEvQlyBl1OZm+WoDHDTdx3TyiVWaJgwXKhbkuKrRRa7
         DVvehCL3oH4Q1ZltsHb3fod2KxgjeK8Sb4w7/HN1xpNOYeLBqIhQrt4F59j8qP9XupFO
         VF+H2ImTYDEGCE7gNSwO8HV8YZFhM05mqcMBUUaGyKAPlJvZPQNpFXZ6BAsCqsHv0EXD
         vnuc88Pso96PErutYnPMial+XmWLMFtEIBtCrGK/6jN1A2pbfsEcQ/NcFEjajId9gflk
         Yajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070465; x=1763675265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqoHIAOMP/FKT/9VT/hqQELvOIqQD/vYIqYYxJUp824=;
        b=rw1HcvHGHzEfmaYdtm4QLEM2DoKwcEZMLONHB/YWK9kkQ+aWtRip8oL0CsCYqIz1Qa
         mpdTX23/A4sYWxBJnDPo0xFTi2W+iCi0/H8wfKZWPHpJWdMqtK539thv1toUPUlyKM+7
         SUrrINxdex/z3sx5O7T8ms+jD3cbb6hcfmS3blEd0vO/+8nA5ATHAixTbuUmXGOh55KD
         WG7vbBD9ilI0Tdns8Tsw5agloHekNhb9A3xSXV8e/4UHRBi3Hfms6grmGyk08I3d1k2l
         7MgSJbe/CMkGdmZ2rkARlFwk1Sg7me1uTE24bDGyQ1k3t5nbWDb4DRlXqTljOlBw0w1M
         rWqg==
X-Gm-Message-State: AOJu0YwQQBjj7zEg5977Wc3y7fanYcXOhGbkW5kK6IuptKak7AZeQh+m
	j9+rJ2ecRMMFSzxMJXXDyDma3PxUsKouGAnAmu/dNu1gAr3T7O0KYItrJ4VoxKZ0qt0+H9PZQRR
	mLq3m
X-Gm-Gg: ASbGncsahFk3Hkfv6AFsN3Qw5jrB5wImdueGonXt4hIJOb5xm5FKb+BrHLxpgwW0cw0
	Iecgsl2/dzxVq+GmiTJ0Ta+RQUePq49uhdbqtQlt6ttJTyyG1OjVygmiSXr1WmrJH+3Z829TWj3
	zY630+eyOHUKk8WMIxV+kYb/4rhbCWgCKbfokLV7zXVaVU+o21Ufph2srF9PBiY4eAW0NQnZ4qV
	WrfoDSrfiMA++rm2xhhABOV+MweEn4rqlxG6bWZep39aUMoDgyG7uddHYN9lOMc6bWhl8RJSd/+
	PV3JIfXQ3w7A1PNU8O3vbkBaqrKizIwzo7w3xZIg/9+WFMPM3eX6V+RAtRvuvlzOIMg+Ou+rWqo
	5R7c1qaX/2EVuluafmJfzm1zeNCpehD3cOvtTFdPaacqwUhZHiJp73MZ0cUqRjXenfw==
X-Google-Smtp-Source: AGHT+IFYYEE+ToUnQaxm627SqKc8eJiKEykViiYVkxwk11sa2wRPS1b+d2Rc8ZB6iGfnkNpVXGJ5nA==
X-Received: by 2002:a17:903:4b4e:b0:295:6c26:933b with SMTP id d9443c01a7336-2986a6b87a7mr5484765ad.1.1763070465351;
        Thu, 13 Nov 2025 13:47:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] python3-urllib3: Upgrade 1.26.18 -> 1.26.20
Date: Thu, 13 Nov 2025 13:47:25 -0800
Message-ID: <2e805113fe0488224f05524360eeff729dd12d91.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226278

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-37891

Changelog:
----------
https://github.com/urllib3/urllib3/blob/1.26.20/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.18.bb => python3-urllib3_1.26.20.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.18.bb => python3-urllib3_1.26.20.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
index b26c9ad2fa..58988e4205 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e328580a0"
+SRC_URI[sha256sum] = "40c2dc0c681e47eb8f90e7e27bf6ff7df2e677421fd46756da1161c39ca70d32"
 
 inherit pypi setuptools3
 
-- 
2.43.0


