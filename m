Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144DEE77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.18208.1735998367728012221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wJKcXfYF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21a1e6fd923so147583165ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998367; x=1736603167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJff0iMmHB3R/P6SQZuTT8iUbPv/wh6nRxqXpD5xs2c=;
        b=wJKcXfYFdMwIjnsqmxKwW18GXdMqkDorY4EGN0CFpaMNPs21xaQqRSMwdrQ0zzV3oH
         P7R3dZJEkEEHkHZI+tpUnnr9FYzD1zffNn5GPkwz2uckfelq8JauGUI2ZdIZH5HCFj5l
         Z+NU8EMfzhF+khMvM8eChf3MfusuKBqkDo4Ow9YX28fKqGBVgz2D0IxgBjCb8DCYKGmb
         CIqigMDWWZG0bD1dSd3geFOYJAvf1dYQsIr786Y1ii5NEHyKsWuQWAzWQKHmLm9YvV2E
         fDYu4Z3947NgioFSBUYpcX8HqTmYeRH4IiPrMujTEDgCg4KLKbj2gjxcZ8Qxt04VjsL+
         IOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998367; x=1736603167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJff0iMmHB3R/P6SQZuTT8iUbPv/wh6nRxqXpD5xs2c=;
        b=AztUwBiGvwC/GRz4Zf/ViIVpDL0/YXAbpuhjvslxQp6bQ8I8s910CA04fXO12vZWhp
         gxq4IpvD0Bgbsz8jllcrwQRmcQ2g73TpBQjsqo/YQIplBDrnsdv/biH97FW6uw6Tab8j
         /tzjtWDv9YXxBzlVqI0PcgXapXhfsbzyMBL4cCNlzYME40qARM6RlCCCpa0qtXylGf1D
         YAOGW/3RopOs7OhQO/hVSOiRMBXR2iQVQAe86oOQtVdSzMnBCg8OI1CsVDwB+Ejo0uZU
         mtFh6zSpy2evKnDdYcZYUWU7JC5wpCRxbM8ONw0SZEgxsTuLroSblZCy40ek4iYvD65K
         5eWQ==
X-Gm-Message-State: AOJu0YxheuScNCpXLV76dqG5cHUERR57D+NY8JD39qoXUc5ktFv9Evpz
	lqhtivx9X35ZjCq+9BlF9oRvON6XGB6Uk5devwcR8zifZ2koSmMKOie/7bEDcEA6q5n5x1Avt1d
	w
X-Gm-Gg: ASbGnctwX8/h/M8ou7u6x2MWCmmkpUbQ3IszbDSMmuUMZPvfEoW7YzfK0SFEgXydgy/
	u9WRppA7uDHNjqoUDFIprp1mpO1/U9C5sWBmGrFW2W7x/6sZvLUVO6K5A1tL7bX8d8FPPGnHxCm
	gJWM7L1XUL9U28NtbmN1TlaQb1pX9w08PBq+vG0C2UwvayIw9sRSG+OinApkOFfgYsjuta+nomS
	IdzSZ/TxodpnYdMS0fIBlHM7/3LQSSFyj8RR7o66hTe8A==
X-Google-Smtp-Source: AGHT+IE8rGA1mdyUPilPgNG9Yjr2cbo0+rlWejGlvmugFqPC3LDVXitnBE9gJBd36uIRJvXGHn1rfQ==
X-Received: by 2002:a17:90b:51c6:b0:2ee:ab10:c187 with SMTP id 98e67ed59e1d1-2f452e49393mr74988402a91.18.1735998366930;
        Sat, 04 Jan 2025 05:46:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/10] Patch review
Date: Sat,  4 Jan 2025 05:45:52 -0800
Message-ID: <cover.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209395

Please review this set of changes for styhead and have comments back by
end of day Tuesday, January 7

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/735

