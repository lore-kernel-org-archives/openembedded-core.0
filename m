Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA53FCF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:03 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.36262.1727097243253978008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zK3tm4M7;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e045525719so2490380b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097242; x=1727702042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISDXHHBpkPne5R6ZPKVMlFxBVCyfLXTCc7YSjgUmjws=;
        b=zK3tm4M7tOQqEx0Mhj0DsQQUKVHMFpVqcg7OWjymRm9ss9kRzpyfD7KHmBKV73Invw
         +Q8230SALMhIyiuoFko+z922FrOObsxyrJ7l0+3CXOJZv9LlTLL2687gmZJ8H1h0BGxk
         BH3ABwGkgQ4DFBw+VilPffBAZW6e1Bkr9iiJYVYJ3hTSF4Dwp+RBc8OnanjOpIlHmaz6
         1SNp64v6ee34+ABOOgjsaycSD7XWveKWQmwDjPzAi+H3K1UfQHnlWSqhqJHeQ9ipZJaA
         p1ABJ1+P2QnGnQKx3BFFmbUYda0IfzknfQpT1869gGZEiJnwhIs0Zs/rwZRhtsDcXkPm
         OtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097242; x=1727702042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISDXHHBpkPne5R6ZPKVMlFxBVCyfLXTCc7YSjgUmjws=;
        b=I/Gsya0qgQEqKbtFzhHkLyJKRu/XudbnIQW8RE0uvgoJFxiRj4mnr4DuiRvziWqV5S
         3lfFeOT+7mFR4o/w2PP7Z25h80RJwYdbMsXwvjqMT+94oQqw3BFyVgowdZb+kEqHDI/m
         JlAacWohmxsDdkNBN6MFUYb5iCVoRY/c8m6MpLrR++bxOP3l4JbhzE/zvqffKwkGyvWo
         x79C+9KdnuwI/8OUMxbW9qS5ziA4ldysW5KIuKoe0GqFcTEcKCtvN4k8fg6H2JJoIqD6
         dr9xfLTLT0wyBGc5qLuhOwe2wOFXCZFPAvtwKOi2T/1rORrgmbPJyAOC9tjq7bQbTQky
         oIoA==
X-Gm-Message-State: AOJu0YxcjytfdK09Wv25yRVhMEkAAbFFgEAc3exvJu7E7FEqja+mf3r8
	HWPUdr+7YN8n3xjgTJi6LV9pbQf0+m9Jf8gjQSG18fcY9fftSTkx4+/1B9bQEKDUGOztVbsRo2u
	eWTU=
X-Google-Smtp-Source: AGHT+IG3YVzPyt2FrHmB7qfhnzyba3iWCV5MpiypwDXlzDK00jrRGU5YhHD3ooYQ886syzQNtF7lsg==
X-Received: by 2002:a05:6870:8927:b0:260:71c4:f33a with SMTP id 586e51a60fabf-2803d17a686mr5900329fac.39.1727097241569;
        Mon, 23 Sep 2024 06:14:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Mon, 23 Sep 2024 06:13:41 -0700
Message-Id: <cover.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204806

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, September 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7353

The following changes since commit 88630352d6d1cfee06787fa84b73ca8ad335cb08:

  libedit: Make docs generation deterministic (2024-09-11 05:03:48 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Colin McAllister (2):
  busybox: Fix cut with "-s" flag
  udev-extraconf: Add collect flag to mount

Divya Chellam (1):
  python3: Upgrade 3.10.14 -> 3.10.15

Konrad Weihmann (3):
  runqemu: keep generating tap devices
  testimage: fallback for empty IMAGE_LINK_NAME
  testexport: fallback for empty IMAGE_LINK_NAME

Michael Halstead (2):
  yocto-uninative: Update to 4.5 for gcc 14
  yocto-uninative: Update to 4.6 for glibc 2.40

Pedro Ferreira (2):
  buildhistory: Fix intermittent package file list creation
  buildhistory: Restoring files from preserve list

Richard Purdie (1):
  buildhistory: Simplify intercept call sites and drop
    SSTATEPOSTINSTFUNC usage

Rohini Sangam (1):
  cups: Security fix for CVE-2024-35235

Ross Burton (1):
  lib/oeqa: rename assertRaisesRegexp to assertRaisesRegex

Vijay Anusuri (1):
  libpcap: Security fix for CVE-2023-7256 & CVE-2024-8006

Vivek Kumbhar (1):
  webkitgtk: Security fix CVE-2024-40779

 meta/classes/buildhistory.bbclass             |  71 ++-
 meta/classes/sstate.bbclass                   |   5 +-
 meta/classes/testexport.bbclass               |   2 +-
 meta/classes/testimage.bbclass                |   4 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oeqa/selftest/cases/runcmd.py        |   4 +-
 .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |  99 ++++
 .../libpcap/libpcap/CVE-2023-7256-pre2.patch  | 131 +++++
 .../libpcap/libpcap/CVE-2023-7256-pre3.patch  |  67 +++
 .../libpcap/libpcap/CVE-2023-7256-pre4.patch  |  37 ++
 .../libpcap/libpcap/CVE-2023-7256.patch       | 368 +++++++++++++
 .../libpcap/libpcap/CVE-2024-8006.patch       |  42 ++
 .../libpcap/libpcap_1.10.1.bb                 |  10 +-
 ...1-cut-Fix-s-flag-to-omit-blank-lines.patch |  66 +++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 .../recipes-core/udev/udev-extraconf/mount.sh |   2 +-
 .../python/python3/CVE-2023-27043.patch       | 510 ------------------
 .../python/python3/CVE-2024-6232.patch        | 251 ---------
 .../python/python3/CVE-2024-7592.patch        | 140 -----
 .../python/python3/CVE-2024-8088.patch        | 124 -----
 ...{python3_3.10.14.bb => python3_3.10.15.bb} |   6 +-
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2024-35235.patch            | 121 +++++
 .../webkit/webkitgtk/CVE-2024-40779.patch     |  91 ++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 scripts/runqemu                               |  24 +-
 26 files changed, 1109 insertions(+), 1079 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre2.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre3.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre4.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2023-27043.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch
 rename meta/recipes-devtools/python/{python3_3.10.14.bb => python3_3.10.15.bb} (98%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-35235.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch

-- 
2.34.1


