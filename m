Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70ACC6FD1F
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.2635.1712113919968666249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TB86bzfE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6eaf7c97738so2733074b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113919; x=1712718719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=stgu09sRXeOtXBLYX0msHVoCxxkayiTgpdGWV5jq4ZY=;
        b=TB86bzfEpKq/CXuOiQZxBJ4bfS6Daq80ZX2mXY2C/frIborgnqwX5+eoJYQzd68dgd
         lfegG1yK8v50v36lLczyLDH+hC3JGw1bJmomzxlzqGR9uE+k1gWQ6rzkI76XHAaZv1U/
         C4KKIT2I0zG163ieTXQ36/V2HI5VQIQdTNdUXuBrKiNU5rKPtg7g3ue4ZYVTGKbMiwLF
         VLNhbdV0hgZq6T3e/BFHhbWeTJasFXseCmo2f3O4Bry3LMDqLQJ6GPmvE/B4o87sPKRu
         8lwqTtKfUrxsyfNOLWFEqWMA6AWaIbwb5YNKUQZaWuHBc2bTvAbFEg1NkDSnvU//OIR9
         5jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113919; x=1712718719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stgu09sRXeOtXBLYX0msHVoCxxkayiTgpdGWV5jq4ZY=;
        b=lsWHiCAidaXhY2pxtfXF/nvHoIrFwynfg0Vzng/Jq0hXONxBCPnsEl91UJVc2ctgke
         8FAYEBfjPZ0zHSrngWpDD7ZVkrfynNNkIIMIB11/PCvXmgAC+Fuc6VN9h+Pu9xY1QH9Q
         ltdrXbCaK4nNO2rRd4s0EiNFUnFv/FgzbsmE9bFd9SQ5n5kloarOYuIGtp1s3EMQdfqU
         XsaVWgKvuiQgh8kJiugynZ+vCkXy+bC0UAJTCUliff/J47DbjizKcAOqNRgvRS8rahV1
         bCmJ/t19NMa/5nE9+c8PUgDimnE/JWLGh5JvwohuBwhxm/2U3sh9M/3usBSI0Eh8IsU3
         zNXQ==
X-Gm-Message-State: AOJu0YzcR6gV7QxenS2Ha+vR+Imvq8z2tt0bjlmufj/Gd1RlzdLm1LBK
	twm6lo8CrALEMvE5+saGXrAPoQBSRrs8DXZpWPtNk/i+IuyI7/r0TMcY9N9GxbAP0NXpFkJwVTl
	7gY8=
X-Google-Smtp-Source: AGHT+IHHNmdQV7X8eg9OCIheB/mrLQ1UmaEswcGvkQykhefXWz090AKwrjOaShJCZlFbmrX0ZVl1Aw==
X-Received: by 2002:a05:6a00:9389:b0:6e8:f708:4b09 with SMTP id ka9-20020a056a00938900b006e8f7084b09mr1858696pfb.15.1712113918952;
        Tue, 02 Apr 2024 20:11:58 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:11:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Tue,  2 Apr 2024 17:11:45 -1000
Message-Id: <cover.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197885

Please review this set of changes for dunfell and have comments back by
end of day Thursday, April 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6757

The following changes since commit d0811b98fa3847dbbfcfe6a80694509bb29aaf9c:

  yocto-uninative: Update to 4.4 for glibc 2.39 (2024-03-18 11:44:32 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Steve Sakoman (2):
  tar: bump PR to deal with sstate corruption on autobuilder
  perf: bump PR to deal with sstate corruption on autobuilder

Vijay Anusuri (4):
  libtiff: backport Debian patch for CVE-2023-6277 & CVE-2023-52356
  go: Fix for CVE-2023-45289 CVE-2023-45290 & CVE-2024-24785
  tar: Fix for CVE-2023-39804
  curl: backport Debian patch for CVE-2024-2398

virendra thakur (1):
  openssl: Fix CVE-2024-0727

 .../openssl/openssl/CVE-2024-0727.patch       | 122 ++++++++
 .../openssl/openssl_1.1.1w.bb                 |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   3 +
 .../go/go-1.14/CVE-2023-45289.patch           | 121 ++++++++
 .../go/go-1.14/CVE-2023-45290.patch           | 271 ++++++++++++++++++
 .../go/go-1.14/CVE-2024-24785.patch           | 197 +++++++++++++
 .../tar/tar/CVE-2023-39804.patch              |  64 +++++
 meta/recipes-extended/tar/tar_1.32.bb         |   3 +
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 .../libtiff/files/CVE-2023-52356.patch        |  53 ++++
 .../libtiff/files/CVE-2023-6277-1.patch       | 191 ++++++++++++
 .../libtiff/files/CVE-2023-6277-2.patch       | 152 ++++++++++
 .../libtiff/files/CVE-2023-6277-3.patch       |  46 +++
 .../libtiff/files/CVE-2023-6277-4.patch       |  94 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   5 +
 .../curl/curl/CVE-2024-2398.patch             |  88 ++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 17 files changed, 1413 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-0727.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45289.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45290.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2024-24785.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2023-39804.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-52356.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6277-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-2398.patch

-- 
2.34.1


