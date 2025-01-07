Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BE3E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.20158.1736256685862106205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ae3v9tjg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2163bd70069so36415795ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256685; x=1736861485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKtL399cK2QDd7MUN1Rlslco1Kt0DeP4IcldX7DS3Zg=;
        b=ae3v9tjgMPMm9ST3cMB8rwZh6I9GFbUXqnhR5OBFkK+y6ZgBSQaFCRHDZfwXNI27xt
         93X5GGZ4Rw1NEzULnuRy9SlCenm5PPT73IcYgiS7GKat+RTRZ88TAuu0NGZYyXbwRJcV
         VfXICP57NbYNv5UgZGELvLQ882+rF4tKnWu2JnQ8u2KrrP/XVJxF9g9g+jj1MAtARobs
         SUypU4mRBjPjP+pR2uxr7BDIsYgqEY4hlOF+PaEMKHrjpCd6Rkw119vI3GQA/ieac8/x
         7Vwj0qc1XVYuHWRIQVe4udplkArBNkcOGJGpZyQTzc6Ra2wqW9QNCBGKt0S9ytYxHbNF
         bM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256685; x=1736861485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKtL399cK2QDd7MUN1Rlslco1Kt0DeP4IcldX7DS3Zg=;
        b=YQypdZZHyycl6uX2RyYbO/WX/qy/TDeKjNer6yiNfevHMPyFXw0ZAAkLuoMBUWPlpW
         RIeQbxpPtXwUKafXp1r0WCBa8Q6cCDWFmG9WXwnz7TwA1oJdzTTEOF+0zEeI8dfaAmBo
         Rp1cQpa014dxf3mxe2QZbLJ+aZbMV5uVyMQVtwvEVj6T4rOwSu3ADp5AYk0pngvFYRBI
         OMbEFJ8wXK2k1Nmk1fIVeORK7Jbg9b1comMlfB+ZSlvxF6rsRlVwoB0dsSAIewlWIVOb
         UAjCQcq+B0I99vzLMwbw8ag3mVZrKl8mRTYChqzkYhlzmG9u4uuJwYpgk+XiF+4m502B
         VgPw==
X-Gm-Message-State: AOJu0YzOSqGbgc0P8OkhUwtBgyXfzg8fUXxtjGPQdJ8fZCK/rF58udF0
	gN3Qzw1PS2LRUPlZTM6sqRiQjnCngVQSYBkAqi1FXPz8kD9lQDKxjzEHBCvJfEZxDMs4E3DnkYf
	G
X-Gm-Gg: ASbGnctgk0HmnTo9Td1ru71CbyYKIdf7rwrH8ouFnv17AUfFIG1YmGcM8o5sozffIOt
	FABNL6cSWmE7fuDUBQGNyhRNY9d8EuyA8UYUpizMD4xZ8T6NGgRoNY5e0+l1DV6r2BqNrPkVcHQ
	9CLRjtEmSHZ7DRBPuBgjXjoD8voNI2NAJ6qtIfuPJsqRHLG+245R4njxe8vAEZuLdFEQeSRLJTl
	5dp3LiCEs7dwhsUbfm5PQWi0tclNbZQMWmXkrARkl/fzA==
X-Google-Smtp-Source: AGHT+IH6higrGJsOyvGwrsJpz3XU/2tuhVF8Hm0CBAExXw9oYw0gea9rqmF+wGpnYXsGIUI1uYLA/w==
X-Received: by 2002:a05:6a00:140e:b0:727:3cd0:122f with SMTP id d2e1a72fcca58-72abdd8c667mr79115617b3a.9.1736256684568;
        Tue, 07 Jan 2025 05:31:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Tue,  7 Jan 2025 05:31:04 -0800
Message-ID: <cover.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209453

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, January 9

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/751

The following changes since commit a20b02fdfe64c005f7587a1d9077bdc282f7b6b1:

  base-passwd: Add the sgx group (2024-12-18 07:06:28 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (3):
  ffmpeg: fix CVE-2024-35366
  ffmpeg: fix CVE-2024-35367
  ffmpeg: fix CVE-2024-35368

Mikko Rapeli (1):
  ovmf-native: remove .pyc files from install

Peter Marko (6):
  ghostscript: ignore CVE-2024-46954
  tiff: ignore CVE-2023-2731
  tiff: patch CVE-2023-3164
  gstreame1.0: ignore CVEs from gstreamer1.0-plugins-bad
  xwayland: patch CVE-2023-5380 CVE-2024-0229
  python3: upgrade 3.10.15 -> 3.10.16

Rohini Sangam (1):
  webkitgtk: Security fix for CVE-2024-40776 and CVE-2024-40780

Vijay Anusuri (1):
  libsndfile1: Backport fix for CVE-2022-33065

aszh07 (1):
  libarchive: Fix CVE-2024-20696

 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 ...-search-system-for-headers-libraries.patch |   2 +-
 ...{python3_3.10.15.bb => python3_3.10.16.bb} |   2 +-
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +-
 .../libarchive/CVE-2024-20696.patch           | 114 +++++++++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 .../xwayland/xwayland/CVE-2023-5380.patch     | 103 ++++++++
 .../xwayland/xwayland/CVE-2024-0229-1.patch   |  88 +++++++
 .../xwayland/xwayland/CVE-2024-0229-2.patch   | 222 +++++++++++++++++
 .../xwayland/xwayland/CVE-2024-0229-3.patch   |  42 ++++
 .../xwayland/xwayland/CVE-2024-0229-4.patch   |  46 ++++
 .../xwayland/xwayland_22.1.8.bb               |   5 +
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        |  37 +++
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        |  47 ++++
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        |  41 ++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +
 .../gstreamer/gstreamer1.0_1.20.7.bb          |   4 +-
 ...022-33065.patch => CVE-2022-33065-1.patch} |   0
 .../libsndfile1/CVE-2022-33065-10.patch       |  39 +++
 .../libsndfile1/CVE-2022-33065-11.patch       |  35 +++
 .../libsndfile1/CVE-2022-33065-12.patch       |  40 +++
 .../libsndfile1/CVE-2022-33065-13.patch       |  58 +++++
 .../libsndfile1/CVE-2022-33065-2.patch        |  58 +++++
 .../libsndfile1/CVE-2022-33065-3.patch        |  34 +++
 .../libsndfile1/CVE-2022-33065-4.patch        |  60 +++++
 .../libsndfile1/CVE-2022-33065-5.patch        |  39 +++
 .../libsndfile1/CVE-2022-33065-6.patch        |  82 +++++++
 .../libsndfile1/CVE-2022-33065-7.patch        |  48 ++++
 .../libsndfile1/CVE-2022-33065-8.patch        | 179 ++++++++++++++
 .../libsndfile1/CVE-2022-33065-9.patch        | 231 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |  14 +-
 .../libtiff/tiff/CVE-2023-3164.patch          | 114 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +-
 .../webkit/webkitgtk/CVE-2024-40776.patch     | 141 +++++++++++
 .../webkit/webkitgtk/CVE-2024-40780.patch     |  94 +++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   2 +
 36 files changed, 2025 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.15.bb => python3_3.10.16.bb} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-5380.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-3.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-4.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
 rename meta/recipes-multimedia/libsndfile/libsndfile1/{CVE-2022-33065.patch => CVE-2022-33065-1.patch} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-10.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-11.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-12.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-13.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-2.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-3.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-4.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-5.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-6.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-7.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-8.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-9.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3164.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40776.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40780.patch

-- 
2.43.0


