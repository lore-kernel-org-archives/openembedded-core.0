Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DACC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.78798.1746544447435618035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=poMc4r39;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223fb0f619dso69771375ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544447; x=1747149247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5F1kL2tTqpATNCYMwScwaRdQ2jjR8+SYTINb3zgjaQU=;
        b=poMc4r39IfpGBGo6DEPBFTC+0h8oTRQ6wvT871tGkhPJ4zFrxXxCaQt32BhSQxYhL8
         7/vul8/mMHLT6VXR4C/ziF8088DwDFi3lQDhmxB21RHAlCdx6Lsq8whF0SFh3dkR9j4O
         tCXTesZyyQ+YGquUkroOvuFbVXOhShsLtC4LRPrWEulDEe2lncFYR2lFJRtU+m/kHxel
         5EaipW8ch5+N0ZwaZ4fkULL2p0u1/saEvkUsfEg8EPwgVGMrwQwZUX8UIhNw15osHGoV
         UQ/DfjiRqEiii4LHVjgKFLaiURgNLcP7L1DSta5UL6+HpM5Cw8UstkTGrd9SFPByP8fu
         jbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544447; x=1747149247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5F1kL2tTqpATNCYMwScwaRdQ2jjR8+SYTINb3zgjaQU=;
        b=Zl4uBxhxFoQnapgdCQw9wmEUS4u8g5TBkR4WYliKOWKfyfoBQDSPhjtBQaha8Mtt+j
         Rf2BCApji6HPjCZ/dkIxh3pgLFCTxiKDVVumFHhIYl8kIxFUGQSXiRh5Mpkz311J06VS
         Ryv4k3vKdvi+T8wAjHqZ0FGmlm6YD7sMUGSZv4KBehQdRfenmsFkq8TtwvJlhr07muVS
         tDDLH4yRr7UwL+XpUlLodaQtJOtWnrhZSR0NwUh40pjNt1ooS+nTRZUGPR8NKy5ob/Ts
         52w6ZPxRZxJ8UhxmLxOiqznP7OJ/Djy1lPyeIBH/v084IXuTpKilBNUz787sLHRrXdEB
         IiWw==
X-Gm-Message-State: AOJu0Ywe36EsyQ3pjdyNyWjz+oEfMWTy3uLR7S8yKqWwYsIRgAQNTKVk
	mgyxmGDX8ZVdAOvUVSsf8dO2oaXGo5MAsMWv3M/1afaHJQaGwPiGw3Dbl28av5SKGKwcUdkc51L
	v
X-Gm-Gg: ASbGncvJGScH5+XTUZm3dUR/X7Px9UlkoSQWGAjElYcguojWTKilbJz/c/EzQFMPphE
	UUt4dJyLlT/l7NyESoxJ649DR6zCIPdNjEWusmR3Y3dm0lMu5eMZJZ3H8RzyqiAFUz4uxt9YzFa
	jCCB1umX7GRF7cJMA4MUGAhcIrAE25tcHfOPvXegt4S6saj4jq6AXtAHLXou62Ms4L1nXlGOnEz
	x3GFETLx71cbMYiETTJMUqFRNtZLstnz5ph+GJIonKQnXMSDAbYQuQ99UnsVCu1T26xjOCRvHZd
	Hmn71dfiZMbb693DngyUHAYnDlrJZhwF
X-Google-Smtp-Source: AGHT+IGJdOlXkVPrV5Ue41y7D30XGUD6R3Y3prowE+61fjjFhQrTpssp92HzmLmP8M40GrPMCar8/A==
X-Received: by 2002:a17:903:1b0d:b0:224:fa0:36d2 with SMTP id d9443c01a7336-22e1031328fmr242202095ad.26.1746544446377;
        Tue, 06 May 2025 08:14:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/7] Patch review
Date: Tue,  6 May 2025 08:13:52 -0700
Message-ID: <cover.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216057

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, May 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1529

The following changes since commit 00dd4901e364d16d96cfab864823a9cfdd336eeb:

  Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR" (2025-04-29 10:21:16 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Ashish Sharma (1):
  libsoup: patch CVE-2025-46420

Deepesh Varatharajan (2):
  glibc: stable 2.39 branch updates
  binutils: stable 2.42 branch updates

Jeroen Hofstee (2):
  bluez5: make media control a PACKAGECONFIG option
  bluez5: backport a patch to fix btmgmt -i

Peter Marko (1):
  sqlite3: mark CVE-2025-29087 as patched

Soumya Sambu (1):
  elfutils: Fix CVE-2025-1371

 meta/recipes-connectivity/bluez5/bluez5.inc   |  3 +
 ...ndex-option-for-non-interactive-mode.patch | 29 +++++++++
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../binutils/binutils-2.42.inc                |  2 +-
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1371.patch        | 41 +++++++++++++
 .../libsoup-3.4.4/CVE-2025-46420.patch        | 60 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 .../sqlite/sqlite3/CVE-2025-3277.patch        |  1 +
 9 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/toolsbtmgmt-fix-index-option-for-non-interactive-mode.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch

-- 
2.43.0


