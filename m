Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A42C3601A
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:59:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.3271.1743537573615311628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 12:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0KfxnJfn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227914acd20so2551725ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743537573; x=1744142373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+EKyB5XcguyGY5jYRPx2TO4YMoMaBJkl3KitioF4TQ=;
        b=0KfxnJfnZVe3ZHqXfiH32jNpUpgOLtHtbLU6xt1AUeQH6xriNAN3MwJzixeV/1mw4X
         krfhQLFtTXa+s1OtRaYMolw/W7YCeCX05AeNas1apsp4YCMyD2GTYhV1H76UHGF3KcHF
         H4kspqnWgPxHLj68mga5BwV9VWdGFOyuS7ykJnp9UJHrGpfnrPdHdVvrzMYXGqK2diUn
         ZUlVEtTyDrxMREgIjTau8wckM4DHzhv82t7zfTqDWZbI/W8dAArRX3l94fS0yiL2pt2H
         TgScNXEBd1hI9lWsczL39jNTNI5e9m/5cqYLZz428ziOdb5ufuVV2MlpvwOvuNX6s6tB
         YtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537573; x=1744142373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+EKyB5XcguyGY5jYRPx2TO4YMoMaBJkl3KitioF4TQ=;
        b=qhQg26RxhH4rokGp21DLK33YxqlPgzNDm8xjO1IJ+boWjwLqyzfngDK4Srljokct0E
         z30yxBTXFwmnGEnkce3tZubBdIRuyqIofX5YtQ4srk2idB5bGQvYS0/jogLZ44rbbCMp
         Nk8+vD5pgjJUrWhIOsCK6vn+bRczBvi3L4x7zhfkKMRpZ8Vcs634nklRDasxTzCdRcE/
         qDcXevaFP5TrxMWdne+rhTIu9C/35E/LOSEpKQoq+60F9YdPYVI0CFLkQsdLi93uDrGY
         +DyBN47s+FHICvpQjuQyoEasVHrm+9+leL8oQTv0mClVCGkPokPeZGyptft3YIwpez4t
         J0qA==
X-Gm-Message-State: AOJu0YwZPxmHM9Iu/5sdlKPwxW7OBuop6aZdepOZaWMrBcmF3tZnNqCZ
	laLNiJ/Oq5fOsfFCCbsMMjmDZLS6f3A2pj6aj7ILiSydMXz6oPauZX94AMQ+uOie1v6ltra9q32
	y
X-Gm-Gg: ASbGncv7bSYet5x0uNakZvKYuc1ykezMyZ0Gqoo2wIJoYGYHBJR38TaOMPwmVZiOfXJ
	MGG2aBNoZz/UzHxLVimsE4uMotzvtF9GPD8cZLgNPlvCUyN7OBvTYmSWRKsvOCipd3hXz819tW5
	HEWUhY/7m8eTy+FI5fdhO2RhSUltcb1+ZLnxjH3EegCUullypwNViuLlFNUDDu2C5N8TEpLBQgw
	l4OyDHoZ+50yDJZmB3A5j19WthLJIfzmQA3bloB2N5YUholbNOETlCtNFp5X8IgJKMMvX2/VPk5
	fOlgooEbVNf06mLtvhgW8JeGxByXIQsZDVEC
X-Google-Smtp-Source: AGHT+IGWxm8jSBeVZYc9NJfrJQra72+8xzIOHv8JKko3+/FE6UETQ4p+WVOX92/RCiTvnDzqN4+9SQ==
X-Received: by 2002:a05:6a20:89a4:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-200dfa2736amr1281711637.11.1743537572818;
        Tue, 01 Apr 2025 12:59:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b52ea6bsm7234369a12.0.2025.04.01.12.59.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:59:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/5] rust-cross-canadian: Set CVE_STATUS ignore for CVE-2024-43402
Date: Tue,  1 Apr 2025 12:59:20 -0700
Message-ID: <ef2ba1f04f6f21530dc4efe5c4f61cbb0c76c032.1743537463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743537463.git.steve@sakoman.com>
References: <cover.1743537463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 19:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214148

From: Virendra Thakur <virendra.thakur@kpit.com>

This CVE was created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

As per NVD, this CVE only affects to Windows platform

Reference: https://git.yoctoproject.org/meta-lts-mixins/commit/?h=scarthgap/rust&id=13f045acf6388d1e320fd4c0f3ca19ca7a75ef44

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index dbf997560b..ac5f6bd57c 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -15,6 +15,10 @@ SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
 S = "${WORKDIR}"
 
+# As per NVD, this CVE only affects to Windows platform
+# Link: https://nvd.nist.gov/vuln/detail/CVE-2024-43402
+CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
+
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
-- 
2.43.0