The following changes since commit 6e517366cda4c22547ed097ee58126f7dfc56a57:

  cve-update-nvd2-native: Tweak to work better with NFS DL_DIR (2024-12-18 06:35:02 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Alexander Kanavin (1):
  gstreamer1.0: upgrade 1.24.6 -> 1.24.9

Antonin Godard (1):
  buildtools-docs-tarball: Add rsvg so we can handle svg files in docs

Guðni Már Gilbert (2):
  python3: upgrade 3.12.6 -> 3.12.7
  python3: upgrade 3.12.7 -> 3.12.8

Mark Hatle (1):
  populate_sdk_ext: write_local_conf add shutil import

Ross Burton (2):
  gstreamer1.0-libav: explicitly disable documentation
  gstreamer1.0: run ptests in parallel

Sunil Dora (1):
  gcc: Fix c++: tweak for Wrange-loop-construct

Wang Mingyu (1):
  gstreamer1.0: upgrade 1.24.9 -> 1.24.10

Yash Shinde (1):
  binutils: Fix CVE-2024-53589

 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +
 .../meta/buildtools-docs-tarball.bb           |   1 +
 .../binutils/binutils-2.43.1.inc              |   1 +
 .../binutils/0015-CVE-2024-53589.patch        |  92 ++++++++++++++
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ++++++++++++++++++
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   3 +-
 ...-use-prefix-value-from-build-configu.patch |   5 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   6 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  16 +--
 ...est_sysconfig-for-posix_user-purelib.patch |   7 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   9 +-
 ...asename-to-replace-CC-for-checking-c.patch |  20 +--
 ..._fileno-test-due-to-load-variability.patch |   6 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   5 +-
 ...ctive_children-skip-problematic-test.patch |   9 +-
 ...pes.test_find-skip-without-tools-sdk.patch |   5 +-
 ...-test_deadlock-skip-problematic-test.patch |   9 +-
 ...le.py-correct-the-test-output-format.patch |   7 +-
 ...t_readline-skip-limited-history-test.patch |  14 +--
 ...-test_shutdown-skip-problematic-test.patch |  11 +-
 ...orlines-skip-due-to-load-variability.patch |   5 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |   6 +-
 .../python/python3/cgi_py.patch               |   3 +-
 .../python/python3/crosspythonpath.patch      |   5 +-
 .../python3/deterministic_imports.patch       |   5 +-
 .../python/python3/makerace.patch             |   6 +-
 .../{python3_3.12.6.bb => python3_3.12.8.bb}  |   2 +-
 ...ct-has-a-different-signature-on-musl.patch |   2 +-
 ...ools_1.24.6.bb => gst-devtools_1.24.10.bb} |   2 +-
 ....24.6.bb => gstreamer1.0-libav_1.24.10.bb} |   3 +-
 ...ialized-warnings-when-compiling-with.patch |   2 +-
 ...-avoid-including-sys-poll.h-directly.patch |   2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |   2 +-
 ...bb => gstreamer1.0-plugins-bad_1.24.10.bb} |   2 +-
 ...et-caps-from-src-pad-when-query-caps.patch |   2 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |   2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |   2 +-
 ...b => gstreamer1.0-plugins-base_1.24.10.bb} |   2 +-
 ...b => gstreamer1.0-plugins-good_1.24.10.bb} |   2 +-
 ...b => gstreamer1.0-plugins-ugly_1.24.10.bb} |   2 +-
 ...24.6.bb => gstreamer1.0-python_1.24.10.bb} |   2 +-
 ...bb => gstreamer1.0-rtsp-server_1.24.10.bb} |   2 +-
 ...-required-lines-accidentally-removed.patch |  33 +++++
 ....24.6.bb => gstreamer1.0-vaapi_1.24.10.bb} |   6 +-
 ...spect-the-idententaion-used-in-meson.patch |   2 +-
 ...ts-add-support-for-install-the-tests.patch |   4 +-
 ...s-use-a-dictionaries-for-environment.patch |   2 +-
 ...er-script-to-run-the-installed_tests.patch |   4 +-
 .../gstreamer/gstreamer1.0/run-ptest          |   2 +-
 ...r1.0_1.24.6.bb => gstreamer1.0_1.24.10.bb} |   2 +-
 52 files changed, 346 insertions(+), 121 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
 rename meta/recipes-devtools/python/{python3_3.12.6.bb => python3_3.12.8.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.6.bb => gst-devtools_1.24.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.6.bb => gstreamer1.0-libav_1.24.10.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.6.bb => gstreamer1.0-plugins-bad_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.6.bb => gstreamer1.0-plugins-base_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.6.bb => gstreamer1.0-plugins-good_1.24.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.6.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.6.bb => gstreamer1.0-rtsp-server_1.24.10.bb} (90%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.10.bb} (97%)

-- 
2.43.0


