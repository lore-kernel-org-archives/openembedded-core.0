Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A593DC47077
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 23:29:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.32649.1704842956558357785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 15:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHjasska;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3ea5cc137so31332875ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 15:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704842956; x=1705447756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvqPrRlrUuKbPFjdvbYZZUtk+QC02gREU6ZyF0MUtAg=;
        b=FHjasskapWM1/GasV4t/onBgcB/FCEGOdJmYwYteZ7zeOf64KtZtGptKIVYgjx3Z+q
         Oko8zzpM7mmLEW3kMQKpR2HMihW9EuKVIFqA8Gqnd2Ma9+3T33voMec7UXYjfJ1cTJ96
         uhDjriI3uuxuQQ/iizj1Mu3XVDU9RNcauuLVgTnfQy6Sw03NvsBDPbcQwZ8RDHik5GRN
         OTGwBUIyP8i/AhTm9gYh4MsaRLGGBvPyiWtMx8qGAxZ5oaM/cmzCpaNxmfAi95+1HsGt
         iVxUxG7ElAjI3TSmVbBVGMBXliAxZwa4tYPGpY5G4l6r1UIWga/h1Kg/bG3YMM1DzMed
         k3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704842956; x=1705447756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvqPrRlrUuKbPFjdvbYZZUtk+QC02gREU6ZyF0MUtAg=;
        b=dWd96zZwArL+OB+Nj4isrsYkwRqfjozW9Ms1Mw/A1FdaUV3aWo/fy098o/fTAJ7kN6
         QbRAIHNc4qbosTneTh/iZOqUUgtUb898CTxtwBX5lohQOWM+LFskikXhsj8XFom75qDR
         CA1AvFKCyPl8Mf5cbzohNGXuyqzuUCRhf05sEhwj9D/BuRCgI5jiOkF/LeuwwJLCl90x
         1zdNkTLybfmi7fZnEVpxBwK4Sh/3TUGBDblZDMFcBerhGcWu5JwmTAkIeLwLnGuh+JrY
         nIcH00JaDY9XMQAQ2wVvaXDxRm+iqRoOq4LFbu/ExJZZ2MFt4Bw24ooTlTyw/5WnTOA6
         9/Bw==
X-Gm-Message-State: AOJu0YyBPS1rc/zAxcP6mXBNlRDGII/nM22Vlf//TCtvd/LFHRgwJnGq
	uxY2xiRPnKhYCHAPgwA5pCTAdwKQBZH2QQ==
X-Google-Smtp-Source: AGHT+IF9PcgnMvSjdkBUnbImZVvvV4Ryea3eNYf1fECVM0KbPRiFL8P6nHvDbxLs5AUmkGlPGk55IA==
X-Received: by 2002:a17:902:c94f:b0:1d3:5b35:543a with SMTP id i15-20020a170902c94f00b001d35b35543amr165581pla.109.1704842955541;
        Tue, 09 Jan 2024 15:29:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3c3a])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709028c9600b001d060c61da5sm2312808plo.134.2024.01.09.15.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 15:29:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tcl: Fix prepending to run-ptest script
Date: Tue,  9 Jan 2024 15:29:12 -0800
Message-ID: <20240109232912.2557227-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 23:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193485

This ensures that string is prepended properly and eclosed in ''
Fixes the ptest runs on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index b33a78e147f..bb75353a5a8 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -88,7 +88,7 @@ do_install_ptest() {
 
 do_install_ptest:append:libc-musl () {
 	# Assumes locales other than provided by musl-locales
-	sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="unixInit-3*"|' ${D}${PTEST_PATH}/run-ptest
+	sed -i -e "s|SKIPPED_TESTS='|SKIPPED_TESTS='unixInit-3* |" ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
-- 
2.43.0


