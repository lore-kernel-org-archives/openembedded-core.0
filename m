Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD02C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:33:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5743.1788327217171998424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CfmCnkje;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f9309813so627605f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788327215; x=1788932015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYwqFAvZggOqGzTWeIO8Osbdx6L8pBcK2cxD1oBWBV4=;
        b=CfmCnkjeon+fzhFxrP+6BeGGIJxWyx0venND6NAIpfFvgQXyLhBMe9KH0rTO082hsd
         f6nT+SgIoYuDyBWz5pFbAchhdwZHdxvZLfLA/e9kQDcwb6ZwSi0hE0dV1AFjmsmnYaJ5
         pLc5+Vk4wFCR7Gwh1HWw7wNZ3aRZVUbxA3PdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327215; x=1788932015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYwqFAvZggOqGzTWeIO8Osbdx6L8pBcK2cxD1oBWBV4=;
        b=NHHwbarI6rOcjIpTdC2EAHGdGuwLoCHM7uK9yqULGKBpVznlPLr1JDWSRkbm8EWsoC
         xLSWEgMbAnxZDTAaeGCdNBHzCPp2XNW8LPyZoVxHGIAXGIbitCwP+wTpkZ5MSaiP8/Uc
         6k1sGXDHVJnAUJkDIRGOCwmmXH7+/zuHv8CCWLASfVFsqk7elt5vCV0TD5zAs++n/789
         8hQMj0yBpBc2UbqPhS7xz/ri2MFrZdjspe5G1QlHUePGez+oRhI2Wyg/yAw6+t6gL96d
         x4kahdOukYlOsm4cVz5deqfTRBfqqKQgZQRLoFzDyyYAmg16wn4TRJAv6Y85mV4AuPED
         c+iQ==
X-Gm-Message-State: AFuF++lu87ewzBzK7hDZjyI8xXHzXFVcifep8yqaeTxVfBpjPS7TVrOV
	cwrowOHdMkNDafXz3sunbhL6FoTd7PJaBV7XFLIjMssqKxFGjVVeyMw9yBPQi+KK4xeEVBBsIiv
	dkbSOU7w=
X-Gm-Gg: AYBFou3bRZwLiJ8ozPGwS/vEMuT//0JEDJvfEilT23DIl67KUgPO5mCPMsxYZP70lHv
	n7My5dXCMHcvQIBfoX+vrbGDYcA5NS+cspuJxR2Y0JBMraiWjSMmzyZS25Wi2iFrl4Pz6HCb3mg
	eMtx/mh7ylqOb89w85+pzsg1mpqkIXBNjDlW8SjuaMBEelUekkBg8cKYH0dcVcgr8SXCUaEnVV2
	F7fienwyqrxHIPrJ+IvZkFY3VTZ3z/ir/4nJ1unsf0m4PrlkVg8OJ++KYub4lD+3sdagHxR6nPL
	5UytQM44d8kJUsVcywtgXkuvC6K1vsuXWegjDpe0/PJtua1dfWQymF/uzocC+yJL0J0JNeDv5XW
	pZwaXw52wCvKMKBl73p0E6NrJ+CvKn9KBdXTpZJ/e6U3VKz2PGiHv/ydFU13iBXQff6/MmbBWJr
	G9W+XfCxHMhl4y2KWkCaHlZAsOfNqPzswjo2XYBm5vGSeNii1KxW9vfXQnU0fND4sGuB85wApUj
	ZObck70dpNxl2+fUmEA+fKDF31Z
X-Received: by 2002:a05:6000:1449:b0:47f:8ac0:ccb4 with SMTP id ffacd0b85a97d-48488f07b9cmr3706980f8f.10.1788327215240;
        Tue, 01 Sep 2026 22:33:35 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm3948710f8f.24.2026.09.01.22.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:33:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose 00/56] Pull request (cover letter only)
Date: Wed,  2 Sep 2026 07:33:18 +0200
Message-ID: <cover.1788327061.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244886

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1787945536.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4604

