Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD42CD8C85
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6123.1780698855415531439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zNtJEFTP;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4600ddc4017so1863569f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698854; x=1781303654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KM6Rq5ecC4+BJKlhTPaznrocvXTnf3wIdOfJTTElwY=;
        b=zNtJEFTPZ1IGfZsF/JCrqf9zzE7DVScd+L3QEr0/xl7MFHVMLb+KMeFHeRfuvnGUGx
         KEYXkl2KbGQIAx8yAIIERX6FdfXbg2hXfo68OtSuq4zglHnTyylo7dVkIuYWEFXF3uyw
         yFJ0zqZyEa9WABV7f0UAoCI7W/+vq7QrtlpWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698854; x=1781303654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KM6Rq5ecC4+BJKlhTPaznrocvXTnf3wIdOfJTTElwY=;
        b=ATLoNcANJQMK2DmM0muki1r+msdiSCEE4nFXHShFQfKau/GMxVgiRTnVn+1Jlq3nSD
         honfpX0jCmbiqnKjuuO3vYbKGyHxYSusT368zBITL3XEqPVBJPXN1oiMxJv0MzDpp+mk
         NA5gox0+OHjiSUM3FU0pNiqgtTPav++wUbicdGGpIQ9nwPbok1GCvnKqlEYew8/5k5Bu
         YU9lO0wow0xucd44htuc1Tf6zM6XiBq+8m2QY2lTVFbxHK5bQCu0cAjT8QwhXtw70sdu
         BVww6hbyNob03dnY6VmLxumbZO/Jm45mwmbZo7r4a/K/fgA+lMwHMCyY6ca06BPXYfMR
         MXYQ==
X-Gm-Message-State: AOJu0YzpP2HB1753CtpwygZx+R3Kv18IROC3xT1Z2HYLwPs2MhTmK2py
	4MvfDlQe4lO8F/IorhNrCQpTIUKO2YpmRH0njFL1dwtPbw5Y4oOqCRn2QKKwo1Rmd+BqkR3yycM
	UL83i
X-Gm-Gg: Acq92OHvkiv4UoI+bClXtKQp3O9IEWR/6lhM9/EObKAW1IyKJyjA4/usqIdc4z9Moip
	iNxyzlREhQemFpI1ZwIPASAKYkk+Ff1Nt/5ku/vY7sWRl1IGkhCoDtdcL8pDJDhNy4Oq67iB5kv
	jO+Qd7/+OjylXVkF5n+d/b22bMv58UQ/2RZ0vb0OIeMm6SJA9jsrck2bq1PAoG0ZHTyeNc0H5CR
	unmYdy++9wHCTXGy03dHmXGn1OoRNo93wCEBdzybUNXkp3+eyseByGK/yOxlAr1/aGp0wGBnVQk
	2JyuXlRLxUlup+y8Cvi2fm/H4DqXdNcr2kC6aRzeU9FxYT1P+UzChP+NQKZnm2lAFlwuKSVIaZ1
	aFzwJyj/b0LI2iNz3t4byVX1K/DT53HUqnnl5mp00P6j43K9VKGswctkvFMqqhPBQ5Rvs1/Hkbc
	dYtdPU4ybfV4C9lbFF/MdOLBxIKcfPbnuD7JYjOAhCizRmt0f8vX6Fkn6LiPY4VltFdUefGayFM
	7l5duzF+heatBw1cvT+Sd2iD9Y1jvgD3seAmZE=
X-Received: by 2002:adf:e30e:0:b0:460:1233:ecf2 with SMTP id ffacd0b85a97d-46030609798mr7002087f8f.30.1780698853670;
        Fri, 05 Jun 2026 15:34:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/25] Patch review
Date: Sat,  6 Jun 2026 00:33:45 +0200
Message-ID: <cover.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238187

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, June 9.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3933

The following changes since commit ece80784b493c8b7493478fa2ba0dc1d6d80aa79:

  build-appliance-image: Update to scarthgap head revisions (2026-05-15 13:25:33 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to e2864ea1ac022e43af92badc701fa1e2a9571f46:

  pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-06-05 11:02:52 +0200)

----------------------------------------------------------------

Ankur Tyagi (1):
  tzdata/tzcode-native: upgrade 2026a -> 2026b

Benjamin Robin (Schneider Electric) (1):
  lz4: Remove a reference to the rejected CVE-2025-62813

