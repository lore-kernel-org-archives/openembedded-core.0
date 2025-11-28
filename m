Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296DDCFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:37:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16073.1764337042983959681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AWgbehax;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775ae77516so19623805e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764337041; x=1764941841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82DGcDQQkshubN98eaqD3VUEewaGZbv1kRUM1iwOdy0=;
        b=AWgbehaxmbwzCuSwVIxY32Zp8CqDowD+cZIn1l0jUbk3m1uWPAGEmkMwd3dUcmLxNN
         Pj4Wr75Cp/lv8941XxjasHhY/uo5J0lWlB6p/maGL18SjaKDAByBYsigvglk5i7df8Zo
         FC8ZYsXtlo52KgmpfMsza49iaUpsvsymFnIN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764337041; x=1764941841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82DGcDQQkshubN98eaqD3VUEewaGZbv1kRUM1iwOdy0=;
        b=SFR3qF5HV6b3fcHVTm96ZpnUIRBZKUhsd2aXsQDDns5DIr7T+gyC/j80HK+tX9OZ21
         XVz+M5Wfr7ded83vy331Ys1jfEcmlTxOJYiaubeUngA/Wa89kTZ55+PNTd4Mw78GUMxj
         Dm0HdWDnKcowQovmmnH00AL24X0f1G5X4P9ngzvND0Gk7DcP36mB0SRPaMY3y1qUy/iJ
         0wBkitmceX46Q7QhhzNoh3hssjm8rXRhwX5goq4YPXBwkH8WfzRHGvGHwwIcEV5+tCdA
         L2SPBipQdjsjIM68bQg5be0nguH3JYxKQWEsy0mydwo8L0ZesOOk1PMVEDFsJwNGEjIW
         iUwQ==
X-Gm-Message-State: AOJu0YzZ+zOV8DsLJAVBLzyInoF8JxRjYvCE/OIoq9eIxy3r+6K01Ru8
	SFkAthImVtYTB6jzYUwaR0s3LuWYwFe0bq//cuOnZkSgBVFtWaQgElhdEtbPODwwu0CSCwMPed9
	lReKq
X-Gm-Gg: ASbGncs/mhYfToukMcMn5X9R6vdSy7zjDyUpYsU76LqfvSascmqi8qtMXI238gxcAL3
	tU4/mohaV8z4Y4o4tURX1lASpo7WImbGIVPwptMOMpi1Jn3kmaYO6XDDgl7FgSsxzCciShkJ1Jk
	qLxxn6w0bMF2L5glxLsLAEyEfRDUvL/cmzmcaf2YO8c5w/EpwkylKOhZfHXBjmc+jJNm0ThkDey
	fN8Vy7vR12LscERuahjU2SdrMyD/nhZkO5lWhvaXbWXMdX79XsROH4BTqDW/GOZChf9ZQAPOYN2
	JcElXwB8cFIhhI0i1A/OjCjQokaUybTD5LUaPa9P44VmYqWgauow0Yk04b4QhuKMU2Y+MX/SMjx
	YEAHB+DwL0FRRR7ZeiTnJTFhUFPS6j0nXv4uq3dSQ7+akqyTzHQ77O3ijxANE0efM+k1863Qf6Z
	1WpRt1JH72EzspaFz9eEBetl5p
X-Google-Smtp-Source: AGHT+IGpagNc/SxQV5SNpC5z8RNnEs6ebnJPRhuYab+IhnLgRnj37FsPodWetoQb+2xInVNcyoX47Q==
X-Received: by 2002:a05:600c:1ca5:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-477c1115ff6mr331558575e9.17.1764337040429;
        Fri, 28 Nov 2025 05:37:20 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791116c3c0sm86999805e9.8.2025.11.28.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 05:37:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/2] glib-2.0: Upgrade 2.86.1 -> 2.87.0
Date: Fri, 28 Nov 2025 15:37:15 +0200
Message-ID: <20251128133716.3635989-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226909

Overview of changes in GLib 2.87.0, 2025-11-03
==============================================

* Update to Unicode 17.0.0 (!4793, work by Peng Wu)

* Support runtime extensions to `gdbus-codegen` tool to allow modifying its
  output in project-specific ways (!4812, work by Sebastian Wick)

* Use document portal to open all the URIs for snaps (!4822, work by
  Marco Trevisan)

