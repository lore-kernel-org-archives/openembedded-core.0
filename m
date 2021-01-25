Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.306.1611586294650635293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z1zxaU84;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id t29so8499085pfg.11
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gB6NoaZzm43Jc2rgh7JLq1mOJuD66F39xqbo9TP7L3A=;
        b=z1zxaU84PPjpCGhrBTZW3iYQv9p+6ogNctl4ZZiEkl6omURbL+0zRrAsZWaWFnDnxM
         jF/TeP3takez7YAnozfbwKX1vh5V8RQh8j40QKo47nVmSJHyR0uFSrXxU4TJwKGk/hu0
         CSGpDVmNJ4IcBaYdzFmJeUv9iI2TqLZ7sYvwYWi83c1gvkG69POezwnqKsdSePecd1S2
         Z4lDNJ/4cFeTPaNR24RIL1S12vLM9zlJUNsNSQdG1bmQJWX4/dYdG67rjCrplS1LH27u
         i1gBpuM45XCvfS/42Vu00T2Ulr2QeX0PbUE1mN/G8ez+ucc7zlPOqPkf+17Dp1hs+bkL
         2xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gB6NoaZzm43Jc2rgh7JLq1mOJuD66F39xqbo9TP7L3A=;
        b=TNxKHfG2HNpXEpolSbqtHF0VZj31UUlxE+fBHKAlvw+gGuT8inV7NjyTHWoyGhtNw0
         wuO+CfFQCYuYVpnHvUfSN7cIw9aD2MA9mMbnK673l7eK0rzNjiGQty/0cXy+dGiDLZYr
         U9fu/xVN93cdiPo8vgpHmCPfRe61bHv7aeOI9Dh4EZTT8wz8wBQbTFMfPt71RyFu4Bs3
         5B+EDl6g/FKfimnpnXBtWaMoUPjIwTRGuJWuHBRvuTYsB9st5UlvKDMQASdkD0sp31y3
         nSSZbQdB7WhBm1XZH0BnY0zwpxIyybWrcPaVx8ilVpbmtfrOH76gMVBrG+0cnYkxHyCT
         fBoA==
X-Gm-Message-State: AOAM5333ul+xph7FehXgnmSpSeWq7Iqlxr/o2ExY6/Q7i21W7uR+XQ/k
	CrIA4lbgNQEFU20dcYptxeM/X0eMT3QnHD3ddLg=
X-Google-Smtp-Source: ABdhPJyM9wb43n55k4IrzVBP162OX76sTcZRXnvBV1mTfQIfNLywi9ilRAM8aJdwnUpJa+7pSz6lDQ==
X-Received: by 2002:a63:2902:: with SMTP id p2mr980112pgp.274.1611586293359;
        Mon, 25 Jan 2021 06:51:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/47] Patch review - pseudo file mode corruption fix V2
Date: Mon, 25 Jan 2021 04:50:32 -1000
Message-Id: <cover.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Issues with undetected file mode corruption in pseudo have been identified.

Fixes have been merged into master and gatesgarth over the past several months and
things seem to have stabilized enough that we can consider backporting these fixes
to dunfell.

This is a somewhat more invasive change than normal. Specifically the user will
be required to clean TMPDIR after this merge. It may also expose issues with
other layers, though master and gategarth have probably helped to pave the way for
this change.

Personally I think that this fixes a serious enough issue that we should consider
this series for dunfell.

This second version includes the wic patches which have been the gating item for
merging this series.

Note also that there is an associated bitbake patch for stable/1.46:

lib/bb/utils.py: Do not preserve TERM in the environment

This is due to taking:

bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST

which was needed to do clean cherry-picks of the pseudo changes.

Let me know if you think this is an issue, or if you are aware of any other pseudo
issues which would necessitate delaying the merge of this series.

Please have comments back by Wednesday evening.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1779

