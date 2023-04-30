Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FC1C77B73
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.72226.1682871970912664779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ObNg1ei7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-24e01ba9e03so107865a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871970; x=1685463970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNaSVJ2DWYV7GtHN9sdYlWV3whVvKSfG/NJvdfOrzPo=;
        b=ObNg1ei73EySxs49D3+ugX+FFxTcA4WFl3QwrGEgpThH02pccSZw2dncnLc3+SFCQf
         WwMHkHhctoqPjI0ZbBHHM1ZEVwKjQMjZVUWAVRSrvaa9qSV8H/rL1BSTkUVxxNehSJJ9
         zxz8+iGWynSsFZA48Atv3YyeqnM4Inb7a13SOI8PCB1iV8aGT/L6EoUjDvaIS3dcW5XU
         xkgji7CVSQl+puWdYOqts6cIp2dMePm/jbxYTmr2+X+iidysOxiRKqj3Ejc/JiMoT/0x
         Fs9hM6ZQOE5N4f5+xv9satCT6WinZSY3/G+h+sIoGmWmdtMrrkjPbm7/l9kVgVt8LeSo
         JUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871970; x=1685463970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNaSVJ2DWYV7GtHN9sdYlWV3whVvKSfG/NJvdfOrzPo=;
        b=B8O1/sBxImrt04L1cwGeDo+bnTtDwTcFrwAweY11W1SdfipLkmWBSbWZ1ttpPTk1l3
         KkgzykojKKoPHqHyJG3q5wAhF8SUaa8M2En7aqIgbAKa3oWhbt87IBhyET/Z7RHLhBJY
         BckOqBK69T248hpaBmx/L2ObTB1x1xJIQ9rexZwVgRS15hj+9M0ombGkaVTy1PzAvs4f
         heFyPXiMmhT04wMuZcWmGzKI5RbXiLwbZXZ6dHiqtm7XC5XzTR15YsB57FQ6zkNb3NnG
         VuNCkZ0VdMyd9SON6k7NhunbjYc4OqjN+qHlEQx5/oaLqp6Scye3AWswGy/JJjMdw3oD
         ktZQ==
X-Gm-Message-State: AC+VfDxAQxjGTFecl6vd2V6M18Z5EoAZ0a75pM7rM0jkwCz53alDaFHW
	mL+YJBIh5PqYW/MpRZHx0HdsMp31UkPhS6Pi/F8=
X-Google-Smtp-Source: ACHHUZ6pXURPicpZX9/B1Hw7wc2ss8faqXnSvL2c0kCg3emGJmGgNbRfMb1/LbNfl/hl9sPzu+MLCQ==
X-Received: by 2002:a17:90a:eb06:b0:23d:1f95:de1c with SMTP id j6-20020a17090aeb0600b0023d1f95de1cmr12492115pjz.28.1682871969655;
        Sun, 30 Apr 2023 09:26:09 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Sun, 30 Apr 2023 06:25:51 -1000
Message-Id: <cover.1682871868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180572

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5239

The following changes since commit d1943e6a0ec00653c81cd4c0bb0d6b7e0909094c:

  go: fix CVE-2023-24537 Infinite loop in parsing (2023-04-21 04:15:45 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Christoph Lauer (1):
  populate_sdk_base: add zip options

Nikhil R (1):
  openssl: Fix CVE-2023-0464

Omkar Patil (2):
  openssl: Fix CVE-2023-0465
  openssl: Fix CVE-2023-0466

Shubham Kulkarni (1):
  go: Ignore CVE-2022-1705

Vijay Anusuri (2):
  sudo: Security fix for CVE-2023-28486 and CVE-2023-28487
  curl: Security fix CVE-2023-27533, CVE-2023-27535 and CVE-2023-27536

Virendra Thakur (1):
  qemu: Whitelist CVE-2023-0664

Vivek Kumbhar (1):
  go: fix CVE-2023-24534 denial of service from excessive memory
    allocation

 meta/classes/populate_sdk_base.bbclass        |   4 +-
 .../openssl/openssl/CVE-2023-0464.patch       | 226 ++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  60 ++
 .../openssl/openssl/CVE-2023-0466.patch       |  82 +++
 .../openssl/openssl_1.1.1t.bb                 |   3 +
 meta/recipes-devtools/go/go-1.14.inc          |   4 +
 .../go/go-1.14/CVE-2023-24534.patch           | 200 ++++++
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../CVE-2023-28486_CVE-2023-28487-1.patch     | 646 ++++++++++++++++++
 .../CVE-2023-28486_CVE-2023-28487-2.patch     |  26 +
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   2 +
 .../curl/curl/CVE-2023-27533.patch            |  59 ++
 .../curl/curl/CVE-2023-27535-pre1.patch       | 236 +++++++
 .../curl/curl/CVE-2023-27535.patch            | 170 +++++
 .../curl/curl/CVE-2023-27536.patch            |  55 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |   4 +
 16 files changed, 1781 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24534.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27535.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch

-- 
2.34.1


