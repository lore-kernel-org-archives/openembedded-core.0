Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71699C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:12 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9236.1739023505151146935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eINYqgAI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21c2f1b610dso73815455ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023504; x=1739628304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vD6shl2rFn9+Zd+tSNfCT0VPwFtaOsbHa5ikfbjW3Y=;
        b=eINYqgAIm/qdYMYEybSW6C5rGgYmR/ih0WlZbOaCQ1e1aHUVsUC6piZtN70xyLNqvA
         QWiZonW3mh5Ug8NQgYQu05LfVg0zwRJ1HykTfxi9stGbH16d/eBu/w5zwkG9pFLw0eVb
         uTAuqNwcZMPaJpkmQ8GZOl3pPKbqb1y3u37xYRXXeuHE3iVIxbSXQNY4iQQ1zUfB880f
         xlS0+pXCyzAfY3NFE1kuYMd4ccoamXSbaD++1S0vDRfwB9/zeN/OrBtr8KMAQ9pOtWPj
         IhuoLZ3nAzU/2rho+KFsbOXS7aNauXZfDPmPZgk1ESdLN97UoqLuaHl1a8PVUPOXa+iz
         /QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023504; x=1739628304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vD6shl2rFn9+Zd+tSNfCT0VPwFtaOsbHa5ikfbjW3Y=;
        b=Ju6AHVDlNxbULX9EGskw5IbKUrdPXOOOsf1ebxz/ZcLrkifoc9uwtKxc6TeDMPGU/x
         /zL38FUNS0sBYq37fq1IzlMzaJrvQxYPMdX+q2ZHCXcMKmA3J674jglUZy51jItgAMeK
         5C9OSgefy9pDUkJwrZYaQhPVFGqqynah9OcupCGWRWJ4s7MXgO1EsgY1gLBpQ4ETMCE/
         anY0mB48DNNsriuQeaOJbCRjCKMVfciJF1LHRhAYzTwO9s/tGMEJ8WZOVVGyxiYIgEvt
         b1CYKgStjfDqO/i26RZhp6aafi2XniiLUqoJDlw3F26omMx9Ib0oTxRrSw/n7q95g6Zi
         emgw==
X-Gm-Message-State: AOJu0YxJsi0OS9i6q4LQr+l/q1UjX3YjMPEwfl19F45x1lVZTQScvd5L
	jKz8aJtKvMmx5ZFfpYQ9Iv0/yksRclzp8h9LbTT5czpw/ICiuggP9RcRiEhs17RYv1ALNFWDXPQ
	Y
X-Gm-Gg: ASbGncs+cDlmK8dQF1wsyw9H7ZXHAbB9R5PGqIQBQZFDoHhK+xlDn0cB8a6ihvUXjZt
	AxLIljHz6m3wfCb4vhgAoOUufENUhDYDgJ/NPNMhtXVD0a6yY3Gm797r30aWtK9T/0Ol6CPcfMQ
	5f3UJFMyW73i/dWbiSSCyJTEYmNmOsAlxGgrCHItmKaNkPuwvyjzwsymaHA0Iyl0UnAf75umsZh
	tna4YVkIxswW/uewsfrKCIB2NaGtlv2XbVcIQ2Gg/mdin8+bJRCsiAyGBHntbI+nku+THL87Sdj
	tu9Z
X-Google-Smtp-Source: AGHT+IGrlFdIeRei42bSX6gixK2FdinZOse8C0W9sP7CZmSuXAEznLBbVacmAElOhMTC9CAdcqru5Q==
X-Received: by 2002:a17:903:104b:b0:215:bf1b:a894 with SMTP id d9443c01a7336-21f4e7249bdmr99612275ad.24.1739023504215;
        Sat, 08 Feb 2025 06:05:04 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/13] Patch review
Date: Sat,  8 Feb 2025 06:04:47 -0800
Message-ID: <cover.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211020

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, February 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/977

The following changes since commit 37835788d0772568f3551532eacbf810a4a6e47b:

  uboot-config: fix devtool modify with kernel-fitimage (2025-01-29 08:19:33 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (2):
  pkg-config-native: pick additional search paths from
    $EXTRA_NATIVE_PKGCONFIG_PATH
  selftest/rust: correctly form the PATH environment variable

Deepesh Varatharajan (1):
  binutils: stable 2.42 branch update

Esben Haabendal (2):
  files: Amend overlayfs unit descriptions with path information
  files: overlayfs-create-dirs: Improve mount unit dependency

Harish Sadineni (3):
  rust: fix for rust multilib sdk configuration
  rust: remove redundant cargo config file
  oeqa/sdk/context: fix for gtk3 test failure during do_testsdk

Jiaying Song (1):
  binutils: File name too long causing failure to open temporary head
    file in dlltool

Pedro Ferreira (1):
  rust-common.bbclass: soft assignment for RUSTLIB path

Peter Marko (1):
  glibc: stable 2.39 branch updates

Ross Burton (1):
  oeqa/selftest/rust: skip on all MIPS platforms

Wang Mingyu (1):
  gnupg: upgrade 2.4.4 -> 2.4.5

 meta/classes-recipe/rust-common.bbclass       |   2 +-
 meta/files/overlayfs-create-dirs.service.in   |   5 +-
 meta/files/overlayfs-unit.mount.in            |   2 +-
 meta/lib/oeqa/sdk/context.py                  |  12 +-
 meta/lib/oeqa/selftest/cases/rust.py          |  13 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.39.bb         |   2 +-
 .../binutils/binutils-2.42.inc                |   3 +-
 .../0017-dlltool-file-name-too-long.patch     | 208 ++++++++++++++++++
 .../pkgconf/pkgconf/pkg-config-native.in      |   2 +-
 .../pkgconfig/pkgconfig/pkg-config-native.in  |   2 +-
 meta/recipes-devtools/rust/cargo_1.75.0.bb    |  13 ++
 .../rust/rust-cross-canadian.inc              |  24 +-
 meta/recipes-devtools/rust/rust_1.75.0.bb     |  12 +
 .../gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb}  |   2 +-
 15 files changed, 257 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-dlltool-file-name-too-long.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} (97%)

-- 
2.43.0