The following changes since commit f7397af248e1e338929d70a910b0fbc2341528ec:

  mirrors: Disable YP mirrors on autobuilder (2026-08-21 18:06:46 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 00c66f1d38a234f7738c2eb8fafa41b4f057a865:

  pseudo: 1.9.10 -> 1.9.11 (2026-08-28 17:24:32 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  glibc: stable 2.43 branch updates

Alexander Kanavin (2):
  gstreamer1.0: disable an intermittently failing test
  gstreamer1.0: upgrade 1.28.2 -> 1.28.4 (the remaining pieces)

Bhavesh R Maheshwari (10):
  vim: Fix for CVE-2026-55693
  vim: Fix for CVE-2026-55895
  vim: Fix for CVE-2026-57451
  vim: Fix for CVE-2026-57453
  vim: Fix for CVE-2026-57454
  vim: Fix for CVE-2026-57455
  vim: Fix for CVE-2026-57456
  vim: Fix for CVE-2026-59856
  vim: Fix for CVE-2026-59857
  vim: Fix for CVE-2026-59858

Bruce Ashfield (1):
  kern-tools: bump SRCREV for conditional 'depends on X if Y' support

Deepak Rathore (6):
  curl: fix CVE-2026-8286
  curl: set CVE_STATUS for CVE-2026-8924
  curl: fix CVE-2026-8927
  curl: fix CVE-2026-8932
  curl: set CVE_STATUS for CVE-2026-9547
  curl: set CVE_STATUS for CVE-2026-12064

Hetvi Thakar (5):
  wget: Fix CVE-2026-58469
  wget: Fix CVE-2026-58471
  wget: Fix CVE-2026-58472
  patch: Fix CVE-2026-56289
  patch: Fix CVE-2026-56288

Jaipaul Cheernam (2):
  perl: fix CVE-2026-13221
  perl: fix CVE-2026-57432

Leonid Iziumtsev (1):
  coreutils: fix CVE-2026-56391

Peter Marko (10):
  openssh: set status for CVE-2026-55653
  connman: remove connection_manager from CVE_PRODUCTS
  gstreamer1.0*: upgrade 1.28.4 -> 1.28.5
  ffmpeg: upgrade 8.0.1 -> 8.0.3
  ffmpeg: set status for CVE-2026-8461 and CVE-2026-40962
  libsoup: patch CVE-2026-4271
  diffutils: patch CVE-2026-53910
  p11-kit: set status for CVE-2026-13757
  libxml2: set status for CVE-2026-6732
  python3-cryptography(-vectors): upgrade 46.0.5 -> 46.0.7

Richard Purdie (15):
  gst-devtools: upgrade 1.28.2 -> 1.28.4
  gstreamer1.0-libav: upgrade 1.28.2 -> 1.28.4
  gstreamer1.0-python: upgrade 1.28.2 -> 1.28.4
  gstreamer1.0: upgrade 1.28.2 -> 1.28.4
  xserver-xorg: upgrade 21.1.22 -> 21.1.23
  xserver-xorg: upgrade 21.1.23 -> 21.1.24
  ruby: upgrade 4.0.2 -> 4.0.3
  ruby: upgrade 4.0.3 -> 4.0.5
  xwayland: upgrade 24.1.11 -> 24.1.12
  xwayland: upgrade 24.1.12 -> 24.1.13
  p11-kit: upgrade 0.26.2 -> 0.26.4
  libxml2: upgrade 2.15.2 -> 2.15.3
  pseudo: Add in openat2, exec and linkat fixes
  pseudo: Update to 1.9.10
  pseudo: 1.9.10 -> 1.9.11

Sudhir Dumbhare (1):
  binutils: fix CVE-2026-3441 and CVE-2026-3442

Tim Orling (1):
  python3-pyasn1: upgrade 0.6.3 -> 0.6.4

Wang Mingyu (1):
  python3-pyasn1: upgrade 0.6.2 -> 0.6.3

 .../connman/connman_2.0.bb                    |    2 -
 .../openssh/openssh_10.3p1.bb                 |    1 +
 .../coreutils/coreutils/CVE-2026-56391.patch  |   66 +
 meta/recipes-core/coreutils/coreutils_9.10.bb |    1 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 meta/recipes-core/glibc/glibc_2.43.bb         |    1 +
 ...-installation-directories-in-libxml2.patch |   12 +-
 .../libxml/libxml2/install-tests.patch        |    9 +-
 .../{libxml2_2.15.2.bb => libxml2_2.15.3.bb}  |    3 +-
 .../binutils/binutils-2.46.inc                |    1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         |   51 +
 meta/recipes-devtools/patch/patch.inc         |    6 +-
 .../patch/patch/CVE-2026-56288.patch          |   75 ++
 .../patch/patch/CVE-2026-56289.patch          |   36 +
 .../perl/files/CVE-2026-13221.patch           |   75 ++
 .../perl/files/CVE-2026-57432-01.patch        |   52 +
 .../perl/files/CVE-2026-57432-02.patch        |   34 +
 meta/recipes-devtools/perl/perl_5.42.0.bb     |    3 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    4 +-
 .../python/python3-cryptography-common.inc    |    2 +-
 .../python/python3-cryptography-vectors.bb    |    2 +-
 .../python/python3-cryptography.bb            |    2 +-
 ...yasn1_0.6.2.bb => python3-pyasn1_0.6.4.bb} |    2 +-
 ...save-the-original-name-and-timestamp.patch |    5 +-
 ...x-cross-compilation-of-external-gems.patch |    6 +-
 ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch |    4 +-
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch |    6 +-
 ...doc-build-reproducible-documentation.patch |   15 +-
 ...-list-of-object-files-in-generated-M.patch |    6 +-
 ...eproducible-change-fixing-784225-too.patch |    6 +-
 .../0006-Make-gemspecs-reproducible.patch     |   13 +-
 ..._rm_r_no_permissions-test-under-root.patch |    4 +-
 .../ruby/{ruby_4.0.2.bb => ruby_4.0.5.bb}     |    2 +-
 .../diffutils/CVE-2026-53910-01.patch         |   67 +
 .../diffutils/CVE-2026-53910-02.patch         |   35 +
 .../diffutils/diffutils_3.12.bb               |    9 +
 .../wget/CVE-2026-58469-regression_p1.patch   |   39 +
 .../wget/CVE-2026-58469-regression_p2.patch   |   26 +
 .../wget/wget/CVE-2026-58469.patch            |   53 +
 .../wget/wget/CVE-2026-58471.patch            |   71 +
 .../wget/wget/CVE-2026-58472-regression.patch |  233 ++++
 .../wget/wget/CVE-2026-58472.patch            |   74 ++
 meta/recipes-extended/wget/wget_1.25.0.bb     |    6 +
 ...-Intel-ddx-only-for-pre-gen4-hardwar.patch |    2 +-
 ...org_21.1.22.bb => xserver-xorg_21.1.24.bb} |    2 +-
 ...wayland_24.1.11.bb => xwayland_24.1.13.bb} |    2 +-
 .../kern-tools/kern-tools-native_git.bb       |    2 +-
 .../{ffmpeg_8.0.1.bb => ffmpeg_8.0.3.bb}      |    4 +-
 ...ct-has-a-different-signature-on-musl.patch |    2 +-
 ...tools_1.28.2.bb => gst-devtools_1.28.5.bb} |    2 +-
 ...001-Make-player-examples-installable.patch |   21 +-
 ...mples_1.28.2.bb => gst-examples_1.28.5.bb} |    2 +-
 ...1.28.2.bb => gstreamer1.0-libav_1.28.5.bb} |    2 +-
 ...ialized-warnings-when-compiling-with.patch |    4 +-
 ...-avoid-including-sys-poll.h-directly.patch |    2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |    4 +-
 ...added-buffers-in-wl_shm-buffer-creat.patch |    5 +-
 ....bb => gstreamer1.0-plugins-bad_1.28.5.bb} |    2 +-
 ...et-caps-from-src-pad-when-query-caps.patch |    6 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |    2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |    2 +-
 ...bb => gstreamer1.0-plugins-base_1.28.5.bb} |    2 +-
 ...bb => gstreamer1.0-plugins-good_1.28.5.bb} |    2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.28.5.bb} |    2 +-
 ....28.2.bb => gstreamer1.0-python_1.28.5.bb} |    2 +-
 ....bb => gstreamer1.0-rtsp-server_1.28.5.bb} |    2 +-
 ...spect-the-idententaion-used-in-meson.patch |    2 +-
 ...ts-add-support-for-install-the-tests.patch |    6 +-
 ...s-use-a-dictionaries-for-environment.patch |    2 +-
 ...er-script-to-run-the-installed_tests.patch |    2 +-
 .../gstreamer/gstreamer1.0/run-ptest          |    4 +
 ...er1.0_1.28.2.bb => gstreamer1.0_1.28.5.bb} |    4 +-
 .../curl/curl/CVE-2026-8286.patch             |   81 ++
 .../curl/curl/CVE-2026-8927.patch             |  349 +++++
 .../curl/curl/CVE-2026-8932-dependent.patch   |   71 +
 .../curl/curl/CVE-2026-8932.patch             | 1148 +++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |    7 +
 .../libsoup/libsoup/CVE-2026-4271.patch       |  362 ++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |    1 +
 .../{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb}  |    3 +-
 .../vim/files/CVE-2026-55693.patch            |  103 ++
 .../vim/files/CVE-2026-55895.patch            |  106 ++
 .../vim/files/CVE-2026-57451.patch            |  192 +++
 .../vim/files/CVE-2026-57453.patch            |  269 ++++
 .../vim/files/CVE-2026-57454.patch            |  203 +++
 .../vim/files/CVE-2026-57455.patch            |   87 ++
 .../vim/files/CVE-2026-57456.patch            |  164 +++
 .../vim/files/CVE-2026-59856.patch            |  118 ++
 .../vim/files/CVE-2026-59857.patch            |  125 ++
 .../vim/files/CVE-2026-59858.patch            |  149 +++
 meta/recipes-support/vim/vim.inc              |   10 +
 91 files changed, 4659 insertions(+), 109 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb} (95%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.4.bb} (83%)
 rename meta/recipes-devtools/ruby/{ruby_4.0.2.bb => ruby_4.0.5.bb} (98%)
 create mode 100644 meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-01.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils/CVE-2026-53910-02.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.24.bb} (92%)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.11.bb => xwayland_24.1.13.bb} (96%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.0.1.bb => ffmpeg_8.0.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.2.bb => gst-devtools_1.28.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.2.bb => gst-examples_1.28.5.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.2.bb => gstreamer1.0-plugins-bad_1.28.5.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.2.bb => gstreamer1.0-plugins-base_1.28.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.2.bb => gstreamer1.0-plugins-good_1.28.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.2.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.2.bb => gstreamer1.0-rtsp-server_1.28.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.5.bb} (93%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb} (95%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57451.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57453.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57454.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch


