Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC80C369CA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:14:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.29610.1744834462712955153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SY7dBOYW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso2802b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744834462; x=1745439262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XElMEAhzHk6QhizFd/JF40J9mFjLMHrHID3AdCFT5sc=;
        b=SY7dBOYWqisguEMTQISphh1O2UKozTPD8lByhV5/B+21n83mFGs+hhMoJawZuGsOpE
         QjWJ27esRYZ+ID4E0R0IXJN7JRQ6tP5TDqp/sy+pUllok/ya9i9zCnTjqYsHe7GJjf/U
         L7eHnI5Sq5udtZnzqKPOAw9FI2XujOuRN+eJtAORro2dbhioFdaA0/TF4cy6/isGiQWm
         /PFwS3Pl77KzAf577lK1iULqxHGZmUeqahXV8plXe697o1XY8gkxlmzgh2jIEO1jmet9
         /Nk+CWsqUsKsWVTd6nXZbG4gx5PnRyAJUooJAMbE6kobNMfyBFziK2uhw+gN37Pms+BX
         9AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834462; x=1745439262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XElMEAhzHk6QhizFd/JF40J9mFjLMHrHID3AdCFT5sc=;
        b=e6b4hJOGv8jYFlPYKvrS66U77SP2pXPzWAlHeac2hErmKhdVTACplKYnxUs641pNTn
         jbRuRw3mHaxTlsSnbLLpJvdq4xIucdfSiSSkC0TjyzFq69L4x6uEXJrz0pHratDxM3hB
         0aQ2eCmFwKq5oudXfRW5jHoLDEjQxGDOv16OtbSa2aeUMrG7UkbeC9I1TpV6KlCC7Qyd
         Ct4DNHo0OEixKHidXtj8vjTxwCMNliU6aPg0yo9lnhW/CmVT2tLEgzC9F1CPdTFCbIne
         bCUXoy1DMRPSTqFdNctKfNZMVNvfb+EvfFeLyCVJKmR4Ajrmc7HjC2pmYQ0jxr+MrNVd
         Dn1A==
X-Gm-Message-State: AOJu0Yy77GT4P594G7LT1nBd2MFRK3qr1e/C2V4S3Sk1s9vTY9VkCS5n
	R23lrT5dyP2cJqHJSFyGgbXlD4TAmkELgO5E/u0xtfosDYRNEGQttMpLaZZ3BXDc8F2GZRJcuiC
	a
X-Gm-Gg: ASbGncsn/FQ5qD3eKO/T8tkifAxS7EWUrzYbsRIGbfyjlALkHAPfhu2ZMTmqlTx3stF
	JJHVkvlv8xjZZlO9hEYxJadXsT+foU73+SzAv5q3r8EVqB+kZmPCh/sXC83QbRpq/eF7F5hGGh8
	7pgDJMUyl2XDu0IkHwFDNA5kXS5MCIrYGh6Wdj5SYrNhhwEWWSwVoC42zHTQg8xrFmseaRUoT4Y
	+QYyjIK7fWIft0zxrhzZiFvjPl5As9UHF1tyuxu/xlsmy0yIGSp1/JKkify16Kcs4BKlXezQhuX
	NJUVneJ2pmPtI5yxm9f1DIZlyZ3+KbEP
X-Google-Smtp-Source: AGHT+IFxgaUjVNg4QYrrQoF+QrRFKkU7awE08n8eptfXd6/+m4j4D4GKcEct4b17OdiN6YFzCiyI+g==
X-Received: by 2002:a05:6a20:9f0a:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203b3ffb6fbmr5314496637.36.1744834461739;
        Wed, 16 Apr 2025 13:14:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aeb8:30c6:2c5c:85aa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b222029ccsm1703880a12.62.2025.04.16.13.14.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:14:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/6] Patch review
Date: Wed, 16 Apr 2025 13:14:09 -0700
Message-ID: <cover.1744834364.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215007

Please review this set of changes for scarthgap and have comments back by
end of day Friday, April 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1409

The following changes since commit 9de38ac99c2b19f549c00ea5277faf621c6f4e65:

  patch.py: set commituser and commitemail for addNote (2025-04-11 06:47:51 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Ashish Sharma (3):
  binutils: Fix CVE-2025-1176
  binutils: patch CVE-2025-1178 & CVE-2024-57360
  binutils: patch CVE-2025-1181

Peter Marko (1):
  libarchive: upgrade 3.7.4 -> 3.7.9

Vijay Anusuri (1):
  openssh: Fix for CVE-2025-32728

Vishwas Udupa (1):
  openssl: rewrite ptest installation

 .../openssh/openssh/CVE-2025-32728.patch      |  44 +++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 .../openssl/openssl/run-ptest                 |  19 +-
 .../openssl/openssl_3.2.4.bb                  |  67 ++--
 .../binutils/binutils-2.42.inc                |   5 +
 .../binutils/binutils/CVE-2024-57360.patch    |  75 ++++
 .../binutils/binutils/CVE-2025-1176.patch     | 156 ++++++++
 .../binutils/binutils/CVE-2025-1178.patch     |  38 ++
 .../binutils/binutils/CVE-2025-1181-pre.patch | 151 ++++++++
 .../binutils/binutils/CVE-2025-1181.patch     | 345 ++++++++++++++++++
 .../libarchive/CVE-2024-20696.patch           | 115 ------
 .../libarchive/CVE-2024-48957.patch           |  36 --
 .../libarchive/CVE-2024-48958.patch           |  40 --
 .../CVE-2025-1632_CVE-2025-25724.patch        |  83 -----
 .../libarchive/libarchive/configurehack.patch |   4 +-
 ...ibarchive_3.7.4.bb => libarchive_3.7.9.bb} |  12 +-
 16 files changed, 866 insertions(+), 325 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2024-57360.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1176.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1178.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.7.4.bb => libarchive_3.7.9.bb} (84%)

-- 
2.43.0


