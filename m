Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CC6C3ABAA
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8384.1745982014100411525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ec6gThAH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so113422125ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982013; x=1746586813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkSTO3Rftla0ocRuXMhyZ1qsZoqT0nSLJGAZvtldIFE=;
        b=ec6gThAHpL8wyUusNV94zf5Gjsn1yxBoElxOwgleVmzS6MA34MfrpO37yMF/0DsOWz
         DBjbZ8/kaQ3XPHPwUAonFIia/B4ypFFT+rf6L9iSPiihBhMDsYbpByloh4o3Vfa9c/9d
         dDYfxnQIRkvVtnWVw5Uh5WPcXlO8JXHnfZDdW/RGxH8nggBCOfRnWkjwmR2uMDZcMIDP
         3+52Vmfc3vFT8P40Nikhkqwm4Eg7fZj229WhPi53xrKr798wN9kr92oVlRnS7XUCVe+2
         5W8y1sA8/+z+GwuVixq9BDp4DayNp5R9OlDfNEfuXQOhNzzqrZPSwFgVJrZEcboAcld5
         IbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982013; x=1746586813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkSTO3Rftla0ocRuXMhyZ1qsZoqT0nSLJGAZvtldIFE=;
        b=O/BzSKTHuHa/mYMRdxtUF9oY5GLtysHgGu6AdUOa72ln+A1s7h73gonPYVtuRIC6nZ
         JBWd6OA9kc0s2txM4Zp7lpxxbbIoPRxswH7h0B4an3ip089XIT3qF0PPSY84vB8z/JDZ
         azzWSpHjeKIRmSeIk/MCbHXUDshUAa7lMlp6/IHskC1LT6nMI7XjhQCuYSWp7DuILv0o
         c4ZQzPPeTTxUyMbqARnDukkgXriMnI3W+Inv3KN2fGVc0r14qiB+/bFdJdE/XsMKjTKy
         mUtNAfiJC7EhvjzL294jgZTOegvQpglaDTgKrQQn+08vBSM55cN8goD1MulCM7QoYpOj
         c51A==
X-Gm-Message-State: AOJu0Yx8hJvuqv4ySthVEthocvXVOEypvkuIHk57ZKo6PRzCGTkjCDe2
	ywYVHMWHwyS+iSc3rmGnqGm3hn9GMD+jgGH+2HIbLpqqPPf1xUjPrZPHMLl2Yia15gZ2tHVWPtl
	M
X-Gm-Gg: ASbGncvm46d7FbLpNU5G8lY54Mu3MPCmlQbOSYAC7IvQyNwxdWbaUFtfJMFpBDaZl9I
	IQk105fEnnLXVMDmiPSQY7vOSbyqkrYyWdKCQCn5rT4HRZRNqJb+HdPxDQlg17BtbgkKedQLnhr
	4H9IweCy+qeajZUZ3tc7oNBIPP5SF6RmTwAIcscMec27rOb305VribeQVvExkeCPOHDiHsAZ0OM
	qmXUA386Yx23HEbt6mWy/Ty3t3uYxNUmirT+adc/56YcPLP2/xJ2YKYR2uW3VDql1jMoUTWZJxk
	XfHdHzEFUizZjoxWV2g8KoHERVZC+ic=
X-Google-Smtp-Source: AGHT+IHOWhAkj+CqIM1xHlrp7OQGL2fH2jCYwtENnubpAqqQn4QsDG9FWfMnPH4gX1S2g0o7+PHA7g==
X-Received: by 2002:a17:902:fc47:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-22df35a39b4mr27238125ad.33.1745982013384;
        Tue, 29 Apr 2025 20:00:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/15] Patch review
Date: Tue, 29 Apr 2025 19:59:48 -0700
Message-ID: <cover.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215706

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, May 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1498

The following changes since commit 87cadf62ba0d6b0fc3dc0151a5d320919b7eb1ab:

  bluez5: add missing tools to noinst-tools package (2025-04-22 10:32:27 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  perlcross: update 1.5.2 -> 1.6

Archana Polampalli (2):
  perlcross: 1.6 -> 1.6.2
  perl: upgrade 5.38.2 -> 5.38.4

Changqing Li (4):
  initscripts: add function
    log_success_msg/log_failure_msg/log_warning_msg
  buildtools-tarball: move setting of envvars to respective envfile
  buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
  buildtools-tarball: Make buildtools respects host CA certificates

Peter Marko (5):
  ppp: patch CVE-2024-58250
  libxml2: patch CVE-2025-32414
  libxml2: patch CVE-2025-32415
  glib-2.0: patch CVE-2025-3360
  Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"

Priyal Doshi (1):
  tzdata/tzcode-native: upgrade 2025a -> 2025b

Shubham Kulkarni (1):
  libpam: Update fix for CVE-2024-10041

Soumya Sambu (1):
  git: Upgrade 2.44.1 -> 2.44.3

 .../openssl/files/environment.d-openssl.sh    |  22 +-
 .../ppp/ppp/CVE-2024-58250.patch              | 194 ++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |   2 +-
 .../glib-2.0/glib-2.0/CVE-2025-3360-01.patch  |  57 +++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-02.patch  |  53 +++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-03.patch  |  36 ++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-04.patch  |  76 +++++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-05.patch  |  57 +++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-06.patch  |  50 +++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   8 +-
 .../initscripts/initscripts-1.0/functions     |  21 ++
 .../initscripts/initscripts_1.0.bb            |   1 -
 .../libxml/libxml2/CVE-2025-32414.patch       |  74 +++++++
 .../libxml/libxml2/CVE-2025-32415.patch       |  39 ++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   2 +
 meta/recipes-core/meta/buildtools-tarball.bb  |  29 ++-
 .../meta/cve-update-nvd2-native.bb            |   2 -
 .../git/git/environment.d-git.sh              |  19 ++
 .../git/{git_2.44.1.bb => git_2.44.3.bb}      |  10 +-
 ...ile-check-the-file-if-patched-or-not.patch |   3 +-
 ...oss-add-LDFLAGS-when-linking-libperl.patch |   9 +-
 .../perl-cross/files/determinism.patch        |  41 ++--
 ...{perlcross_1.5.2.bb => perlcross_1.6.2.bb} |   2 +-
 .../perl/{perl_5.38.2.bb => perl_5.38.4.bb}   |   2 +-
 .../environment.d-python3-requests.sh         |  11 +
 .../python/python3-requests_2.32.3.bb         |  11 +
 ...024-10041.patch => CVE-2024-10041-1.patch} |   0
 .../pam/libpam/CVE-2024-10041-2.patch         |  77 +++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   3 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../curl/curl/environment.d-curl.sh           |  19 ++
 meta/recipes-support/curl/curl_8.7.1.bb       |   9 +
 32 files changed, 899 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-06.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 rename meta/recipes-devtools/git/{git_2.44.1.bb => git_2.44.3.bb} (93%)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.2.bb => perlcross_1.6.2.bb} (92%)
 rename meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} (99%)
 create mode 100644 meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
 rename meta/recipes-extended/pam/libpam/{CVE-2024-10041.patch => CVE-2024-10041-1.patch} (100%)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041-2.patch
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh

-- 
2.43.0


