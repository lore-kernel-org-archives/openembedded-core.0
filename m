Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79767E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 03:36:10 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.122498.1734579363492550037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 19:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3zcmeU6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-728eccf836bso296573b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 19:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734579362; x=1735184162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzU5y6DPOoI0Pdvzhk5bmp6Qmkqo3Q1PRMnHfP+BXnw=;
        b=O3zcmeU6QqHPALiLEEI3pV4Y6Ugt2JH9ytMcUK3ZHjiZ1C6efhtzEOZOSmNTPgvg7s
         9uMy6GDKuJkVk63RDlMik1b+5MYbCUH1TgUnpfEjvHvLp+7GIb0F8LSw6sjctvvincsW
         SouShf42P2ZKbrxhpW6KiFlty1nEnbn8eFohGkIvBRTfa6EZtju6D2Wau8gXQmf1GhG2
         IWR/NjUByGCsTVRPCbJQ8Q/fb2zRv8vZ7/oVNiS3SnHrtnn9f0vEPU1vLSAn8wQv9AGE
         mKRp+c3Ry0cPhMNtry+ZjTouZzbq/iGS7+WXwHa3aYMo6l7uQKB6pi6M/9ZD24WIiuLM
         EWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734579362; x=1735184162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzU5y6DPOoI0Pdvzhk5bmp6Qmkqo3Q1PRMnHfP+BXnw=;
        b=Vnh0GxAFQLE4OcYA7TododbR7M2b6ugp+Kn1zZVIFomi9FarfEDuiky+YaiOydBoA8
         /xF6Gx8o8il222sb2xsE2RxCVDwVVwWMxlBd/VLnDtCP6vdYxNm3l/3QcFKThSYtwnC1
         ck5twtaZS5Ys3QOrMLMIBGazXwzWRLzNrncjSoya8cBmLBpCv5YQXG2OW+mU3BTjsmAq
         tM0faI+Bs7Yw7Hd2iFzKmy/N/9XzrV5QJ1R7sHgiHnvqPkCxo+dGQ/by+UDI4el6sT9k
         AoeiOLw+bNiD+i3bprqwcDiFCAU9MWMMrgLG7R7pV1PUs7V44OjP6g+jyEEnxExX8MmG
         v1dw==
X-Gm-Message-State: AOJu0Yyo3l7ZfsZw9UfYdkFNbXOFwQ2wsKoxrur3/3Qt6fC43jxYeEie
	HiOKc+B3ixmnssLz0hzneLWuc6XkxNlbj108A6kA2R27gGE3nWRFtjtvHKXK
X-Gm-Gg: ASbGncvLxgdJP/7C6kqlgHm54TdeBVDM1I90LTKyWUYTEPBbf/ZKIncyidvsydAqwpE
	BPdPGckhVOEfU7wKf2lj2WLcXSRSBQ3bUoxJNou8RTYrCW49/GoWKO1NaoSpSUjNE9lxSsAnMBW
	yvxGne+QY8C9ddY8VI/6n+h+YqYW/uG0pOY80G8Mzmd0NL1e4oEkjzUBNsmq+p1qemsqiDfi8tJ
	qRDGo1/RoGu4NKf/fK/yXZjFrvv15kqxcSXWhA2o6CyVsl7Y4WaYaW8PQ==
X-Google-Smtp-Source: AGHT+IGFAg0zlJfOV5TzzcN7WRxcGxiICmRvkA6AmVWI7bMD/5ImHlhAEMASbEW2ksnGbB3tKdPSSw==
X-Received: by 2002:a05:6a20:a10b:b0:1e3:da8c:1f3b with SMTP id adf61e73a8af0-1e5c76b8433mr2783079637.28.1734579362440;
        Wed, 18 Dec 2024 19:36:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::d5a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72e61sm195975a12.3.2024.12.18.19.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 19:36:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nfs-utils: Fix warnings found with clang
Date: Wed, 18 Dec 2024 19:35:59 -0800
Message-ID: <20241219033559.4188397-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 03:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208894

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-typecast-warning-with-clang.patch | 29 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.8.2.bb              |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
new file mode 100644
index 00000000000..4b38db1f747
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
@@ -0,0 +1,29 @@
+From bbed752dfad73738baefe518e5959b5c0f038c75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2024 19:20:39 -0800
+Subject: [PATCH] Fix typecast warning with clang
+
+Fixes
+file.c:200:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173457863307678&w=2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Benjamin Coddington <bcodding@redhat.com>
+Cc: Steve Dickson <steved@redhat.com>
+---
+ support/nsm/file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/support/nsm/file.c b/support/nsm/file.c
+index de122b0..0fa6164 100644
+--- a/support/nsm/file.c
++++ b/support/nsm/file.c
+@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)
+ 
+ 	base = strrchr(pathname, '/');
+ 	if (base == NULL)
+-		base = pathname;
++		base = (char*)pathname;
+ 	else
+ 		base++;
+ 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index 543c68f7f5b..18c4a249b33 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+           file://0001-Fix-typecast-warning-with-clang.patch \
            "
 
 SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"

