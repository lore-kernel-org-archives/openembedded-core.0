Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8B1109316C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:42:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2882.1773967323509668649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0DVWBene;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b9675d36so10393255e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773967322; x=1774572122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sX7FAxULYKeT/1VhWx9q2dVDH8DInvDgj8EHPJTsJZQ=;
        b=0DVWBene5UEc0nRyw3CrJqtsEQoUTDfl4feQ3V4qE/GM3d+cRXq1WGH+7Q8P1nWaNj
         HUN+hljBBq9XEVmH2O9bXD2Rt9uLtJLEvDVN2VG99A7Q7y/wB5gEoatwhpaFsWStxl4C
         WhclaOug4lcYjl0tIJ/srdUwr3ld66i4aKYvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773967322; x=1774572122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX7FAxULYKeT/1VhWx9q2dVDH8DInvDgj8EHPJTsJZQ=;
        b=CiLXQ2dCnWnzKEBCoPgjIp2wyi3umrujs6l/ahian0m6C1HaVnLLktsA5fj6Dw2yrG
         AU0Z7ThyAgmnwUnvUTkBW63e8vqiIlwAcI82QsqciKELNn2dGa0kPRwv1DA9RyZrbKbB
         0wByO0clq9g1ys9CnAP29SV7NIi/Yf346sI1Vt5rZw5fiMkZvqQ9OpUIFXPimJDrhvRr
         tKUZTi1/BIG8LkR7pMBbFYMzkTLWX8B0CyUfMypn+4pnYIE6Cm9yxj264umH/y3T3aTY
         zFi7ylWFqr5T9SaFB+hFGgwDjRA0ooaDQNIykspPBcjsyY8kz3vAS3nydrhnRmEd26rS
         kADQ==
X-Gm-Message-State: AOJu0Yz5AiYdVr0cPFeuIKYoDIlJHtADx47q6huEIFmPEGrBXjxX+4wp
	QLdTMTsIuZiQsbEssLcoOPed00G+R/+9ogp9l1x2mgJQDL7GlBE3aksOyl9Ui236lnq8i04ezE4
	jI1BZ
X-Gm-Gg: ATEYQzx1KBKLcOcUeg5U2F1LvSG+tImKoKXKNG+YhCJprJa0mD+vttrAZwGX9CFp8YL
	uwffV7sE0BMt1r/PMOT3iwr04dvYAu52BWVttRVLc04fNgTbTGtBZjt7B+/ua+hWvfdKdXjoakP
	55t1RWHHPEvPZBWLRhzkKKQcHFyQLWZNZ8N7AJdM0YKJ+9AUneSDYQ47ppMbo0wsPJ400YR+Gj7
	oa1rgwXfBlraPmwDhIxTuv1LXKVuy/izY8OM016cQ5Ddm/0xlqPajvV9j6b0wLXwO1ubEWtY8We
	TPasYSl9cL/Aby9OHtbVXLK7OzGc6TprAPfVFWCmUiO87TvzPQC/3hVdKJ95j/f+zWRoUnrQel+
	GmrOEfjXR+QPqbWvpl1tfIFuri3zL8Q3q/9+hJHPSOvVUF+4yaqBildepXMoh3uTHr/MqkwvsAz
	ffi8Y5GPpuJEXP0Fh4DRhQReQPSEvEV1Mf8LtF0XHUiiHs3aJjJ02RloeVmScrw50Gotev0QPOA
	66adpexBj0ZrjkEV6J5mToEZUKOhGLTwllVzw==
X-Received: by 2002:a05:6000:248a:b0:43b:4921:8744 with SMTP id ffacd0b85a97d-43b64244339mr2163190f8f.22.1773967321495;
        Thu, 19 Mar 2026 17:42:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm2065994f8f.20.2026.03.19.17.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:42:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone 00/17] Pull request (cover letter only)
