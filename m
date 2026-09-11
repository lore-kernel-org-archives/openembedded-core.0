Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B518C88E56
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 21:41:38 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50329.1789162892540259677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 14:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B3aP35z7;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so2136675e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789162891; x=1789767691; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX3/f0raTqyUHqu1D2sS0oFCiOqbV5ysGngRaUvVzYw=;
        b=B3aP35z7jn+kyPVS789HFfQ3D6sNZRUwVhsrpBGHM+N8fFs5HmZXNQlIHlKeh28a2p
         Pje1yCC+11ZkFo5i5g9g5CqGs8Fu3esUVru3nQOrU1ha/dTCPT8C3xtR4B4cN2fQrJD8
         UMChjIlEzwj4nymTdpwQ22GJwsH7O5U9e1pIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162891; x=1789767691;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sX3/f0raTqyUHqu1D2sS0oFCiOqbV5ysGngRaUvVzYw=;
        b=kxIPTyGpEJbfREkh6nPJ22qbRBZf5lI+DnCZotsgHvnnI399Us1kHwtL35UwdonrgV
         vjqj/qmUxymSe12FY7EsEgnwIzxDsEMnP5fZNqywk8L/pN/fthtU2aKDs6HEtNg9M+zW
         IP1+FxBwU2v9UKq5Jg66Sne5Xs99/mBXFo8ccif27UZwvQbVs/PO8cfWrhCgHFe5R9sj
         CcOQJvAsbVyyONxU28UPpYkp+yOW4AyvDHZrlo+bI/Apj5iadWD/NbxHhzEzemHObN9/
         6NTcx3BMNaPj8Yp1WlmnlnJwIhM0yHQMqzUgIUaZPlPvrLgXRLJm4XCFFk3+qZuJbVN3
         y9/Q==
X-Gm-Message-State: AFuF++l4uoVHJcJChZyPGYE1RphYmRknzXaBXwNlPy0a5pYZ0Sv4D03Y
	Asw2QCn4SdX4eB4MVK015v9UTPvDj26Cy9yOOgi16eT+Dv4vE8tSle3ffS6gTEYvPTIIwRYrk5N
	uBOp9OU8=
X-Gm-Gg: AYBFou1UpRFMLZiYi9aXrO+0vhy6/4+A/cYl9aJh6E08KEt6qGuQkZYraLlQljgkQ4M
	KmopXKX2sJvaJvZ5pIH8QsI9Z5gWcOHM+kUhqqIGgGqeMcm7k/pryN8H3Lu5U7kqwuHSGqhUa0u
	HoS+LU4Y9kQ9+zhCvrf4SIVsTRToM6CNYoMKa1nh9pp8EqkbDlYfyGgHYyYwH7EPBWVNpfmhXZI
	zit5Ur0uxNbQEbnxKfpw192xIqQ17evMhfxrTGGjvma80PSVlTwW2AZd5cmeN1nIxFQ4uWxK65a
	NECR33PjvJ6y+DCBIXp20pwyklNYJY2xzIGhIAWFqeUbX2TYHcqAVl7Yz0ci186WFKqfr5+t4dn
	OoXYyQuX63j7YuH9rkjzHH4B0TFr3cgta9rVgE60f5mToQsFs8l9k5lWpeavwCT9SbC6crSsTcN
	+NwgUYfFbBlepAoqZe73SlFf91lu0FNz1xdgVVuWWASQ+yJqdLcu+9R5E3Oljo4KozVXTMpIwIk
	eHWwPdxGOtJcxwZXk+dN2KiwMBOO8Wi58vdS5fSdtA8sIMRbV9xEkxGPTqP6GBgjSvUYSqxWRQ=
X-Received: by 2002:a05:600c:4692:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49e619ad0e1mr133738765e9.11.1789162890753;
        Fri, 11 Sep 2026 14:41:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm181660695e9.0.2026.09.11.14.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:41:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose 00/38] Pull request (cover letter only)
