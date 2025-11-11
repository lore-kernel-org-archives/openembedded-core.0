Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACAECCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:49 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19435.1762873120050620536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l6BpeaUH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so3145463b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873119; x=1763477919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeO316DM8qyxn9z+NCC+44NPPqBWV1zvwvftyIvgIfY=;
        b=l6BpeaUHm4rUj1OQuno8iLsklNkH1uyxbtJZh2xk+EPaLY47DsY/lNmLCYtqZWnBDi
         0QXUz9mALTVXywvhjoz6DdfXiBsolZRuhZJj1pMUD+6zERrbmcMXjZHRYNPWCairERql
         5mGZ281O+W57U5SG3A7vMsSVgzQloDBTMtXSVl4wviIHJK9HUC9C7BzP+DA4dFfMi9hQ
         BKE7uAC5LwOaDII3GJ3QU8Awm+++oUEDBqGUTYxRWL6lNlfYhe+VTo2ORMsvHFz7Zff8
         8QpBTgCGpi+u45QX6PEbAu9K3tNgXPwwlWzIf4VgM0mOU8scx2PxoQvtlksNoiSsCocy
         vNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873119; x=1763477919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeO316DM8qyxn9z+NCC+44NPPqBWV1zvwvftyIvgIfY=;
        b=sTTDL+to85FBE7leAMecigo9z9kYhklfr8qgG93mEkZNjPk5dc2XlDyevukE+NCwS+
         OcrDXz3v44PL5rClwZE87wVlbAhuNUhk+gSPhFY6njL41SjozXd6Km5GBsu51DLx4g55
         ne7IR1SSklyQqHFBdTHntfT1tWW1ealqGRi0i9vLMh5nTTBHbF4FpwZcNk0wXH8fuY+n
         w1vDS2Uf8jEKMlk52p1N9pW8foUvDtTOmhJgmCo5krGW5PxCYurHJOi6OapXhH6j5671
         /1lESBqXIy6bb05KhQF/n046piXG4JExIk/+EI8bCdvOT4QfI3JbDLFA7o6UxqVHaQhU
         bmRw==
X-Gm-Message-State: AOJu0Ywiqt+GeDi7YqQ2bDQRT7uBCzBpSz3p3mFhDEpzSj0bOpv62OiJ
	rqNF9lon2pyD5mzWZmxafA9UGRSmeh8uXOamX6p9+O8zO2g1mYgCYXLO8/RvQ86sJ2pS9QHoO98
	+QtDYJL0=
X-Gm-Gg: ASbGncsYzC8oo+ccuS7tY4x+DihsmHGEva9agsYE8gw6B1mUMjmkXf6lgE3hRcjgTNc
	SHeEDL7EV3wvhIbtURARbsUMhSNranzFbhBpdx+Q34lYYcmQIBUFhmvSckBWl1er1lY1Br8Sj6Z
	Esh+3qEz877p7X1DeynI/N4nZC4/skDCTjjieaTNuoRiysHY4BJeE1rxHZfaxIxqn9dESaKzBlp
	PZR8O2BnqmZqWQtOngS+bgKNRCnYpZfVGJiUL9j47gK+ukVdf28hd4bxh8t7TuuZzaS6/BuQwoT
	TNPyRj9mP5W+GUIiOlMdZGz0rc/mW9sVgeWGYI2VhlqPcxs/e57sgEo4XOX9KHB7F6qkP2EQP5K
	SUoRoLoEE+YXLIhxjM5wGDMJR34INInhFcjYp1KNtDuGG0MuM93Fq0X2bprakkkJZ7Bw3u+LSV7
	qlng==
X-Google-Smtp-Source: AGHT+IFa5nV4G0fb0IM3TOgGI8rJFANyRNxbI2DYMzDloU05ZOj9E3NhJA/E+0/8pnjB06tqANzwnw==
X-Received: by 2002:a17:90b:2d48:b0:341:a9e7:e5f9 with SMTP id 98e67ed59e1d1-3436ca9b051mr15514030a91.0.1762873119137;
        Tue, 11 Nov 2025 06:58:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/19] Patch review
Date: Tue, 11 Nov 2025 06:58:08 -0800
Message-ID: <cover.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226165

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, September 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2708

The following changes since commit 06d4981313ce67a8d53b1c14be9845b4b5a9f4cf:

  perf: add arm64 source files for unistd_64.h (2025-11-03 07:45:57 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (3):
  ca-certificates: get sources from debian tarballs
  ca-certificates: submit sysroot patch upstream, drop
    default-sysroot.patch
  xf86-video-intel: correct SRC_URI as freedesktop anongit is down

Ankur Tyagi (2):
  webkitgtk: upgrade 2.44.3 -> 2.44.4
  wireless-regdb: upgrade 2024.10.07 -> 2025.10.07

Archana Polampalli (7):
  go: fix CVE-2025-58185
  go: fix CVE-2025-58187
  go: fix CVE-2025-58188
  go: fix CVE-2025-58189
  go: fix CVE-2025-47912
  go: fix CVE-2025-61723
  go: fix CVE-2025-61724

Gyorgy Sarvari (1):
  ca-certificates: fix on-target postinstall script

Peter Marko (1):
  curl: ignore CVE-2025-10966

Richard Purdie (2):
  ca-certificates: upgrade 20240203 -> 20241223
  oeqa/selftest/devtool: Update after upstream repo changes

Theodore A. Roth (2):
  ca-certificates: update 20211016 -> 20240203
  ca-certificates: Add comment for provenance of SRCREV

Wang Mingyu (1):
  ca-certificates: upgrade 20241223 -> 20250419

 meta/lib/oeqa/selftest/cases/devtool.py       |   8 +-
 meta/recipes-devtools/go/go-1.22.12.inc       |   7 +
 .../go/go/CVE-2025-47912.patch                | 226 ++++++++++++
 .../go/go/CVE-2025-58185.patch                | 142 +++++++
 .../go/go/CVE-2025-58187.patch                | 349 ++++++++++++++++++
 .../go/go/CVE-2025-58188.patch                | 194 ++++++++++
 .../go/go/CVE-2025-58189.patch                |  50 +++
 .../go/go/CVE-2025-61723.patch                | 223 +++++++++++
 .../go/go/CVE-2025-61724.patch                |  75 ++++
 .../xorg-driver/xf86-video-intel_git.bb       |   2 +-
 ....10.07.bb => wireless-regdb_2025.10.07.bb} |   2 +-
 ...ebkitgtk_2.44.3.bb => webkitgtk_2.44.4.bb} |   2 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch |  21 +-
 ...icates-don-t-use-Debianisms-in-run-p.patch |  20 +-
 ...2-update-ca-certificates-use-SYSROOT.patch |  46 ---
 ...icates-use-relative-symlinks-from-ET.patch |  18 +-
 .../ca-certificates/default-sysroot.patch     |  50 ---
 ...0211016.bb => ca-certificates_20250419.bb} |  19 +-
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 19 files changed, 1311 insertions(+), 144 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47912.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58185.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58187.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58188.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58189.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61723.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61724.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.10.07.bb => wireless-regdb_2025.10.07.bb} (94%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.3.bb => webkitgtk_2.44.4.bb} (98%)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20211016.bb => ca-certificates_20250419.bb} (84%)

-- 
2.43.0


