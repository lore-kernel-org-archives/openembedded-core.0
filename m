Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.831.1627493548833725878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 10:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=LrRKDozg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id o13so2986512qkk.9
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72vLoaFOyCOppY5NVkOAn23WdcqGjCd0qXm7BgyMmxA=;
        b=LrRKDozgk23y04Vtsj94w2nYFDFotMxKjtTYCBcSTUhSDfiiELSzeqIGIiWuW1Ygs9
         Lr0R0tPznUaSAI8StY/cjLzE/OSd+0QtJzb3lW3RWQMhm26mBCx4GRNWy1HlKYphvXhB
         UfpuCSlXC12g3vpc1BTjXuRDCf573MCmKpc6yvYzhyOlUm1NVE/adTm5JajnOh+p6+F0
         Sn279714xkQxKgHDuDC/M3M32HWeHkbpJCszY9HnZneTaDQrih1tuVOp3EcabkIP5CMl
         vo2vszWDaDcBxiY0OgtyKyNwhxJqhdXuoy8pBIRiIR2299zyeB1z34pkv0dn8p2YwfOD
         NvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72vLoaFOyCOppY5NVkOAn23WdcqGjCd0qXm7BgyMmxA=;
        b=MUexaPEYP9VSJKaFFR5nlhzN+ylmAqmNaPqrq9zn0oGgnQcBaDjG27PngzWkyDiw/g
         NMt18F4VCbGpNdu7ARihQDNKkeF0Y8VhGCtj/33RjPxfB3R2ftzxcCD/69nXFjMAa9Ne
         +a7UzKFvo/MY59q8VOKL0zzhkBGmpW+treLbsaUrAikVL4/RqHnsyAr7R/6bRaug8t7K
         tXZf8B1ZcHuso2tLl3nn8rEhFIXQzlXVYTP4MC/vd2JZgBqPtIQUiy0a8Bx7eJ2CqlgP
         sJbhWbYBMZ+4qeZSczcSXfSpl/dLjDnIxnp3timHnI51UrJdEvfoSJtyou/Ea1kCauu5
         q3jQ==
X-Gm-Message-State: AOAM5309ChYcIVnCVsJX4NsudvKACxqMhnTTxdiE/uh8uyZzf1WB0dBH
	Kt6UHGcCAWKhUVaVGSgUfajJruDzoXzOSg==
X-Google-Smtp-Source: ABdhPJy5NmAih5Pew7LCiaFVdxno0tX/3nMcdahrhsrVTdowNQMITlz7U1P6iJyC6h1akiTLdN4wkw==
X-Received: by 2002:a37:4042:: with SMTP id n63mr747960qka.425.1627493547721;
        Wed, 28 Jul 2021 10:32:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:bcd8:ed53:504b:4ba7])
        by smtp.gmail.com with ESMTPSA id i4sm304041qka.130.2021.07.28.10.32.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 10:32:27 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] parselogs.py: qemuarm should be qemuarmv5
Date: Wed, 28 Jul 2021 13:32:26 -0400
Message-Id: <20210728173226.14546-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the errors being masked off for qemuarm are legacy from before
the migration of qemuarm to qemuarmv5.  Rename the machine to that to
allow for qemuarmv5 to pass parselog test.  Light testing shows no
errors in dmesg for qemuarm.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 73243c36591d..af8a8d67bd46 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -122,7 +122,7 @@ ignore_errors = {
         'synth uevent: /devices/vio: failed to send uevent',
         'PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]',
         ] + common_errors,
-    'qemuarm' : [
+    'qemuarmv5' : [
         'mmci-pl18x: probe of fpga:05 failed with error -22',
         'mmci-pl18x: probe of fpga:0b failed with error -22',
         'Failed to load module "glx"',
@@ -136,6 +136,7 @@ ignore_errors = {
         'OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000',
         'Failed to initialize \'/amba/timer@101e3000\': -22',
         'jitterentropy: Initialization failed with host not compliant with requirements: 2',
+        'clcd-pl11x: probe of 10120000.display failed with error -2',
         ] + common_errors,
     'qemuarm64' : [
         'Fatal server error:',
-- 
2.20.1

