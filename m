Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229F3C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:59:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13263.1787565577482243841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hTycyely;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47db714766aso2483618f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787565575; x=1788170375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM32N1QmWhAWmBF+eItSFckFjGfwY3ukW/w5VVjfa/s=;
        b=hTycyely/iaRLb7huCdXkqF2iC5A+h0DVm2ZLCxpSrZNr3a7cVx3RFZgnFpPr16Bby
         2/w41i4PSCZ+QIGEjI3VKz53JgJY5GiSeA/IdROqDMBlf1H/liF+kIeuiw/PBPyElWNT
         Oh3Unsakab48FKzFo4NFK8QuCqq0mDkcUfeus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565575; x=1788170375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cM32N1QmWhAWmBF+eItSFckFjGfwY3ukW/w5VVjfa/s=;
        b=b/ISlT6ObRFz1nir5mT3JkZ3mbFNWzDISBy0G4bSrbI0pl1FQkXKfo80opBnGVplGB
         brw968j43LI3lIwkCfPdtjhtHFq0V0UizrkeagPv3LMUdVW2ilWAN1nH53dmi6REfVxq
         4IxAUWFpMvqt1uo+d/ApiJ+HuXJernDu2FIbvSY01+iZMNBV2+L3ruUIpGDrWcJdJw0q
         BdK/S3lIkuj9GiX69mmHtBghg2qoOZCB840W35VUpee+qdBrvnHyVSazZl1TnvxPxsoX
         urR+YGaupjLj1DfD/wJZam8/w1iguOANbmLAvVpfXfeiroikyFJYhcHeipcCtH3I/EM/
         dk9w==
X-Gm-Message-State: AFuF++nJfRg2xKMe0cq4TZ0oNBlWxrQTsrJ+e/UCHQ8meqgJf0ZFuWFG
	GuYPH2P8Qo/cWG+Bt48QrWyYbQ+TkBSTe/iCrblq+Xw1zcjFedZV+DX/vZf9fKIta5T4k7JH/+0
	gLpqu+Q0=
X-Gm-Gg: AR+sD10wkjniM4f0gUYCdhb6xPfXr25gO6RKtf3FVJnKHy4C0truh7T3hAHQUbcwifk
	eD7J4+5aa4OfSOqFgSTsIVyV5NlarYNc85TnjocgUlNiyQLKJr1VajoR7pG8HXUvQ54yAlHfc9R
	41AHcpZOyZrXJPQNRYIG7RcVv043D0S+AaX5kd2OMBO+5Sj80wkt6F8KC0UpQPWPXE9E1l2KTiG
	yiqPrfJAVeXsHW+RM77LcpQaIygz01Aiksir0ByhhzsQBNo51zVhIh/9++QKpZVEDtVGH+y80p/
	YyRKefFQXjyc0a8oKz0MxhDfYzG36EcPAIJhPLLws1rnBvv9DBIPRWilSCcUacRq1ICmaLeGWgk
	LbB9FFL1tanalFkMIW9M/m+YYgvzHNsZ8N7yOdC5VzNsaigsd5VIWIXmVjqHEWQpJcx6w9Huyf7
	Kh1ahSRcgSIQUkHsj5wHRKqpMH3FJAZ51rEr3y5hGgEEK3X5IfRbySpYoBlrKUQnLfiZ9lAbXuu
	VpP7vPS22BjEWePYQ==
X-Received: by 2002:a5d:5f07:0:b0:47f:ece1:1eca with SMTP id ffacd0b85a97d-482c102d922mr26236769f8f.1.1787565575485;
        Mon, 24 Aug 2026 02:59:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0869bsm7687850f8f.25.2026.08.24.02.59.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:59:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] ccache: upgrade 4.13.6 -> 4.14
Date: Mon, 24 Aug 2026 10:59:31 +0100
Message-ID: <20260824095933.2906404-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244079

=== Removed functionality

