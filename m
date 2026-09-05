Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F2AC79F8B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:13 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2572.1788641106029172348
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=liN+5eem;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48436216a98so1433486f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641104; x=1789245904; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mJvWxblBzPfP2L/iU62fYicqHyHD4X/dnwuAqhmPvY=;
        b=liN+5eemVMlSInUn4RSJaqstW5tAq2M38+2ZeVFlZFLOeM/ix+AySJWlKzbU2MZ9H1
         cq7VxaqIH20QuE4bxm2KLuGHdWQqo1UgVaeisYaz7nW0plG89Y3Wmi92PoKfgAGSfk0L
         fwr6NladsJ6cMVtRJEPffgJPFe9pphyXEIMf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641104; x=1789245904;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mJvWxblBzPfP2L/iU62fYicqHyHD4X/dnwuAqhmPvY=;
        b=gSYojOcriv9oZty4Plb3Ii3ysqEahrxQiSGa9F0czvaXgo/+U739JFC/h37aVvLMiB
         dW7SX3/cUKylndkkFZ8xqmtbekZXRcKBn8rT2ERmtrxNx76UQwKBBS4Nnh68DpOTdIY7
         z3rBbw5YUm7DqU074fcNyFvuDeZ/PetaxEht8FZXFUBrAC7AbqS4d7DdgYyX+a/LHi0v
         ESD0TnMOnmHbZ773YS68y1SzKiO3nWi9W/T4BkMjUQRNQ1cNBUbiegQXKu/6NVnhW2DU
         XkwXG3KTtGLNbbCi0pD+jMT1o2WJJpuIfG+g4AyVl486BYkZYJ7wgEtHqs8dL3EGHUlh
         jGXQ==
X-Gm-Message-State: AFuF++ma6wmUS2eAWqRsULo1b0LTvCdX+jwu7HLOTLwhuwFT5cvQ4CF6
	e2HUvJMa7LdC4p8OMWDEY0ofAsSaYX+K1JGnncAnh2kqIlwiTsR1i5WBL62uvgZ01Pg72PnS9XD
	mmcMrqUs=
X-Gm-Gg: AYBFou3lxWgHavwpjJsgej9sKO4pd7ev3ptrKOJqRCKXJrH8JqsW0c1bwfHJ2HvoIbJ
	NgsqdvpY2Pp09iay/zBbfNFKS16kOlpNHQOw5YJgOH7ewo+JL1vy7UQ7BHsgn1vFhwguC+oSN78
	vWvjehW6Cs16bLK0ThUSjJB/Dw/fhlLvTQ6VYzBex2gv29LWd6UvEoVSsS7aAfK8rNDMsFImVku
	c/42+Uj8XiKJRutj3wkPF8smuQ4UrVpDJEmOmLjXRltyPRyPohvm8u1YskoYy101e2tNlH+BZge
	jZGt3w9T7RZrF3Qr+b03C7dhPYPkfUgNl8kq2c8uYZCIlABq4io7gvhqPsmj1h4cPCNKCE1PmBh
	gda2BdFUf9CmA9HqmF75Fmo4i9H2BosmgO8zLlEvapx9QJ9MzUW2lWF5o1khTfJDi+RPsAL6Rp9
	W+WKtaLJXmsSQBJwx1PDkLiCjTP/6OoslktbaYRnCOVU3CgKpuMjyDbcBItRM+P0N901NS50UH8
	aXWXuyDsyl3B7a1CPB3Scn7B1kkFlfvXILCZJWYPiKrFv/83iIipGPTlVtyIJ0CEg==
X-Received: by 2002:a05:6000:2508:b0:485:9879:a45c with SMTP id ffacd0b85a97d-4859879a4ebmr9309f8f.53.1788641103981;
        Sat, 05 Sep 2026 13:45:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/40] Patch review
Date: Sat,  5 Sep 2026 22:44:01 +0200
Message-ID: <cover.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245152

Hello,

This is a series dedicated to unblock a number of patches on scarthgap.

Please review this set of changes for wrynose and have comments back by
end of day Tuesday, September 8.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4666
Some builds failed due to failed access to our infrastructure (Michael
Halstead is looking into it)
* "Compare AB workers and SANITY_TESTED_DISTROS" failed but succeeded in
  a previous run (with no change related to this)
