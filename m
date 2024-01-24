Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DD4C48260
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.23138.1706104897779067782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EtSAAHqi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d70b0e521eso39998345ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104896; x=1706709696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGTauSoo165RBrn84U2tRbvzoY3jD2LV6a503tl+1nw=;
        b=EtSAAHqis6A1n7vbX2i8VUQ8EETMyng6rtyYIVVO0qvyD3BhtOHSC4bvw+qES+rOuE
         2+2vyv1tKfOU0Pzogwk1cWT94e1cRrv/WAxxzwHkeFkLyaKr1KGA/WpLONmXX6PZ8HYI
         ycHkI4wGC/snlzlqJEPNdTrasiYMz2X9uWv2oO1Av5TqZPmaUmNajxFc6Xec6SAN6tCi
         HqgfHKskTm0B7KGMcvN6sQ2g8Y2PWdsfqk2Cc311mAKDSIiLh8pC/hIwLV4YcMlX69Oq
         sq9bTP/Sww1FnN2e6+m/hGCCv7MPJKJOvTrFeDc+N9ZXLWRNffjbg939V7WKTAJmMecD
         Aa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104896; x=1706709696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGTauSoo165RBrn84U2tRbvzoY3jD2LV6a503tl+1nw=;
        b=hVjcBQyuALN0HSSOxoNByY/P8a6944s0T42biya9goeMHoOWfKzWV+U9KGFwFhcHog
         J8H6EMpHRYS+YBZVFD3dr7nJg5WYtmvpU/sFX0ukxieEAVMDd5PkrEGgGclsdV38t7v3
         BNh9PaJPIAljzEVu3OHL2D9MIomodfcB34pUHwzSw9SxZXWdiJvCObt4rn9IH8N0B8RN
         gPGioNNp3ojvlPePzd3YGklJBKEGmQ65Cjrbb7YQIkQyanPxC5TxsYfSp/pAZUrHn8Jl
         OV8fzFGG7jCMqT6mgp7zwSIoYgLeUo8Nf7ouEcH1ELA3Lm2cekmS1yC8qevoQSdi5jJi
         ywLQ==
X-Gm-Message-State: AOJu0YwJrjBcgGKL19UWsavB+NzdVsyvpqiVp7y9KsFus/MYs3Z/MA76
	qtvxaOKdk3bHYHE3kiGSyfBgxB41vNojHBSWsL1rDSSfHaB8ZIE/ntefw+stu/QE+wilG1LpbaF
	OG9U=
X-Google-Smtp-Source: AGHT+IFIT7eEl0/iS8wtYcHF+n7QiISkB6zmZ5K3QSXykVatBArxBa9I04+4tEqKd+PV2840bZ8UNw==
X-Received: by 2002:a17:902:f682:b0:1d7:48e1:e219 with SMTP id l2-20020a170902f68200b001d748e1e219mr865619plg.90.1706104896125;
        Wed, 24 Jan 2024 06:01:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/12] qemu: 8.1.2 -> 8.1.4
Date: Wed, 24 Jan 2024 04:01:09 -1000
Message-Id: <2a2f2b5be2070544f0ab98144e4c31c749b7d504.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194282

From: Lee Chee Yang <chee.yang.lee@intel.com>

update include fix for CVE-2023-3019.
CVE-2023-3019 : https://github.com/qemu/qemu/commit/88e79a2dfda319f9ebec2cc8a5c3c9733716d13f

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../qemu/{qemu-native_8.1.2.bb => qemu-native_8.1.4.bb}         | 0
 ...{qemu-system-native_8.1.2.bb => qemu-system-native_8.1.4.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.4.bb}     | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.2.bb => qemu-native_8.1.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.2.bb => qemu-system-native_8.1.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.4.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-native_8.1.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.1.4.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.1.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.1.4.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5ab2cb83b4..0ea23ecdc3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
+SRC_URI[sha256sum] = "176dd6d0bdcc4c71a94172d12ddb7a3b2e8e20d638e5db26138165a382be2dbd"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.2.bb b/meta/recipes-devtools/qemu/qemu_8.1.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.4.bb
-- 
2.34.1


