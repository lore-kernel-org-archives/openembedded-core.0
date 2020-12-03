Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.11358.1607008111366403105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kwhK5BFH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id v1so1256057pjr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=1ybJcwO9gdAfo43qKse/bsTgBUmshHR25kHdP6QTxuc=;
        b=kwhK5BFH0I/OSySWeSmKucqcXXWtC2pMuxD5MfFrGfcA/C7edlXVoDr7MXfdFe++LH
         Df+yg3k9rIxD9Qu4x8OrtBUv411WTK0IVe4n3uu3Xl0oeRaXVl07eyv/LCb49EHGTfaV
         5o3jZ8OfdyIzbND2DDOktKHfzsVoqPUzSDvVvTndcbCfNNK1nkKA+QeKe9nS5xJ6n8r+
         PvLLx0Fi2/qnakIAqnnFTB1955nEkI7S/u1CTN6E29o8y4M3ZfgSuqR8R696kjVDG+nF
         R+CIdeJp5ahNDqzex0JFqQGpHm8KeZlXkCIB9lMPuxeGn1V1n0Hb2PhXf5nkF8Cm3nsG
         mFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=1ybJcwO9gdAfo43qKse/bsTgBUmshHR25kHdP6QTxuc=;
        b=RYJENW5pULaz/388TQTjEB5v7urrC4da7tzcouLVuiB/QBDl/oE5KvayNJaLM8S36x
         bxYkrGjP5ijGyluUt5AhDteow/wMYPk1My7pXQiqN8w7QsTOB2J/Ab6rW7L8T7RLw/jf
         5EPnGTis3bBfV+BLvHudTFbGRpvigumDBT/e4ZGkfNSyoPaP9+YB+kgbVnBHP578P9OQ
         SaYnWdlWGkzBzDA6aIug72bWJ/W7hAWmneCFIbhoQrpkPuluvohfeo6Rpos7q7WvUhkp
         NPUiuubLqrIUxtECK/PfxsyEEdXDUf4SCDUQL0YRUS/QNYmKzvP0xQk4f+i9ipFyMqwI
         FEZA==
X-Gm-Message-State: AOAM531Hjz7IQp2MLuFBJOFP3UsEjpbKwBhaH7gFO7odDlhpZ40UylwH
	EoBRDNumciW3C3a1c8B3njMcIEzhsrCNzpEg
X-Google-Smtp-Source: ABdhPJyxzbjxAdoi4s+HsBCcXADLG7TDiT0hrS3Vm7dLmOUTp+gH7dUbTt4APi37xcsI8UW6OmrjkA==
X-Received: by 2002:a17:90a:f28f:: with SMTP id fs15mr3483493pjb.121.1607008110167;
        Thu, 03 Dec 2020 07:08:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
Date: Thu,  3 Dec 2020 05:07:50 -1000
Message-Id: <cover.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Issues with undetected file mode corruption in pseudo have been identified.

Fixes have been merged into master and gatesgarth over the past couple of months and
things seem to have stabilized enough that we can consider backporting these fixes
to dunfell.

This is a somewhat more invasive change than normal. Specifically the user will
be required to clean TMPDIR after this merge. It may also expose issues with
other layers, though master and gategarth have probably helped to pave the way for
this change.

Personally I think that this fixes a serious enough issue that we should consider
this series for dunfell.

Please have comments back by Monday morning.

The following changes since commit 071806feb195961e59069f778c9ae8f27a739d9a:

  e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30 12:05:57 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jacob Kroon (1):
  bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST

Joe Slater (1):
  pseudo: fix renaming to self

Martin Jansa (1):
  base.bbclass: use os.path.normpath instead of just comparing WORKDIR
    and S as strings

Mingli Yu (2):
  tcl: adapt to potential pseudo changes
  bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database

Ricardo Ribalda Delgado (3):
  wic: Fix permissions when using exclude or include path
  wic: Fix multi images .wks with bitbake
  wic: Avoid creating invalid pseudo directory

Richard Purdie (19):
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

Ross Burton (1):
  devtool: remove unused variable

 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/base.bbclass                     |   6 +
 meta/classes/image_types_wic.bbclass          |  12 +-
 meta/classes/populate_sdk_base.bbclass        |   2 +
 meta/classes/sanity.bbclass                   |   3 +
 meta/classes/sstate.bbclass                   |   4 +
 meta/conf/abi_version.conf                    |   2 +-
 meta/conf/bitbake.conf                        |  13 +-
 meta/lib/oe/sstatesig.py                      |   4 +-
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
 scripts/lib/devtool/standard.py               |   1 -
 scripts/lib/wic/partition.py                  |  23 +--
 scripts/lib/wic/plugins/source/rootfs.py      |  37 ++++-
 scripts/postinst-intercepts/update_font_cache |   2 +
 26 files changed, 89 insertions(+), 644 deletions(-)
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
2.17.1

