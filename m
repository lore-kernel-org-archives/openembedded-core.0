Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87867C79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:29:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6415.1788938993101473931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lnpvXeaP;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso80324105e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938991; x=1789543791; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fli0XgIQG3e1onTOcQnsvRxFcAkVQcbQLDWEonnGUPM=;
        b=lnpvXeaP+ApgXF3t8qMcAvL7G6OJjZLnejXmi/o7VbKueq3LH59Qe21rX1scNMcJXu
         JKvMoOEyAUeYWBKQTQ7A0fCDf2oaeA5q6CI44s720WXOnLNJxR5jF6O6DVCL1idOJw6W
         Q6u+GMikUA/DBIa82Bp87SFY7Csl4h5ZiO/FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938991; x=1789543791;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fli0XgIQG3e1onTOcQnsvRxFcAkVQcbQLDWEonnGUPM=;
        b=cPqc8tIx2e6qh0LyDJbXIvlMDFS4bVZZujwNaI0eW1P+VmFWlcD3RpvQ67eLi75O+h
         rPRz958QD5y260dy4gNeNR7wYP+yjVsFFPbfOzUaDvERafi7FczqjRfEj7zEyEKzzMWc
         dbrESRAN3sh/LQHU373s9A0jChqvN7vPq9WHjFXMOYTSWepsWwqyWdapTdi5bi86R6J5
         Zorj9JS6Amc71wAjDVb5CKf5eQfEaAId1Ox/+uGnNDZeSHVLxly2f+SyoJoLv05xRwzd
         AuTO1W0JhGSpqIkKwLQxpkos7sPiV4Sbe3G0YgTBXE8ranDbnkI0brv+Li/x0LKWXnoC
         j8JQ==
X-Gm-Message-State: AFuF++lgDcCLTFdPUn18EBgpqiaIJFROySw1OnGx+9gVyVz14lm4zgEA
	QATwoTHKIHu7KLwexytYizo5q+ilIAg5biFmKogT+f4gHvNHl2GBltF6kA4RI5ODa4NiIRV7vra
	Z4wl1Oy0=
X-Gm-Gg: AYBFou2dBnQ9OX+m5sBFXF9pqnB4teXixdqbED1qMEBKPr4UmKtl5BZUbCSNzj7D1Ek
	l1L8MOewolLpFsgWpwNe0ugGxIp/Mhts+zjvABmFn4Y6k7x55WGzrGTl+rXBM5cr/7elB+jAqT0
	GzbjMw+cN0hBrO6TYPMdY9agNJzFChG0xD4lC4cuKp45KdPckdTKuR/Bwh/Sjx6+WDU2B1dTWxJ
	q8q/HXiIb49/CejW1T7NYcGlcJ/mS1q1yzE/F6WDpbLPK1YxJST3i5eJ+OhfaAB/AkwaoaWaIJx
	n/0RU7UBbl/h+OS7Z/PwdfdmQFiHiG4sfIt66F/dT23LTa8C6FXptgNSWjhveaqhRMydEaR3+iL
	uxE6A48n8cOxv3iHw/T9EhDxBKVo/YWbRXmOqh0iTA/CMrVtIn7X5EsNArTfJjFFjXOQtv2558L
	Grs8+kyb8leBDPW+EOH7de62Fd4t6B3MkF8CZ/yQmE4TO/uiVr2+Moh2xD6nVAkrsjiahIYg/sK
	J9y7MdB7ALliKv7++CtWfCdVQ4cLKaz96JAEvd5GpyM8Olegb0yZimk2HYiHr+MKKR/aCLbze0=
X-Received: by 2002:a05:6000:41ed:b0:485:8ef9:325f with SMTP id ffacd0b85a97d-4858ef93304mr30164895f8f.42.1788938991002;
        Wed, 09 Sep 2026 00:29:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/38] Patch review
Date: Wed,  9 Sep 2026 09:28:59 +0200
Message-ID: <cover.1788938908.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245409

Please review this set of changes for wrynose and have comments back by
end of day Friday, September 11.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4697

The following changes since commit 31def396136be047e10c507a50264aad52ba6b0f:

  scripts/install-buildtools: Update to 6.0.3 (2026-09-04 16:21:55 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 4ce10a99a44924dd629fbd79268207b145ccfc62:

  gawk: skip randtest in ptest suite (2026-09-09 00:58:52 +0200)

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

Ghanshyam Banait (1):
  wget: fix CVE-2026-16599

Harish Sadineni (1):
  glibc: fix CVE-2026-19542

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
 .../u-boot/u-boot-tools_2026.01.bb            |   8 +
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |   4 +-
 .../{openssl_3.5.7.bb => openssl_3.5.8.bb}    |   2 +-
 .../wpa-supplicant/CVE-2026-58374-1.patch     |  52 +++
 .../wpa-supplicant/CVE-2026-58374-2.patch     |  47 +++
 .../wpa-supplicant/CVE-2026-58374-3.patch     |  55 +++
 .../wpa-supplicant/CVE-2026-58374-4.patch     |  46 +++
 .../wpa-supplicant/CVE-2026-58374-5.patch     |  47 +++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |   5 +
 .../glibc/glibc/0023-CVE-2026-19542.patch     |  98 +++++
 meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
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
 57 files changed, 2889 insertions(+), 205 deletions(-)
 rename meta/recipes-bsp/u-boot/files/{CVE-2026-33243.patch => CVE-2026-46728.patch} (98%)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-1.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-2.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-3.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-4.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2026-58374-5.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
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


