Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1143FCA0FFD
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 18:55:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2939.1756493742938484230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 11:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BkVYt41+;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-771e15ce64eso2133978b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756493742; x=1757098542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/cswSbKhxsdgO8ZNczEQ9EsIr0he5IK6Qvf/Lsgy+o=;
        b=BkVYt41+QW+WJD5TENjO2HIn3SUfzj+qckjOnunAoLtbU1r4KYftHBQaxx0T6Ghiu/
         qWVez/zI1EiqniFtMA746yXRWiVE+eeOKXAbaq5wkTYVbSJ5F4w6BoQxYQRx/amVsins
         U+0K+7/YBfu6rGCbad56DOUhKQLCIWAyWvJlB3O1FmNIPei7ckjWJ7RKzODinYXxnrO4
         fjrbi0DRT1vRxMkMY+839wcjGV+33Q4pwEGoHa6GB2ehagH2LQSrCSQMTWJw7agqcwSP
         bdZWFKzuWeb/DVVdc0hNVg/2UoBAaXIQAYu+Voppaar7mQ3lVKliCtfGskZAcCrHcxQ+
         Vp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493742; x=1757098542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/cswSbKhxsdgO8ZNczEQ9EsIr0he5IK6Qvf/Lsgy+o=;
        b=YJ4zUzzQkOULkgmtiYhvHwzQyuHAPNQgcVVwEaGgLXrQ4ZWTVZoVD0xnziYOWh2Mgc
         NOhs1+Hn9cCkkpfvwbE8JsvnHMGNYCRjSBgZ5NVq9enP+B+f97iqGGoQoqga2+AleKJj
         p/9gd5q6QCsj6WV0RGK6dJBxlVZIG2Br2+7ZXqv/0Cj0OXcNX7/3gTiQ+lMe9yHkdxsM
         fyoYRNT9+7y3Jx7wAtSqx/mSoOE8fS5olrWln4cbwNsBJrO/4Hw1ic9qAFaOBEJMhR1y
         WgIY1QLz4mHXkh4OQcotaHlAzZlJClJj0mQOBJQJscP7N2RxbGHtG3l/fR471Bd845Oe
         whbQ==
X-Gm-Message-State: AOJu0Yw9uGG0YP/G40hr+2R/EgOCbZd1cCGD2gkP8seNLFGvsG4y/9hn
	Q6WwFmxk8rw7DgLLj2cgoe9avZn6VmF0MQ9PVhL+2yc32iQ7j7z4f0m1QMMBmhbE
X-Gm-Gg: ASbGnctV6ty6ohdG1/sB1fvd0KHIrF5mbfUZXBLFZqiaDO3+gqEzhRIg3Dgh71PpDVX
	ii2JtFQyJKgLKWQKG+g38ExhhAer3qZnWBrHqsczz7EEnu9+9RLrGG4b9YgDWrNV0tgpE8i6rV2
	wHcBHgAW3qNzpkRhA1cerIQ+HzqrgesOzBsKMJijJElygZ0u7Cj3O6P/AnTeoc0NTZOKNz8kWzC
	oVZ/qvCCaEK9BDIFHfW/jdw9dMscJe9+PCbYi1nzx2/XVLoojlXkCvXeIVm6fdLFyqoipD07CH/
	I6WQac0iKYmIS45KB+ZhA/HSqwp0p/vk/oGjCS3+fl3D9faIA1LIdYeEHVGXjDKZR2w/RWb30WP
	Sc3h8cFGgQ1H415WDzl3KCVb0FbSoWCtWQCKLTPE1Uro0bhgHbtmH2W0gi5mqeIrLlhWHRoDR0r
	ZgemGI6M191WuBrZVpNpTxTTzDXARMa+ErZiGcW/MXB9QKazLgu9U=
X-Google-Smtp-Source: AGHT+IGQ2pSGaifgLLH4AEEMAWjqXfPoThn0b26f3bNMTmI7Zc+c6LJUlpCRofYD3rEo7Ln12Lq53g==
X-Received: by 2002:a05:6a00:b95:b0:772:2c15:230e with SMTP id d2e1a72fcca58-7722c1524b2mr6177944b3a.6.1756493741967;
        Fri, 29 Aug 2025 11:55:41 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26ac0esm3049863b3a.2.2025.08.29.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 11:55:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] boost-build-native: upgrade 1.87 -> 1.89
Date: Fri, 29 Aug 2025 11:55:35 -0700
Message-ID: <20250829185539.3379514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 18:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222621

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased
v3: No change

 ...st-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.89.0.bb} (88%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
similarity index 88%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.89.0.bb
index 5b914b6f88f..911de72bc1f 100644
--- a/meta/recipes-support/boost/boost-build-native_1.87.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.89.0.bb
@@ -6,8 +6,8 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
+SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"

