Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BB7C27C53
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.36107.1717244699516597029
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BO5V9/1Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f6262c0a22so14573415ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244699; x=1717849499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5hxJV99rkfROveOUOpjk7E9Nd/rYqkN/Nrx+CyeiUE=;
        b=BO5V9/1Qxc2cDkcAZ/GEwKwZhJomh+nWmWtesuOacxyCCLNfxDpC5/7zNvgrtD3Pt+
         hTHTgZOrbuOH0ZcD7wYVIA2aIUPumGtwa9AmrGfKhoADgMcYzWfIk+z4o5tL9jt6ZNrR
         aNby+nYxEilHaxpDJ9TbX76qNAGp6sLLlXXSaIojdmEgk+Uu4veIqUEMIPUQm5MxQ3z2
         BDY0kfLSXMfbQ+BR0sFvYBc8bDXfMbGN6GnOtNiX98W/LFPd/Za0UrNsj8lOtE9hIVeN
         fyZabCqRTVdkjPsNw4kNYTgDju3pTEo6Zr3zyrq6drnQOOwFu/b1tvr0bMs4oi33Yf28
         vSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244699; x=1717849499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5hxJV99rkfROveOUOpjk7E9Nd/rYqkN/Nrx+CyeiUE=;
        b=qRq2vqNzyW2BY3gqa4xUMNepY30HfUrddiJeDMRhuk5SaVTJs3aVy8CL3Jb2g/h223
         DyDo49gFAdhTLCMHlND8Qph3FKabJImGbDCR+sGOadoCausAdiuP8JrDRP9lSoQY2nXx
         PveWQc42/CAbE8mEjStDtd8FV5Jn4ictqn8e1FCzSOLrsN8ew3hOq3azOftff0BI3h8L
         XMuccC7yYbXNGXPZTR41ffnQEqZ565tuCbdx2BsmW8DaxfLP62G0RIDIpQ93DlhLGXs7
         DrXWUuDb7ATVgBnJ1Zo1kNnMNLhPDWK2UA8h7XP6KGWUx0h4nHW8E0otxcLOR0mnqBVN
         /HRg==
X-Gm-Message-State: AOJu0YwXynN4vSXAuRwSgitsKgumeaS53G+c1rRXlD0W+pkgM2PeZIMU
	RA+x4U+uFJFTtbuGqpLxPxHka1RBP7OllHOdvKagv99Mte9fyq67oGfKWtWmKPzj9P2jU3nqRXu
	c
X-Google-Smtp-Source: AGHT+IFYHcrznXNoZeiX0WWQafnMucqVZamVu801SWa/dtNlLf8DqbQWSTZk+n4GOe5cZmAC0yeWsg==
X-Received: by 2002:a17:902:ec88:b0:1f6:62aa:e0e with SMTP id d9443c01a7336-1f662aa0fc0mr2047435ad.15.1717244698727;
        Sat, 01 Jun 2024 05:24:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.24.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:24:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/21] libusb1: Set CVE_PRODUCT
Date: Sat,  1 Jun 2024 05:24:29 -0700
Message-Id: <89e991380aac2bea93732a8dff1c4c646bb2cea1.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200099

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This commit sets the CVE_PRODUCT variable to "libusb" to match the
product name used in the NIST CPE database [1].

[1]: https://nvd.nist.gov/products/cpe/search

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libusb/libusb1_1.0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.27.bb b/meta/recipes-support/libusb/libusb1_1.0.27.bb
index f2431d75c8..5bf854f95d 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.27.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -8,6 +8,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
+CVE_PRODUCT = "libusb"
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
-- 
2.34.1


