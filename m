Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3480BC3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 18:43:51 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.21477.1720982627649676370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 11:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJiovP3b;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-75c3acf90f0so2341939a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720982627; x=1721587427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrn2911XpxaM+VPyczwiC0efo+wKmaxi6acUsqyo6Ss=;
        b=jJiovP3b+YY8q3RZgXgjErVzXY/LWY5TzKk9OBr+f36KzaOH+S5I7/X3DrNf1VTBO+
         nCMMhXMhegJbI+PVrOuPBHBXujJghbb1I+dXuoY/Bm6OrILEsDO9Gn0YJ83sj+uf3ps3
         tCwOt9jDb4HtrVWgmTA7fvGknjPPKkokcUZjN1ym7vKPeO7gcaAM9WicxvNV/mwDVglR
         x0X6BlBYCOeNM01PRynhxfo9Qob0uw8TXHmQCfLeF2bVyvwEPEzm1z2+b4WaTT65tOsS
         NOmU1hhWExO/0yRMZLAVvCKCfMf4NFtyMOu5diiCtSvGIBNsxX6IMrnRdk4S6OfH+y73
         MaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720982627; x=1721587427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrn2911XpxaM+VPyczwiC0efo+wKmaxi6acUsqyo6Ss=;
        b=W1C9NpsPj2OPsofMe15KSMKJkqMnGxk8TG7N9Q/TigD1+GyxdferOo2GxzuT4l4iY4
         hqZM7A864vb3pMH4AYlVTD1mZrcA3TVClHaykSXiPEOwdI+AICdt0Pr+i1CC91xEvxZS
         4/MarA5ZHmvDFqmOziVu2NCZhPfudPRxx5RkT64SoLk5z1fg8JCb6NlPm4eqZGfnoPZw
         sImnehwfo77NeezGs1PjCCkSO5OL89gsFOlzcHVW2z/UNpBNrr5eQXYyH7zFVIj5yQWR
         aXmZOPonz6H6ajQkXxtVa4Pw7AlCr0ZDXHLsn1HmU+IdoYD1J57PRfaQNah/jjwbfRKS
         P4rw==
X-Gm-Message-State: AOJu0YymQhjs3PtS/M30wa7Q8zLUP13RXWJ/XvLTPuIyykNwNfIff+Q3
	zm6013H+8ggfAcp9To2nJXWfRqy49Mu2DXLBjhITneQscX9jcHm4cZH9mgXo
X-Google-Smtp-Source: AGHT+IHwXn+F1ld5HNcmqfY9Rrgq/KWZlTfn7vr8e7+OYqLfuPVypDGwUJ6korwSFsj4dZlZ3CJxKA==
X-Received: by 2002:a17:903:988:b0:1fb:7435:c2c5 with SMTP id d9443c01a7336-1fbb6ec1c1cmr137368935ad.46.1720982626613;
        Sun, 14 Jul 2024 11:43:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f6de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc5cdadsm26539695ad.303.2024.07.14.11.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 11:43:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-14: Mark CVE-2023-4039 as fixed in GCC14+
Date: Sun, 14 Jul 2024 11:43:44 -0700
Message-ID: <20240714184344.923440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 18:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201892

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-14.1.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtools/gcc/gcc-14.1.inc
index 8b51b2938e8..8e887c84144 100644
--- a/meta/recipes-devtools/gcc/gcc-14.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.1.inc
@@ -111,3 +111,4 @@ EXTRA_OECONF_INITIAL = "\
 "
 
 CVE_STATUS[CVE-2021-37322] = "cpe-incorrect: Is a binutils 2.26 issue, not gcc"
+CVE_STATUS[CVE-2023-4039] = "fixed-version: Fixed from version 14.0+"