- Removed the `cpp_extension` (`CCACHE_EXTENSION`) configuration option since
  ccache now processes preprocessor output directly in memory instead of using
  intermediate files. +

=== New features and improvements

- Added support for the QCC (QNX) compiler. +

- Added limited support for caching SARIF diagnostics:
  `-fdiagnostics-format=sarif-stderr` and
  `-fdiagnostics-{add,set}-output=sarif:file=...` for GCC, `/experimental:log`
  for MSVC.
- Added automatic depend mode for NVCC on Windows.
- Added support for `@layout=local` in the file storage backend, allowing a copy
  or read-only mount of a local cache to be used as remote storage.
- Extended the remote storage helper protocol with an `exists` operation,
  avoiding transfer of already stored values in reshare mode, and an `info`
  operation for reporting the helper's identity and diagnostics.
- Added a `--dry-run` option for previewing cleanup, eviction and directory
  trimming operations without removing files.
- Added support for rewriting absolute profile data file paths to relative,
  improving cache sharing between different directory trees. +
- Added support for reflinking `.dwo` files when file cloning is enabled. +
- Added detection of C23 `#embed` directives in direct and depend mode and of
  assembler `.incbin` directives in depend mode, preventing false cache hits.
- Added support for `-Wp,` options with multiple macro definitions.
- Ccache now hashes the contents of Clang module files specified with
  `-fmodule-file=`, preventing false cache hits when a module changes.
- Cleanup and eviction operations now print the amount of data and number of
  files removed.
- Increased the maximum number of raw files stored in a cached result to 256.
- Modernized use of C++ type traits.
- Improved portability of compiler exit status handling.
- Made path rewriting on Windows case-insensitive and Unicode-aware.
- Made `ignore_headers_in_manifest` match case-insensitively on Windows.
- Reduced the number of system calls for IPC requests.

=== Bug fixes

- Fixed `base_dir` path rewriting when using MSVC's `/Yu` option: paths are no
  longer rewritten to relative when using a precompiled header, since MSVC then
  does not like relative paths for the `/Yu` and `/FI` arguments.
- Fixed handling of compiler options when one recognized option is a prefix of
  another.
- Fixed `base_dir` handling for include paths in preprocessor mode (regression
  in ccache 4.12.2).
- Fixed handling of Clang 22's `--warning-suppression-mappings` option.
- Fixed error handling when a Clang configuration file cannot be hashed.
- Fixed a remote storage configuration with `read_only=false` being treated as
  read-only.
- Fixed interrupted system calls when communicating with remote storage
  helpers.
- Avoided a race if starting a remote storage helper takes an unexpectedly long
  time.
- Avoided spawning and waiting for a remote storage helper when IPC access is
  denied by a sandbox.
- Fixed the free space check for the inode cache.
- Fixed handling of empty atomic file writes and improved robustness if
  opening an atomic file stream fails.
- Fixed a size overflow when allocating very large files on Windows.
- Fixed thread safety of time conversion fallbacks on systems without
  `gmtime_r` and `localtime_r`.
- Fixed handling of systems that report zero available hardware threads.
- Fixed reporting of errors from `posix_spawnp`.
- Fixed the statistics counter used when a Clang sanitize ignorelist cannot be
  read.

=== Build improvements

- Fixed building with Clang 23.
- Added missing CMake probe for `gmtime_r`.

=== Documentation improvements

- Improved `base_dir` documentation.
- Clarified syntax of configuration options that take path lists.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ccache/{ccache_4.13.6.bb => ccache_4.14.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.6.bb => ccache_4.14.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.6.bb b/meta/recipes-devtools/ccache/ccache_4.14.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.6.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.bb
index 21bd193c20e..6d922d85147 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "d42ace95dec14583fb8af19ed117919995bd910376f52d9b6f546046b792dfb7"
+SRC_URI[sha256sum] = "fca63f36a83fb2f4b3cc4c01b2c7a1cd6e3629e7f7bd1e01a2eb8810f947c5ab"
 
 inherit cmake github-releases
 

