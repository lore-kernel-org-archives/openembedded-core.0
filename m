Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CEFC55165
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 00:15:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.747.1785456931699241518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 17:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dRhCipdS;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f84023916so247653f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 17:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785456930; x=1786061730; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AfXbgLa/Lpj0DR6eTWfdwpYhJUFLx+b+W5bpy215xo=;
        b=dRhCipdSGlut2x7a7Vqz2TYlAiy2q6WzknEAJ6hW3i3QTX28oTWecEIztDVbOrkvX7
         aoFpsNhHgB7ggjvP3g+qmcAE1oGYB5OYLA0BhdHkYA8MHa5CnyO8XnsURvb5G/FtNwp8
         cnBBxC0iChIm68O1xmoWB9NDPLxcEMwOrtN0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456930; x=1786061730;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AfXbgLa/Lpj0DR6eTWfdwpYhJUFLx+b+W5bpy215xo=;
        b=jd07DLWsLB3icAsooqOHqEL87wb3crKsUL9vPmerNxor6Ix+w0X+Hg1f8A24gPkcOM
         ELk1K0DiNhw8N4JAMPNZAtdOjTQxUi8TKd0K8aPiPXRRLX3/ADG94Skh7nrop9fQ13iN
         o8Sf24yMSqsyX/VRr4i1pET7VLQmpLxUdCTm7J3P17RrJk57HRvsEFqkqpL/p9HpBgDt
         DRXCttLzyRQFsxEJL4cp04CbFbTaAkueZ5+f/E6p+amCJo3Zai3Srl1G6lrbkNfdn7le
         5JvWC7MOq7kRXorZcSRf1y6r+4XCDLJ7qCGpcS5yljmskRPFIVxYImy49C9TPFDx/i2C
         D73Q==
X-Gm-Message-State: AOJu0YysfDbR1xoS/BViQFeDqXABtfuVis2no2wNgtuYHvdlg57WZMiE
	8/6xe08BK6/eQaoZNXz92LWLZiAGLohDcGeX2y/VpYfEF7cfOQvYp9kp9araw3eq7mGKpGw7sOs
	259yiFWo=
X-Gm-Gg: AR+sD13KvKmf370nw+a3UjJiyRL/39iPBU/86tOh9tzN063RzPfNIGu5bZLf+kHKjrN
	qQbHpY59aVwWwkejhm1lidaGVaOab/QZk1Qc3ugDAqKU3XVWrWatwtSEvkFB0rj/p5S1qvIbo+1
	rxGKDAhObd8gqfNbxgYbjj490M4Y29I9VWyxdfSxTQ+9wrVeQBxJVadGUKC/vfLPpVSoquQOimo
	Y9HUQHoZwzG9h1WbpqF6F8pJnSKofUe7/5c/zWDmx7aXKG/F6RhSIvf3K1RgYzC8niE7SEIeGsD
	JTVdDHarbE/+oRO+ai+jguDqKBujbzYKh53m5p28Ch/ogkzQl1gaZe+39f6hLXq6xa0kDXJMiOV
	5IvLDBV3ph+BCFzvdW6DtMEI6Jyhp0GUxUHFDcW93ZP78++nSfz5dAxhOCHN7W8IWtrYZJbp8w2
	MD7qjjH7B8wUDDFDUWgm3f9kNxjWO+3/ajAgNrV5gqLw5r6HQdujJ16WgMZu9NAgYf5Vl/XarBj
	FUA9qGjfIZL6bMpTaS4FzpmHaIq1i1jjVj5iAccbtrUGLxOm3EBwtKO+VtcP933
X-Received: by 2002:a05:6000:4615:b0:47f:9283:1fbe with SMTP id ffacd0b85a97d-47fd2a431a3mr209823f8f.0.1785456929875;
        Thu, 30 Jul 2026 17:15:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fcb9cb612sm5683600f8f.20.2026.07.30.17.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:15:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/19] Pull request (cover letter only)
Date: Fri, 31 Jul 2026 02:15:14 +0200
Message-ID: <cover.1785456637.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 00:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242387

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1785277157.git.yoann.congal@smile.fr/
No review, no change

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4312

The following changes since commit 762321beb0260b1411c7f98f13458ec99a118280:

  bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang (2026-07-25 23:57:45 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 543550522f831479f07d332a40ba343c53ae1065:

  openssh: set status for CVE-2026-59998 (2026-07-28 15:30:13 +0200)

----------------------------------------------------------------

AshishKumar Mishra (1):
  package.bbclass: hardcode emit_pkgdata to run last

Darsh Kelaiya (5):
  gawk: Fix CVE-2026-40467
  gawk: Fix CVE-2026-40468
  gawk: Fix CVE-2026-40469
  gawk: Fix CVE-2026-40553
  python3-setuptools: Fix CVE-2026-59890

Deepak Rathore (1):
  sqlite3: fix CVE-2026-11822 and CVE-2026-11824

Devansh Patel (1):
  openssh: set status for CVE-2026-59998

João Marcos Costa (1):
  curl: add annotation for CVE-2026-10536

Martin Schwan (1):
  cargo-update-recipe-crates: Don't fail for partially empty Cargo.lock

Shubham Pushpkar (1):
  libsolv: Fix CVE-2026-9149

Siddharth Doshi (5):
  vim: Security Fix for CVE-2026-28422
  vim: Security Fix for CVE-2026-42307
  vim: Security Fix for CVE-2026-43961
  vim: Security Fix for CVE-2026-47162
  vim: Security Fix for CVE-2026-47167

mark.yang (3):
  python3-cryptography: set CVE_PRODUCT
  python3-ply: set CVE_PRODUCT
  python3-pyasn1: set CVE_PRODUCT

 meta/classes-global/package.bbclass           |   7 +-
 .../cargo-update-recipe-crates.bbclass        |  16 +-
 .../openssh/openssh_9.6p1.bb                  |   1 +
 .../python/python3-cryptography_42.0.5.bb     |   2 +
 .../python/python3-ply_3.11.bb                |   2 +
 .../python/python3-pyasn1_0.5.1.bb            |   1 +
 .../python3-setuptools/CVE-2026-59890.patch   | 194 ++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |   1 +
 .../gawk/gawk/CVE-2026-40467.patch            |  63 ++++++
 .../gawk/gawk/CVE-2026-40468.patch            |  65 ++++++
 .../gawk/gawk/CVE-2026-40469.patch            |  90 ++++++++
 .../gawk/gawk/CVE-2026-40553_p1.patch         |  50 +++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         |  44 ++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |   5 +
 .../libsolv/libsolv/CVE-2026-9149.patch       | 152 ++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |   1 +
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 .../CVE-2026-11822_CVE-2026-11824.patch       |  41 ++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   1 +
 .../vim/files/CVE-2026-28422.patch            |  44 ++++
 .../vim/files/CVE-2026-42307.patch            | 121 +++++++++++
 .../vim/files/CVE-2026-43961.patch            |  65 ++++++
 .../vim/files/CVE-2026-47162.patch            |  39 ++++
 .../vim/files/CVE-2026-47167.patch            |  39 ++++
 meta/recipes-support/vim/vim.inc              |   5 +
 25 files changed, 1039 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28422.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch


