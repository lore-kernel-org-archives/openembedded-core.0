Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A99C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 17:51:20 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.49237.1722448274893159982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 10:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=sjTh4Ry6;
 spf=pass (domain: baylibre.com, ip: 209.85.166.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-397052a7b63so25869585ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722448274; x=1723053074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQJbBvlv+SBlCXJK+mih7e5fM1u31mg4GZdbTicnHmI=;
        b=sjTh4Ry6pavBrGBINvgSr7OwLU1bSCUobOgb5U13IpYpzoPS3QNAKgRpc4presEdHx
         9qR+VmnRN9BtG2JgkbInnSBIYE7/jug2q6o/LvVl4Cdv7A8eIVmknLWcGSzfKy9AAYMh
         MACADb6h7RsuTsAq9/X6XwdnitE3UsxST4DFI5f3UkVxsfpE2mx3Yi1antKPX9ppVhGd
         qbOtEm5+1mpEvFMETKLvrPdCaKoSC8c8MLAgM2ZLF6v/zB681VrevhixCu03gbSnXgex
         pb31a5mnwKPjdiIiiQix4VLbebutD2w66juwEp4uTveECE7BgQqMydytikZMR86/Dkq1
         jqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722448274; x=1723053074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQJbBvlv+SBlCXJK+mih7e5fM1u31mg4GZdbTicnHmI=;
        b=H+TTUHWYZ82zzCFt97Ooffmhksk4s+OIXtJDiNv4canmm/zNihKXWflSVBTrnlYVG/
         WszJsa9MgZBthGJbA2h/UQzfmzMN15Y4bl4MnBEwC1ub/3wOnOvRp6Sxvxem3oq3UiOm
         czwzTExyhcEUWLizu6qRu3PvkarLsdlJwLZzgWGHF6jsz6hbkxyuYp5jPMM2Uq891bTn
         K10fW92/LXjI/6JmFiA2nmrySLo3Oh0mEXNDyzINVenvXrGVXkKRUuwap/F17jcvPzud
         GF+1v5a6B65Zx+r8ZeKPis6ZPR73GRzXb73xt0VH/7bIPtdg3vRtLEP5KSBC9EcDv19a
         ZzpA==
X-Gm-Message-State: AOJu0YwnF8QBp+kkxs3zFqnZiECwQNq1fPB14JnEBauH9LE3gWgM2Kxj
	MknT5Y87BbLTgZilg+Yr/U41BOHWiP5SKq6QtpuuYO44SI0pA9j/N15P07mho7eHKXB8WPFykCN
	b
X-Google-Smtp-Source: AGHT+IHC9i6QbHMDC1wSJD3w3FTEQsAXdtQp+aLSqMfstcfZIC+cDkQDUgeFKtbrRbmgkUqAP3Q1UA==
X-Received: by 2002:a05:6e02:1745:b0:383:5520:cc48 with SMTP id e9e14a558f8ab-39b182d6bbbmr198695ab.0.1722448273670;
        Wed, 31 Jul 2024 10:51:13 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39af7929ba2sm31490905ab.3.2024.07.31.10.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:51:13 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] dpkg: upgrade 1.22.6 -> 1.22.10
Date: Wed, 31 Jul 2024 13:51:12 -0400
Message-Id: <20240731175112.2838825-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 17:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202719

This required a refresh of patch
'0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch'. Since
it didn't have a proper commit message or signoffs, I also added those
and renamed the patch in the process. The original title is now the
description.

Wasn't able to find a new changelog, so commit history will have to do:

ef5536cfe (tag: 1.22.10) Release 1.22.10
e4d8d44dd po: Regenerate .pot files and merge .po files with them
58146a371 Revert "scripts/mk: Reduce the number of subprocesses"
3618de586 Dpkg::Changelog: Remove useless escaping for -
af10377e2 Dpkg::Changelog::Entry::Debian: Remove obsolete /o modifier from regex
dd4d53d97 build: Simplify C standard check output
adc3dd67b build: Fix dpkg_cv_c99 assignment in DPKG_C_C99 macro
1b562a0e9 build: Fix length for comment bar line after autoconf functions
f320bc0f8 build: Use pre-defined macros to check C/C++ conformance requirements
a2f7f85d5 build: Do not define macros for C/C++ standard level
e2b256176 Bump version to 1.22.10
82ab77437 (tag: 1.22.9) Release 1.22.9
5dcf833c2 po: Regenerate .pot files and merge .po files with them
b40d59472 scripts/mk: Fix typo in comment
c05f82972 scripts/mk: Fix pkg-info.mk evaluation by adding new DEB_TIMESTAMP variable
05efe8360 test: Fix typos in Makefile comments
80bdfdfe5 s-s-d: Use a stop context to track the current state
78a970dba dpkg-deb: Track maintscript information in a new struct
514b761a1 dpkg-deb: Print pathname instead of filename and directory in error output
f7978c885 dpkg-deb: Add long options for short-only compression ones
06dd1ad0f Bump version to 1.22.9
e9a8f699f (tag: 1.22.8) Release 1.22.8
ccaea43c6 po: Regenerate .pot files and merge .po files with them
017079b0c scripts/mk: Fix make variable expansions passed to dpkg-buildflags
574081691 scripts/mk: Ensure dpkg_datadir is computed once
f2f447be4 po: Update Catalan translations
286fc7467 Dpkg::Archive::Ar: Rework _read_buf() error messages to make l10n easier
ad717618e po: Update German programs translation
127d25ed1 libdpkg: Fix execname support on GNU/Hurd
94e577411 build: Update lcov usage for version 2.0
1aba90294 doc: Update Doxygen configuration from version 1.9.8
7c1ab6e31 Bump version to 1.22.8
7603b54e2 (tag: 1.22.7) Release 1.22.7
956bede10 po: Regenerate .pot files and merge .po files with them
3eca339cc dpkg-buildpackage: Reference the .dsc in .buildinfo if building from one
555f9fe3c dpkg-buildpackage: Add support for building from a specified .dsc or dir
a0e40ff85 perl: Use new Dpkg::Source::Package->get_basedirname() method
5ca492db5 Dpkg::Source::Package: Add a new get_basedirname() method
98adc2ec5 Dpkg::Source::Package::V3::Bzr: Remove unused variables
044955f9b Dpkg::Source::Package: Document method additions with an object
00f0fb173 Dpkg::Substvars: Add support for required substvars assigned with !=
df60765ed Dpkg::Vendor::Debian: Guarantee UTF-8 locale codeset on sanitize-env
259debe76 build: Do not include VCS specific files in the distributed tarball
5a381b45a build: Include a .dist-vcs-url file in the distributed tarball
4c6e077bf libdpkg: Do not try to strdup() a NULL pointer in dpkg_get_pid_execname()
4ec4dcd01 libdpkg: Remove unused variable in dpkg_get_pid_execname() on GNU/Hurd
99bba12f0 libdpkg: Try to print the executable name of the lock contending process
d6a9bb695 libdpkg: Add new execname module
b7dc60447 dselect: Use enum values instead of literal integers
e56be2165 libdpkg: Check for updateslength < 0 instead of == -1 in ulist_select()
af5c8d99e libdpkg: Check for limit >= 0 instead of != -1 in buffer_copy()
1a7b7d52e dpkg: Check for < 0 instead of == -1 for conffderef() return values
4682652aa Check for >= 0 instead of != -1 for syscall return values
5601b4769 Check for < 0 instead of == -1 from syscall return values
040922cf0 dpkg-realpath: Guarantee varbufs have been allocated
f724d5076 Revert "dpkg-realpath: Switch direct varbuf accesses to varbuf_str()"
0fee7b211 dpkg-realpath: Switch direct varbuf accesses to varbuf_str()
474db9879 dpkg-realpath: Do not allow an empty pathname argument
983fadb9e libdpkg: Do not accept len >= INT_MAX in fd_read() and fd_write()
9ff1f50b1 libcompat: Fix vasprintf() to error out if vsnprintf() returns >= INT_MAX
811651673 build: Check whether HAVE_* macros for headers are defined
83c6705c1 s-s-d: Fix typos in code comments
4993ac06a build: Add missing files and sort POTFILES.in
45317f873 test: Switch ar m4 macros to use internal dpkg-ar implementation
865322b2a dpkg-ar: New internal ar implementation script
fbee9f6d4 Dpkg::Archive::Ar: New module
9b2f0100f test: Refactor ar handling into m4 macros
59ce405f3 test: Unify all ar invocations into create, extract and list
7e27cbae0 Dpkg::Shlibs::Cppfilt: Normalize demangled symbols with llvm or C++11 format
1c7f9f2be test: Only execute Dpkg::Shlibs checks on ELF platforms
ef9d366fe test: Add new DPKG_CHECK_DIFF macro to abstract file comparisons
3533e05c2 Dpkg::Vendor::Debian: Set -Wno-error on qa=-bug-implicit-func
0dff3528b po: Update German scripts translation
0b7988833 po: Update German man pages translation
33e3074db Dpkg::OpenPGP::ErrorCodes: Update error codes from SOP draft version 10
0274e3d35 dpkg-buildpackage: Make newline injection during signing GnuPG specific
8389e7010 lib, src: Include missing <stdbool.h>
c94e16d93 Dpkg::Vendor::Debian: On native builds map *_FOR_BUILD flags to * flags
17456a341 Merge conffile obsolete and remove-on-upgrade into a single flags member
b11ffedca dpkg: Refactor conffile disappearing check into a new function
09ae88618 dpkg-shlibdeps: Add support for new --package option
e16a155f5 dpkg-shlibdeps: Refactor executable CLI parsing
01505a922 libdpkg: Factor fsys_list_parse_buffer() out of ensure_packagefiles_available()
6410d905b test: Clarify the Makefile fragment variable being tested via comments
1e9c98a43 test: Parametrize all Makefile fragment functional tests
7e73ffda9 test: Set CC to gcc in make fragments functional tests
d8ff5ef85 scripts/mk: Stop hard-coding dpkg_datadir
a0b4da48c scripts/mk: Replace more GNU sed constructs with POSIX ones
57048fc8c build: Fix test verbose and parallel option propagation
deb4cfe60 build: Workaround Tap::Harness verbose misbehavior on parallel mode
f2407763c doc: Fix casing after admonition
153a7c8de doc: Fix grammar for fallback
86fe73a5a po: Update German man pages translation
17dd89881 libdpkg: Make varbuf_detach() always return a string
0e589d3fc libdpkg: Make prefix and suffix varbuf checks cope with unallocated varbufs
7f287adcd libdpkg: Compute string slice for varbuf_has_suffix() check on good values
61b221cf7 man: Update verify format example to also include M
6d6488a9e dpkg: Do not run hooks or loggers with --dry-run or unprivileged
bc4dc7153 debian: Suppress s-s-d compat symlink if /sbin is missing
98e16e2eb dpkg-genbuildinfo: Parse Provides as virtual packages
b126d9726 test: Refactor real and virtual package setup
b33121e1f po: Update German man pages translation
b33417497 libdpkg: Turn the warning on Provides version relation into a lax error
77cd6c000 libdpkg: Refactor lax problem reporting into parse_lax_problem() function
4ed783dc7 man: Document weak checksum algorithms
e5fb453b3 man: Document missing Packages front-end fields in dpkg-query(1)
77f1ce33a po: Update Dutch man pages translations
9dff67290 libdpkg: Mark file_slurp_fd() NUL-terminate the varbuf
e146a68a3 scripts/mk: Reduce the number of subprocesses
970350af0 test: Test override of a build tool
48a52db41 test: Add missing test for CPP build tool
0b4d3ad3d test: Test DEB_CXXFLAGS_MAINT_SET
0a3195357 test: Test variable override
4b04e760a test: Test exported variables in addition to Make variables
bb01e59d8 test: Replace double quotes with single quote in shell recipes
d583f4846 test: Use loops instead of repetitions in mk fragment tests
4c7702871 test: Simplify buildflags.mk test of _MAINT_APPEND when TEST_ is empty
ce5c5af16 test: Unset DEB_BUILD_MAINT_OPTIONS in build flags tests
f1175056f build: Rework subst handling for built or installed artifacts
84d82aaaf po: Update German programs translation
f8d4dc399 po: Update German man pages translation
24a7aee46 Revert "test: Pass -T+1 to xz to workaround spurious warning with xz 5.6.0"
0f4000a29 test: Initialize varbuf before use
489c0f4b2 libdpkg: Add missing header includes
51b9b23c4 po: Update Swedish translations
0f503ee3a src: Check whether SOURCE_DATE_EPOCH is set before parsing it
2b771a88e src: Fix timestamp parse error reporting
f6d747035 dpkg: Use a variable for each conffile pathname type
42158472a dpkg-realpath: Rewrite in C
9d410b391 libdpkg: Add new file_getcwd() function
f382029ba libdpkg: Add new varbuf prefix and suffix handling functions
e5c856f73 libdpkg: Add support for DPKG_NLS environment variable
24287281f man: Document DPKG_COLORS and DPKG_NLS for all perl scripts honoring them
e309f8639 man: Add new libdpkg(7) manual page
46ca7d944 build: Pass abs_srcdir and abs_builddir to the TAP driver
ae03bfd28 libdpkg: Remove varbuf_end_str() function
cae07d61c libdpkg: Always NUL terminate varbufs
fe1c99810 Use varbuf_str() instead of direct access
426997f83 libdpkg: Rename varbuf_get_str() to varbuf_str()
aea0858f5 libdpkg: Change varbuf_get_str() to return "" instead of initializing it
bfecc8f13 test: Pass --check-level=exhaustive to cppcheck
54a1a23d3 scripts/mk: Generate the _FOR_BUILD variant of each variable automatically
61f824cf1 scripts/mk: Search once for parrallel= in DEB_BUILD_OPTIONS
d5835c587 scripts/mk: Use explicit test of $(origin) instead of ?=
c0dde13fd scripts/mk: Use filter instead of findstring
8966616fa scripts/mk: Protect files against double inclusion
f268c3733 po: Update German man pages translation
3e430c1f2 man: Document DEB_BUILD_ARCH and DEB_HOST_ARCH usage in commands
54a6ad9db build: Add support to track release VCS commit id
00707c50e build: Print the release version at the end of configure
4d9214444 po: Update German man pages translation
2c55113b6 build: Partially revert the sanitizer for some functional tests in CI
78a5e8e24 Dpkg::Vendor::Ubuntu: Use -fcf-protection=none instead of -fno-cf-protection
281c308ee libdpkg: Handle readlink() failures in file_readlink()
197fa86fc Dpkg::BuildDriver: Refactor build driver out of dpkg-buildpackage
bab74e22a dpkg-buildpackage: Refactor build target hook execution
c711bc865 dpkg-buildpackage: Fix the debian/rules executable check to respect -R
f4a75f138 dpkg-buildpackage: Remove fallback handling for missing required targets
7b6e42a13 libcompat: Include missing <string.h> in strnlen module
6a22037c2 build: Do not check for functions used unconditionally
4c586e344 build: Do not check for memcpy()
2eb48ad0c build: Unconditionally include <stddef.h>
4921ef18c build: Add missing space before backslash
ebd19171d build: Re-enable the sanitizer for functional tests in CI
7348ad792 doc: Add missing full stop to end of sentence
0d3527afd test: Do not fail the functional test suite due to memory leaks
5cdc783e5 libdpkg: Factor out filesystem database file loading into new function
cedd58200 po: Update German man pages translation
dfa1ac937 Bump version to 1.22.7

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...> 0001-script.c-avoid-use-of-chroot.patch} | 28 ++++++++++++-------
 .../dpkg/{dpkg_1.22.6.bb => dpkg_1.22.10.bb}  |  4 +--
 2 files changed, 20 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/dpkg/dpkg/{0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch => 0001-script.c-avoid-use-of-chroot.patch} (79%)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.6.bb => dpkg_1.22.10.bb} (86%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
similarity index 79%
rename from meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
rename to meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
index 916c7dfb00..7d4dc97e94 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
@@ -1,9 +1,11 @@
-From b6c28222276704a1e1a544983e38dfa2f3fb481a Mon Sep 17 00:00:00 2001
+From cf135f2b3395e54dc1adfe51c1a25922e01c167e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
-Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
- sysroot and don't expect a chroot. This matches up our system expectations
- with what dpkg does.
+Subject: [PATCH] script.c: avoid use of chroot
+
+Our pre/postinsts expect $D to be set when running in a sysroot and
+don't expect a chroot. This matches up our system expectations with what
+dpkg does.
 
 Upstream-Status: Inappropriate [OE Specific]
 
@@ -11,15 +13,19 @@ RP 2011/12/07
 ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
+
+Refresh to apply on top of v1.22.10.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- src/main/script.c | 53 +++--------------------------------------------
- 1 file changed, 3 insertions(+), 50 deletions(-)
+ src/main/script.c | 52 +++--------------------------------------------
+ 1 file changed, 3 insertions(+), 49 deletions(-)
 
 diff --git a/src/main/script.c b/src/main/script.c
-index 017d92efe..181e7c710 100644
+index e9aee0bf9..181e7c710 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
-@@ -97,58 +97,11 @@ static const char *
+@@ -97,57 +97,11 @@ static const char *
  maintscript_pre_exec(struct command *cmd)
  {
  	const char *instdir = dpkg_fsys_get_dir();
@@ -62,9 +68,8 @@ index 017d92efe..181e7c710 100644
 -			varbuf_add_char(&args, ' ');
 -			varbuf_add_str(&args, *argv);
 -		}
--		varbuf_end_str(&args);
 -		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
--		      args.buf);
+-		      varbuf_str(&args));
 -		varbuf_destroy(&args);
 +        if (*instdir) {
 +                setenv("D", instdir, 1);
@@ -81,3 +86,6 @@ index 017d92efe..181e7c710 100644
  }
  
  /**
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.6.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.10.bb
similarity index 86%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.6.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.10.bb
index 3f5f7395e0..b247404855 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.6.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.10.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://arch_pm.patch \
            file://add_armeb_triplet_entry.patch \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
-           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+           file://0001-script.c-avoid-use-of-chroot.patch \
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
@@ -17,6 +17,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "b2f9600ead232a2dd3c27f8b52807a9ca5854d17"
+SRCREV = "ef5536cfe24e4c41c6fdc56e4530161fade3887c"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


