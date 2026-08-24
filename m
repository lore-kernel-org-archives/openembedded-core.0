Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40302C5DF9B
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 05:36:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10369.1787549784277288323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 22:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sIGjhzP2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=giLIXtRp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a032451375-14144a5b-c777-4dce-8ef1-cf2a6af85ad7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787549783;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uxZ9HE1H+Q40L1cHqLgWLM03jIlD/nUFu/E3kRAMm0A=;
	b=sIGjhzP2CsRDFVm7yPGT0W2+G0kqOsWDSDZMhsK6TcPcjTBO/K3+LARjFSV+Hx9F
	vUfEaX5oLutpRJbGewyadmTC/CyZZJCQ5EygOyIAsAMI6+S4Fc5zrxumgl/uaSWIWoX
	S5Hd8fnxe+c1+ILeICwqgyA/+SThRlnXCryWuJRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787549783;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uxZ9HE1H+Q40L1cHqLgWLM03jIlD/nUFu/E3kRAMm0A=;
	b=giLIXtRpGq/EfyQbtTS8vW7lU8fWIE0dBd9bQRnN+bUWgm+1usGJkaQtEZjswNgZ
	8NJHyviAeJWAx7pa+5CWc8fA0l5DMtlr941Ac9lrRcZz2mFCJfhqOdUzrTwTT+bCKUw
	t6LPpJZ769bZ2A0PAHv9QdSaQ1f5gn+DK0ekcFKA=
Content-Type: multipart/mixed; boundary="===============5544638614672252168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.14 SUCCEEDED
Message-ID: <010101a032451375-14144a5b-c777-4dce-8ef1-cf2a6af85ad7-000000@us-west-2.amazonses.com>
Date: Mon, 24 Aug 2026 05:36:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 05:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244062

--===============5544638614672252168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.13.6-4.14.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2dea6ea63c7f772486e818a55111f7d1747ff5df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 24 Aug 2026 05:16:04 +0000
Subject: [PATCH] ccache: upgrade 4.13.6 -> 4.14

Source: doc/news.adoc

== Ccache 4.14

Release date: 2026-08-23

=== Deprecation notice

Built-in support for the HTTP and Redis protocols will be removed in the next
non-bug-fix ccache version. Use the
https://ccache.dev/storage-helpers.html[remote storage helper] mechanism (added
in ccache 4.13) for HTTP/Redis storage instead.

=== Removed functionality

- Removed the `cpp_extension` (`CCACHE_EXTENSION`) configuration option since
  ccache now processes preprocessor output directly in memory instead of using
  intermediate files. +
  [small]#_[contributed by Joel Rosdahl]_#

=== New features and improvements

- Added support for the QCC (QNX) compiler. +
  [small]#_[contributed by Joy Wang]_#

- Added limited support for caching SARIF diagnostics:
  `-fdiagnostics-format=sarif-stderr` and
  `-fdiagnostics-{add,set}-output=sarif:file=...` for GCC, `/experimental:log`
  for MSVC. +
  [small]#_[contributed by Joel Rosdahl, Karl Fessel and Leander Schulten]_#

- Added automatic depend mode for NVCC on Windows. +
  [small]#_[contributed by Xing Xiwen]_#

- Added support for `@layout=local` in the file storage backend, allowing a copy
  or read-only mount of a local cache to be used as remote storage. +
  [small]#_[contributed by Joel Rosdahl]_#

- Extended the remote storage helper protocol with an `exists` operation,
  avoiding transfer of already stored values in reshare mode, and an `info`
  operation for reporting the helper's identity and diagnostics. +
  [small]#_[contributed by Joel Rosdahl]_#

- Added a `--dry-run` option for previewing cleanup, eviction and directory
  trimming operations without removing files. +
  [small]#_[contributed by Joel Rosdahl]_#

- Added support for rewriting absolute profile data file paths to relative,
  improving cache sharing between different directory trees. +
  [small]#_[contributed by GitHub user markyang92]_#

