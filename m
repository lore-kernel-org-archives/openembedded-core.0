Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.966.1613428895602662878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 14:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2gpqB3y;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id cl8so4537835pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 14:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zknK1cTappJxJi5kfyojntpKukritZFN45HT2d+AQw=;
        b=p2gpqB3y/Py/3IiSugU1IG+a8ljzrwzHWrTdbOEC4Byu6PN5xfZzgpg7sjVcIsANyJ
         FEOZSHBNiubOpiCOwRaNV3t0om9khpQp7WXkrVM/iOtK1+i4zVUOQEkNTVdysc1SmeHl
         59wJ6kzsbgmero1gRKYMc+oj1QQF8cOVfxatwKIrwhB/tqzy6hx0Rx9K9Yz6uk8a6Eys
         07sfWtwM1h+VxziOoPx/kSyuMNEhSdMZiquYL8eSKjJJkyUYavRq9wIDW77cAT3yo2h3
         z8ZyPDYDTiVaZtJ9cJLbboD2mZBwHHBJ9MP/jJy3qHDXzn0jUKIYLey4OYjbkUoQ73cd
         Cqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zknK1cTappJxJi5kfyojntpKukritZFN45HT2d+AQw=;
        b=VIaKKEtI2gJHWg4T6433L1UyoynDNwen5PcAoP39EtYkgccYEOtkOttg7R+5/fFqY8
         JeLWYIBPzrv6vP9DxwHowQqRfGFjoIb3an2xQw2zR4QCFJMoTaMzKgD2pYu63y+8KtMz
         Fy9FvobhmnZ9Cez+cSARZbpx3z1L1c9yzXxpbTDf688HvfntGFcZcC7Hpi/MFtPEvmHm
         0Hu9U0aNtBZx9/kjH5PImYZFRAa09gPlZx3YU8nGIiWvh+vLuUmI4VEqH+pUTQFAvjv8
         0SKNJKRlyK6oD42mOaczzZQfByPuyo/l3/OQoIUFWMacTg+Qr/mrBOtH2qR19D3FbyOG
         wweg==
X-Gm-Message-State: AOAM532Q6egULTWZK4KN2PppdAi9F9/97Eab43otbkNGZV0ypp3BowZn
	2VQx5gbmVPZdCEMntEgasFObpk4MqJs=
X-Google-Smtp-Source: ABdhPJxHPeCth748N+drZ3ETOMieqJ0qxdPMtwwg/J9FAVJTsv4b6MUoEMZnYx1otNNf04Ay0eYnlw==
X-Received: by 2002:a17:90a:bb8b:: with SMTP id v11mr959578pjr.77.1613428894883;
        Mon, 15 Feb 2021 14:41:34 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id ga22sm476407pjb.34.2021.02.15.14.41.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 14:41:34 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [[PATCH] cve-check.bbclass: don't skip scanning if file not found
Date: Mon, 15 Feb 2021 22:41:33 +0000
Message-Id: <20210215224133.2550191-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps avoid these errors:
ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found: /home/build/builds/master/tmp/work/core2-64-poky-linux/lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff

We should continuing to scan other applied patches for CVE info.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1bed815d8e4..e56366579d1 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -186,8 +186,8 @@ def get_patches_cves(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
         if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
+            bb.warn("File Not found: %s" % patch_file)
+            continue
 
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
-- 
2.25.1

