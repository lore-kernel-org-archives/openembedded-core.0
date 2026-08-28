Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB97C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3031.1787945883535802584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q2+7acUK;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8687630fso9064215e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945881; x=1788550681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrMDQqAKgBDpGQNXRtmZuTYgISxcM3f+Kl/zvN49f2Y=;
        b=Q2+7acUKTx4iQwyYE5a8+HeJgZsdl6ps9rBU2NQx8uKt1wiRmOjddUOFnUJ2T+s/+i
         z7KyM2U5aHQN5mWbozPHxvgBPjtShCpmVJeCDCl3rLA/HqCAlFbe0ntXmL7tLyBnkunY
         tzwEO2ZRanKwrlFuURKryMb20Ej/RX5gli47s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945881; x=1788550681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CrMDQqAKgBDpGQNXRtmZuTYgISxcM3f+Kl/zvN49f2Y=;
        b=eYoeKHtl6uw601Df8Wv6j7ZTwSPU4AtwnxQlzQScYOthVYrkE45UPHpseGi1MXtI4X
         X4Yh3Dzvc8cRYZ3lcjTkUDAAigLzxG0U4LP9847jZzg4FgivYD3xGgaKjXjhGlIUSZhz
         cEaB5OVVuLXeP387i6fc51p7jifFQ10CDWajpmXjjCq/YeLVIPKkx1B48kV1hcdyeXNJ
         iQnBAAb6AT/2/Vdc2robdxVG3RwOoUb5xUtlBKy4fenNot5oR42rA4k681f+iBfMaPp6
         AHV+TC48DC9+7TJqNCokxQpO688to4HrCuKlAe1ahs0e9EkU8gwuZWdxoZt310iZJXUk
         cXoA==
X-Gm-Message-State: AFuF++kDjZmgeuUPtyEIGnqqvmqidcUVUUq3cFSQ7prDhaTr8QE8LiJV
	YuUqovgad4zYNLK45Q1xyhKEw7b7ajqrYGwyjPLYXmUCeUmE4g3M/Tf58B1uuDVrp+VxX2HEpLf
	qC1HDFPA=
X-Gm-Gg: AR+sD10EbnsgJKCcteWttSlJQz5rGuWDaUcp+w3D3Wg9Qd72P2jvRbovoc2KB9oCiXD
	26xnYUkdE8Xj2eB/lHZTEC8/psstHLQKdYmcl/gbsMVw9xZ4bIeP+1X35pDdjz3BpnE9/hzFiVb
	NHAckaTtxxZJX15QDfz2mTIPVMQvsi5W9izVWMQsZH4FELR1oY2Xv3V1h2SK31dsqszla8eTOWE
	MVH1G6/K/CPILg9JqLopJG+kMModQyNhOG60a3y7UcnTR62S8LKJB+vdkKFjUElGC8VhLnNS90e
	jQkfW2jd4HB0FZBWcJp2iNmI7a6zeddmGSQbiJauPn2ApE5+hXOVcg8Qf/49oiK6wPSFXa/I9+p
	mDKePzkDrr+2OOGd4c8KDCNijlW5s4rO08reEdwXnkHf5pg1Oewf9CPGzM0OFjkDnWef+eoGq+V
	xR63URca7x/7enKKoh86WCnKt2E1nPXoeBUVc1sdpdMkX0jfG3G2puPlzd5LLEZzjMYgYOW5dmR
	NTDfzT8YfHmeksVm6BxbMcDCQgnBKqesXZo0/b+GnZ7+pwZXPfm/2uE+Gs887KNDAxv9RrgFAg=
X-Received: by 2002:a05:600c:4445:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49b91c2e150mr144014405e9.2.1787945881233;
        Fri, 28 Aug 2026 12:38:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/56] Patch review
Date: Fri, 28 Aug 2026 21:35:10 +0200
Message-ID: <cover.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244561

This is the first part of the patches pending fro wrynose. I think there
will be one or two review cycles before returning to a more usual rhythm.

Please review this set of changes for wrynose and have comments back by
end of day Tuesday, September 1.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4604

The following changes since commit f7397af248e1e338929d70a910b0fbc2341528ec:

  mirrors: Disable YP mirrors on autobuilder (2026-08-21 18:06:46 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

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


