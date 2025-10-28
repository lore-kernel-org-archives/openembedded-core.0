Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA2FCCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9351.1761659185605063023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q5C0Vec+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27c369f8986so53812475ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659185; x=1762263985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5M1HgvQ88FK6MgPKbRXdftJhbY66KYmzAGMA8+TVeVg=;
        b=Q5C0Vec+hgrNa8TUcPI8xyO7XEN9dTc9iTcvDHwQzl3S08gVDRQ0szihYWl1Uscpkg
         3ttIXO8TY5/+X82vfCZiU/xF0uaEdhymMi9g3P2TRFYgkygouLJ19+x2uX2uo7UMRGlN
         8Nr8BCdkIyVcJmlo5NHZHUZu3GjzjOaef/ULxGu3TzG6Egb0l2BgnUP36OU84bNbtHf9
         /1GXPUMi/9XBxp4BKFydEpTQ6D8RLgecPzB7ctQL6zF4lx870Jm7+lsQIbCOX3TEMo/M
         2oFx/SrYJ6Fd2HwSc8fWVziWMGHZtwD1mLT/KebHBgWXmH1PG3q2cqxmpvoBnr802sYM
         WrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659185; x=1762263985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5M1HgvQ88FK6MgPKbRXdftJhbY66KYmzAGMA8+TVeVg=;
        b=IroJvI3/sr6jrkAuzIyQI9yl7y4G/nffNJ5FpA+VIxtBW3rfKJ1RaPrVZOJvfHR7qj
         tIleqM9C7TP7kndw0FtmjQwlpsZtraKM34mrZ7EsrVab2tRO2B7Mif4w4N5pN/I5xpzy
         OT5QryNSCipDnVCWhiwCBVQMf5djhY09QUITi+gv0agR09eG+rFzE3oVBXxTxweKsORM
         jzbymtqz3xRGQoxts7lY35557t66aZLcywOWmdibVAug7qimTknKt1gJPDUHKdQA1/YK
         V3vH6Vw5fmogTUKKXq97BBVYR9gDJgDktaTUcr6LaBaz4daX3fC0fPAD+OKS5w6s7ltL
         lo0Q==
X-Gm-Message-State: AOJu0YyRohH8kNL5jyGDNXh/xQLShu+Fsoh774QlagVbG4efMnARTRsl
	/6SnkFeVmOQhip/KA9RKKjlEO0l+fasawVQlnYhuabrQ/KSsE6esMsoZ3qUgLCwxJOIPjvB/6PR
	bqtRVhVc=
X-Gm-Gg: ASbGnctfnypHKSGNt4OYqZ3/MrHPl4FHgU1clOv7+s83bYoiPX72xFBfsRsZD53oVpk
	9p3xSk7iT7wTaGsLy+kPGCOL41onCNaLtLu9H8prFHtZ+ZFL0pFWQbY1El28WGXsOA7//CdC5PF
	Up87pVzC0DI2/OfpEp5kmMnePhUFYgJBwG7J76ONmVbxAK6xbIDqFD0Lx/3W6ZgZMy0sXFaCp9n
	33I8UwFTDtPsygL3qR57MLh0pnqoa977kvUxMNqtua+VLDFMV2kmsWe4GvV/9uDTOw6RJBM0bsE
	p5iQ7dlKiFwC1sqscMlqat7AGeIpsaFpEISYp2xjvZpcUqs1b/ymdQgF7n3HPeVraEtzk8NxosT
	DbOXPYmnN1EiQmMWtXs3BwoCvmzFT1o608o30hL9amEsvwxDR71w1kSiFANNE7OWwsPm5Bzmp2y
	Jv+w==
X-Google-Smtp-Source: AGHT+IHEban5W8TLT2XQBzhVRP3yRAq53sMy9xf0l2PA4lXwowKWnJYSdxpx9HdjAtjT8XmDgO5tvA==
X-Received: by 2002:a17:902:d2d1:b0:270:4964:ad7c with SMTP id d9443c01a7336-294cb3785f0mr46459225ad.2.1761659184476;
        Tue, 28 Oct 2025 06:46:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Tue, 28 Oct 2025 06:46:10 -0700
