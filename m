Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FFAC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:07 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.8198.1745981639361696263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xLYctWMn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so5400604a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981638; x=1746586438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jo63xqoW78zdAHcpHxWmw/ZxfM7+VI1naHhw41mzVsQ=;
        b=xLYctWMncw/ysDRtX2QlCu5zBn9hMpPZsqkwfQCjkGPkQucWPiyVYzBXLB6Qs/jkW6
         ZndPoX8Cf8Y3mqk9KrfMxQnqFj6besKU8t9zmL5u3IwDqM2wUV5abKBp4PiuVSH6eFPb
         dhad0HsDy0jNlVNZxc5QPvuYtLg3fthxQFPCf5VzfVhexJBHXXjERlq5xjmqxQyw5Tln
         mz46jtcuxuDETm0cfG2e+m2sIJ6u7mvz3EjqfP1OBzSj2RBC87fNDfW+ORa3aSjf6sKI
         RVCY3MP9idyL6XSeYjdcCu+bYqLL6r9xvPAOyEetRwfHIr/i+y4mL5paFlJHwsVMOFKO
         sQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981638; x=1746586438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jo63xqoW78zdAHcpHxWmw/ZxfM7+VI1naHhw41mzVsQ=;
        b=uNxEk3pwhvkFqv+M/+WqIXdBm+fuc4gQ6SPaHfC3uULrzmzVwftSvwvZk57aZ5AF8u
         29WQ8V0pBmYz+PIOT3z8+kzntOAM/mDq5wmDnhaJ4qxQMQBxTnPFwBkJHPWg0pqFUvFR
         5f+1snac/pe1kRSyVZDsmw5AnohpnIAlUtlUeA3NjSuBH+ee8LSykNxGnsZ8X7cJzhZl
         /YCSzlQIu0eeWh5dApfgFDkHl/9nnwI8t93tyYcDo06yJ041EEUNt80ir82aek5nh+4E
         gQmIVyNSBJA1Xpw4qB20UKfE94FOeakVgNEala/kz4Q1KYon6K7xv17TgHnvXH8xxl9Q
         WPZA==
X-Gm-Message-State: AOJu0YxiWflBcRUzAwooNX65hrh7uQNLrQ34Xrgca32/kYYZtOehtdT+
	FvZ5+Cy7EGQbqdys5Je1rJSbcmfgZ1t9gZZupqN+pVIzfAFn5/6GSoNB8QiOYRoLrKZCcUuWyzI
	d
X-Gm-Gg: ASbGncudJc1MI0EuRMlh1yj28MheY8rydS3GmDBFWNTyiymXycyzYua7lQpnz9EElBB
	9kmRjsiXz8OpfnDdB2BXI6L+8KRPX8lgNCaeaMBQ33ngPHGKBqobIlQ82DCJYKoHiJE+CSVQqzA
	MYWkCK1vIShtJJuFCRK0v1/ayROZN5sZmNXPAc1YkRGjdlBOnJlv1dPJ7mvXDcZx+j7s+46FLK3
	uux1jeavTUOh0K9FOwqBe+q2jobywkXTcwL9YcKJzu9LpVAE+SqgJnbetYHCdvCq7DFOeZ7TbSj
	sZJVh/yc3F2C63OVxs86w6pp0aeLcbs=
X-Google-Smtp-Source: AGHT+IE+OkvOQpc/i3MIsyjXGAObLSTm6V459cAxOIndT7TEOIUlNEktRm3tUWIoXWVa76c3Zp1IVA==
X-Received: by 2002:a17:90b:538b:b0:305:5f32:d9f5 with SMTP id 98e67ed59e1d1-30a332e1ee8mr2231344a91.7.1745981638165;
        Tue, 29 Apr 2025 19:53:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.53.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:53:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Patch review
Date: Tue, 29 Apr 2025 19:53:25 -0700
Message-ID: <cover.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215691

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, May 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1494

The following changes since commit f23d1bfca0ea57150c397bc2e495191fb61423d0:

  ruby: fix CVE-2024-43398 (2025-04-15 06:43:55 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Chen Qi (1):
  systemd: backport patch to fix journal issue

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-1178

Haitao Liu (1):
  systemd: systemd-journald fails to setup LogNamespace

Peter Marko (8):
  sqlite3: patch CVE-2025-29088
  ppp: patch CVE-2024-58250
  ghostscript: ignore CVE-2025-27833
  libarchive: ignore CVE-2024-48615
  libxml2: patch CVE-2025-32414
  libxml2: patch CVE-2025-32415
  glib-2.0: patch CVE-2025-3360
  Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"

Priyal Doshi (1):
  tzdata/tzcode-native: upgrade 2025a -> 2025b

Shubham Kulkarni (1):
  libpam: Update fix for CVE-2024-10041

Soumya Sambu (1):
  python3-setuptools: Fix CVE-2024-6345

 .../ppp/ppp/CVE-2024-58250.patch              | 185 +++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |   2 +-
 .../glib-2.0/glib-2.0/CVE-2025-3360-01.patch  |  57 +++
 .../glib-2.0/glib-2.0/CVE-2025-3360-02.patch  |  53 +++
 .../glib-2.0/glib-2.0/CVE-2025-3360-03.patch  |  36 ++
 .../glib-2.0/glib-2.0/CVE-2025-3360-04.patch  |  76 ++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-05.patch  |  57 +++
 .../glib-2.0/glib-2.0/CVE-2025-3360-06.patch  |  50 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   6 +
 .../libxml/libxml2/CVE-2025-32414.patch       |  74 ++++
 .../libxml/libxml2/CVE-2025-32415.patch       |  39 ++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 .../meta/cve-update-nvd2-native.bb            |   2 -
 ...n-in-mkdir_p-when-parent-directory-e.patch |  78 ++++
 ...journal_previous-next-return-0-at-HE.patch |  87 +++++
 meta/recipes-core/systemd/systemd_250.14.bb   |   2 +
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0039-CVE-2025-1178.patch         |  33 ++
 .../python3-setuptools/CVE-2024-6345.patch    | 353 ++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |   1 +
 .../ghostscript/ghostscript_9.55.0.bb         |   3 +-
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 ...024-10041.patch => CVE-2024-10041-1.patch} |   0
 .../pam/libpam/CVE-2024-10041-2.patch         |  77 ++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   3 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../sqlite/files/CVE-2025-29088.patch         | 179 +++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 28 files changed, 1457 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-06.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32414.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-32415.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
 rename meta/recipes-extended/pam/libpam/{CVE-2024-10041.patch => CVE-2024-10041-1.patch} (100%)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041-2.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-29088.patch

-- 
2.43.0