Date: Fri, 20 Mar 2026 01:41:50 +0100
Message-ID: <cover.1773967232.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233577

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1773652940.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3429
This build was impacted by:
* 16185 – AB-INT: failed connections to git.yoctoproject.org https://bugzilla.yoctoproject.org/show_bug.cgi?id=16185
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3403
     * rebuilt successfully as https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3404
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3404
     * rebuilt successfully as https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3405
* A random network glitch on github:
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3357
    * rebuilt successfully as https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3360

The following changes since commit 7b6c9faa301a6d058ca34e230586f6a81ffa3ffb:

  build-appliance-image: Update to kirkstone head revision (2026-02-27 15:59:49 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

for you to fetch changes up to ec995339f1f4143616f1b13814899acaf137b0b5:

  createrepo-c: Fix createrepo-c-native build on GCC14 hosts (e.g. Fedora 41) (2026-03-15 23:59:54 +0100)

----------------------------------------------------------------

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.33

Hitendra Prajapati (1):
  libpam: fix CVE-2024-10963

Ken Kurematsu (1):
  libtheora: set CVE_PRODUCT

Martin Jansa (2):
  libpam: re-add missing libgen include
  lsb.py: strip ' from os-release file

Peter Marko (7):
  alsa-lib: patch CVE-2026-25068
  ffmpeg: patch CVE-2025-10256
  inetutils: patch CVE-2026-28372
  busybox: patch CVE-2025-60876
  tiff: patch CVE-2025-61143
  tiff: patch CVE-2025-61144
  tiff: set status of CVE-2025-61145 as fixed by patch for CVE-2025-8961

Shaik Moin (1):
  gdk-pixbuf: Fix CVE-2025-6199

Vijay Anusuri (1):
  python3-pip: Fix CVE-2026-1703

Yoann Congal (3):
  gtk+3: fix incompatible-pointer-types errors for native build on
    Fedora 41
  libcomps: Fix libcomps-native build on GCC14 hosts (e.g. Fedora 41)
  createrepo-c: Fix createrepo-c-native build on GCC14 hosts (e.g.
    Fedora 41)

 meta/lib/oe/lsb.py                            |   2 +-
 .../inetutils/inetutils/CVE-2026-28372.patch  |  86 +++++++
 .../inetutils/inetutils_2.2.bb                |   1 +
 .../busybox/busybox/CVE-2025-60876.patch      |  38 +++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 ...-proper-cast-for-PyMethodDef.ml_meth.patch |  41 ++++
 .../createrepo-c/createrepo-c_0.19.0.bb       |   1 +
 ...orrect-variable-for-category-and-env.patch |  48 ++++
 .../libcomps/libcomps_0.1.18.bb               |   1 +
 .../python/python3-pip/CVE-2026-1703.patch    |  37 +++
 .../python/python3-pip_22.0.3.bb              |   1 +
 .../pam/libpam/CVE-2024-10963.patch           | 229 ++++++++++++++++++
 .../pam/libpam/CVE-2025-6020-01.patch         |   4 +-
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 +++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |   1 +
 ...-type-when-calling-GtkWidget-methods.patch |  28 +++
 ...ests-Add-GdkEvent-casts-in-testinput.patch |  48 ++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb      |   2 +
 .../alsa/alsa-lib/CVE-2026-25068.patch        |  34 +++
 .../alsa/alsa-lib_1.2.6.1.bb                  |   1 +
 .../ffmpeg/ffmpeg/CVE-2025-10256.patch        |  31 +++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   1 +
 .../libtheora/libtheora_1.1.1.bb              |   2 +
 .../libtiff/tiff/CVE-2025-61143.patch         |  44 ++++
 .../libtiff/tiff/CVE-2025-61144.patch         |  27 +++
 .../libtiff/tiff/CVE-2025-8961.patch          |   1 +
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 scripts/install-buildtools                    |   4 +-
 29 files changed, 748 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Fix-build-use-correct-variable-for-category-and-env.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Use-the-right-type-when-calling-GtkWidget-methods.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0002-tests-Add-GdkEvent-casts-in-testinput.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-10256.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61143.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-61144.patch


