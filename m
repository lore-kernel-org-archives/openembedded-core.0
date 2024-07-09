Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9279CC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4641.1720553406073833542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NHDb8GV1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b09cb7776so3062116b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553405; x=1721158205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0uZiAmZNSfhpdnlEZPj4Kjw3qj7NpKy8ou0f1W5cuI=;
        b=NHDb8GV152NpdNs9zjKcL1S5HE6hgn7EaR/m5W9mgKOcuRGnOEpO/Dq9e9QIp+JYZB
         Sacf5G3NWS/ZZEYcseFm3Um0mjn2uFBO0NKO0lGgURFpjkY1zohyYLz8TefmKePgxLFW
         ywBsVBBrozEiIvnh9s+1pKt4VOZQ9itKyqWN0JT6UPf/HrY40s2iOgL3/h7sRR+LvUiD
         QUgI2lwo+eE6AcMvZLW/zrBuGXp8O9d/F5XDZY/YTp/2zgfhVYxVCoMUAYKaOssvomy5
         QigIYWK0CHoki9hLCF8ySDDmEaJTr75YDGv8M3+8QQJYnoHmNPFMK/X+yQIQzQjz3Ukj
         uuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553405; x=1721158205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0uZiAmZNSfhpdnlEZPj4Kjw3qj7NpKy8ou0f1W5cuI=;
        b=JYvEFZINOCoQNYL89sVmuNGZZW2dcI9QOVR+PEPS9sp5eVUwx0CqH3mqqPbAHZWkCR
         FIjG7i0oqzOwy+v+bzypKXbzGkMtpPLTkWM8s/iJ0bTEjmi2rRWExvZCVr4CsJNuqL1v
         f2lmshiDJAHfkkMu2+U4gVD/qRhTgI6JMdfMb6Tp1YfNkg+nDyGjB5ZKYwOfnxSklatc
         g19MhilKgwfqkTsnLuU+IuFzGWCiv6kmdwzNnhxfCWnuawOuj0kCkR5/qGx0RRJmy3YT
         HPDkIrvkVaQrDgx6j0M5JZbocD+KOStWwT+Lkkzj3y9rvWHBaTT82rB2ZnAqfZMgoHpC
         8zMw==
X-Gm-Message-State: AOJu0Yy4q7Piqk5WBSrrnU2bmjTWmF/iy24L9YT2fPyAWJY8zSNS7I6J
	eFszPOTvm4J3xWzB+o1hDDEQGvfSAR6x4VwzfAp1asPUuLvTpfMzw91IxsQnzvfClLxBfcqUC6J
	q
X-Google-Smtp-Source: AGHT+IEH7nIdnolV2VVIZmyeAKWDIA3nwXUjbqMU/IhPHGBjaHhVtsaKmcO1yJqKnlKlyuOtGIoKiw==
X-Received: by 2002:a05:6a20:3ca8:b0:1be:4441:66bf with SMTP id adf61e73a8af0-1c2984c875dmr3834311637.43.1720553404807;
        Tue, 09 Jul 2024 12:30:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/7] Patch review
Date: Tue,  9 Jul 2024 12:29:53 -0700
Message-Id: <cover.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201673

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, July 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7115

The following changes since commit 1cab8d06ce5df7a8d00cff8531965a84d90d265a:

  curl: locale-base-en-us isn't glibc-specific (2024-07-03 07:09:47 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (2):
  apt-native: don't let dpkg overwrite files by default
  apt: runtime error: filename too long (tmpdir length)

Hitendra Prajapati (1):
  ghostscript: upgrade 10.02.1 -> 10.03.1

Peter Marko (2):
  flac: fix buildpaths warnings
  cargo: remove True option to getVar calls

Xiangyu Chen (1):
  qemu: Upgrade 8.2.1 -> 8.2.2

aszh07 (1):
  xz: Update LICENSE variable for xz packages

 meta/classes-recipe/cargo_common.bbclass      |  4 +-
 meta/classes-recipe/ptest-cargo.bbclass       | 18 ++--
 ...he-filename-can-t-be-longer-than-255.patch | 40 ++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  3 +-
 ...u-native_8.2.1.bb => qemu-native_8.2.2.bb} |  0
 ...e_8.2.1.bb => qemu-system-native_8.2.2.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 .../qemu/qemu/CVE-2023-6683.patch             | 91 -----------------
 .../qemu/{qemu_8.2.1.bb => qemu_8.2.2.bb}     |  0
 .../ghostscript/CVE-2024-29510.patch          | 84 ----------------
 .../ghostscript/CVE-2024-33869-0001.patch     | 39 --------
 .../ghostscript/CVE-2024-33869-0002.patch     | 52 ----------
 .../ghostscript/CVE-2024-33870.patch          | 99 -------------------
 .../ghostscript/CVE-2024-33871.patch          | 43 --------
 .../avoid-host-contamination.patch            | 11 +--
 ...dd-option-to-explicitly-disable-neon.patch | 99 -------------------
 ...ript_10.02.1.bb => ghostscript_10.03.1.bb} |  8 +-
 meta/recipes-extended/xz/xz_5.4.6.bb          |  6 +-
 meta/recipes-multimedia/flac/flac_1.4.3.bb    |  7 ++
 19 files changed, 69 insertions(+), 538 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.1.bb => qemu-native_8.2.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.1.bb => qemu-system-native_8.2.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.1.bb => qemu_8.2.2.bb} (100%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.1.bb => ghostscript_10.03.1.bb} (88%)

-- 
2.34.1