- Added support for reflinking `.dwo` files when file cloning is enabled. +
  [small]#_[contributed by Fabian Parzefall]_#

- Added detection of C23 `#embed` directives in direct and depend mode and of
  assembler `.incbin` directives in depend mode, preventing false cache hits. +
  [small]##_[contributed by Joel Rosdahl and Haaris Rahman]_##

- Added support for `-Wp,` options with multiple macro definitions. +
  [small]#_[contributed by GitHub user subotac]_#

- Ccache now hashes the contents of Clang module files specified with
  `-fmodule-file=`, preventing false cache hits when a module changes. +
  [small]#_[contributed by GitHub user RedNicStone]_#

- Cleanup and eviction operations now print the amount of data and number of
  files removed. +
  [small]#_[contributed by Joel Rosdahl]_#

- Increased the maximum number of raw files stored in a cached result to 256. +
  [small]#_[contributed by Joel Rosdahl]_#

- Modernized use of C++ type traits. +
  [small]#_[contributed by Gregor Jasny]_#

- Improved portability of compiler exit status handling. +
  [small]#_[contributed by Joel Rosdahl]_#

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../ccache/{ccache_4.13.6.bb => ccache_4.14.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.6.bb => ccache_4.14.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.6.bb b/meta/recipes-devtools/ccache/ccache_4.14.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.6.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.bb
index 21bd193c20..6d922d8514 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "d42ace95dec14583fb8af19ed117919995bd910376f52d9b6f546046b792dfb7"
+SRC_URI[sha256sum] = "fca63f36a83fb2f4b3cc4c01b2c7a1cd6e3629e7f7bd1e01a2eb8810f947c5ab"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============5544638614672252168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ccache-changelog.txt"

Changelog for ccache: 4.13.6 -> 4.14
Source: doc/news.adoc

== Ccache 4.14

Release date: 2026-08-23

=== Deprecation notice

Built-in support for the HTTP and Redis protocols will be removed in the next
non-bug-fix ccache version. Use the
https://ccache.dev/storage-helpers.html[remote storage helper] mechanism (added
in ccache 4.13) for HTTP/Redis storage instead.

=== Removed functionality

- Removed the `cpp_extension` (`CCACHE_EXTENSION`) configuration option since
  ccache now processes preprocessor output directly in memory instead of using
  intermediate files. +
  [small]#_[contributed by Joel Rosdahl]_#

=== New features and improvements

- Added support for the QCC (QNX) compiler. +
  [small]#_[contributed by Joy Wang]_#

- Added limited support for caching SARIF diagnostics:
  `-fdiagnostics-format=sarif-stderr` and
  `-fdiagnostics-{add,set}-output=sarif:file=...` for GCC, `/experimental:log`
  for MSVC. +
  [small]#_[contributed by Joel Rosdahl, Karl Fessel and Leander Schulten]_#

- Added automatic depend mode for NVCC on Windows. +
  [small]#_[contributed by Xing Xiwen]_#

- Added support for `@layout=local` in the file storage backend, allowing a copy
  or read-only mount of a local cache to be used as remote storage. +
  [small]#_[contributed by Joel Rosdahl]_#

- Extended the remote storage helper protocol with an `exists` operation,
  avoiding transfer of already stored values in reshare mode, and an `info`
  operation for reporting the helper's identity and diagnostics. +
  [small]#_[contributed by Joel Rosdahl]_#

- Added a `--dry-run` option for previewing cleanup, eviction and directory
  trimming operations without removing files. +
  [small]#_[contributed by Joel Rosdahl]_#

- Added support for rewriting absolute profile data file paths to relative,
  improving cache sharing between different directory trees. +
  [small]#_[contributed by GitHub user markyang92]_#

- Added support for reflinking `.dwo` files when file cloning is enabled. +
  [small]#_[contributed by Fabian Parzefall]_#

