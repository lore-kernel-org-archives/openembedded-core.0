Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D10C77B73
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.26717.1750067407441226334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9tLOJWR;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso38028055e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067406; x=1750672206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVp8EvTUE1YaFCWkVjXzojieFj290ZYit5FSH8J2A4o=;
        b=V9tLOJWRIjtcF33gq9xc/jrGSS5jdogJfSC2HGdIyoTROfTKPX392wpvRpu/TwR7Zt
         5mS0/GdWrZ0QdqjPmZKaMU7ZrfR0iNByCSKErIhmLOkvHfqOF031E7d4MFhoTFiqHXI6
         /7oQi1UKaMNudM7RII0hjXWOSC4dloPdUaXofuUGQ876BcwZfMEMiaTRUOo6uQRjwgPa
         +BPDiAhaxcDaTf71T5wgDA7PBPIjpHdkG6NDtF0WDlgCJr++9ZJ+7HApWvkjyAWUhkEG
         XkbHZPID2KQTL2rFPBcoO5dc/cE7DvVX+MWT3f72nDd5YNQbGj+arym1Co7xkqhgfE6Q
         mJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067406; x=1750672206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVp8EvTUE1YaFCWkVjXzojieFj290ZYit5FSH8J2A4o=;
        b=amO8UIVX+kVGf6ld1wUeL0e1WLwmntS6Pqb6ccYygv6iMn7VylfEoN7BE+hLnuCmZm
         vovT8hgz3c6d4oFqCW3LG3oKZBaU87aC3sYSfd8vMBdDX3BckgJu59heLE+WgWa3EvqS
         UR4gaa7yZz+hS6wvLjJMpQkOMNDMB2ZBAGHKF+fUwCSwGblPl1yi1KehC3ceKGJl/zXC
         BNZdVpAqh5dGR8p9S/+QD9kHaHrPm9CeCTo2rfvCsIEpu128eWriGoH8dB8Liw8t+U4x
         cD4mzmG6ivYAzr1r7LrZZ+JRenQ66mW4m6Hmg0w8pas2IAhOvz4KNz76laIfGL610UDo
         Hucw==
X-Gm-Message-State: AOJu0YzCkllPRMOSuiFGtuus2nFCmH9NByfsTdH95lHrK3fjDoGDyQBS
	jg4bD0cwFm+xYLi4+zfqTgrOq039QRyqFRdVB7ae6gfgTLvaQl46BCtfSmYSoQ==
X-Gm-Gg: ASbGncsDAMSsUrI9J/kZdQljDd2StrOjPh3f0KWmLQt9ZmaOgEfXMKRXVqPj2adgAy7
	sPbsix/P3t7me1f8TlmYXy1P6fkhngxl5A0m8HIgGMdLf1e9ggh4pxPXlBaP3gZE9ck1WM7TSad
	vbgg41cs0T83noVExq5yGp6uPsCkHWpXbxroObgdgwuTuJ0el0QGMvpah9s201LJBb4kXDfHjvB
	Z4lKWF90uF5QC2pmDmM1oiyluMYE0rPYlPsF/0Ge94ytbzCN/iZPZgCC1a9BOpoifESDav6Kdis
	I9a2MEMW0aYPsotPZQbIcbvWesObcVxwRvcoBsARC8AQFmecyPN3M6byBsryb6mbbhSSAr/NBI+
	0fh3bic6lluZ9cfNNtMa2XZM=
X-Google-Smtp-Source: AGHT+IEjfIGvt+r9SikHDc3x+zMwPX2Z8FbizcRxDvIqfeHEjXE3dUbtqGWyPajci/toSE4Ka/LxEw==
X-Received: by 2002:a05:600c:528e:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-4533cacb7dcmr72011975e9.29.1750067405517;
        Mon, 16 Jun 2025 02:50:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/10] bitbake.conf: set S to be in UNPACKDIR rather than WORKDIR
Date: Mon, 16 Jun 2025 11:49:53 +0200
Message-Id: <20250616095000.2918921-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218800

From: Alexander Kanavin <alex@linutronix.de>

This transitions most of the recipes to have their sources
in UNPACKDIR, which over time will allow more simple and logical
source code handling in various pieces of the Yocto project.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7496221ebd..fb119edaf99 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -411,7 +411,7 @@ UNPACKDIR ??= "${WORKDIR}/sources"
 BB_GIT_DEFAULT_DESTSUFFIX = "${BP}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
-S = "${WORKDIR}/${BP}"
+S = "${UNPACKDIR}/${BP}"
 B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/sysroots"
-- 
2.39.5


