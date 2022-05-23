Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4DEC433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.27824.1653314408396164525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3DLBOufz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id w3so6548639plp.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zV5jYCS6Y7m5GaHZr2NlyZZS95oAP5tf2naqvMxPpoo=;
        b=3DLBOufzIpc2mcf40qjpy3B6EUG4le93+fKn83HvRy4NtRMBFHseVMSiNcYD9H68NU
         T6SQ/RcjAfqY39nfeB8n4k8StR/SIwum0+1qufyt9rytmbdbNQromFsmlYHHE8J8x0b6
         SOO1tG+j00eodE/8OSspilhMarB3M0J1yk6QUuwVg6jLaJT5/u08rzOEA7S7LI8VhA1c
         HlDRGxSBFbtOFQL+CwNUdTSMmQUezvE4lQAXcigFfS/4/zp7MIaxcayVgjbO3qcpNtkl
         R8HFxFytNwYkNe8T0s+1OsqDS9vNMBbDSK8Mld5tJpxaMzno98FbwQq5SZkce4UvAszp
         m6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zV5jYCS6Y7m5GaHZr2NlyZZS95oAP5tf2naqvMxPpoo=;
        b=yy8+2zWtYXszgg0NkIueNdtfZaCYSPh6yjBKujkOpKcwGvOrM6OuSQNyH3X+wid/B2
         u6MPNX8mlinlvIM6dcoT9Dq1Lrr5rcNdODqCL2O8aJs9dEYaUcCjjSM8g2AHRiQ5eNi7
         lNKgPQDD5r6t1qScE7SrnoAUv19xtXZnWjuI/2a7IRnVSf1i0vTuEh2ETwZTRj3Bv79k
         lTM7TYaSmwP/yrt07lDD8pTz+gQySz20+Ixj5s73cIZ+Iz4S4ONFHmSwabygDIPC43Yi
         v1PcoXIKCK3loDH1IZRVR+WOLVvsBKBStZn1GEqrpAvNXp/eltI9CucJYCUNi20X4P2l
         AOtg==
X-Gm-Message-State: AOAM530aERcJhdXvrtnzHCXz3K06tDHsrZTqtWSOyi+9zelGSndOHwt/
	cW63npnRl3ifESVWRXQFeNPlFPGY560dF7yQ
X-Google-Smtp-Source: 
 ABdhPJwOp8kqVYoAQzh1AFZ2uaEz/8XLhdTvK0hZWC0hEWPTdn+VYJzlXNeoK6ZvN64kEUZhNk/YIQ==
X-Received: by 2002:a17:90b:3c50:b0:1df:7b1f:8b79 with SMTP id
 pm16-20020a17090b3c5000b001df7b1f8b79mr26718496pjb.71.1653314406519;
        Mon, 23 May 2022 07:00:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Mon, 23 May 2022 03:59:39 -1000
Message-Id: <cover.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166022

Please review this set of patches for kirkstone and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3692

The following changes since commit ec9e9497730f0a9c8ad3d696c8cdcec06267aacf:

  base-passwd: Disable shell for default users (2022-05-16 13:59:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  mmc-utils: upgrade to latest revision

Claudius Heine (1):
  classes: rootfs-postcommands: add skip option to overlayfs_qa_check

Marta Rybczynska (1):
  cve-check: Fix report generation

Richard Purdie (2):
  staging: Fix rare sysroot corruption issue
  selftest/imagefeatures/overlayfs: Always append to DISTRO_FEATURES

Robert Joslyn (1):
  curl: Backport CVE fixes

Samuli Piippo (1):
  binutils: Bump to latest 2.38 release branch

Steve Sakoman (1):
  python3: fix reproducibility issue with python3-core

wangmy (1):
  librepo: upgrade 1.14.2 -> 1.14.3

 meta/classes/cve-check.bbclass                |  18 +-
 meta/classes/rootfs-postcommands.bbclass      |  10 +-
 meta/classes/staging.bbclass                  |  24 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py |   2 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py     |  36 +-
 .../binutils/binutils-2.38.inc                |   2 +-
 .../{librepo_1.14.2.bb => librepo_1.14.3.bb}  |   2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |   2 +-
 .../recipes-devtools/python/python3_3.10.4.bb |   5 +
 .../curl/curl/CVE-2022-22576.patch            | 145 ++++++
 .../curl/curl/CVE-2022-27774-1.patch          |  45 ++
 .../curl/curl/CVE-2022-27774-2.patch          |  80 +++
 .../curl/curl/CVE-2022-27774-3.patch          |  83 ++++
 .../curl/curl/CVE-2022-27774-4.patch          |  35 ++
 .../curl/curl/CVE-2022-27775.patch            |  37 ++
 .../curl/curl/CVE-2022-27776.patch            | 115 +++++
 .../curl/curl/CVE-2022-27779.patch            |  42 ++
 .../curl/curl/CVE-2022-27780.patch            |  33 ++
 .../curl/curl/CVE-2022-27781.patch            |  43 ++
 .../curl/curl/CVE-2022-27782-1.patch          | 458 ++++++++++++++++++
 .../curl/curl/CVE-2022-27782-2.patch          |  71 +++
 .../curl/curl/CVE-2022-30115.patch            |  82 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  16 +-
 23 files changed, 1362 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb} (94%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-22576.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27775.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27776.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27779.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27780.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-30115.patch

-- 
2.25.1