* Add g_markup_parse_context_get_offset() API for getting error locations in XML
  files (!4879, work by Matthias Clasen)

* Bugs fixed:
  - GNOME/ptyxis#490 new tab does not open in current directory when hostname
    contains a period (Christian Hergert)
  - #672 hash resize broken for large sizes (Tobias Stoeckmann)
  - #2608 Support nanosecond time resolution with stat() on macOS (Andre Barnaba
    Silva)
  - #2949 gdbus-server-auth test intermittently fails on macOS
  - #3070 gio/g-file-info test fails on macOS (Andre Barnaa Silva)
  - #3523 g_filename_from_uri rejects valid host names according to RFC 1123
    (Christian Hergert)
  - #3745 GIRepository: union fields offsets for compiled typelibs all have
    offset 0xffff (unknown) (Philip Chimento)
  - #3771 Should opening a .desktop file fail if Exec key contains invalid
    escapes? (Philip Withnall)
  - #3780 `gio/tests/socket-listener` requires dlsym
  - #3781 GLib.OptionContext's get_help() includes width of invisible options
    (FeRD (Frank Dana))
  - #3783 [CI] Pipeline on 'main' failed for commit c31c4a52 (Tobias Stoeckmann)
  - #3784 Memory leak related to g_get_home_dir (Tobias Stoeckmann)
  - #3785 "gio trash --empty" returns 0 even when it fails to remove files
  - #3790 _g_log_abort() should check TracerPid from /proc before raising
    SIGTRAP
  - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with non-existent
    paths (Philip Withnall)
  - #3803 GNetworkMonitor's netlink backend doesn't notify connectivity change
    (Philip Withnall)
  - #3805 [CI] Pipeline on 'main' failed for commit e6c52881
  - #3806 fake-document-portal needs to use _g_fd_query_path() rather than
    accessing /proc/self/fd directly (Marco Trevisan (Trevino))
  - #3808 Uyghur language translation updated.
  - #3809 GRegex tests fail with pcre2 10.47: different error for ^(a)\g{3
    (Marco Trevisan (Trevino))
  - #3811 g_get_user_special_dir doesn't strip trailing slash from $HOME/
    (Tobias Stoeckmann)
  - https://gitlab.gnome.org/Infrastructure/Infrastructure/-/issues/
  - !4753 GIO/Win32: Remove custom definitions of system interfaces
  - !4755 ghash: Fix entry_is_big for CHERI architecture
  - !4756 ghash: Handle all table sizes in iterator
  - !4759 GWin32AppInfo: Allow focus-stealing when requested via
    GAppLaunchContext
  - !4760 gbookmarkfile: Escape icon href and mime-type
  - !4764 subprojects: Update libffi, pcre2, proxy-libintl
  - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code
  - !4775 Update Ukrainian translation
  - !4776 Update Catalan translation
  - !4777 Update Lithuanian translation
  - !4778 tests: Fix clang compilation warnings
  - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul
  - !4780 Update Brazilian Portuguese translation
  - !4781 Update eu translation
  - !4782 Update Korean translation
  - !4785 Update Japanese translation
  - !4786 Update Galician translations
  - !4787 Update Hungarian translation
  - !4789 gio: add some nullable / zero-terminated annotations
  - !4790 gstring: Support large strings in g_string_replace
  - !4791 gstrfuncs: Check string length in g_strescape
  - !4792 gtype: Define copy and free functions for GTypeClass and
    GTypeInterface
  - !4793 gunicode: Update the code for Unicode 17.0.0
  - !4794 CI/MSYS2: Use builtin b_coverage option
  - !4795 Meson: Add arguments and defines to all C-like languages
  - !4798 GDBus: Add `(out)` annotation to quark in
    g_dbus_error_register_error_domain()
  - !4800 gutils: Improve load_user_special_dirs' user-dirs.dirs parser
  - !4802 Update Turkish translation
  - !4803 Add missing `(array length=n_values)` annotation to `GEnumClass` /
    `GFlagsClass`
  - !4806 build: Post-release version bump
  - !4807 Add missing "nullable" to parameter docs of GList/GSList
  - !4810 gutils: Mark load_user_special_dirs unlocked
  - !4811 Update Esperanto translation
  - !4812 gdbus-codegen: Support extensions and changing the
    GDBusInterfaceSkeleton type to inherit from
  - !4813 Update Serbian translation
  - !4815 gfile: Expand documentation around file equality
  - !4816 strfuncs: Check for overflows when joining strings
  - !4817 Mark a couple of functions as constructors and not methods
  - !4819 utils: Fix a leak when user-dirs.dirs declares a variable twice
  - !4820 gio/tests: Fix a race condition in /gdbus/connection/flush
  - !4822 GDesktopAppInfo: Use document portal to open all the URIs for snaps
  - !4823 gio/gdocumentportal: Use the target name when opening a symlink
  - !4825 gdbus-codegen: Supress coverity warning in skeleton finalization
  - !4827 ghostutils: Treat 0x80 (and above) as non-ASCII
  - !4829 docs: Fix typos in win32-build.md
  - !4830 giowin32: Fix uninitialised variable error on msys2-clang64
  - !4831 macros: Add C23/C++23 standards
  - !4832 gtypes: Support more overflow check implementations
  - !4835 Update Portuguese translation
  - !4837 tests: Fix another clang compiler warning
  - !4838 GLocalFile: keep suffix name when trashing
  - !4840 gpattern: Support patterns/strings longer than G_MAXUINT
  - !4843 tests: Use integer widths rather than maximum values for strfuncs
    check
  - !4844 Forward-port !4839 "Update Romanian translation" to main
  - !4847 GFile entity tags: Update HTTP reference link to point to RFC9110
    ETags description
  - !4849 Update British English translation (main)
  - !4851 Docs: New file-name-encodings image: light/dark, color
  - !4855 glib-compile-resources: print error message when the temp file cannot
    be created
  - !4856 Mark return value of g_dbus_interface_get_info() as `nullable`
  - !4857 Docs: Migrate gvariant-*.svg licenses to comments
  - !4858 gsocketcontrolmessage: Fix a minor typo in a doc comment
  - !4860 Fix `g_memory_monitor_base_query_mem_ratio` on Solaris
  - !4861 gio/tests/gapplication: Check the values received on action activation
  - !4862 ci: Temporarily disable macos-arm64 CI as it has issues creating temp
    files
  - !4863 ci: Temporarily disable msys2-mingw32 CI
  - !4864 ci: Update Fedora CI image to Fedora 41
  - !4866 Fix various scan-build errors
  - !4870 Reenable MSYS2 CI
  - !4874 ci: use APFS for macOS TMPDIR
  - !4877 gresolver: Fix loopback detection of IPv6 addresses
  - !4879 Add g_markup_parse_context_get_offset
  - !4887 glib-unix: Add Solaris implementation of g_unix_fd_query_path
  - !4893 ci: Use CI/CD file variable tokens for secrets
  - !4894 gthread-win32: Ignore error when setting thread priority
  - !4895 gunixmounts: fix out of bounds write in AIX mount table parser
  - !4896 ci: Actually use token file for the issue bot
  - !4897 Re-enable PCRE2 tests for 32-bit Visual Studio builds