Changqing Li (1):
  go.bbclass: change GOTMPDIR to improve reproducibility

Guðni Már Gilbert (1):
  gnupg: upgrade 2.4.8 -> 2.4.9

Hitendra Prajapati (3):
  libssh2: fix for CVE-2026-7598
  libexif: fix for CVE-2026-32775
  libexif: fix for CVE-2026-40385, CVE-2026-40386

Hugo SIMELIERE (Schneider Electric) (1):
  libarchive: Fix CVE-2026-4424

Martin Jansa (1):
  systemd: update musl specific patch to apply

Mathieu Dubois-Briand (1):
  oeqa: runtime: go: Increase test_go_compile/test_go_module timeout

Peter Bergin (1):
  go.bbclass: disable workspaces

Peter Marko (1):
  cargo: set CVE_PRODUCT

Richard Purdie (4):
  pseudo: Upgrade to 1.9.4
  pseudo: Upgrade to 1.9.5
  pseudo: Update 1.9.5 -> 1.9.6
  pseudo: Upgrade 1.9.6 -> 1.9.7

Ross Burton (3):
  python3-requests: backport fix for CVE-2026-25645
  perl: link to the system zlib instead of a vendored copy
  classes/base: prefer gnu-prefixed HOSTTOOLS

Theo Gaige (Schneider Electric) (3):
  openssh: patch CVE-2026-35385
  openssh: patch CVE-2026-35387
  openssh: patch CVE-2026-35388

Trevor Woerner (1):
  wic: filemap: use separate fd for SEEK_HOLE probes

Yoann Congal (2):
  scripts/install-buildtools: Update to 5.0.18
  linux-yocto/6.6: update CVE exclusions (6.6.127)

 meta/classes-global/base.bbclass              |    6 +-
 meta/classes-recipe/go.bbclass                |    3 +-
 meta/lib/oeqa/runtime/cases/go.py             |    4 +-
 .../openssh/openssh/CVE-2026-35385.patch      |   47 +
 .../openssh/openssh/CVE-2026-35387.patch      |  205 ++
 .../openssh/openssh/CVE-2026-35388.patch      |   47 +
 .../openssh/openssh_9.6p1.bb                  |    3 +
 ...missing.h-check-for-missing-strndupa.patch |    4 +-
 meta/recipes-devtools/perl/perl_5.38.4.bb     |    5 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    4 +-
 .../python3-requests/CVE-2026-25645.patch     |   46 +
 .../python/python3-requests_2.32.4.bb         |    7 +-
 meta/recipes-devtools/rust/cargo_1.75.0.bb    |    2 +
 .../libarchive/CVE-2026-4424-1.patch          |   61 +
 .../libarchive/CVE-2026-4424-2.patch          |   28 +
 .../libarchive/libarchive_3.7.9.bb            |    2 +
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 .../linux/cve-exclusion_6.6.inc               | 2462 +++++++++++++++--
 ...erride-init-is-not-needed-with-gcc-9.patch |    7 +-
 ...-a-custom-value-for-the-location-of-.patch |    5 +-
 ...use-pkgconfig-instead-of-npth-config.patch |    3 +-
 ...h-fix-find-version-for-beta-checking.patch |    3 +-
 .../gnupg/gnupg/CVE-2025-68973.patch          |  108 -
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     |    7 +-
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     |    7 +-
 .../gnupg/gnupg/relocate.patch                |   19 +-
 .../gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb}  |    3 +-
 .../libexif/libexif/CVE-2026-32775.patch      |   86 +
 .../libexif/libexif/CVE-2026-40385.patch      |   35 +
 .../libexif/libexif/CVE-2026-40386.patch      |   46 +
 .../recipes-support/libexif/libexif_0.6.24.bb |    3 +
 .../libssh2/libssh2/CVE-2026-7598.patch       |   60 +
 .../recipes-support/libssh2/libssh2_1.11.1.bb |    1 +
 ...13.patch => fix-null-error-handling.patch} |    1 -
 meta/recipes-support/lz4/lz4_1.9.4.bb         |    4 +-
 scripts/install-buildtools                    |    4 +-
 scripts/lib/wic/filemap.py                    |   13 +-
 37 files changed, 2938 insertions(+), 419 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb} (96%)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-32775.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40386.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
 rename meta/recipes-support/lz4/files/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)


