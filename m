Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B96E67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68628.1766353037123381956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NKFuMi++;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7f1243792f2so2300618b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353036; x=1766957836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2o5kOplooXkwKWT06K2A3vo53Pa7VglfLj+aX5bWTU=;
        b=NKFuMi+++5iZVpPQerd27igJfoAOVu1jY26R49/GiNYqzGY1hb7Ff8N+1RykqmVh8a
         91yFDC0Cz4wsfUfp/yFw1Wz0uNcao51zup2C6I+4iQQPty9nyG7EUFTczbQYlzfbLFq9
         t7JrKKPoqeljYVTxZIzoobxnzI42w0uNCn9vz4yAiMsCtmFB/HIe0aK+J3KAy+x4VNii
         6DEEw1qV01zB7sKxX8PI3gwO0p82TVEbXo9LLMhJyeLVgKcS5FiZSZ/m+CuYnFNjZCyg
         PHzqsmn7CPCQkjcKy1mn8+brgngrjdPwBq3o0YiPwC5hZfV7HnmEGOcMHQJ7CWKlq/k6
         mMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353036; x=1766957836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2o5kOplooXkwKWT06K2A3vo53Pa7VglfLj+aX5bWTU=;
        b=Dg9lLJwwsg7VCBiLxingmBJRA99D68kNMEgnc+iFPF0gLflws/nHpr1apyFLTWAQdV
         tMqDJ4ZZjDpxP4jzuawOvYlHOvZxvpFuNnfbdcKga/b4I3pMDgEL5JHKAV314qrMzXC4
         dW1Oqb0oWIaV3Qdm3rQgMOdZnYPVMzwH7ripeZk+0wO9Gvrv0QJ3v/zFFJiIHD+YYr9x
         wBH0PjIBxg54LNP7xq7nEecf79e3WHM5KTIBckwKhU7+McKXb9eb5JlpftT4jo4H7VCN
         8gFvn7LqWPai8oIO/EPZxP3uMuBvYwXhn8KF111WWPA7Dlb415Sa+sQJhcFwpWjWeeKw
         EJDA==
X-Gm-Message-State: AOJu0YyTri3+G8pI4CN9aV6gNckZ0S9pi3934+Cbrb42gwas/k1EhPOC
	XHh2DEr4x+WiTesvunnUwVjsV0R+KFz6g7/UbofQMeW2PdLEFOt0QV3P83+j2nqFrxvLi5Z12SX
	EXJ4sYf0=
X-Gm-Gg: AY/fxX7c0bnnK610/5HxtM9orErO2ESHXyrxEEdYm5T00VX0G8xswWGQL5Cn3v0JEa0
	xJIYO98DY2ch7YVHTM5foe1IHeyrF18DQSiVb/wx9LQUpTo3STsGOZgAc4jSbVzUttc4spGEhqE
	OtioveLbYbmaYJw8VviEoCsSiNaIVd3osojsz5dJVrfpV+HwBndJg3GV+hMKXh2TIqLzSFDBARm
	UeMm6mImnvFye4mPRWfl/GwUT/Z6ScS8YOZnkpe72W+dDPp6SkXelMyvwgQznWkCl35HytdPpV0
	hnpghtKplKSvCs6Hlk7kEs7RxBqiSIWmIDVD7tnqGq/pSrab9I9KYl6x27y1BSBVqIxkr1xY5WQ
	910UXIDCMA3HZETZIbgIQUK5Cl0JuF1ArYenGaNTVBdCJYfC1cuwQzxJdrLx6WcBv15pMLp5Q5D
	LJ
X-Google-Smtp-Source: AGHT+IEI+Ua6jd+hjAu46RI2o5ZbUdoLytKF6vgXkh8eFkw54UUh+/qrrmsg37jQs7AzXtxtKAC54g==
X-Received: by 2002:a05:6a00:3286:b0:7ee:f5d7:cd9a with SMTP id d2e1a72fcca58-7ff6725628cmr7443270b3a.46.1766353036145;
        Sun, 21 Dec 2025 13:37:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/18] Patch review
Date: Sun, 21 Dec 2025 13:36:53 -0800
Message-ID: <cover.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228258

Please review this set of changes for whinlatter and have comments back by
end of day Tuesday December 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2893

Note: there was a failure in the Send QA Email task, but this is an known
issue that also is present on the master branch

The following changes since commit 8519978592483bb096ed5192fff7af6c887b799e:

  build-appliance-image: Update to whinlatter head revisions (2025-11-26 13:33:50 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

Bruce Ashfield (8):
  linux-yocto/6.12: update to v6.12.57
  linux-yocto/6.12: update CVE exclusions (6.12.57)
  linux-yocto/6.12: update to v6.12.58
  linux-yocto/6.12: update CVE exclusions (6.12.58)
  linux-yocto/6.12: update to v6.12.59
  linux-yocto/6.12: update CVE exclusions (6.12.59)
  linux-yocto/6.12: update to v6.12.60
  linux-yocto/6.12: update CVE exclusions (6.12.60)

Chen Qi (1):
  xserver-nodm-init: avoid race condition related to udev

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-11494

Jayasurya Maganuru (2):
  create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK
    installation
  populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked
    sigs

Martin Jansa (1):
  cross.bbclass: Propagate dependencies to outhash

Moritz Haase (1):
  curl: Use host CA bundle by default for native(sdk) builds

Paul Barker (1):
  cve-update: Avoid NFS caching issues

Peter Marko (1):
  go: upgrade 1.25.4 -> 1.25.5

Stefano Tondo (1):
  spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation

Vijay Anusuri (1):
  libssh2: fix regression in KEX method validation (GH-1553)

 .../create-spdx-image-3.0.bbclass             |   2 +-
 meta/classes-recipe/cross.bbclass             |  36 ++
 meta/classes-recipe/populate_sdk_ext.bbclass  |   9 +
 meta/lib/oe/spdx30_tasks.py                   |   4 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  85 +++-
 .../recipes-core/meta/cve-update-db-native.bb |   9 +-
 .../meta/cve-update-nvd2-native.bb            |   9 +-
 .../binutils/binutils-2.45.inc                |   1 +
 .../binutils/0018-CVE-2025-11494.patch        |  43 ++
 .../go/{go-1.25.4.inc => go-1.25.5.inc}       |   2 +-
 ...e_1.25.4.bb => go-binary-native_1.25.5.bb} |   6 +-
 ..._1.25.4.bb => go-cross-canadian_1.25.5.bb} |   0
 ...{go-cross_1.25.4.bb => go-cross_1.25.5.bb} |   0
 ...osssdk_1.25.4.bb => go-crosssdk_1.25.5.bb} |   0
 ...runtime_1.25.4.bb => go-runtime_1.25.5.bb} |   0
 .../go/{go_1.25.4.bb => go_1.25.5.bb}         |   0
 .../xserver-nodm-init/xserver-nodm.service.in |   2 +
 .../linux/cve-exclusion_6.12.inc              | 412 +++++++++++++++++-
 .../linux/linux-yocto-rt_6.12.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |  28 +-
 meta/recipes-support/curl/curl_8.17.0.bb      |  11 +-
 ...rror-if-user-KEX-methods-are-invalid.patch |  73 ++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 24 files changed, 682 insertions(+), 63 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
 rename meta/recipes-devtools/go/{go-1.25.4.inc => go-1.25.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.4.bb => go-binary-native_1.25.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.4.bb => go-cross-canadian_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.4.bb => go-cross_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.4.bb => go-crosssdk_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.4.bb => go-runtime_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.4.bb => go_1.25.5.bb} (100%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch

-- 
2.43.0


