Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F68CC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:04:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8991.1791968637475224511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wnEaefJQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48deeadb3fdso204998f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791968636; x=1792573436; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPJWF1qceoDxWiiLqhoBF5BmkFk++Wje+2MskT0/ujs=;
        b=wnEaefJQo3f5NJP0zuEE+CbRBSZZQLSzqfBNX/CaVTCB02RxnU0U7keTu4mO2YtBRT
         XscGL4f0I3jf2YxSiM2dzviXmyr+0lXhokvelUaVDH+bhekh8Ut1i4G0cxKJLLcPmDK8
         rVdNP3qr9jkCR2SpywtIQF3vb7Qtixx27Euhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968636; x=1792573436;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPJWF1qceoDxWiiLqhoBF5BmkFk++Wje+2MskT0/ujs=;
        b=NrwBIIoBhids2GTD6souZp348fGTrWFuZ64v0ziLRV5prJqOTUHQ/8e+SOiohMuSxY
         Q/WbL1aYIdh6OteodpPc0IjGvLEIoXlsaPww1R9cJVL84yLImo0aRqbQu+Av8q7pZ9Tv
         2VOuif2Mdb4WvuJa6SqPIqrmSoMLbYhZqWT19p0e+Q40LE6PbWPsXlWeuFD/Rfv6FPyq
         PEfhAnzy8t/KaPMGnAzbmsUk+oYs+jdc32+cnKU+MRA+3cfBnccc619O2B5WrO+XhxJz
         zUO6gENIAMkHMmKWqBXP99AghsjLF1i3JyIvWTmUyLXC+vjAGikUvQaHsgXktexQUQNZ
         nMSA==
X-Gm-Message-State: AFq9FYIHvrAW6LvwaCG3DOn6aRWPXwg5VfV87L9VjHhiKMhSOoYs1NcE
	svpYAR+gWK//44aoErbEtH3wlZN73DuZigNtLPHf2xli9vCEh6GdZN0ik6WdNVKWBwoMhxuOYmO
	TGrCYmLk=
X-Gm-Gg: AYBFou16mivILrOu1nPmy8vjdDh+5EdPfA7HBsARYASG3KZUJooeKYZmiZtwQHC1tY2
	SeltCMFw1xO2gyrbhVnkJTU5gVS/zOucLiN7GhNgGOtcDBwi0iVAQ44rFBBesgRPfXpONRCSSag
	cUm8HAqTeSCUp/zwBAHN0DXQdYYeVljMecRyvqIq3O+O2inpbmPrh3ABmpxUrW8gFt9WL9hrco7
	UcCO5lxUb96eMSl7nJDMBnwObYIH5cQy//d1/dQGIKnmsh07QYT+Dx+jfBkioU+/0P/lWJ1AOD7
	ymp0R+KcXyk4wT498VKOG0SXhc1oRgzvkh3ZVvkolnANiCi8cgogr4/ny73G8My/Jj3uM6JYeua
	WyFRLwvV0K2/OSeUteZXmVheAJ/aWrG7GL5NXBFskUPzbuKmIL7tyDn6dp4boCiu11AggxmWIN2
	1HJw49Wgoq7K5CoJcBSX+gp9w/bWV2IxrB4MN7poJRry9Lat9TLN3+q9AQD3a9IKwUOWR19vPQs
	Ov5ExlvakDD0juKQ9X81AtfJi+vC+JFJM0Y3DpRmCcRGcR7jqp+MsLEs4XPmlKwKE/u5LYTajKr
	7F/IYsXTgLt2YlB3
X-Received: by 2002:a5d:6f08:0:b0:48d:bae5:41c with SMTP id ffacd0b85a97d-48dbae50634mr29089069f8f.17.1791968633958;
        Wed, 14 Oct 2026 02:03:53 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72c7e36sm5131592f8f.37.2026.10.14.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:03:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/51] Pull request (cover letter only)
Date: Wed, 14 Oct 2026 11:03:49 +0200
Message-ID: <cover.1791968405.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247750

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1791707817.git.yoann.congal@smile.fr/
with the following changes:
* "libpng: upgrade 1.6.58 -> 1.6.59" held until the equivalent merge on
  blacksail
* libpcre2 series dropped per Peter's request.
  https://lore.kernel.org/all/AS8PR10MB507316F31E025A7F7EEC2533FD902@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4920
* qemuarm64-armhost failed with disk space issues (now fixed)
   rebuild in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/8/builds/4855
* oe-selftest-armhost failed with #16450 – AB-INT: gopkg.in connectivity issues
  rebuild in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/5086
* oe-selftest-debian failed with #16236 – AB-INT: test_list_pkg_files: ResourceWarning: unclosed transport
  rebuild in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5058

