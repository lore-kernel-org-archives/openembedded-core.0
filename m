Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0901BCCD18C
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:50:51 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2314.1760064644464311448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ClM7SXXv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-791c287c10dso1518254b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064644; x=1760669444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdNnCnmWCQYsdE7n7H7bGz7cJgUZ34JrleWKX29l60A=;
        b=ClM7SXXvYHSnBs1ZIc1TNIiwRAZX/z3CJUi1gqbEtmITRj2r4gRVcVWbMB2OHV6gpH
         oGk+e96JL6Ha3y5VdlLpgom01NMSg5ImukX6iWHH89v0ogCR+NCy1hsdiRNOFGQswmbM
         16zWDQDuMWltX5z9mZEGPXUzk6pxagrZAvjnwyv85/3GUsQriSDONqOvWnRflCjjko9q
         yY8ar/tTgRT+H7pmZrMPeLwFzeqLj6f1dXHhx6Ktn8zlnEL5Rfct2quICNGngrVvEABt
         MYDQe1n4UwoytY17/lDjwcRNK1qH2Lv1/yvF4AKFZIdAX/cLQ90FaloPI5RUsiVaZ74F
         EC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064644; x=1760669444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdNnCnmWCQYsdE7n7H7bGz7cJgUZ34JrleWKX29l60A=;
        b=V9+MUCFKwkLd1GtD1uiU9+t4xIDbTK5n/f5kDcZZrg/hMbXwNBxLMlrqHBvTZCwOXb
         CCVqiTJ7AaTBMVBkHAjcTj8svwIGEM+407McC6giDmwXI6/IX/7obbrbgahcJ2wui01m
         /6fhjrsko5d45rznK53GUfbBlsVO52v3GVTHeACKoCMJ4iaeU9W1ZxHimbwvQVMWR48Q
         HmWZxdJ+YL9wdhzVbhu2unFZ4vCL/gzNkl62Knw/xzILRjciPdfsyQ+KZeZ9M23Xhrp3
         Xpm0Qu8Up4Evtv+yQIg1zWjowdFWGI4ALLo6eofiKKMyiZnV8lYSQlksnxhh3fZejD+X
         XVSA==
X-Gm-Message-State: AOJu0YxtfXNrngZ9Pvqk1RPQ86LLnpKO7u1F5zjlRL87/jmapxN24zQ+
	5boBXgKHF0slYG6v8RwDPC62doyieicZNV0Z3bgCwXFKqqIYL2gQS+E1UK0w897HqfTH8EBBj+B
	KV+jH
X-Gm-Gg: ASbGnctYQTkBCRZarq4IdPq6z5ZI/uwZpwbFoBSD/FiZ2/LMDYJMBwsfuArw+7EbHuc
	NcU3j/OfmZ5+OUTxrZgULu4zulXm5Yh8rnCnjPrKYdWCPGHN2Yt0TadG/QZtjNfujLGUu373paS
	ZUKNAay+R/njl5tziFozRQ/v8jCTA/ZDvPxRuwaNCXDje3CZJxiryeJRgKuZ9aDHuo94t3n0twr
	HJgvx+b31G+77Pzs1rFczDjpPlGaiBdlG7dK2r5mPSMGbinxFBZ/J4+xOzBbJl+9Ks0zc7KwyvN
	qVmycweUmQST+x392DWPU8LVNcP3M9XDzZa1lkf88Mykm9Ol++F1s780wQXf1QDBGBCOnSDsOe1
	QDadfp3gBY39sm4kuj9roc+AA6bVEwTQH
X-Google-Smtp-Source: AGHT+IHcelT619vcc6YKoQYUAG+YgFV0FTP3L1k+V3xTmd1WBkugztEgJ1ZLM2Tk2Y5bdrI1XnBmPA==
X-Received: by 2002:aa7:88c8:0:b0:780:fb3f:9127 with SMTP id d2e1a72fcca58-79387829625mr10947047b3a.19.1760064643453;
        Thu, 09 Oct 2025 19:50:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/18] Patch review
Date: Thu,  9 Oct 2025 19:50:19 -0700
Message-ID: <cover.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224644

Please review this set of changes for scarthgap and have comments back by
end of day Monday, October 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2553

The following changes since commit 2696c50af9946f425ccaf7d0e7e0eb3fd87c36bb:

  expect: fix native build with GCC 15 (2025-10-02 08:40:43 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.12

Archana Polampalli (1):
  go: fix CVE-2025-47906

Deepesh Varatharajan (1):
  glibc: stable 2.39 branch updates

Gyorgy Sarvari (1):
  conf/bitbake.conf: use gnu mirror instead of main server

Hitendra Prajapati (1):
  grub2: mark CVE-2024-2312 as not applicable

Peter Marko (10):
  busybox: patch CVE-2025-46394
  gstreamer1.0: ignore CVEs fixed in plugins
  gstreamer1.0: ignore CVE-2025-2759
  ghostscript: patch CVE-2025-59798
  ghostscript: patch CVE-2025-59799
  ghostscript: patch CVE-2025-59800
  expat: follow-up for CVE-2024-8176
  tiff: ignore 5 CVEs
  ffmpeg: ignore 8 CVEs fixed in 6.1.1 and 6.1.3 releases
  openssl: upgrade 3.2.4 -> 3.2.6

Ross Burton (1):
  pulseaudio: ignore CVE-2024-11586

Steve Sakoman (2):
  selftest/cases/meta_ide.py: use use gnu mirror instead of main server
  oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server

 meta/conf/bitbake.conf                        |    2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |    2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |    2 +-
 meta/recipes-bsp/grub/grub2.inc               |    1 +
 .../openssl/openssl/CVE-2025-27587-1.patch    | 1918 -----------------
 .../openssl/openssl/CVE-2025-27587-2.patch    |  129 --
 .../{openssl_3.2.4.bb => openssl_3.2.6.bb}    |    4 +-
 .../busybox/busybox/CVE-2025-46394-01.patch   |   57 +
 .../busybox/busybox/CVE-2025-46394-02.patch   |   32 +
 meta/recipes-core/busybox/busybox_1.36.1.bb   |    2 +
 .../expat/expat/CVE-2024-8176-03.patch        |   35 +
 .../expat/expat/CVE-2024-8176-04.patch        |  115 +
 .../expat/expat/CVE-2024-8176-05.patch        |   78 +
 meta/recipes-core/expat/expat_2.6.4.bb        |    3 +
 meta/recipes-core/glibc/glibc-version.inc     |    4 +-
 meta/recipes-devtools/go/go-1.22.12.inc       |    1 +
 .../go/go/CVE-2025-47906.patch                |  183 ++
 .../ghostscript/CVE-2025-59798.patch          |  134 ++
 .../ghostscript/CVE-2025-59799.patch          |   41 +
 .../ghostscript/CVE-2025-59800.patch          |   36 +
 .../ghostscript/ghostscript_10.05.1.bb        |    3 +
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb |    4 +
 .../gstreamer/gstreamer1.0_1.22.12.bb         |   19 +-
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |    4 +
 .../pulseaudio/pulseaudio.inc                 |    2 +
 scripts/install-buildtools                    |    4 +-
 26 files changed, 754 insertions(+), 2061 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-27587-1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-27587-2.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.4.bb => openssl_3.2.6.bb} (98%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-05.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47906.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch

-- 
2.43.0


