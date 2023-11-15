Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733FAC47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.4868.1700018261953119603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V6e6nNHx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc0d0a0355so49019485ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018260; x=1700623060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm3iKSjvbSRmxlGIUSKwHCwjqO2ab1mQfwPM6DV2+QY=;
        b=V6e6nNHxkvzKVPFSccLtOEj56QzboHNA+d0QOWIkmoNi9cqlXG3t7hmWKe4LF3W8a1
         n/RQF3ezTahQsEV+cHi2iRaGdDTZgf1LF/5Wu1Q+lr6SGHYPtOc4tOR9egaaLQAjM7ia
         6eZHfg2xyjvcmEM1cgvR38RKmqCRIDKW371uhzfwXY5WBSjVOmWoa4NmDx8Wu9YNmcGb
         GNx2fwOqHMb+20dnOIzURAEjXva0U1iAqk142kvJiodVlFy2TkwnaCZqpln9AZyiLUfS
         q5D6dQekzZuFcuDw+x5+WwagmSNepPsaAer7dvB++x3vREvG0B0obyxO4U68ABoJqPWO
         aniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018260; x=1700623060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm3iKSjvbSRmxlGIUSKwHCwjqO2ab1mQfwPM6DV2+QY=;
        b=lP4uXDzK2NcT5NtxMGPiC8ZgstR95Vr3HW7WWrjzAwt/oynzoa2g3TpaqjHSadb182
         r21LdVBNf4WIM1MChe0oFcL8SmHZTmhPlBuNPVCoXsqXKminps5kgn+xRRz9794sdUlO
         vfTFqO/f6HjAKpzoKroiBimGl7rhoiiJkwB7ihYRcf+Wq8WtMnOByIfT9Fh7NTQXm+Lx
         35opijMztBuXakFiTASGNoQhWFDeMNHGVB/ETS5jcIVYcUPy9iIlqIgX8NfsCEDquVku
         Lt6Lw+fZaFm4QlFKKSb2zj63XPTD5hukyzhFVVez52mN4g5G6EaN6MTr5zo7XE3/E8yz
         f6yA==
X-Gm-Message-State: AOJu0Yy5fTa9KgqNOzsrYF2wA5RQGcRhv3XgAqCcfQrIdNrfVIo+C1tp
	tthp1eLk/YJ7c/nmj7nofqLIH9JVMlsY6jYvq1z+tQ==
X-Google-Smtp-Source: AGHT+IHp6+uNRHnF/FKfKO8ftZPxLkq1kjZf2YG9xmlJOg7xYX1WvPNt9JEE4pxbV2ph5ubL73n/6w==
X-Received: by 2002:a17:902:ab0f:b0:1c9:ca02:645c with SMTP id ik15-20020a170902ab0f00b001c9ca02645cmr4012992plb.36.1700018260257;
        Tue, 14 Nov 2023 19:17:40 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Patch review
Date: Tue, 14 Nov 2023 17:17:17 -1000
Message-Id: <cover.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190530

Please review this set of changes for dunfell and have comments back by
end of day Thursday, November 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6194

The following changes since commit 0dbf3a15321b8033ff8ed86c6aa261fdb9c3d5bb:

  build-appliance-image: Update to dunfell head revision (2023-10-27 04:22:17 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (1):
  zlib: Backport fix for CVE-2023-45853

Hitendra Prajapati (1):
  tiff: Security fix for CVE-2023-40745

Lee Chee Yang (1):
  kexec-tools: Ignore Fedora/RedHat specific CVE-2021-20269

Mikko Rapeli (1):
  lz4: use CFLAGS from bitbake

Naveen Saini (2):
  assimp: Explicitly use nobranch=1 in SRC_URI
  resolvconf: Fix fetch error

Peter Marko (1):
  glibc: ignore CVE-2023-4527

Ross Burton (3):
  cve-check: sort the package list in the JSON report
  cve-check: slightly more verbose warning when adding the same package
    twice
  cve-check: don't warn if a patch is remote

Soumya Sambu (1):
  libwebp: Fix CVE-2023-4863

Steve Sakoman (3):
  Revert "qemu: Backport fix for CVE-2023-0330"
  lz4: Update sstate/equiv versions to clean cache
  selftest: skip virgl test on all fedora

Vijay Anusuri (3):
  tiff: CVE patch correction for CVE-2023-3576
  tiff: backport Debian patch to fix CVE-2023-41175
  xserver-xorg: Fix for CVE-2023-5367 and CVE-2023-5380

 meta/classes/cve-check.bbclass                |   2 +
 meta/lib/oe/cve_check.py                      |  13 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  10 +-
 .../resolvconf/resolvconf_1.82.bb             |   2 +-
 meta/recipes-core/glibc/glibc_2.31.bb         |   7 +
 .../zlib/zlib/CVE-2023-45853.patch            |  40 ++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...-2023-0330_1.patch => CVE-2023-0330.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 135 ------------------
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   2 +-
 .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++
 .../xserver-xorg/CVE-2023-5380.patch          | 102 +++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   2 +
 .../kexec/kexec-tools_2.0.20.bb               |   3 +
 ...-2023-3618-1.patch => CVE-2023-3576.patch} |   3 +-
 ...-2023-3618-2.patch => CVE-2023-3618.patch} |   0
 .../libtiff/files/CVE-2023-40745.patch        |  34 +++++
 .../libtiff/files/CVE-2023-41175.patch        |  67 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   6 +-
 ...23-5129.patch => CVE-2023-4863-0001.patch} |  27 ++--
 .../webp/files/CVE-2023-4863-0002.patch       |  53 +++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   3 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   6 +-
 24 files changed, 431 insertions(+), 174 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330_1.patch => CVE-2023-0330.patch} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
 rename meta/recipes-multimedia/libtiff/files/{CVE-2023-3618-1.patch => CVE-2023-3576.patch} (93%)
 rename meta/recipes-multimedia/libtiff/files/{CVE-2023-3618-2.patch => CVE-2023-3618.patch} (100%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
 rename meta/recipes-multimedia/webp/files/{CVE-2023-5129.patch => CVE-2023-4863-0001.patch} (95%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch

-- 
2.34.1


