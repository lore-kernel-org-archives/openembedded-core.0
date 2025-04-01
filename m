Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E78EC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:59:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3276.1743537569232468035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 12:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n7dVONxk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2260c91576aso95078585ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743537568; x=1744142368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Srw18v1iwIXu4co07x2hX/CnHDTFjm3ifI9OomgCaho=;
        b=n7dVONxkBW5JIeb/K9T85BhA/SEqPtLDFvJbHlnPrEKlSkFJYaydoDpBGKQOg7SO+9
         OceMl2O3fywgRwlEcp8H8+Awf/vdJwqkDe1LdWJaCmRA+/kvh3fEGpQYaL0ZmvufRp37
         Z23HsgYvjGw/9vw20skqlHT7Lu+fqcndbusNRWBPiIGcjYaDUWlJF7vz9hXA5DVCKVRr
         fBhvk2yHnfz2Mol6FN8X+LvqXH2VwJndnMGp1c8VyvqI37qPJLk+CFPWxSiCDH3AAECZ
         2tZTSa5cpxunG46YzJczPXxBPgL/jzmnfggRcvaGvgjBIByiYWsMPdm5CXmHFEYDlCrl
         ZyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537568; x=1744142368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Srw18v1iwIXu4co07x2hX/CnHDTFjm3ifI9OomgCaho=;
        b=C+7HaH8jeneAwfjm6v9bw+sUzh1EFR1FRbEMARz5F6igSfg9NCS8nXxmX5cq+jRlki
         Hpnm05rYkC7Vgq/7oR/yPaFYsUM/HYxKTiVd6HEP8ny22ZpIOTciTpsU0MD/6kr7wGVu
         VGPi8itxwE6Nd7Cz1STFrCpwKfr+qrs3HriA6uEXdrQv9UtvreDwYDqxwo+AEocidLIm
         ID2jgbNw4cLM7NDm7wSmRxX+zHwQqrJGM8wSzIo37nuVb8YCtynfTGIfp/A3oFmys18t
         FU6NL1e3DjQ/kcTg4zk7RnQXz+RSv+ztZ/NnVJolIim+F9cs5dVNZEhflqS1T04i/Eww
         DyjQ==
X-Gm-Message-State: AOJu0YznNRbYBpEreGnJjju13FugzAsSKAPQMLmgjfgUm+AOCnDI5iIo
	IhGQUl1EwIRREZtnWFrRXBa+zEn3iI9a9iIP7qotcdVdxaSOV4XidcV3rBxzUlXl62p1MqRm21T
	e
X-Gm-Gg: ASbGnctydyA/gVPJb/QFIAux1CSgLXXySRxSSaTkiq/F/11GZViFtYS91zm6ss8fPD5
	virrS9tB+y3FDk2wEe+X8j5d5OeG86iowSfGvUop+iaEdUFr18iMFTqb9JaZ7gI2i/BFw9+MDHR
	o/Bu+Ey40DUi2p7GDccrzJzDV0yYlYeqK2o9apnM2qIO/fkXVdPAiWhzbg0Z14zMcOSrKv8+j7C
	Kn45cgTToV50/WAnMKNAo7QUdu5YN/Ede9+KF4dg1oaZh1VqjiuGgCSqvMaUf8K/DRF+Ja6Tv9k
	nLy8OQauPF8ISbai8V4eu5nA8QZoVq451mp2
X-Google-Smtp-Source: AGHT+IEvvj0EganA5ZddNH8tyOOOduWOr5rNW12P/VjcXr7heu3VI3LSGCtd0N+cok9mDOUvb+2SVQ==
X-Received: by 2002:a05:6a21:c8c:b0:1f5:a577:dd1b with SMTP id adf61e73a8af0-2009f5c4900mr24864832637.1.1743537568180;
        Tue, 01 Apr 2025 12:59:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b52ea6bsm7234369a12.0.2025.04.01.12.59.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:59:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/5] Patch review
Date: Tue,  1 Apr 2025 12:59:17 -0700
Message-ID: <cover.1743537463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 19:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214145

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, April 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1310

The following changes since commit 2f242f2a269bb18aab703f685e27f9c3ba761db8:

  cve-update-nvd2-native: handle missing vulnStatus (2025-03-31 08:26:56 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Martin Jansa (1):
  mc: set ac_cv_path_ZIP to avoid buildpaths QA issues

Michael Halstead (1):
  yocto-uninative: Update to 4.7 for glibc 2.41

Peter Marko (2):
  expat: patch CVE-2024-8176
  freetype: follow-up patch for CVE-2025-27363

Virendra Thakur (1):
  rust-cross-canadian: Set CVE_STATUS ignore for CVE-2024-43402

 meta/conf/distro/include/yocto-uninative.inc  |   10 +-
 ...ests-Cover-indirect-entity-recursion.patch |  103 ++
 .../expat/expat/CVE-2024-8176-01.patch        | 1477 +++++++++++++++++
 .../expat/expat/CVE-2024-8176-02.patch        |  248 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |    3 +
 .../rust/rust-cross-canadian.inc              |    4 +
 meta/recipes-extended/mc/mc_4.8.31.bb         |    1 +
 .../freetype/freetype/CVE-2025-27363.patch    |   33 +
 .../freetype/freetype_2.13.2.bb               |    4 +-
 9 files changed, 1877 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-02.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch

-- 
2.43.0


