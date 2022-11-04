Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE51C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:27 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.7176.1667530878658974221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cmSGI4sV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id q1so3288334pgl.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rrLkzZzopuf6vr9ZhqQKigD4R8QVV5bRmxRo+G3TCo=;
        b=cmSGI4sVNdHYiDzkVJhOKgYMomx9H3HnOxWlNA8XcQVBYLHhsjIU7P+iQMzH1cn+yA
         6O90/pALJO9mdjQhk5/Dp7lCLl+PBvfEjGK2q78DGI3JwOqbWbfz/BCGNJb5U7OeJ8YF
         6sSNrvUtb2arp9HGjhsCPxJ96T0Yh7vLUFOF7SeweLxTxWXJMTVg5QiW+obI04FZXFM0
         dwil+geIch6S59/vSSWjETUNo4SDTw3Pni8ZbWXNZ1xBJ5xcDXypTPPn2PmcZkNgwdRe
         mOH9QHpO/8sY6dKZ7fc3YfZAgYiH9XkogUYRMJwFxVBm5dzgWNBNYltcGUMcMLxWJW4w
         xQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rrLkzZzopuf6vr9ZhqQKigD4R8QVV5bRmxRo+G3TCo=;
        b=FgUlzy8k09SIWjb1z6oJpoVAUH/8edGvgnTYZwEQ5gvG4Tm4IHWBBi4wb/MbbvLjkm
         4OyRbSISSmnywL0o34v0OkFpz+v2I2QgJpmKOx/W8t/CNVEjabyc2PziKK8v06OJqFHq
         bRkc5d+up9YK7VSsoQMrywiGPLta2XPT7K/Enj89fe93Xlb87rhYlr1r57l5wTUYikWi
         HfgQkTodIkBgh+5FGTeJ1usLO47Xqo5rwgLTfp1C2a49GJ5nWhlDBT72wYNgbW711cHv
         /2OHKyxRLrOKAZA2pq+kIF6SZnzT/TBF61oNl7yk94Zfgw2VowY3a1xScnC+0DSPYepu
         FJ4g==
X-Gm-Message-State: ACrzQf2ufCzG8CYlbeuhK/gKum9dzgjXY2iEXg3IvRz21RL40RSOVplw
	AkrZ54xolXi/3H28HzmFFPYHuWlYNjNH0X2E
X-Google-Smtp-Source: AMsMyM4embNavIM49XiFf6ei6tWHBAy+6+dDPeKUx5wuBDUUXGWiheJCWjgc/oNHhPexOqPPy/OC7Q==
X-Received: by 2002:a05:6a00:1a0f:b0:56e:32a2:abcf with SMTP id g15-20020a056a001a0f00b0056e32a2abcfmr8432140pfv.35.1667530877378;
        Thu, 03 Nov 2022 20:01:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/31] Patch review
Date: Thu,  3 Nov 2022 17:00:35 -1000
Message-Id: <cover.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172661

Please review this set of patches for kirkstone and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4416

The following changes since commit fbdf93f43ff4b876487e1f26752598ec8abcb46e:

  build-appliance-image: Update to kirkstone head revision (2022-10-29 16:32:59 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  u-boot: Remove duplicate inherit of cml1

Bartosz Golaszewski (1):
  bluez5: add dbus to RDEPENDS

Bernhard Rosenkränzer (1):
  cmake-native: Fix host tool contamination (Bug: 14951)

Chen Qi (1):
  openssl: export necessary env vars in SDK

Ed Tanous (1):
  openssl: Upgrade 3.0.5 -> 3.0.7

Frank de Brabander (1):
  cve-update-db-native: add timeout to urlopen() calls

Hitendra Prajapati (1):
  openssl: CVE-2022-3358 Using a Custom Cipher with NID_undef may lead
    to NULL encryption

Jan-Simon Moeller (1):
  buildtools-tarball: export certificates to python and curl

Jeremy Puhlman (1):
  qemu-native: Add PACKAGECONFIG option for jack

Joshua Watt (2):
  runqemu: Do not perturb script environment
  runqemu: Fix gl-es argument from causing other arguments to be ignored

Keiya Nobuta (1):
  gnutls: Unified package names to lower-case

Khem Raj (1):
  perf: Depend on native setuptools3

Liam Beguin (1):
  meson: make wrapper options sub-command specific

Mark Hatle (1):
  insane.bbclass: Allow hashlib version that only accepts on parameter

Narpat Mali (1):
  wayland: fix CVE-2021-3782

Richard Purdie (1):
  openssl: Fix SSL_CERT_FILE to match ca-certs location

Ross Burton (7):
  lighttpd: fix CVE-2022-41556
  expat: backport the fix for CVE-2022-43680
  scripts/oe-check-sstate: cleanup
  scripts/oe-check-sstate: force build to run for all targets,
    specifically populate_sysroot
  opkg-utils: use a git clone, not a dynamic snapshot
  oe/packagemanager/rpm: don't leak file objects
  glib-2.0: fix rare GFileInfo test case failure

Teoh Jay Shen (1):
  vim: Upgrade 9.0.0598 -> 9.0.0614

Thomas Perrot (1):
  psplash: add psplash-default in rdepends

Tim Orling (1):
  vim: upgrade 9.0.0614 -> 9.0.0820

Vyacheslav Yurkov (1):
  overlayfs: Allow not used mount points

Xiangyu Chen (1):
  ltp: backport clock_gettime04 fix from upstream

Zheng Qiu (1):
  tiff: fix CVE-2022-2953

wangmy (1):
  ifupdown: upgrade 0.8.37 -> 0.8.39

 meta/classes/insane.bbclass                   |   5 +-
 meta/classes/overlayfs.bbclass                |   6 +-
 meta/lib/oe/overlayfs.py                      |   6 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |  33 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../openssl/files/environment.d-openssl.sh    |   4 +
 .../{openssl_3.0.5.bb => openssl_3.0.7.bb}    |   2 +-
 .../expat/expat/CVE-2022-43680.patch          |  33 +
 meta/recipes-core/expat/expat_2.4.9.bb        |   1 +
 ...-info-don-t-assume-million-in-one-ev.patch |  51 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   1 +
 ...{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} |   2 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +
 .../recipes-core/meta/cve-update-db-native.bb |   9 +-
 meta/recipes-core/psplash/psplash_git.bb      |   2 +-
 .../cmake/cmake-native_3.22.3.bb              |   1 +
 .../meson/meson/meson-wrapper                 |  21 +-
 .../opkg-utils/opkg-utils_0.5.0.bb            |   6 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../lighttpd/lighttpd/CVE-2022-41556.patch    |  31 +
 .../lighttpd/lighttpd_1.4.66.bb               |   1 +
 ...set-threshold-based-on-the-clock-res.patch |  89 +++
 meta/recipes-extended/ltp/ltp_20220121.bb     |   1 +
 .../wayland/wayland/CVE-2021-3782.patch       | 111 ++++
 .../wayland/wayland_1.20.0.bb                 |   2 +
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 ...ue-330-and-some-more-from-320-to-349.patch | 609 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-2953.patch          |  87 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/oe-check-sstate                       |   8 +-
 scripts/runqemu                               |  28 +-
 34 files changed, 1115 insertions(+), 51 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.5.bb => openssl_3.0.7.bb} (99%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} (97%)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-clock_gettime04-set-threshold-based-on-the-clock-res.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland/CVE-2021-3782.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch

-- 
2.25.1


