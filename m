Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171B0D59D6A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15352.1765554010597424972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E0Lyv78z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so1389665a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554010; x=1766158810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jE4y59WaQBa6Ut2ejuZ+1yuMesCyUjH0lXKRXgwKxWw=;
        b=E0Lyv78zKnk0YVd0NrcADODK+Lk4MmRwHHLks2Arb0oPQ6TF8U9xQmZO8qqtQDYCQq
         rMFIT5UANMNg7ksrKbvHZ2l0yrtfP9aw8usR4pcxEZ7X4/YIvusvTqaIllWWnzfHaGT5
         +HR5DP1Rvq5G5IiQ2vFr5ENKrdJr/iLG/Wp5PVOlvNdCcphnfpaG6zd0nFCTjNNTJNIl
         d50O3dc4wXYLo0Qw5FcdPzfGTtFOi0QEHZ5Kw/dpbYEYXmfAL/3+NQVFwSDxGrUF64NN
         Mm8CoZmA1GKAMcFqOSEoTDyaM4F3hns5vlUZcCo915BvJjxccK74SRNjevp+o//q21SM
         k9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554010; x=1766158810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jE4y59WaQBa6Ut2ejuZ+1yuMesCyUjH0lXKRXgwKxWw=;
        b=RImyI/bhG89QeqShNfvMOaeGv3nKT4xLFX2ToDQj0p2BDuDSHwOr88zQqRAJ/RoLqg
         zepE1X/QDnW4eOOwpyccUggZRaUtbG3F7IOxQ+d3BKtvEiEIokbQOBEcd5NMioenwpPz
         JQ09eaS7VLkzeOZk3Tp/UGmX7H8hqip1/k0DpSyWI1JNe4FGfWyTOE813KjFaP5h28t/
         a7Qfy5lHbvJdBn+r0xM6TDrIyMuotI23t2el0qqDZC1XsqiW5tHpV9i0YeLZiIZi0dFt
         SVhRCa+3EuHzEsN2B0zJgaQ1KDJkdRhR+poGmk5MW3CHI9UO66ijpfTBLsEnmIZ1WQP1
         DqeQ==
X-Gm-Message-State: AOJu0YzmdyrbrRZ7eWCGN+q9J5IKy7LPx5bcQHcoaMeO+Zy9sG0+FrkR
	hRJY+0iDleIx4xcXBT6IyGIbZX52uuRUcFIsXOlaO6nBVwrjR2FNQj9tOT60cxu0W6iXdfbOczw
	zwldR
X-Gm-Gg: AY/fxX7afpMuaCRn0T/skMifzQN/SCpEYkv3BENf5tvU70X641x3dp+5MoFYtcUFDNN
	IIimbRypvNLFUeyMlqmzJcxsx/jG0QONG+iKCKQjcQbMuse4hSW2EmcQUEw+KQpOxQOcnPTcIMN
	q28VMx96fbpzrt1Tkw9iUcrVR/enR3g5QMtbZ5rIzopl9LBTKIGx9mrK0ZjTWYyqc1TzUrMuFa5
	1MYhy+/OzX8vGFWYByOvC7xkDlTiPlm54gabgsuKq4DQMTzlBZDS6pUpEGpL2yhfgkTvuTNlc9I
	uXuR9vbmz4sH0gehZdcVCFkWjzpQN/guYvh6+t6/5mECe0vlXvvR9NJkMGPqRsh0ce3KHF/bUY3
	FPzlPhUExvTMEj4zAbI5m5wYBxLxQ1X3lb/KfzLqzP+BFOvlUVzppc+tEQJ6H8OFoEevyhVBrKE
	WEFA==
X-Google-Smtp-Source: AGHT+IFyy0owKMHDV/wlGCPUrlOPYniZXEej0ndUliYNDCMvDuUO4O7ROsrosuKE/HxyqJKVjBUlUQ==
X-Received: by 2002:a17:90b:3fc6:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-34abd77efdcmr2033694a91.30.1765554009753;
        Fri, 12 Dec 2025 07:40:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/7] Patch review
Date: Fri, 12 Dec 2025 07:39:53 -0800
Message-ID: <cover.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227600

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, December 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2849

The following changes since commit ef198b0c6063ede32cb93fe44eb89937c076a073:

  curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected (2025-12-05 07:08:31 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Daniel Turull (1):
  classes/create-spdx-2.2: Define SPDX_VERSION to 2.2

Hitendra Prajapati (1):
  libxml2: Security fix for CVE-2025-7425

Peter Marko (3):
  libpng: patch CVE-2025-66293
  libmicrohttpd: disable experimental code by default
  Revert "lib/oe/go: document map_arch, and raise an error on unknown
    architecture"

Vijay Anusuri (2):
  libssh2: upgrade 1.11.0 -> 1.11.1
  libssh2: fix regression in KEX method validation (GH-1553)

 meta/classes/create-spdx-2.2.bbclass          |   2 +
 meta/lib/oe/go.py                             |   6 +-
 .../libxml/libxml2/CVE-2025-7425.patch        | 802 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 .../libpng/files/CVE-2025-66293-01.patch      |  60 ++
 .../libpng/files/CVE-2025-66293-02.patch      | 125 +++
 .../libpng/libpng_1.6.42.bb                   |   2 +
 .../libmicrohttpd/libmicrohttpd_1.0.1.bb      |   4 +
 ...rror-if-user-KEX-methods-are-invalid.patch |  73 ++
 .../libssh2/libssh2/CVE-2023-48795.patch      | 466 ----------
 .../{libssh2_1.11.0.bb => libssh2_1.11.1.bb}  |   6 +-
 11 files changed, 1073 insertions(+), 474 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-7425.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/0001-Return-error-if-user-KEX-methods-are-invalid.patch
 delete mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
 rename meta/recipes-support/libssh2/{libssh2_1.11.0.bb => libssh2_1.11.1.bb} (87%)

-- 
2.43.0