- Added detection of C23 `#embed` directives in direct and depend mode and of
  assembler `.incbin` directives in depend mode, preventing false cache hits. +
  [small]##_[contributed by Joel Rosdahl and Haaris Rahman]_##

- Added support for `-Wp,` options with multiple macro definitions. +
  [small]#_[contributed by GitHub user subotac]_#

- Ccache now hashes the contents of Clang module files specified with
  `-fmodule-file=`, preventing false cache hits when a module changes. +
  [small]#_[contributed by GitHub user RedNicStone]_#

- Cleanup and eviction operations now print the amount of data and number of
  files removed. +
  [small]#_[contributed by Joel Rosdahl]_#

- Increased the maximum number of raw files stored in a cached result to 256. +
  [small]#_[contributed by Joel Rosdahl]_#

- Modernized use of C++ type traits. +
  [small]#_[contributed by Gregor Jasny]_#

- Improved portability of compiler exit status handling. +
  [small]#_[contributed by Joel Rosdahl]_#

- Made path rewriting on Windows case-insensitive and Unicode-aware. +
  [small]#_[contributed by Joel Rosdahl]_#

- Made `ignore_headers_in_manifest` match case-insensitively on Windows. +
  [small]#_[contributed by GitHub user trustytrojan]_#

- Reduced the number of system calls for IPC requests. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Bug fixes

- Fixed `base_dir` path rewriting when using MSVC's `/Yu` option: paths are no
  longer rewritten to relative when using a precompiled header, since MSVC then
  does not like relative paths for the `/Yu` and `/FI` arguments. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed handling of compiler options when one recognized option is a prefix of
  another. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed `base_dir` handling for include paths in preprocessor mode (regression
  in ccache 4.12.2). +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed handling of Clang 22's `--warning-suppression-mappings` option. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed error handling when a Clang configuration file cannot be hashed. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed a remote storage configuration with `read_only=false` being treated as
  read-only. +
  [small]#_[contributed by GitHub user ThisIsFineTM]_#

- Fixed interrupted system calls when communicating with remote storage
  helpers. +
  [small]#_[contributed by Joel Rosdahl]_#

- Avoided a race if starting a remote storage helper takes an unexpectedly long
  time. +
  [small]#_[contributed by Joel Rosdahl]_#

- Avoided spawning and waiting for a remote storage helper when IPC access is
  denied by a sandbox. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed the free space check for the inode cache. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed handling of empty atomic file writes and improved robustness if
  opening an atomic file stream fails. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed a size overflow when allocating very large files on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed thread safety of time conversion fallbacks on systems without
  `gmtime_r` and `localtime_r`. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed handling of systems that report zero available hardware threads. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed reporting of errors from `posix_spawnp`. +
  [small]#_[contributed by Joel Rosdahl]_#

- Fixed the statistics counter used when a Clang sanitize ignorelist cannot be
  read. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Build improvements

- Fixed building with Clang 23. +
  [small]#_[contributed by GitHub user LinuxUserGD]_#

- Added missing CMake probe for `gmtime_r`. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Documentation improvements

- Improved `base_dir` documentation. +
  [small]#_[contributed by Joel Rosdahl]_#

- Clarified syntax of configuration options that take path lists. +
  [small]#_[contributed by Joel Rosdahl]_#