Message-ID: <cover.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225400

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, October 30

Passed a-full on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2645

with the exception of the meta-aws test, which failed due to a meta-aws commit
changing the distro from poky-agl to agl
The following changes since commit 649147913e89cd8f7390cb17cd0be94c9710ffa6:

  oeqa/runtime/ping: don't bother trying to ping localhost (2025-10-17 07:47:32 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Anders Heimer (1):
  libpam: mark CVE-2025-6018 as not applicable

Daniel Semkowicz (1):
  gstreamer1.0-plugins-bad: fix buffer allocation fail for v4l2codecs

Martin Jansa (1):
  flex: fix build with gcc-15 on host

Matthias Schiffer (1):
  curl: only set CA bundle in target build

Peter Marko (1):
  expat: patch CVE-2025-59375

Rasmus Villemoes (1):
  iptables: remove /etc/ethertypes

Soumya Sambu (2):
  elfutils: Fix CVE-2025-1376
  elfutils: Fix CVE-2025-1377

 .../expat/expat/CVE-2025-59375-00.patch       |  52 ++
 .../expat/expat/CVE-2025-59375-01.patch       |  48 ++
 .../expat/expat/CVE-2025-59375-02.patch       | 109 ++++
 .../expat/expat/CVE-2025-59375-03.patch       | 127 ++++
 .../expat/expat/CVE-2025-59375-04.patch       |  62 ++
 .../expat/expat/CVE-2025-59375-05.patch       |  64 ++
 .../expat/expat/CVE-2025-59375-06.patch       |  68 +++
 .../expat/expat/CVE-2025-59375-07.patch       |  52 ++
 .../expat/expat/CVE-2025-59375-08.patch       | 577 ++++++++++++++++++
 .../expat/expat/CVE-2025-59375-09.patch       |  43 ++
 .../expat/expat/CVE-2025-59375-10.patch       |  54 ++
 .../expat/expat/CVE-2025-59375-11.patch       |  66 ++
 .../expat/expat/CVE-2025-59375-12.patch       |  58 ++
 .../expat/expat/CVE-2025-59375-13.patch       | 309 ++++++++++
 .../expat/expat/CVE-2025-59375-14.patch       | 122 ++++
 .../expat/expat/CVE-2025-59375-15.patch       |  70 +++
 .../expat/expat/CVE-2025-59375-16.patch       | 146 +++++
 .../expat/expat/CVE-2025-59375-17.patch       |  28 +
 .../expat/expat/CVE-2025-59375-18.patch       |  74 +++
 .../expat/expat/CVE-2025-59375-19.patch       | 103 ++++
 .../expat/expat/CVE-2025-59375-20.patch       | 285 +++++++++
 .../expat/expat/CVE-2025-59375-21.patch       | 196 ++++++
 .../expat/expat/CVE-2025-59375-22.patch       |  37 ++
 .../expat/expat/CVE-2025-59375-23.patch       |  47 ++
 .../expat/expat/CVE-2025-59375-24.patch       |  36 ++
 meta/recipes-core/expat/expat_2.6.4.bb        |  25 +
 .../elfutils/elfutils_0.191.bb                |   2 +
 .../elfutils/files/CVE-2025-1376.patch        |  58 ++
 .../elfutils/files/CVE-2025-1377.patch        |  69 +++
 ...01-Match-malloc-signature-to-its-use.patch |  25 +
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   1 +
 .../iptables/iptables_1.8.10.bb               |   2 +
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   2 +
 ...s-chain-up-to-parent-decide_allocati.patch |  87 +++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |   1 +
 meta/recipes-support/curl/curl_8.7.1.bb       |   4 +-
 36 files changed, 3108 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-00.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-07.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-08.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-09.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-10.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-11.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-12.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-13.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-14.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-15.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-16.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-17.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-18.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-19.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-20.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-21.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-22.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-23.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2025-59375-24.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Match-malloc-signature-to-its-use.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch

-- 
2.43.0