Date: Fri, 11 Sep 2026 23:40:11 +0200
Message-ID: <cover.1789161249.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 21:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245667

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1788938908.git.yoann.congal@smile.fr/
... with some changes:
* rebased on to of the latest origin/wrynose
  "build-appliance-image: Update to wrynose head revisions"
* Added "u-boot: share CVE_PRODUCT with u-boot-tools" (needed for the
  u-boot-tools fixes)
* Removed "glibc: fix CVE-2026-19542": This will be fixed by the
  upcoming glibc upgrade.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4704
5 builds failed due to 16421 – AB-INT: SSL UNEXPECTED_EOF_WHILE_READING errors
The builds are fine now:
* oe-selftest-fedora https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4646
* qemuarm64 https://autobuilder.yoctoproject.org/valkyrie/?#/builders/36/builds/4628
* oe-selftest-debian https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4839
* oe-selftest-armhost https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/4874
* qemuarm https://autobuilder.yoctoproject.org/valkyrie/?#/builders/16/builds/4664
Note: this was with the glibc patch which I've now removed. I don't
think it's worth restarting a full build for an isolated removed patch.

The following changes since commit 9da814ca3685ada3fce46b8987f04ed3d57247b7:

  build-appliance-image: Update to wrynose head revisions (2026-09-09 09:07:10 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 883075157987ca300af59185b903d6d1977234c3:

  gawk: skip randtest in ptest suite (2026-09-10 14:53:48 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-33845

Ankur Tyagi (1):
  wpa-supplicant: patch CVE-2026-58374

Bruce Ashfield (4):
  linux-yocto/6.18: update to v6.18.41
  linux-yocto/6.18: update to v6.18.43
  linux-yocto/6.18: update to v6.18.44
  linux-yocto/6.18: update to v6.18.48

Daniel Turull (1):
  libarchive: mark CVE-2026-14164 as fixed-version

Darsh Kelaiya (1):
  python3-lxml: fix CVE-2026-41066

Devansh Patel (1):
  u-boot: share CVE_PRODUCT with u-boot-tools

Ghanshyam Banait (1):
  wget: fix CVE-2026-16599

Hetvi Thakar (7):
  python3-pip: Fix CVE-2026-13346
  u-boot-tools: Ignore CVE-2026-29007
  u-boot-tools: Ignore CVE-2026-29008
  u-boot-tools: Ignore CVE-2026-29009
  u-boot, u-boot-tools: Correct CVE-2026-46728 attribution for FIT fix
  wget: Fix CVE-2026-58470
  python3-pip: Fix CVE-2026-8643

Hiago De Franco (1):
  improve_kernel_cve_report: fix backported-patch check

Himani Ramesh Barde (1):
  gawk: skip randtest in ptest suite

Himanshu Jadon (1):
  grub: disable grub-protect for native builds

Hitendra Prajapati (6):
  vim: Fix for CVE-2026-73072
  vim: Fix for CVE-2026-73073
  vim: Fix for CVE-2026-73074
  vim: Fix for CVE-2026-73076
  vim: Fix for CVE-2026-73077
  vim: Fix for CVE-2026-73078

Jaipaul Cheernam (1):
  p11-kit: upgrade 0.26.4 -> 0.26.5

Peter Marko (4):
  openssl: upgrade 3.5.7 -> 3.5.8
  apr-util: upgrade 1.6.3 -> 1.6.5
  curl: patch CVE-2026-11352
  curl: patch CVE-2026-11586

Peter Tatrai (2):
  testimage: handle bootlog variants on failed qemu tests
  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk

Pratik Farkase (1):
  procps: ptest: skip flaky pgrep full process name match test

Vijay Anusuri (4):
  libxfont: Fix CVE-2026-56001
  libxfont: Fix CVE-2026-56002
  libxfont: Fix CVE-2026-56003
  perl: Fix CVE-2026-57433

 meta/classes-recipe/testimage.bbclass         |  27 +-
 meta/conf/distro/include/time64.inc           |  10 +
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 ...-2026-33243.patch => CVE-2026-46728.patch} |  11 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   2 +
 .../u-boot/u-boot-tools_2026.01.bb            |   8 +
 meta/recipes-bsp/u-boot/u-boot.inc            |   2 -
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |   4 +-
 .../{openssl_3.5.7.bb => openssl_3.5.8.bb}    |   2 +-
 .../wpa-supplicant/CVE-2026-58374-1.patch     |  52 +++
 .../wpa-supplicant/CVE-2026-58374-2.patch     |  47 +++
 .../wpa-supplicant/CVE-2026-58374-3.patch     |  55 +++
 .../wpa-supplicant/CVE-2026-58374-4.patch     |  46 +++
 .../wpa-supplicant/CVE-2026-58374-5.patch     |  47 +++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |   5 +
 .../perl/files/CVE-2026-57433.patch           |  32 ++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |   1 +
 .../python/python3-lxml/CVE-2026-41066.patch  | 349 ++++++++++++++++++
 .../python/python3-lxml_6.0.2.bb              |   4 +-
 .../python/python3-pip/CVE-2026-13346.patch   | 206 +++++++++++
 .../CVE-2026-8643-regression_p1.patch         |  35 ++
 .../CVE-2026-8643-regression_p2.patch         |  69 ++++
 .../python/python3-pip/CVE-2026-8643.patch    |  80 ++++
 .../python/python3-pip_26.0.1.bb              |   7 +-
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |   5 +-
 .../libarchive/libarchive_3.8.7.bb            |   4 +
 ...p-pgrep-full-process-name-match-test.patch |  39 ++
 meta/recipes-extended/procps/procps_4.0.6.bb  |   1 +
 .../wget/wget/CVE-2026-16599.patch            |  68 ++++
 .../wget/wget/CVE-2026-58470-regression.patch |  48 +++
 .../wget/wget/CVE-2026-58470.patch            |  79 ++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   3 +
 .../xorg-lib/libxfont/CVE-2026-56001.patch    |  87 +++++
 .../xorg-lib/libxfont/CVE-2026-56002.patch    | 150 ++++++++
 .../xorg-lib/libxfont/CVE-2026-56003.patch    | 114 ++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   5 +
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 ...le-function-prototype-warning-with-c.patch | 130 -------
 ...ion-Check-if-transform-is-supported-.patch |  37 --
 .../apr/apr-util/configfix.patch              |   4 +-
 .../{apr-util_1.6.3.bb => apr-util_1.6.5.bb}  |   4 +-
 .../curl/curl/CVE-2026-11352.patch            |  48 +++
 .../curl/curl/CVE-2026-11586.patch            | 203 ++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 .../gnutls/gnutls/CVE-2026-33845.patch        | 166 +++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 .../{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb}  |   2 +-
 .../vim/files/CVE-2026-73072.patch            |  64 ++++
 .../vim/files/CVE-2026-73073.patch            | 105 ++++++
 .../vim/files/CVE-2026-73074.patch            | 115 ++++++
 .../vim/files/CVE-2026-73076.patch            | 167 +++++++++
 .../vim/files/CVE-2026-73077.patch            | 105 ++++++
 .../vim/files/CVE-2026-73078.patch            |  94 +++++
 meta/recipes-support/vim/vim.inc              |   6 +
 scripts/contrib/improve_kernel_cve_report.py  |   4 +-
 57 files changed, 2792 insertions(+), 207 deletions(-)
 rename meta/recipes-bsp/u-boot/files/{CVE-2026-33243.patch => CVE-2026-46728.patch} (98%)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-1.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-2.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-3.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-4.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-5.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
 create mode 100644 meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-process-name-match-test.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-16599.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch
 rename meta/recipes-support/apr/{apr-util_1.6.3.bb => apr-util_1.6.5.bb} (93%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11352.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11586.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb} (97%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73078.patch