* Translation updates:
  - Basque (Asier Saratsua Garmendia)
  - Catalan (Jordi Mas)
  - English (United Kingdom) (Bruce Cowan)
  - Esperanto (Kristjan ESPERANTO)
  - Galician (Fran Dieguez)
  - Hungarian (BalazsUr)
  - Japanese (Makoto Sakaguchi)
  - Korean (Changwoo Ryu)
  - Lithuanian (Aurimas Cernius)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (Rafael Fontenelle)
  - Romanian (Antonio Marin)
  - Serbian (Milos Popovic)
  - Turkish (Sabri Unal)
  - Uighur (Abduqadir Abliz)
  - Ukrainian (Yuri Chornoivan)

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{glib-2.0-initial_2.86.1.bb => glib-2.0-initial_2.87.0.bb}  | 0
 .../glib-2.0/{glib-2.0_2.86.1.bb => glib-2.0_2.87.0.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.1.bb => glib-2.0-initial_2.87.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.1.bb => glib-2.0_2.87.0.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.87.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.87.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.87.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.87.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 5909851896..2ba8ad7492 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,7 +236,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
+SRC_URI[archive.sha256sum] = "926cf73d8eb90ea341cc2d6fc7b258901e1a086a3808b166b4476d69a98b2401"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.3


