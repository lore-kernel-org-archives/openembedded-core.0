Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9B6C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3288.1739304561900441237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I1gFS+mS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f2339dcfdso1974035ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304561; x=1739909361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pm4g92iugs8ZJDlhaAvSWrch151JJGO/l6IiS7Zsnzg=;
        b=I1gFS+mSlj1r+ipIl1Xwwl0LSRl95FGuzsjIlSV2nVGGz4NtDjGzk43BKAPG1kZWux
         ZbUIoDP+9q/+zRK13N8vumcBFgkiYXbarA1BMKgbiiKHTmCWk1ZzeSAFWZu8+E39GF8A
         wzaExSOVkqhuiBjxrnFBcPFBMPGr5Un78S5CFxuEY8Y+A20/QvF9mRJ7opKhITZR/4nP
         org8QdNMoI9pfRNXkqfhg9uaTn2Bokyr8Px8i8t1N2d7KI9Qmut2KxastoPQpfXJ06U8
         paxgPzSne4EgOUoEMkI3sjkcxMXhntvUvkZbB7afz+n/1xd288hRyJVmjelhe63vu15L
         4qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304561; x=1739909361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm4g92iugs8ZJDlhaAvSWrch151JJGO/l6IiS7Zsnzg=;
        b=enpC6FavaxJE0clpNmaBYtV/i98TGyyErzaevLJEQsWl5ODuEm1IJBCADQW1NpCp3f
         PPrkVUcjsxJOlFU7Cn3n2H64H0zU4UCUqb/xmWHiH42aWkvnGPDwYBd1rz4c8TNVYBNa
         sl7WFJGdSg1VEYyBNqexbp0Cq0DWX0z7qgAU3XSRSmRzmKo0R4qg8MQ6H4MzluYKrkBm
         bj8Dg/Un8jcD4seycz8pcg8vMUQ/aYTK8OgczJp7OxW8tS/uGdyBIJ/PHEI2dfGpDp5A
         CmwC4uQSPwFxM2JlGReY3Cyvrfiy645eiJr49TwB9n2czGyNzQ+9d1pw5pc3PpLJXo6o
         Dc6w==
X-Gm-Message-State: AOJu0YxwLL+7cHwvn6TrxJRaqwntuI6RVJ3IJRaIRMG0Y1VfyQJZz4S1
	owFCFujN9VFY3eaPWCwwEExbwQIaxr0MeDFQxLRT4s7im/mqEoTYyR32Sxj5kMrMoPDdoOv5nwP
	q
X-Gm-Gg: ASbGncuYYZWyiKASOIMWeJIuOaSfowea2gyG+BAg3bO9FNvxJN2TF0b6eL2tlQekO0/
	TKEDOtZxyM+KzWJuqI5n/Mef/p7AtTbpowmDlV19hYLddnr/Hj7mknVrX8ygqzFuQIgdZGKoKvp
	o7vHtidz3VKIX1YIjuK1rBqHg8cPU8fdYKj7UM4hXw8vA3l9CJTAVTaSBFpTKrlWVKk66FSh9wK
	v1G9icLVsOXN35WeOIxsDXT2rt35giaqC0OoETd/B3uOTeLkLCuy6KDokPvwbSsjGD7k2L0xy8m
	vFz1
X-Google-Smtp-Source: AGHT+IFPXKNGDsHtRPL74wUil3y6ZMpL2QPQEpS3dpAUNI+MZn78n9Xl/Bo4+wnv9gvnuziwlUM3xQ==
X-Received: by 2002:a17:902:c94a:b0:216:271d:e06c with SMTP id d9443c01a7336-220bc1c0c56mr4904905ad.4.1739304560946;
        Tue, 11 Feb 2025 12:09:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/14] Patch review
Date: Tue, 11 Feb 2025 12:08:59 -0800
Message-ID: <cover.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211169

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, February 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/997

The following changes since commit 72156282059aa5a013a386eb95f89dc38726326e:

  selftest/rust: correctly form the PATH environment variable (2025-02-07 06:29:37 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (8):
  ffmpeg: fix CVE-2024-35365
  ffmpeg: fix CVE-2024-36613
  ffmpeg: fix CVE-2024-36616
  ffmpeg: fix CVE-2024-36617
  ffmpeg: fix CVE-2024-36618
  ffmpeg: fix CVE-2024-36619
  ffmpeg: fix CVE-2024-35369
  gstreamer1.0-rtsp-server: fix CVE-2024-44331

Bruce Ashfield (1):
  linux-yocto/6.6: update to v6.6.75

Khem Raj (1):
  qemu: Do not define sched_attr with glibc >= 2.41

Marek Vasut (1):
  base-files: Drop /bin/sh dependency

Peter Marko (3):
  python3: upgrade 3.12.8 -> 3.12.9
  go: upgrade 1.22.11 -> 1.22.12
  cmake: apply parallel build settings to ptest tasks

 meta/classes-recipe/cmake.bbclass             |  2 +
 .../base-files/base-files_3.0.14.bb           | 23 -------
 .../go/{go-1.22.11.inc => go-1.22.12.inc}     |  2 +-
 ...1.22.11.bb => go-binary-native_1.22.12.bb} |  6 +-
 ....22.11.bb => go-cross-canadian_1.22.12.bb} |  0
 ...o-cross_1.22.11.bb => go-cross_1.22.12.bb} |  0
 ...ssdk_1.22.11.bb => go-crosssdk_1.22.12.bb} |  0
 ...ntime_1.22.11.bb => go-runtime_1.22.12.bb} |  0
 .../go/{go_1.22.11.bb => go_1.22.12.bb}       |  0
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  4 +-
 ...001-ctypes-correct-gcc-check-in-test.patch | 53 ++++++++++++++++
 ...asename-to-replace-CC-for-checking-c.patch | 10 +--
 ...t_readline-skip-limited-history-test.patch |  4 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.12.8.bb => python3_3.12.9.bb}  |  3 +-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 47 ++++++++++++++
 .../linux/linux-yocto-rt_6.6.bb               |  6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 ++++-----
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        | 62 +++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 37 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        | 37 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 35 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 36 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        | 36 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2024-36619.patch        | 36 +++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  7 +++
 .../CVE-2024-44331.patch                      | 44 +++++++++++++
 .../gstreamer1.0-rtsp-server_1.22.12.bb       |  4 +-
 32 files changed, 474 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.11.inc => go-1.22.12.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.11.bb => go-binary-native_1.22.12.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.11.bb => go-cross-canadian_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.11.bb => go-cross_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.11.bb => go-crosssdk_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.11.bb => go-runtime_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.11.bb => go_1.22.12.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
 rename meta/recipes-devtools/python/{python3_3.12.8.bb => python3_3.12.9.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch

-- 
2.43.0


