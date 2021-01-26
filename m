Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.12962.1611672132117938761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0txR8mRH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id o16so1939622pgg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDi6eUrNlnVZtuxtDumSv62C5gm1/KCiYktwnNe1u58=;
        b=0txR8mRHsapTMg8zQtj4o2bQz4L+dRzGtrZQfB5FWAuFUl313394RnKS19uLAKtLfs
         UE826rSv+fSIeUyC04Neu+N95r8MXwt21K3oe7R5xx3FaYRKGXMTdJJ9QYXB9ajTTZ52
         SeF7kbhqTauh/n3cgFwLAJhXomEe5aVa/6OWgekGwc26jMomXRf+enALfbce9xl3kLMy
         nSkFtIfJ3EG5Vv2AsYlcyAOrBag3ehWdC+N6Zg9FJ8GSClvC/cECdAubtXoRRglwkMem
         JngTmL6ZDxhsw9dl86ksSUGiuYsEEMMVunOL+qdnfLlsAxSdhI6ES6uAB5qivjdo6mgA
         7SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDi6eUrNlnVZtuxtDumSv62C5gm1/KCiYktwnNe1u58=;
        b=I7JnLLWZC3nGCoo8p9ZmQ+q3Tjt32niLh+cbOnveqY8E+w1xT44FUldm4kFSaLlB58
         2Dolc5AyTfU4wOh2/JcmpX431okuHxO7WVLV5nNKEluuuTEUnaFWpfSzMG7cMJz0V+EI
         mSINBl9Ie53AYrIPorcBcn8FUZ8wGX/6Bi0f3Rw8cJ/uXio6O6+drjLA60LRVf9VLoNO
         2rTUcu0SVNiYlhnoi/ddaZsdZMGF1MvC9/7oDujUurELVCLE20VHRRugudyB9LljRPMh
         uqF0k4LihIew5FHZg4YZMgklnlmJF+00A+s8w0xEB6Il8VqqfKKp1Ga8Xwrcr/PHdxPZ
         xUyA==
X-Gm-Message-State: AOAM531/KGVNSSLOlJM9zG70Ia4WSV6Hl4LSuh2p17IaL3ibO2076GvS
	P+8COoxsoC62eXRpPr26xEE0Hcl1STHsLhnfQw8=
X-Google-Smtp-Source: ABdhPJyaZucqrCnMG/4n1XTu4/DQMo2aglU8KNxggHbV8vnBTmzkzZ8sTWMGELmEr3b1n8//yfMerQ==
X-Received: by 2002:a63:e310:: with SMTP id f16mr6062847pgh.160.1611672130954;
        Tue, 26 Jan 2021 06:42:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 00/46] Patch review - pseudo file mode corruption fix V3
Date: Tue, 26 Jan 2021 04:41:11 -1000
Message-Id: <cover.1611671734.git.steve@sakoman.com>
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

This third version removes:

bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST

and hence the need for any bitbake changes.

Let me know if you you are aware of any other pseudo issues which would necessitate
delaying the merge of this series.

Please have comments back by Thursday evening.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1784

The following changes since commit 897822233faef0f8f35dc1d8a39e1c4bc0550f1e:

  ppp: Whitelist CVE-2020-15704 (2021-01-19 04:22:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jack Mitchell (1):
  distutils3: allow setup.py to be run from a different directory to
    ${S}

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

