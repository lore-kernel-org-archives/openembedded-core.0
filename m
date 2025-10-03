Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88105CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.869.1759510081760901978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A0u47Ceb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1948958a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510081; x=1760114881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6xIWYwlafehHervuknWIEkwUFj7jNKY7GePC5MOSII=;
        b=A0u47Ceby3FxiPR92y5oWIDUHbQfloEDOwmoR9DfztbXOSujJJ60TFeMwpTuYiATLy
         X1sYqW5tqfBH7Kilmak8zMFfXUjRqHFx2WU9Jd69Jz1LzxZTZO7SpuNfGedfjikpMPAf
         HmSeSgrigh2wICtMWFkn6dXPW7ZMg9dqTwTJsc0dJV8Ch98k9puXD6+oLSmX2Inn6ysy
         6QaJILnhYTLlmjyXVaeAGdrWLUkTEgaHJuWxKTy+fFsbMg2Qexvcftcd+Ufu3aT8uiiT
         fX9zbeKhfsrtJVfVCJrkrUCuMTE+ftuwXk4HcAy6idUEYxpj6U+MaENJR9sS2JOkGvGT
         0IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510081; x=1760114881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6xIWYwlafehHervuknWIEkwUFj7jNKY7GePC5MOSII=;
        b=OiBrsvUFduP4oZaUsgsE7I0LEr8HenmpQU9tqnu0MI43xyMD5A0BrxgJTbUQhc02gu
         mdx/eTmgQWe6yQ/X8dvgTWSBFR1smw4Abmq8emwLyb9aXdBP0Kf2PdkwKu0HGHt1UPnP
         jUOxybMMTpFTEkKbbXPek/O+8k0QMNXR7V7Ak3aiwUDuLNAfltxCGSdqwDPhHOgLvdz2
         NCaPjYsoDz7xkxgiw355b8rCPmcTl4MneN3QXz+JEazkXyHHxllQwWEAqgSBQW4Cx/j6
         hsSuBP7hwb6UogYNR2XkV/6vr3KGP4eqhqu9cuRCiWVTjFU1YwHLKDpGaTXb7+ZbV8xo
         ieXA==
X-Gm-Message-State: AOJu0Yx07NhvIGvOLk1VtyY/LvJ4byJJTfZJlyAWkjmpDzEH9lH7TzoZ
	qQTertr10d6jIBV3ZzQhqSEXOK45uGbHRgDru7kVpNRMh58THLFkMJWvmQUPzDa1tcngQOXZwLp
	SJXyD
X-Gm-Gg: ASbGncssWLnxCE6LsogisipzmqUOC9x3dmZCdPFCrNNLK9JScGUm9fG6UrOQWys1GZA
	1aKE8CQkL4QsuU2GfGthu/LmudwG4F4MmHA9WjtXW/E5HVeYRc8F0+nlWiC5wcFiiC0bDo/NjyU
	Np6mU/HbNjOLgAAx2uyfShAhNLLhtSP91W1mmehi6V8NpdTPMAG0ger4cUTpoQV0Z+hwrY5wwaz
	VqBbTxIvC8moZP8K4A/CZrO6IZ8V1xrGatqvGkBKGXwBSeEF3IvAei5xfMfSK5bWdUl4HFt9hYZ
	lm1zWFhKTDtrfm1HOxv5Hk0W3Eu0XeqryWZjwc4U9+N5yYs+xY1gCTtzX03JFDx5+0jPErXGYag
	upEiNw0iy7jkEd11kwZa8T1regK4kBkn697M+og==
X-Google-Smtp-Source: AGHT+IHAP80fm6IZind3MhZkLDocxi4DgsBdTvuBQcoODCkem4PdE+Gz0k1dCit3wPC8t0zyvSF8lQ==
X-Received: by 2002:a17:903:3c70:b0:278:704:d6d0 with SMTP id d9443c01a7336-28e9a56603fmr49534385ad.19.1759510080874;
        Fri, 03 Oct 2025 09:48:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Fri,  3 Oct 2025 09:47:46 -0700
Message-ID: <cover.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224402

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, October 7

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2495

The following changes since commit 55e0c38dc28b73fa689446e2d5e564d235a24084:

  vim: upgrade 9.1.1652 -> 9.1.1683 (2025-09-29 13:04:14 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adrian Freihofer (2):
  expect: Revert "expect-native: fix do_compile failure with gcc-14"
  expect: fix native build with GCC 15

Khem Raj (1):
  expect: Fix build with GCC 15

Ross Burton (3):
  expect: update code for Tcl channel implementation
  expect: don't run aclocal in do_configure
  expect: cleanup do_install

Vijay Anusuri (1):
  gstreamer1.0-plugins-bad: Fix CVE-2025-3887

Yogita Urade (1):
  tiff: fix CVE-2025-9900

 .../expect/expect/tcl840.patch                | 27 ++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb | 18 ++--
 .../CVE-2025-3887-1.patch                     | 50 ++++++++++
 .../CVE-2025-3887-2.patch                     | 95 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |  2 +
 .../libtiff/tiff/CVE-2025-9900.patch          | 54 +++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 7 files changed, 237 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/expect/expect/tcl840.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2025-3887-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch

-- 
2.43.0