The following changes since commit 897822233faef0f8f35dc1d8a39e1c4bc0550f1e:

  ppp: Whitelist CVE-2020-15704 (2021-01-19 04:22:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jack Mitchell (1):
  distutils3: allow setup.py to be run from a different directory to
    ${S}

Jacob Kroon (1):
  bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST

Joe Slater (1):
  pseudo: fix renaming to self

Martin Jansa (2):
  base.bbclass: use os.path.normpath instead of just comparing WORKDIR
    and S as strings
  license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to
    PSEUDO_IGNORE_PATHS

Mingli Yu (2):
  tcl: adapt to potential pseudo changes
  bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database

Paul Barker (8):
  bitbake.conf: Prevent pyc file generation in pseudo context
  wic: Add workdir argument
  wic: Allow exec_native_cmd to run HOSTTOOLS
  wic: Ensure internal workdir is not reused
  image_types_wic: Move wic working directory
  wic: Update pseudo db when excluding content from rootfs
  wic: Copy rootfs dir if fstab needs updating
  wic: Optimise fstab modification for ext2/3/4 and msdos partitions

Peter Kjellerstedt (4):
  pseudo: Simplify pseudo_client_ignore_path_chroot()
  lib/oe/path: Add canonicalize()
  bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
  wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS

Ricardo Ribalda Delgado (4):
  wic: Fix permissions when using exclude or include path
  wic: Fix multi images .wks with bitbake
  wic: Avoid creating invalid pseudo directory
  wic: Add --change-directory argument

Richard Purdie (23):
  pseudo: Switch to oe-core branch in git repo
  pseudo: merge in fixes for setfacl issue
  pseudo: Update to add OFC fcntl lock updates
  pseudo: Ignore mismatched inodes from the db
  pseudo: Add support for ignoring paths from the pseudo DB
  pseudo: Abort on mismatch patch
  psuedo: Add tracking of linked files for fds
  pseudo: Fix xattr segfault
  pseudo: Add may unlink patch
  pseudo: Add pathfix patch
  base/bitbake.conf: Enable pseudo path filtering
  wic: Handle new PSEUDO_IGNORE_PATHS variable
  pseudo: Fix statx function usage
  bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
  abi_version,sanity: Tell users TMPDIR must be clean after pseudo
    changes
  pseudo: Update to account for patches merged on branch
  pseudo: Upgrade to include mkostemp64 wrapper
  oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
  uninative: Don't use single sstate for pseudo-native
  pseudo: Drop patches merged into upstream branch
  bitbake.conf: Add /run/ to PSEUDO_IGNORE_PATHS
  pseudo: Add lchmod wrapper
  pseudo: Update for arm host and memleak fixes/cleanup

Tomasz Dziendzielski (1):
  pseudo: Update to print PSEUDO_LOGFILE in abort message on path
    mismatches

 meta-selftest/lib/pseudo_pyc_test1.py         |   1 +
 meta-selftest/lib/pseudo_pyc_test2.py         |   1 +
 .../pseudo-pyc-test/pseudo-pyc-test.bb        |  15 ++
 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/base.bbclass                     |   6 +
 meta/classes/distutils3.bbclass               |  10 +-
 meta/classes/image_types_wic.bbclass          |  20 ++-
 meta/classes/license.bbclass                  |   1 +
 meta/classes/populate_sdk_base.bbclass        |   2 +
 meta/classes/sanity.bbclass                   |   3 +
 meta/classes/sstate.bbclass                   |   4 +
 meta/conf/abi_version.conf                    |   2 +-
 meta/conf/bitbake.conf                        |  13 +-
 meta/lib/oe/path.py                           |  21 +++
 meta/lib/oe/sstatesig.py                      |   4 +-
 meta/lib/oeqa/selftest/cases/pseudo.py        |  27 ++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   1 +
 .../pseudo/files/0001-Add-statx.patch         | 106 --------------
 ...001-maketables-wrappers-use-Python-3.patch |  34 -----
 ...ixup-remove-files-that-do-not-exist-.patch |  49 -------
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  |  31 ----
 ...1-realpath.c-Remove-trailing-slashes.patch |  57 --------
 ...xattr-adjust-for-attr-2.4.48-release.patch |  48 ------
 .../pseudo/files/moreretries.patch            |  19 ---
 .../pseudo/files/seccomp.patch                | 137 ------------------
 .../pseudo/files/toomanyfiles.patch           |  71 ---------
 .../pseudo/files/xattr_version.patch          |  54 -------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  14 +-
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
 scripts/lib/wic/help.py                       |   6 +
 scripts/lib/wic/ksparser.py                   |   1 +
 scripts/lib/wic/misc.py                       |   7 +-
 scripts/lib/wic/partition.py                  |  66 ++++++---
 scripts/lib/wic/plugins/imager/direct.py      |  48 +++---
 scripts/lib/wic/plugins/source/rootfs.py      |  85 +++++++++--
 scripts/postinst-intercepts/update_font_cache |   2 +
 scripts/wic                                   |   2 +
 37 files changed, 281 insertions(+), 690 deletions(-)
 create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py
 create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py
 create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch

-- 
2.25.1