The following changes since commit 0f03c732a0a2d0506b41b1abe60b3f368b2300dc:

  build-appliance-image: Update to wrynose head revisions (2026-09-30 11:06:32 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 636e5d3b12d54951c13d57346648bc29a0e6b24e:

  wget: fix CVE-2026-15146 (2026-10-12 17:35:35 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  tzcode/tzdata: fix upstream version check

Babanpreet Singh (2):
  devtool: standard: fix update-recipe/finish --initial-rev override
  oeqa/selftest/devtool: cover update-recipe --initial-rev

Bhavesh R Maheshwari (2):
  ffmpeg: Fix for CVE-2026-66036
  ffmpeg: Fix for CVE-2026-66041

Darsh Kelaiya (1):
  python3-click: depend on python3-shell for shlex

Deepesh Varatharajan (1):
  glibc: stable 2.43 branch updates to 9cda6fc96ab

Frieder Schrempf (1):
  weston: fix VNC backend build with aml 1.0

Ghanshyam Banait (1):
  wget: fix CVE-2026-15146

Harish Sadineni (2):
  glibc: stable 2.43 branch updates to 562cd7badd
  qemuriscv.inc: default to fw_dynamic.elf as QEMU BIOS

Hetvi Thakar (5):
  openssh: fix CVE-2026-73283
  openssh: fix CVE-2026-73282
  openssh: fix CVE-2026-73281
  vim: set CVE_STATUS for CVE-2026-51400
  vim: set CVE_STATUS for CVE-2026-51401

Jaipaul Cheernam (1):
  bind: upgrade 9.20.26 -> 9.20.27

Jakub Szczudlo (Nokia) (5):
  gnutls: fix CVE-2026-42012
  gnutls: fix CVE-2026-42013
  gnutls: fix CVE-2026-42014
  gnutls: fix CVE-2026-42015
  gnutls: fix CVE-2026-5260

Lucas Stach (1):
  barebox: upgrade 2026.04.0 -> 2026.04.2

Peter Marko (23):
  glibc: set status for CVE-2011-0536 and CVE-2025-0577
  gnutls: set status for CVE-2023-0361
  libarchive: set status for CVE-2026-4424
  nfs-utils: set status for CVE-2025-12801
  openssl: set status for CVE-2015-3216
  ovmf: set status of CVE-2017-5731 and CVE-2019-14584
  ppp: set status for CVE-2020-15704
  pulseaudio: set status for CVE-2020-15710 and CVE-2020-16123
  graphene: set status for CVE-2026-81281
  openssh: set status for CVE-2026-55655
  openssh: set status for CVE-2026-55654
  xserver-xorg: set status for CVE-2026-55999 and CVE-2026-56000
  openssl: upgrade 3.5.8 -> 3.5.9
  glibc: set status for CVE-2026-86805 and CVE-2026-95818
  libpng: upgrade 1.6.56 -> 1.6.58
  util-linux(-uuid): upgrade 2.41.5 -> 2.41.6
  libsolv: patch CVE-2026-48863
  expat: patch CVE-2026-66046 and CVE-2026-76641
  expat: patch CVE-2026-76956
  expat: patch CVE-2026-76957
  expat: patch CVE-2026-93990
  alsa-lib: patch CVE-2026-90781
  go: upgrade 1.26.8 -> 1.26.9

Peter Tatrai (1):
  systemd: fix mDNS hostname changes

Richard Purdie (1):
  bind: upgrade 9.20.27 -> 9.20.29

Ross Burton (2):
  gstreamer: skip test_queue:test_leaky_downstream test as it's flakey
  libaio: update SRC_URI

Vijay Anusuri (1):
  tzdata/tzcode-native: upgrade 2026c -> 2026d

 meta/conf/machine/include/riscv/qemuriscv.inc |   5 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  22 +
 meta/recipes-bsp/barebox/barebox-common.inc   |   4 +-
 ...1-avoid-start-failure-with-bind-user.patch |   2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch |   2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |   2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |   2 +-
 .../bind/{bind_9.20.26.bb => bind_9.20.29.bb} |   2 +-
 .../nfs-utils/nfs-utils_2.8.7.bb              |   2 +
 .../openssh/openssh/CVE-2026-73281.patch      |  80 +++
 .../openssh/openssh/CVE-2026-73282.patch      |  80 +++
 .../openssh/openssh/CVE-2026-73283.patch      |  42 ++
 .../openssh/openssh_10.3p1.bb                 |   5 +
 .../{openssl_3.5.8.bb => openssl_3.5.9.bb}    |   4 +-
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |   1 +
 .../expat/expat/CVE-2026-66046-01.patch       | 107 ++++
 .../expat/expat/CVE-2026-66046-02.patch       |  90 +++
 .../expat/expat/CVE-2026-76641.patch          | 160 ++++++
 .../expat/expat/CVE-2026-76956.patch          |  26 +
 .../expat/expat/CVE-2026-76957-01.patch       | 121 ++++
 .../expat/expat/CVE-2026-76957-02.patch       |  85 +++
 .../expat/expat/CVE-2026-93990-01.patch       | 191 +++++++
 .../expat/expat/CVE-2026-93990-02.patch       | 328 +++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   8 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.43.bb         |   5 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 ...use-traffic-from-the-local-host-only.patch |  61 +++
 meta/recipes-core/systemd/systemd_259.5.bb    |   1 +
 ...2.41.5.bb => util-linux-libuuid_2.41.6.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   5 +-
 ...sing-fileutils.h-include-to-hook_idm.patch |  38 ++
 .../util-linux/CVE-2026-78408.patch           |  75 +++
 .../util-linux/CVE-2026-78410.patch           | 115 ++++
 ...l-linux_2.41.5.bb => util-linux_2.41.6.bb} |   0
 .../go/{go-1.26.8.inc => go-1.26.9.inc}       |   2 +-
 ...e_1.26.8.bb => go-binary-native_1.26.9.bb} |   6 +-
 ..._1.26.8.bb => go-cross-canadian_1.26.9.bb} |   0
 ...{go-cross_1.26.8.bb => go-cross_1.26.9.bb} |   0
 ...osssdk_1.26.8.bb => go-crosssdk_1.26.9.bb} |   0
 ...runtime_1.26.8.bb => go-runtime_1.26.9.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |   8 +-
 ...3-ld-add-soname-to-shareable-objects.patch |   6 +-
 ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
 ...ut-build-specific-paths-from-linker-.patch |   4 +-
 .../go/{go_1.26.8.bb => go_1.26.9.bb}         |   0
 .../python/python3-click_8.3.3.bb             |   1 +
 .../recipes-extended/libaio/libaio_0.3.113.bb |   2 +-
 .../libarchive/libarchive_3.8.7.bb            |   1 +
 .../libsolv/libsolv/CVE-2026-48863.patch      |  25 +
 .../libsolv/libsolv_0.7.36.bb                 |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   8 +-
 .../wget/wget/CVE-2026-15146.patch            | 126 +++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   1 +
 .../graphene/graphene_1.10.8.bb               |   1 +
 .../weston/0001-backend-vnc-Use-aml-v1.patch  |  24 +
 .../recipes-graphics/wayland/weston_15.0.0.bb |   3 +-
 .../xorg-xserver/xserver-xorg.inc             |   2 +
 .../alsa/alsa-lib/CVE-2026-90781.patch        |  41 ++
 .../alsa/alsa-lib_1.2.15.3.bb                 |   1 +
 .../ffmpeg/ffmpeg/CVE-2026-66036_p1.patch     | 120 ++++
 .../ffmpeg/ffmpeg/CVE-2026-66036_p2.patch     |  71 +++
 .../ffmpeg/ffmpeg/CVE-2026-66041.patch        |  60 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   3 +
 .../gstreamer/gstreamer1.0/run-ptest          |   3 +
 .../libpng/files/CVE-2026-34757_p1.patch      | 518 ------------------
 .../libpng/files/CVE-2026-34757_p2.patch      | 481 ----------------
 .../{libpng_1.6.56.bb => libpng_1.6.58.bb}    |   7 +-
 .../pulseaudio/pulseaudio.inc                 |   2 +
 .../gnutls/gnutls/CVE-2026-42012-pre1.patch   |  69 +++
 .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 161 ++++++
 .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++
 .../gnutls/gnutls/CVE-2026-42013-pre1.patch   |  56 ++
 .../gnutls/gnutls/CVE-2026-42013.patch        |  74 +++
 .../gnutls/gnutls/CVE-2026-42014.patch        |  60 ++
 .../gnutls/gnutls/CVE-2026-42015.patch        |  43 ++
 .../gnutls/gnutls/CVE-2026-5260_p1.patch      |  69 +++
 .../gnutls/gnutls/CVE-2026-5260_p2.patch      |  33 ++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  10 +
 meta/recipes-support/vim/vim.inc              |   3 +
 scripts/lib/devtool/standard.py               |   4 +
 84 files changed, 2805 insertions(+), 1040 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb => bind_9.20.29.bb} (97%)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.8.bb => openssl_3.5.9.bb} (98%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-66046-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-66046-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76641.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76956.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76957-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76957-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-93990-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-93990-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-resolve-refuse-traffic-from-the-local-host-only.patch
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.5.bb => util-linux-libuuid_2.41.6.bb} (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idm.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78410.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.5.bb => util-linux_2.41.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-1.26.8.inc => go-1.26.9.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.8.bb => go-binary-native_1.26.9.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.8.bb => go-cross-canadian_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.8.bb => go-cross_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.8.bb => go-crosssdk_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.8.bb => go-runtime_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.8.bb => go_1.26.9.bb} (100%)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-15146.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p2.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
 delete mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42013-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42013.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch


