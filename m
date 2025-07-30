Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03EEC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:05:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.43855.1753902341364363233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dWF73dlj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76aea119891so1102750b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902340; x=1754507140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=euSxrXFzFWkZ/95v/ErSMC0hEPz5aYChQqNM1AKA12M=;
        b=dWF73dlj/GDD7tIzffLrWe+zR2qiiNCt1CI6BAsJ5mTTfGaYTYsQVipOP5ylp6FQCl
         Y+oodHFGn0TLMO6Fcy6+Sx/Twk8CzB/UEH24eAXi4Lot24h7zA8TG2HRKLJLfBzbEAkr
         tDDKL6gyhC09i2rOjfUcqBzgeVXKGasvpFcpgdatlqDmaUXJxiogoIl0RvDrj4+e4qF1
         D4/JuKWR7MGQYZRVqa9jcFNcGZDlcEOQQAzN9FU7WlKFqgj2E2ETB5iSdJ/v/IF2kDpu
         WLIc/M5u5PQUQ0XCcyK1JEJFC5lxjYUNnDSgO25m6X+iQqJyzlxpoZ3e5LCmS1vFEe8C
         bs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902340; x=1754507140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euSxrXFzFWkZ/95v/ErSMC0hEPz5aYChQqNM1AKA12M=;
        b=v32YudfAizv9bQmm4q1+esylkmdqncFkb0DJkT3hWQF5kuCJg6AxOmRWRiYJILvx5Z
         qdf2gqIoM1jOehQZxQBkfpKIpGLhZ7ZkF3eMSeOywYBIJwNEbxRMmbwpqScPPT2YuasP
         mXCvPl0vLO0ARvHgL8bv4yut9fNRdP536Pg7sSkn4AVmUqHUfNA2PNzNh8Z/UG0fUGP4
         e8qd4MwPff9ZkK9Rslo0KYhxkauMv4IehBjcu1HT0T/rFOZF5hq/Fs5oRmqzXZ+HbHiv
         YMqmKz5VG7jCAZtNfTtDuoc4GdRz3drjD5dzEBDTuHOvnt1k1AGkls75nxPv8O4Dmw12
         hg4w==
X-Gm-Message-State: AOJu0YxPwTlJnipgGT96aWU48UBFu/WeQOfWP1dUVvxIcZxYxJ6FyTLl
	idXSND/OeEkWTyPnDrFLydiIaVX0ERxPtUcpY9HLZ9tFakVcTd/qiGYk/AQ32YZfadfr8r0Z7LS
	emdpf
X-Gm-Gg: ASbGncs3iInNn3bRYORZsP4drSr/Bl/7zPzNiWZxLR2a8uOn6qeSfQvkJ4oASprtyAy
	Ffpl4avZ98mi6EOXv4Nrm4UcZtnwgefkBUsSmdQZhDpBEBnFGTWb2pc+gOOjNRiMZwwkWxU42AX
	8tJ8rqrbAbxBxWxVaSBcKt5mENjCeupWVR6SUOBYsa6jtF++t/vowuPcsILl4TANiRKAlaI5mWl
	/rB1oHtJpagDUCQlBxYSVdQZXg6Nu1rX8mvQc/kh59Z5/Ui+66q29F6ZKZvia+U7K1Z+YQ8mS18
	idZcvTiwiWUAliZf21fM+i216omKY1WfeJMGKPQhZ0haUl+ohjDLrr81B3dWpNgSHaIvHDjr6I4
	BLgx8EDAu78bo
X-Google-Smtp-Source: AGHT+IGVXeSvQW4IVkPaKNlHiPFIjQekqiS7ciJ0WAbEouTVXwBeU6YiAdZ/yN4Kj2RSwgnjyTGPGA==
X-Received: by 2002:a17:902:ec8e:b0:215:b1e3:c051 with SMTP id d9443c01a7336-2409682d77amr64055695ad.11.1753902340077;
        Wed, 30 Jul 2025 12:05:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Wed, 30 Jul 2025 12:05:24 -0700
Message-ID: <cover.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221138

Please review this set of changes for kirkstone and have comments back by
end of day Friday, August 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2113

The following changes since commit 277b5ec3c0212ca8600dd89d0a33f784a060131f:

  db: ignore implicit-int and implicit-function-declaration issues fatal with gcc-14 (2025-07-25 08:37:09 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-7545

Peter Marko (8):
  dropbear: patch CVE-2025-47203
  gnutls: patch CVE-2025-32989
  gnutls: patch read buffer overrun in the "pre_shared_key" extension
  gnutls: patch reject zero-length version in certificate request
  gnutls: patch CVE-2025-32988
  gnutls: patch CVE-2025-32990
  gnutls: patch CVE-2025-6395
  libxml2: patch CVE-2025-6170

Vijay Anusuri (1):
  sqlite3: Fix CVE-2025-6965

 meta/recipes-core/dropbear/dropbear.inc       |    3 +
 ..._snprintf-that-won-t-return-negative.patch |   48 +
 ...-length-paths-and-commands-in-multih.patch |  126 +
 .../dropbear/dropbear/CVE-2025-47203.patch    |  344 +++
 .../libxml/libxml2/CVE-2025-6170.patch        |  103 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |    1 +
 .../binutils/binutils-2.38.inc                |    1 +
 .../binutils/0043-CVE-2025-7545.patch         |   39 +
 ...fer-overrun-in-the-pre_shared_key-ex.patch |   34 +
 ...-length-version-in-certificate-reque.patch |   37 +
 .../04939b75417cc95b7372c6f208c4bda4579bdc34  |  Bin 0 -> 1782 bytes
 .../3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2  |  Bin 0 -> 830 bytes
 .../5477db1bb507a35e8833c758ce344f4b5b246d8e  |  Bin 0 -> 111 bytes
 .../gnutls/gnutls/CVE-2025-32988.patch        |   58 +
 .../gnutls/gnutls/CVE-2025-32989.patch        |   50 +
 .../gnutls/gnutls/CVE-2025-32990.patch        | 2109 +++++++++++++++++
 .../gnutls/gnutls/CVE-2025-6395.patch         |  299 +++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   15 +
 .../sqlite/files/CVE-2025-6965.patch          |  115 +
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |    1 +
 20 files changed, 3383 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Add-m_snprintf-that-won-t-return-negative.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-47203.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7545.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
 create mode 100644 meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2
 create mode 100644 meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32990.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-6395.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch

-- 
2.43.0


