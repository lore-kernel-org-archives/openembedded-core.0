Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1CCC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:23 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.49253.1710951016350948363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gSXGyo+v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dd9568fc51so54736715ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951015; x=1711555815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp5FHT0ljczAZJeUR0I5mGEWrDkJc3KvtcIkjJNTHd8=;
        b=gSXGyo+vk8zjCG715HE8/eKZEPl4pf6s/8YVluO4soUScVKobaDrqpuQBzNDvuYvxc
         EstDbHeBSc4w3SRjs89cINy2ja0p4rUJu3mUHZaDPtgwX54mUgZVk0aY57GK85R04b2u
         TxFGfO9XQyR1WUwG6aTXrLghcyBedwA8pzutgzKYK84Ay2hE7SIu+/O8kLmPrtSPC3pU
         ydJiwmltmB/7Pe1QGibziG5+Anu9bAiOY2u+mdUAUWlWJnMOuCwnCUY300v23X17Azn9
         G/k8+Rr1LL4ZMm8KRmoEP3M9uOrNjd+gDAfHIEJqerdRw5DHGq7qkfNrGdEysLUmJhxj
         VkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951015; x=1711555815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp5FHT0ljczAZJeUR0I5mGEWrDkJc3KvtcIkjJNTHd8=;
        b=wDZtMw+LTx7yuBBBLa+EEVbC4CAmUWuG/jGW/e2cdrtjP0JPgYSrOBot+jp190ea0D
         pfcmg02CoLec+FIE64PtNuAf3ieBvWYUOuurt/HByOgbZsinu7JRr4KLQTV8MPHP3Q3n
         SB6WAZ711c9Q1aJ/k/SuTrPHKiWBVuxoEG5oep1uRtf5XgaIBK2DZtSWfRdCXazv9QmZ
         u8IIzbnjoRKWkGq64UegTrYoIyzvoriHjvexJKdwL1UozGF1XlMRp5qG5p/jO7wM2BXI
         wWty0aAIx6JpXU/+YmbXrrCJ389S/IQ8bR1xAgZAJ5RhrxRHLLh1JpUATHMq/YpjnxoE
         2Gpw==
X-Gm-Message-State: AOJu0YwHmwhI6oxDKo61p4oAf4t1XP/c/aeaGeEL5bE6pm7wfHKI8ci5
	YZVWmgjiVOV0NUa/wDpIIwB1Q71G241CWRJyKV3HZjjh9NhwQMkhQxZHRElSA7Pkdre0GpiOpXs
	nAMg=
X-Google-Smtp-Source: AGHT+IETAAMTIYcxXIbGEpGFcDPHWUaI9A1OWAyirlVrsILAoPoRbjPsdfA9ifoH3TwNoyvXUEmlmg==
X-Received: by 2002:a17:902:c10d:b0:1e0:64bd:51ac with SMTP id 13-20020a170902c10d00b001e064bd51acmr982459pli.22.1710951015538;
        Wed, 20 Mar 2024 09:10:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Wed, 20 Mar 2024 06:09:38 -1000
Message-Id: <cover.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197370

Please review this set of changes for kirkstone and have comments back by
end of day Friday, March 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6699

The following changes since commit 2501534c9581c6c3439f525d630be11554a57d24:

  build-appliance-image: Update to kirkstone head revision (2024-03-13 07:39:46 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23

Alexander Kanavin (1):
  linux-firmware: upgrade 20231211 -> 20240220

Haitao Liu (1):
  glibc: Fix subscript typos for get_nscd_addresses

Martin Jansa (1):
  stress-ng: avoid calling sync during do_compile

Meenali Gupta (1):
  expat: fix CVE-2023-52426

Michael Halstead (1):
  yocto-uninative: Update to 4.4 for glibc 2.39

Peter Marko (1):
  expat: patch CVE-2024-28757

Vijay Anusuri (1):
  python3-cryptography: Backport fix for CVE-2024-26130

Wang Mingyu (1):
  wireless-regdb: upgrade 2023.05.03 -> 2023.09.01

Yoann Congal (6):
  cve-update-nvd2-native: Fix typo in comment
  cve-update-nvd2-native: Add an age threshold for incremental update
  cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
  cve-update-nvd2-native: nvd_request_next: Improve comment
  cve-update-nvd2-native: Fix CVE configuration update
  cve-update-nvd2-native: Remove rejected CVE from database

 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 .../expat/expat/CVE-2023-52426-001.patch      |  35 ++
 .../expat/expat/CVE-2023-52426-002.patch      |  72 +++
 .../expat/expat/CVE-2023-52426-003.patch      |  28 ++
 .../expat/expat/CVE-2023-52426-004.patch      | 429 ++++++++++++++++++
 .../expat/expat/CVE-2023-52426-005.patch      |  34 ++
 .../expat/expat/CVE-2023-52426-006.patch      | 174 +++++++
 .../expat/expat/CVE-2023-52426-007.patch      |  53 +++
 .../expat/expat/CVE-2023-52426-008.patch      |  37 ++
 .../expat/expat/CVE-2023-52426-009.patch      | 354 +++++++++++++++
 .../expat/expat/CVE-2023-52426-010.patch      |  50 ++
 .../expat/expat/CVE-2023-52426-011.patch      |  45 ++
 .../expat/expat/CVE-2024-28757.patch          |  58 +++
 meta/recipes-core/expat/expat_2.5.0.bb        |  12 +
 ...dresses-Fix-subscript-typos-BZ-29605.patch |  40 ++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 .../meta/cve-update-nvd2-native.bb            |  35 +-
 .../python3-cryptography/CVE-2024-26130.patch |  66 +++
 .../python/python3-cryptography_36.0.2.bb     |   1 +
 .../0001-Makefile-avoid-calling-sync.patch    |  35 ++
 .../stress-ng/stress-ng_0.13.12.bb            |   1 +
 ...20231211.bb => linux-firmware_20240220.bb} |   6 +-
 ....05.03.bb => wireless-regdb_2024.01.23.bb} |   4 +-
 23 files changed, 1562 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-001.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-003.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-004.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-005.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-006.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-007.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-008.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-009.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-010.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-011.patch
 create mode 100755 meta/recipes-core/expat/expat/CVE-2024-28757.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb => linux-firmware_20240220.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.05.03.bb => wireless-regdb_2024.01.23.bb} (88%)

-- 
2.34.1