* qemuarm64-armhost retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/8/builds/4608
* qemux86 retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/30/builds/4563
* qemuarmv5 retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/80/builds/4409
* oe-selftest-armhost: Bitbake Selftest failed but that particular
    bitbake commit succeeded in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/4798

The following changes since commit 00c66f1d38a234f7738c2eb8fafa41b4f057a865:

  pseudo: 1.9.10 -> 1.9.11 (2026-08-28 17:24:32 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 31def396136be047e10c507a50264aad52ba6b0f:

  scripts/install-buildtools: Update to 6.0.3 (2026-09-04 16:21:55 +0200)

----------------------------------------------------------------

Abhishek Bachiphale (1):
  perl: fix CVE-2026-42496 and CVE-2026-42497

Darsh Kelaiya (4):
  python3-git: fix CVE-2026-42284
  python3-git: fix CVE-2026-42215
  python3-git: fix CVE-2026-44243
  python3-git: fix CVE-2026-44244

Deepak Rathore (2):
  python3-cryptography: backport stray file install fix
  qemu: guard RESOLVE_CACHED strace flag

Devansh Patel (1):
  apt: mark CVE-2011-3374 as fixed-version

Esa Jaaskela (1):
  volatile-binds: order systemd-timesyncd after /var/lib

Hetvi Thakar (2):
  python3-idna: Fix CVE-2026-45409
  libssh2: Fix CVE-2026-58051

Jaipaul Cheernam (3):
  expat: set CVE_STATUS for CVE-2026-72522
  util-linux: Fix CVE-2026-3184
  python3: upgrade 3.14.6 -> 3.14.7

Jakub Szczudlo (Nokia) (2):
  gnutls: fix for CVE-2026-42011
  gnutls: fix CVE-2026-42010

Peter Marko (5):
  alsa-lib: patch CVE-2026-56109
  libevent: set status for CVE-2026-63380
  go: upgrade 1.26.5 -> 1.26.6
  util-linux: set status for CVE-2026-13595
  go: upgrade 1.26.6 -> 1.26.7

Richard Purdie (2):
  python3-mako: upgrade 1.3.10 -> 1.3.12
  python3-click: upgrade 8.3.1 -> 8.3.3

Ross Burton (1):
  libevent: upgrade 2.1.12 -> 2.1.13

Sowmya Sathram (1):
  binutils: stable 2.46 branch updates

Tafil Avdyli (2):
  python3: add missing pyc files to core
  python3: fix stringold cache files

Tim Orling (9):
  python3-babel: fix CVE_PRODUCT
  python3-pycryptodome: fix CVE_PRODUCT
  python3-dbusmock: fix CVE_PRODUCT
  python3-wheel: fix CVE_PRODUCT
  python3-click: fix CVE_PRODUCT
  python3-attrs: fix CVE_PRODUCT
  python3-numpy: fix CVE_PRODUCT
  python3-pycryptodomex: fix CVE_PRODUCT
  python3-git: fix CVE_PRODUCT

Vijay Anusuri (3):
  libxfont2: Fix CVE-2026-56001
  libxfont2: Fix CVE-2026-56002
  libxfont2: Fix CVE-2026-56003

Yoann Congal (1):
  scripts/install-buildtools: Update to 6.0.3

 meta/recipes-core/expat/expat_2.7.5.bb        |   3 +
 meta/recipes-core/util-linux/util-linux.inc   |   3 +
 .../util-linux/util-linux/CVE-2026-3184.patch |  61 ++++++++
 .../volatile-binds/volatile-binds.bb          |   9 +-
 meta/recipes-devtools/apt/apt_3.0.3.bb        |   3 +
 .../binutils/binutils-2.46.inc                |   2 +-
 .../go/{go-1.26.5.inc => go-1.26.7.inc}       |   2 +-
 ...e_1.26.5.bb => go-binary-native_1.26.7.bb} |   6 +-
 ..._1.26.5.bb => go-cross-canadian_1.26.7.bb} |   0
 ...{go-cross_1.26.5.bb => go-cross_1.26.7.bb} |   0
 ...osssdk_1.26.5.bb => go-crosssdk_1.26.7.bb} |   0
 ...runtime_1.26.5.bb => go-runtime_1.26.7.bb} |   0
 .../go/{go_1.26.5.bb => go_1.26.7.bb}         |   0
 .../perl/files/CVE-2026-42496.patch           |  99 ++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |   1 +
 .../python/python3-attrs_25.4.0.bb            |   2 +
 .../python/python3-babel_2.18.0.bb            |   2 +
 ...-click_8.3.1.bb => python3-click_8.3.3.bb} |   4 +-
 .../python/python3-cryptography.bb            |   1 +
 ...lling-stray-files-into-site-packages.patch |  55 +++++++
 .../python/python3-dbusmock_0.38.1.bb         |   2 +
 .../python3-git/CVE-2026-42215_p1.patch       |  60 ++++++++
 .../python3-git/CVE-2026-42215_p2.patch       |  45 ++++++
 .../python/python3-git/CVE-2026-42284.patch   |  36 +++++
 .../python3-git/CVE-2026-44243_p1.patch       | 134 +++++++++++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  83 +++++++++++
 .../python3-git/CVE-2026-44244_p1.patch       | 102 +++++++++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  28 ++++
 .../python/python3-git_3.1.43.bb              |  10 ++
 .../python3-idna/CVE-2026-45409_p1.patch      |  75 ++++++++++
 .../python3-idna/CVE-2026-45409_p2.patch      |  48 ++++++
 .../python3-idna/CVE-2026-45409_p3.patch      |  72 +++++++++
 .../python/python3-idna_3.11.bb               |   4 +
 ...-mako_1.3.10.bb => python3-mako_1.3.12.bb} |   2 +-
 .../python/python3-numpy_2.4.3.bb             |   2 +
 .../python/python3-pycryptodome_3.23.0.bb     |   1 +
 .../python/python3-pycryptodomex_3.23.0.bb    |   2 +
 .../python/python3-wheel_0.46.3.bb            |   2 +
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   4 +-
 ...-use-prefix-value-from-build-configu.patch |   7 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   9 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   4 +-
 .../0001-prefer-valid-entrypoints.patch       |   2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 .../python/python3/CVE-2026-11940.patch       |  67 ---------
 .../python/python3/CVE-2026-11972.patch       |  61 --------
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/python3-manifest.json      |  11 +-
 .../python/python3/valid-dists.patch          |   2 +-
 .../{python3_3.14.6.bb => python3_3.14.7.bb}  |   7 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...-if-RESOLVE_CACHED-flag-is-defined-b.patch |  38 +++++
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   |  75 ++++++++++
 .../xorg-lib/libxfont2/CVE-2026-56002.patch   | 138 +++++++++++++++++
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |   5 +
 .../alsa/alsa-lib/CVE-2026-56109.patch        |  33 ++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |   1 +
 .../gnutls/gnutls/CVE-2026-42010.patch        |  41 +++++
 .../gnutls/gnutls/CVE-2026-42011_p1.patch     |  43 ++++++
 .../gnutls/gnutls/CVE-2026-42011_p2.patch     | 141 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   3 +
 ....c-patch-out-tests-that-require-a-wo.patch |   8 +-
 ...ncrease-default-timeval-tolerance-50.patch |  10 +-
 ...-monotonic_prc_fallback-as-retriable.patch |  11 +-
 ...ts-are-marked-failed-only-when-all-a.patch |   9 +-
 .../libevent/Makefile-missing-test-dir.patch  |  14 +-
 ...{libevent_2.1.12.bb => libevent_2.1.13.bb} |   4 +-
 .../libssh2/libssh2/CVE-2026-58051.patch      |  34 +++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 scripts/install-buildtools                    |   4 +-
 73 files changed, 1679 insertions(+), 206 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
 rename meta/recipes-devtools/go/{go-1.26.5.inc => go-1.26.7.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.5.bb => go-binary-native_1.26.7.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.5.bb => go-cross-canadian_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.5.bb => go-cross_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.5.bb => go-crosssdk_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.5.bb => go-runtime_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.5.bb => go_1.26.7.bb} (100%)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb} (87%)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb} (88%)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 rename meta/recipes-devtools/python/{python3_3.14.6.bb => python3_3.14.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch
 rename meta/recipes-support/libevent/{libevent_2.1.12.bb => libevent_2.1.13.bb} (92%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch


