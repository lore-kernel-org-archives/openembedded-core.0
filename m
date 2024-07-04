Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9760DC41513
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:26 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.8987.1720096338367520710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yJX+ceh0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70aff4e3f6dso434287b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096337; x=1720701137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjBFJEU74et+gbbGPmxjmjT6tVvrSE4znjWgqJWSNlU=;
        b=yJX+ceh0sEbzfHLPRrOLBYmtyFYL3Gv4WaqH//KE3CSErFJWhqckhltqcWq3n2+1Ul
         w9I6/afKFJj15TnY+Ci6tkZu3hQ7X+6Fi/qpjhyyNxe8kK+2ckCyn+INgAwvTg+W1irJ
         ibt2duWKafQrf8NDRJwBYt+D88uiBo8KUDKG8W1U4glZiyKo8xIkvxyzudPjy+mNvK8I
         3bsu3kUvb7XTPRB/okkLQ3lyFd9MpkFE8TC1XXij9HVMw6IiCnaOfz41obYGy94IjC9T
         C4wbO2s7IyT7z/LHa37jtS4WctpohuBNqZfnqzSE/8fTB69DDHugm/9Sxef1WBcDYVhE
         RCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096337; x=1720701137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjBFJEU74et+gbbGPmxjmjT6tVvrSE4znjWgqJWSNlU=;
        b=Kpq+LpXaZgwny6rbZoilSMiOgNlMSbSefMz5zbJukPNGvRCi+QQQGGnzTepsQgFoDl
         WFymjs5c2fya5CWMPY8PsivDVPdLqqYGFUTesPe/2RwxUn8AJ250o9Xm9wKhKRMWey40
         HeeqCvFwiHw2wqX9M71Xc6cAX9GH1XQnPGwbyKpqFUGzAV6a7OmtFvgV0oi5TCy8VyDI
         pw9RboBiJH+s413+a7lMBqv7ZkpadgAEGnrr8GFZHTWt0zhM8/nv0javbtwJ6mDgIzgN
         ayRasLHGSstMZd5GPXGlyb8YdwzxwA9IgOHhH8ewjX+bJv0DesCh/9bzSXhUd48dwYG8
         KXSw==
X-Gm-Message-State: AOJu0Ywt0GJJDcngcdvUv26lFADV9aPMXRfbHMVgG5GQ4uxUv5HjMGUw
	MKWcJlF5tI1+ijNXAdcXn4Y67LIXhxezy2CkECo4yrc/Dbz14AedHawG/Bm8k9/Vg3W1TcQq/gh
	T
X-Google-Smtp-Source: AGHT+IHQujTDZ0W9lBYEV1poj93ahRkqhu3qyot+8E1gUrXpdr1C/uIahT/Y5WrZCSXs+bppnVs+Cw==
X-Received: by 2002:a05:6a20:3948:b0:1be:e5c3:f97a with SMTP id adf61e73a8af0-1c0cc72bd60mr1743315637.3.1720096337497;
        Thu, 04 Jul 2024 05:32:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Thu,  4 Jul 2024 05:32:05 -0700
Message-Id: <cover.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201566

Please review this set of changes for kirkstone and have comments back by
end of day Monday, July 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7103

The following changes since commit fbc8f5381e8e1da0d06f7f8e5b8c63a49b1858c2:

  man-pages: remove conflict pages (2024-06-21 12:37:32 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (1):
  gstreamer1.0-plugins-base: fix CVE-2024-4453

Jonas Gorski (1):
  linuxloader: add -armhf on arm only for TARGET_FPU 'hard'

Jose Quaresma (1):
  openssh: fix CVE-2024-6387

Poonam Jadhav (2):
  glibc-tests: correctly pull in the actual tests when installing -ptest
    package
  glibc-tests: Add missing bash ptest dependency

Siddharth Doshi (1):
  OpenSSL: Security fix for CVE-2024-5535

Vijay Anusuri (1):
  wget: Fix for CVE-2024-38428

 meta/classes/linuxloader.bbclass              |    2 +-
 .../openssh/openssh/CVE-2024-6387.patch       |   27 +
 .../openssh/openssh_8.9p1.bb                  |    1 +
 .../openssl/openssl/CVE-2024-5535_1.patch     |  115 ++
 .../openssl/openssl/CVE-2024-5535_2.patch     |   44 +
 .../openssl/openssl/CVE-2024-5535_3.patch     |   84 ++
 .../openssl/openssl/CVE-2024-5535_4.patch     |  178 +++
 .../openssl/openssl/CVE-2024-5535_5.patch     | 1175 +++++++++++++++++
 .../openssl/openssl/CVE-2024-5535_6.patch     |   45 +
 .../openssl/openssl/CVE-2024-5535_7.patch     |   68 +
 .../openssl/openssl/CVE-2024-5535_8.patch     |  273 ++++
 .../openssl/openssl/CVE-2024-5535_9.patch     |  205 +++
 .../openssl/openssl_3.0.14.bb                 |    9 +
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |    4 +-
 meta/recipes-core/glibc/glibc/run-ptest       |    2 +-
 .../wget/wget/CVE-2024-38428.patch            |   79 ++
 meta/recipes-extended/wget/wget_1.21.4.bb     |    1 +
 .../CVE-2024-4453.patch                       |   65 +
 .../gstreamer1.0-plugins-base_1.20.7.bb       |    1 +
 19 files changed, 2374 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-38428.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch

-- 
2.34.1


