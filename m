Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CDECCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:46:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.7416.1654699614795971898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tc8oKZs9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id j7so18779643pjn.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d5cHBdEYsmIgSZXi024UYqUwvhy2yJcfs/Z79BucayU=;
        b=tc8oKZs9JX3NmQZnfJX8/O89qYLgOb+B0d+OxrUBWR+ERtFeZlNm6VDfmgkvGgh/ui
         TOTRvctBad/czxBMIuqIlc59+Px4oHIDur56PNily1CLq/r+zjQ+3gjyVrzEUvV0Bxi6
         eNuUoy2iw7+/C5ewVC7/FMYV0ExX97uWnUxaxxsMFDj71qrtZuZt6NvCq/j99Vus5urQ
         iLA41MUXrZCwVkQNnarskzQM7/vpEkA8WkvDWgzRUl9YwDUwrMsrzUinrAOihen6uFpH
         sscOqS+el1Wo0Gwll3WrXjHOaSLDwRNEDgPcF1Ju1pmMWSzBFh3aCM3DIUqLoi5U0UaI
         eQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d5cHBdEYsmIgSZXi024UYqUwvhy2yJcfs/Z79BucayU=;
        b=5NRrFEYcKqCPBKu8DeS9HAmZc04PdfLMxOr6fKiHMYeDnaAbdKVEHuMtrJz4z1JQ+V
         fM1F0zSSdZgJwxKzP7ZZujD0TofBom+7ki/cDwozoKSruZhFXUaUmuZ6z7tAXEddap8T
         PHGpfCHAygvBfBE+ezu0p7aSkkXnCBCd5nJPLUzaReYkvn77ViZRAzpDqsWaR+u6EEYO
         oGSYKNrXqgKEw6d2huWBMv5OVSWhhC65Rk6TnDSltPkS9rxIeUhF88u0vPMZjvKzV6GK
         9A3CmQvyADwQ8neRQ01M3pupEQTNnobE72nT1nMmjdjBREhFjTpDZKMIEPjcCiIE6N5s
         abxQ==
X-Gm-Message-State: AOAM5318VIb6is9BpPAHAQr4jmIvrGPAV8Tb0/9XjkMJTuK0D9jVC+q+
	aqT3+yfg7MZvwhMDEfQF20S/z1xmKtOlvPpG
X-Google-Smtp-Source: 
 ABdhPJzw+vi1RI4iKJ5UsG9WbTVNZPTLcOfTGJvcYPo/g2vrlM51OIXg6FUR8YzYfAZKvgIvBnPW9A==
X-Received: by 2002:a17:903:1013:b0:163:e8b9:2429 with SMTP id
 a19-20020a170903101300b00163e8b92429mr34732118plb.74.1654699613628;
        Wed, 08 Jun 2022 07:46:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.46.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:46:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Wed,  8 Jun 2022 04:46:24 -1000
Message-Id: <cover.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:46:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166735

Please review this set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3760

The following changes since commit 4051d1a3aa5f70da96c381f9dea5f52cd9306939:

  openssl: Backport fix for ptest cert expiry (2022-06-07 11:33:46 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.196

Hitendra Prajapati (2):
  e2fsprogs: CVE-2022-1304 out-of-bounds read/write via crafted
    filesystem
  pcre2: CVE-2022-1587 Out-of-bounds read

Marta Rybczynska (4):
  cve-check: move update_symlinks to a library
  cve-check: write empty fragment files in the text mode
  cve-check: add coverage statistics on recipes with/without CVEs
  cve-update-db-native: make it possible to disable database updates

Richard Purdie (1):
  libxslt: Mark CVE-2022-29824 as not applying

Robert Joslyn (2):
  curl: Backport CVE fixes
  curl: Fix CVE_CHECK_WHITELIST typo

Steve Sakoman (3):
  Revert "openssl: Backport fix for ptest cert expiry"
  openssl: backport fix for ptest certificate expiration
  openssl: update the epoch time for ct_test ptest

omkar patil (1):
  libxslt: Fix CVE-2021-30560

 meta/classes/cve-check.bbclass                |  86 ++-
 meta/lib/oe/cve_check.py                      |  10 +
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 +++++
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch |  55 --
 ...611887cfac633aacc052b2e71a7f195418b8.patch |  29 +
 .../openssl/openssl_1.1.1o.bb                 |   3 +-
 .../recipes-core/meta/cve-update-db-native.bb |   6 +-
 .../e2fsprogs/e2fsprogs/CVE-2022-1304.patch   |  42 ++
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../curl/curl/CVE-2022-27774-1.patch          |  45 ++
 .../curl/curl/CVE-2022-27774-2.patch          |  80 +++
 .../curl/curl/CVE-2022-27774-3.patch          |  83 +++
 .../curl/curl/CVE-2022-27774-4.patch          |  35 +
 .../curl/curl/CVE-2022-27781.patch            |  46 ++
 .../curl/curl/CVE-2022-27782-1.patch          | 363 ++++++++++
 .../curl/curl/CVE-2022-27782-2.patch          |  71 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |   9 +-
 .../libpcre/libpcre2/CVE-2022-1587.patch      | 660 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |   1 +
 .../libxslt/libxslt/CVE-2021-30560.patch      | 201 ++++++
 .../recipes-support/libxslt/libxslt_1.1.34.bb |   5 +
 24 files changed, 1949 insertions(+), 110 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2021-30560.patch

-- 
2.25.1