--===============5544638614672252168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 41467144 to 42017296 (+1%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.13.6/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.14/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.13.6/src/ccache/storage/local -> /usr/src/debug/ccache/4.14/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.13.6/src/ccache/storage -> /usr/src/debug/ccache/4.14/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.13.6/src/ccache/compiler -> /usr/src/debug/ccache/4.14/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.13.6/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.14/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.13.6/src/ccache/storage/remote -> /usr/src/debug/ccache/4.14/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.13.6/src/ccache/util -> /usr/src/debug/ccache/4.14/src/ccache/util, directory renamed /usr/src/debug/ccache/4.13.6/src/ccache/c
 ore -> /usr/src/debug/ccache/4.14/src/ccache/core, directory renamed /usr/src/debug/ccache/4.13.6/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.14/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.13.6/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.14/src/third_party/cpp-httplib, removed "/usr/src/debug/ccache/4.13.6/src/ccache/version.cpp /usr/src/debug/ccache/4.13.6/src/ccache/inodecache.cpp /usr/src/debug/ccache/4.13.6/src/ccache/depfile.hpp /usr/src/debug/ccache/4.13.6/src/ccache/compopt.cpp /usr/src/debug/ccache/4.13.6/src/ccache/context.cpp /usr/src/debug/ccache/4.13.6/src/ccache/main.cpp /usr/src/debug/ccache/4.13.6/src/ccache/hashutil.cpp /usr/src/debug/ccache/4.13.6/src/ccache/execute.cpp /usr/src/debug/ccache/4.13.6/src/ccache/ccache.hpp /usr/src/debug/ccache/4.13.6/src/ccache/ccache.cpp /usr/src/debug/ccache/4.13.6/src/ccache/config.cpp /usr/src/debug/ccache/4.13.6/src/ccache/config.hpp /usr/src/debug/ccache/4.13.6/src/ccache/hash
 .cpp /usr/src/debug/ccache/4.13.6/src/ccache/depfile.cpp /usr/src/debug/ccache/4.13.6/src/ccache/inodecache.hpp /usr/src/debug/ccache/4.13.6/src/ccache/progressbar.hpp /usr/src/debug/ccache/4.13.6/src/ccache/execute.hpp /usr/src/debug/ccache/4.13.6/src/ccache/signalhandler.cpp /usr/src/debug/ccache/4.13.6/src/ccache/signalhandler.hpp /usr/src/debug/ccache/4.13.6/src/ccache/language.cpp /usr/src/debug/ccache/4.13.6/src/ccache/hashutil.hpp /usr/src/debug/ccache/4.13.6/src/ccache/argprocessing.hpp /usr/src/debug/ccache/4.13.6/src/ccache/argprocessing.cpp /usr/src/debug/ccache/4.13.6/src/ccache/hash.hpp /usr/src/debug/ccache/4.13.6/src/ccache/language.hpp /usr/src/debug/ccache/4.13.6/src/ccache/progressbar.cpp /usr/src/debug/ccache/4.13.6/src/ccache/macroskip.hpp /usr/src/debug/ccache/4.13.6/src/ccache/compopt.hpp /usr/src/debug/ccache/4.13.6/src/ccache/context.hpp /usr/src/debug/ccache/4.13.6/src/ccache/argsinfo.hpp", added "/usr/src/debug/ccache/4.14/src/ccache/context.hpp /usr/src/de
 bug/ccache/4.14/src/ccache/context.cpp /usr/src/debug/ccache/4.14/src/ccache/hashutil.cpp /usr/src/debug/ccache/4.14/src/ccache/hashutil.hpp /usr/src/debug/ccache/4.14/src/ccache/ccache.cpp /usr/src/debug/ccache/4.14/src/ccache/argprocessing.cpp /usr/src/debug/ccache/4.14/src/ccache/hash.cpp /usr/src/debug/ccache/4.14/src/ccache/argsinfo.hpp /usr/src/debug/ccache/4.14/src/ccache/config.hpp /usr/src/debug/ccache/4.14/src/ccache/signalhandler.cpp /usr/src/debug/ccache/4.14/src/ccache/language.cpp /usr/src/debug/ccache/4.14/src/ccache/inodecache.cpp /usr/src/debug/ccache/4.14/src/ccache/ccache.hpp /usr/src/debug/ccache/4.14/src/ccache/main.cpp /usr/src/debug/ccache/4.14/src/ccache/argprocessing.hpp /usr/src/debug/ccache/4.14/src/ccache/progressbar.hpp /usr/src/debug/ccache/4.14/src/ccache/compopt.cpp /usr/src/debug/ccache/4.14/src/ccache/compopt.hpp /usr/src/debug/ccache/4.14/src/ccache/version.cpp /usr/src/debug/ccache/4.14/src/ccache/hash.hpp /usr/src/debug/ccache/4.14/src/ccache/exe
 cute.cpp /usr/src/debug/ccache/4.14/src/ccache/depfile.cpp /usr/src/debug/ccache/4.14/src/ccache/depfile.hpp /usr/src/debug/ccache/4.14/src/ccache/execute.hpp /usr/src/debug/ccache/4.14/src/ccache/signalhandler.hpp /usr/src/debug/ccache/4.14/src/ccache/progressbar.cpp /usr/src/debug/ccache/4.14/src/ccache/config.cpp /usr/src/debug/ccache/4.14/src/ccache/inodecache.hpp /usr/src/debug/ccache/4.14/src/ccache/language.hpp"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1844974 to 1871899 (+1%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGSIZE changed from 2062920 to 2107944 (+2%)
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.13.6" to "4.14"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.13.6/ccache-4.13.6.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.14/ccache-4.14.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.13.6 [default] to 4.14 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.13.6" to "4.14"

--===============5544638614672252168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.13.6-4.14.patch"

RnJvbSAyZGVhNmVhNjNjN2Y3NzI0ODZlODE4YTU1MTExZjdkMTc0N2ZmNWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjQgQXVnIDIwMjYgMDU6MTY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMy42IC0+IDQuMTQKClNvdXJjZTogZG9jL25ld3MuYWRvYwoKPT0g
Q2NhY2hlIDQuMTQKClJlbGVhc2UgZGF0ZTogMjAyNi0wOC0yMwoKPT09IERlcHJlY2F0aW9uIG5v
dGljZQoKQnVpbHQtaW4gc3VwcG9ydCBmb3IgdGhlIEhUVFAgYW5kIFJlZGlzIHByb3RvY29scyB3
aWxsIGJlIHJlbW92ZWQgaW4gdGhlIG5leHQKbm9uLWJ1Zy1maXggY2NhY2hlIHZlcnNpb24uIFVz
ZSB0aGUKaHR0cHM6Ly9jY2FjaGUuZGV2L3N0b3JhZ2UtaGVscGVycy5odG1sW3JlbW90ZSBzdG9y
YWdlIGhlbHBlcl0gbWVjaGFuaXNtIChhZGRlZAppbiBjY2FjaGUgNC4xMykgZm9yIEhUVFAvUmVk
aXMgc3RvcmFnZSBpbnN0ZWFkLgoKPT09IFJlbW92ZWQgZnVuY3Rpb25hbGl0eQoKLSBSZW1vdmVk
IHRoZSBgY3BwX2V4dGVuc2lvbmAgKGBDQ0FDSEVfRVhURU5TSU9OYCkgY29uZmlndXJhdGlvbiBv
cHRpb24gc2luY2UKICBjY2FjaGUgbm93IHByb2Nlc3NlcyBwcmVwcm9jZXNzb3Igb3V0cHV0IGRp
cmVjdGx5IGluIG1lbW9yeSBpbnN0ZWFkIG9mIHVzaW5nCiAgaW50ZXJtZWRpYXRlIGZpbGVzLiAr
CiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IEpvZWwgUm9zZGFobF1fIwoKPT09IE5ldyBmZWF0
dXJlcyBhbmQgaW1wcm92ZW1lbnRzCgotIEFkZGVkIHN1cHBvcnQgZm9yIHRoZSBRQ0MgKFFOWCkg
Y29tcGlsZXIuICsKICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgSm95IFdhbmddXyMKCi0gQWRk
ZWQgbGltaXRlZCBzdXBwb3J0IGZvciBjYWNoaW5nIFNBUklGIGRpYWdub3N0aWNzOgogIGAtZmRp
YWdub3N0aWNzLWZvcm1hdD1zYXJpZi1zdGRlcnJgIGFuZAogIGAtZmRpYWdub3N0aWNzLXthZGQs
c2V0fS1vdXRwdXQ9c2FyaWY6ZmlsZT0uLi5gIGZvciBHQ0MsIGAvZXhwZXJpbWVudGFsOmxvZ2AK
ICBmb3IgTVNWQy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2VsIFJvc2RhaGwsIEth
cmwgRmVzc2VsIGFuZCBMZWFuZGVyIFNjaHVsdGVuXV8jCgotIEFkZGVkIGF1dG9tYXRpYyBkZXBl
bmQgbW9kZSBmb3IgTlZDQyBvbiBXaW5kb3dzLiArCiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5
IFhpbmcgWGl3ZW5dXyMKCi0gQWRkZWQgc3VwcG9ydCBmb3IgYEBsYXlvdXQ9bG9jYWxgIGluIHRo
ZSBmaWxlIHN0b3JhZ2UgYmFja2VuZCwgYWxsb3dpbmcgYSBjb3B5CiAgb3IgcmVhZC1vbmx5IG1v
dW50IG9mIGEgbG9jYWwgY2FjaGUgdG8gYmUgdXNlZCBhcyByZW1vdGUgc3RvcmFnZS4gKwogIFtz
bWFsbF0jX1tjb250cmlidXRlZCBieSBKb2VsIFJvc2RhaGxdXyMKCi0gRXh0ZW5kZWQgdGhlIHJl
bW90ZSBzdG9yYWdlIGhlbHBlciBwcm90b2NvbCB3aXRoIGFuIGBleGlzdHNgIG9wZXJhdGlvbiwK
ICBhdm9pZGluZyB0cmFuc2ZlciBvZiBhbHJlYWR5IHN0b3JlZCB2YWx1ZXMgaW4gcmVzaGFyZSBt
b2RlLCBhbmQgYW4gYGluZm9gCiAgb3BlcmF0aW9uIGZvciByZXBvcnRpbmcgdGhlIGhlbHBlcidz
IGlkZW50aXR5IGFuZCBkaWFnbm9zdGljcy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBK
b2VsIFJvc2RhaGxdXyMKCi0gQWRkZWQgYSBgLS1kcnktcnVuYCBvcHRpb24gZm9yIHByZXZpZXdp
bmcgY2xlYW51cCwgZXZpY3Rpb24gYW5kIGRpcmVjdG9yeQogIHRyaW1taW5nIG9wZXJhdGlvbnMg
d2l0aG91dCByZW1vdmluZyBmaWxlcy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2Vs
IFJvc2RhaGxdXyMKCi0gQWRkZWQgc3VwcG9ydCBmb3IgcmV3cml0aW5nIGFic29sdXRlIHByb2Zp
bGUgZGF0YSBmaWxlIHBhdGhzIHRvIHJlbGF0aXZlLAogIGltcHJvdmluZyBjYWNoZSBzaGFyaW5n
IGJldHdlZW4gZGlmZmVyZW50IGRpcmVjdG9yeSB0cmVlcy4gKwogIFtzbWFsbF0jX1tjb250cmli
dXRlZCBieSBHaXRIdWIgdXNlciBtYXJreWFuZzkyXV8jCgotIEFkZGVkIHN1cHBvcnQgZm9yIHJl
ZmxpbmtpbmcgYC5kd29gIGZpbGVzIHdoZW4gZmlsZSBjbG9uaW5nIGlzIGVuYWJsZWQuICsKICBb
c21hbGxdI19bY29udHJpYnV0ZWQgYnkgRmFiaWFuIFBhcnplZmFsbF1fIwoKLSBBZGRlZCBkZXRl
Y3Rpb24gb2YgQzIzIGAjZW1iZWRgIGRpcmVjdGl2ZXMgaW4gZGlyZWN0IGFuZCBkZXBlbmQgbW9k
ZSBhbmQgb2YKICBhc3NlbWJsZXIgYC5pbmNiaW5gIGRpcmVjdGl2ZXMgaW4gZGVwZW5kIG1vZGUs
IHByZXZlbnRpbmcgZmFsc2UgY2FjaGUgaGl0cy4gKwogIFtzbWFsbF0jI19bY29udHJpYnV0ZWQg
YnkgSm9lbCBSb3NkYWhsIGFuZCBIYWFyaXMgUmFobWFuXV8jIwoKLSBBZGRlZCBzdXBwb3J0IGZv
ciBgLVdwLGAgb3B0aW9ucyB3aXRoIG11bHRpcGxlIG1hY3JvIGRlZmluaXRpb25zLiArCiAgW3Nt
YWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IEdpdEh1YiB1c2VyIHN1Ym90YWNdXyMKCi0gQ2NhY2hlIG5v
dyBoYXNoZXMgdGhlIGNvbnRlbnRzIG9mIENsYW5nIG1vZHVsZSBmaWxlcyBzcGVjaWZpZWQgd2l0
aAogIGAtZm1vZHVsZS1maWxlPWAsIHByZXZlbnRpbmcgZmFsc2UgY2FjaGUgaGl0cyB3aGVuIGEg
bW9kdWxlIGNoYW5nZXMuICsKICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgR2l0SHViIHVzZXIg
UmVkTmljU3RvbmVdXyMKCi0gQ2xlYW51cCBhbmQgZXZpY3Rpb24gb3BlcmF0aW9ucyBub3cgcHJp
bnQgdGhlIGFtb3VudCBvZiBkYXRhIGFuZCBudW1iZXIgb2YKICBmaWxlcyByZW1vdmVkLiArCiAg
W3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IEpvZWwgUm9zZGFobF1fIwoKLSBJbmNyZWFzZWQgdGhl
IG1heGltdW0gbnVtYmVyIG9mIHJhdyBmaWxlcyBzdG9yZWQgaW4gYSBjYWNoZWQgcmVzdWx0IHRv
IDI1Ni4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2VsIFJvc2RhaGxdXyMKCi0gTW9k
ZXJuaXplZCB1c2Ugb2YgQysrIHR5cGUgdHJhaXRzLiArCiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVk
IGJ5IEdyZWdvciBKYXNueV1fIwoKLSBJbXByb3ZlZCBwb3J0YWJpbGl0eSBvZiBjb21waWxlciBl
eGl0IHN0YXR1cyBoYW5kbGluZy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2VsIFJv
c2RhaGxdXyMKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBjaGFyYWN0
ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1lbnQgdG8g
dGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVfNC4xMy42LmJiID0+IGNjYWNo
ZV80LjE0LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2Nh
Y2hlL3tjY2FjaGVfNC4xMy42LmJiID0+IGNjYWNoZV80LjE0LmJifSAoOTMlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTMuNi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTQuYmIKc2ltaWxhcml0eSBpbmRleCA5
MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMy42
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjE0LmJi
CmluZGV4IDIxYmQxOTNjMjAuLjZkOTIyZDg1MTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTMuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY2NhY2hlL2NjYWNoZV80LjE0LmJiCkBAIC0xNiw3ICsxNiw3IEBAIERFUEVORFMgPSAienN0
ZCBmbXQgeHhoYXNoIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92
JHtQVn0vJHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDQyYWNlOTVkZWMx
NDU4M2ZiOGFmMTllZDExNzkxOTk5NWJkOTEwMzc2ZjUyZDliNmY1NDYwNDZiNzkyZGZiNyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJmY2E2M2YzNmE4M2ZiMmY0YjNjYzRjMDFiMmM3YTFjZDZlMzYy
OWU3ZjdiZDFlMDFhMmViODgxMGY5NDdjNWFiIgogCiBpbmhlcml0IGNtYWtlIGdpdGh1Yi1yZWxl
YXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============5544638614672252168==--

