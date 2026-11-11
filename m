Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3803.1794377113441477539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NL9JRPev;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TOBEQjQD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1c935dcab-4455ea10-0f97-436d-91ba-e4b6406ed4bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7kjJWBiCTvy+qanjFgsvhVXHkhWNATOc6n9O4utV1yA=;
	b=NL9JRPevHCYPgmpSxObAAg9K1QsoztqU1Moozabz892CzjmFEbwdpWnkq+pB1Az3
	Xs5ROw2uxX71vJ9T1P6xRx+Bbm85fYHi/U8qvItbnuCrRYDIEVmNjNAcke/VnVZp5wJ
	C4mK2V0JP2PgZo11jLwsSxtxeX5XrJNlNG1eiAPQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7kjJWBiCTvy+qanjFgsvhVXHkhWNATOc6n9O4utV1yA=;
	b=TOBEQjQD4mBl6b+57r0gSYgBJg1l1ilVHC+zOf3DDOZy4kq+t4c3Jr423nsNzyqK
	nUR61Z3AHeZMsix4rOCeREufLSCSsVThV1Pi7mJlwISRkDRqT4Tc9qqpTkOAudejMbA
	7xLZdQcvFjWAMbsiwlhX1xdGvyqv6V0Vq4w8DwVE=
Content-Type: multipart/mixed; boundary="===============0798386916199015010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lz4: upgrading to 1.11.1 FAILED
Message-ID: <010101a1c935dcab-4455ea10-0f97-436d-91ba-e4b6406ed4bd-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249964

--===============0798386916199015010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lz4* to *1.11.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lz4-upgrade-1.10.0-1.11.1.patch
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
From 58f0192ecafbfbf8d7e08f6ff7d5c13d020deacb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 06:05:03 +0000
Subject: [PATCH] lz4: upgrade 1.10.0 -> 1.11.1

v1.11.1
fix  : `LZ4_resetStreamHC()` could write out of bounds at levels >= 10, on a
state containing garbage (since v1.11.0)
perf : faster decompression on ppc64 (+12% to +24% on silesia),
`LZ4_FAST_DEC_LOOP` enabled, by @runlevel5
perf : `lz4 -l` compresses small files up to 10x faster : no more threads than
blocks
api  : restored the unprefixed lz4frame enums and types
(`LZ4F_ENABLE_OBSOLETE_ENUMS`), employed by zstd, now deprecated (compilation
warning), reported by @diizzyy
cli  : help (`-h`, `-H`, `--help`) outputs to stdout, requested by @tansy
cli  : `--list` reads standard input again (since v1.10.0)
cli  : various fixes (`--list`, `--stdout`, `--force`, multiple inputs, Windows
pipes, modification time, output creation), by @lee3Q, @immanuwell and
@rudycelekli
build: `lz4file.h` usable from cmake (since v1.10.0) and meson installations,
reported by @rudycelekli
build: MinGW builds with clang and lld (since v1.11.0), reported by @tansy
build: `make` with `BUILD_STATIC=no` or `BUILD_SHARED=no` (since v1.11.0), by
@xry111

v1.11.0
fix  : data corruption in valid usage : ring buffer decoding
(`LZ4_decoderRingBufferSize()`, since v1.9.0), rare cases of streaming or
`destSize` compression, one reported by @freedom-winds
fix  : single-thread `lz4` could truncate the decoding of concatenated frames
with block checksums
fix  : multithreaded decompression could write out of bounds after 2^31 frames
(since v1.10.0), by @arshsmith1
fix  : `LZ4F_compressBegin_usingDict()` ignored the dictionary with independent
blocks
fix  : some periodic data compressed up to 30x worse at fast levels, and very
slowly at level 12, reported by @martinus
fix  : invalid arguments (negative sizes, `NULL`, invalid `blockSizeID`, extreme
levels) no longer crash nor overflow, by @arthuz-th, @jaypatrickhoward,
@louislafosse, @akashdeshmukh-git, @rinsuki
fix  : lz4file reports truncated files and write failures, and accepts files <
19 bytes, by @axiqia
perf : faster decompression on aarch64 and x86-64 (up to +19%, +4% on
silesia.tar), `LZ4_FAST_DEC_LOOP` on aarch64 with clang and on riscv64, by
@Nicoshev and @arpadpanyik-arm
perf : faster compression of small blocks at fast levels, with reused states (up
to +80%) or dictionaries (up to +35%), partly proposed by @BiplabRaut
perf : faster levels 11 and 12 (+8% to +27%), level 2 compresses ~0.8% better
perf : x86 builds avoid the JCC erratum : up to +12% compression and +31%
decompression on Intel Skylake-family cpus
api  : multithreaded lz4frame compression (experimental
`LZ4F_preferences_t.nbWorkers`) : output independent of the nb of workers and of
the context's history
api  : random access within frames and lz4 files : `LZ4F_resumeFrame()`,
`LZ4F_seek()`, `LZ4F_tell()` (static)
api  : `LZ4_decompress_safe()` returns distinct error codes : `-1` malformed
input, `-2` `dstCapacity` too small, `-3` missing dictionary
api  : lz4frame compression accepts any `dstCapacity`, and only fails if the
output doesn't fit
api  : removed from headers : functions deprecated since v1.7.x / v1.8.0 (still
exported by liblz4), unprefixed lz4frame enums ; `LZ4_resetStream()` and
`LZ4_resetStreamHC()` are deprecated
api  : `LZ4F_compressOptions_t` must be zero-initialized ; reserved fields are
scalars (flatten positional initializers) ; `LZ4F_uncompressedUpdate()`
deprecated (use `.uncompressed`)
api  : custom allocators for lz4file (`_advanced()` functions),
`LZ4_USER_MEMORY_FUNCTIONS` also for lz4frame and lz4file ; `LZ4F_cctx_size()`
and `LZ4F_dctx_size()` by @felixhandte
api  : HC states include the buffer of levels 10+ (+64 KB per state) : no
allocation during compression
cli  : multithreaded compression relies on liblz4 : same output with any nb of
threads and without multithreading support ; `-T#` within a memory budget
(`--memory=#`) ; new `--single-thread`
cli  : decodes Firefox's mozlz4 files, proposed by @UnitedMarsupials, and legacy
frames with the Linux kernel end marker, requested by @benjarobin (frame format
documentation by @Artoria2e5)
cli  : safer file handling : an output identical to the input is refused, a
source modified during compression is detected, `--rm` keeps the source after
failures, by @Furan666, @Nexory and @immanuwell
cli  : benchmark (`-b`) measures frames, compressed as `lz4` does with the same
options
cli  : various fixes (`--list`, legacy format, benchmark, `-t -m`, numeric
arguments), by @tansy, @jmestwa-coder, @akashdeshmukh-git, @arshsmith1, @jlee303
and @Nexory
build: dynamic library multithreaded by default, static library single-threaded
; cmake `lz4` multithreaded
build: cmake : exported `lz4::lz4` target by @dg0yt, CMake 4 support by
@GeorgH93, `CMAKE_POSITION_INDEPENDENT_CODE` by @ds-sloth
build: cmake : as a subproject, the `lz4` program is no longer built by default
(`-DLZ4_BUILD_CLI=ON` restores it), by @crueter
build: reproducible static library by @rpurdie, AIX support by @shubhamhii,
meson fixes by @grobian, @bgilbert and @eli-schwartz, other fixes by @hot

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-support/lz4/{lz4_1.10.0.bb => lz4_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/lz4/{lz4_1.10.0.bb => lz4_1.11.1.bb} (96%)

diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.11.1.bb
similarity index 96%
rename from meta/recipes-support/lz4/lz4_1.10.0.bb
rename to meta/recipes-support/lz4/lz4_1.11.1.bb
index 5a39f89871..4dc4a6d362 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.11.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
 
 PE = "1"
 
-SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
+SRCREV = "aa4647fad575d01a874aaaadcdbe8e6a40e072f5"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https;tag=v${PV} \
            file://reproducibility.patch \
-- 
2.47.1


--===============0798386916199015010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-2bebd39cf62b3e964a18b44809a97448e1b2ffae"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2bebd39cf62b3e964a18b44809a97448e1b2ffae"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 255 Local 240 Mirrors 0 Missed 15 Current 336 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 505 of 591 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running task 1050 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_recipe_qa)
NOTE: Running task 1408 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_create_recipe_spdx)
NOTE: recipe lz4-1_1.11.1-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.11.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lz4-1_1.11.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1478 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_fetch)
NOTE: recipe lz4-1_1.11.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lz4-1_1.11.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1479 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_unpack)
NOTE: Running task 1480 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.11.1-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_patch)
NOTE: recipe lz4-1_1.11.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.11.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1481 tasks of which 1475 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261111060445.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261111060445.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.1/temp/log.do_patch.1553449
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: lz4-1_1.11.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4/reproducibility.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.1/sources/lz4-1.11.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.1/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Applying patch reproducibility.patch
patching file lib/Makefile
Hunk #1 FAILED at 55.
Hunk #2 FAILED at 102.
2 out of 2 hunks FAILED -- rejects in file lib/Makefile
Patch reproducibility.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.1/temp/log.do_patch.1553449
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.1.bb:do_patch) failed with exit code '1'

--===============0798386916199015010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="lz4-changelog.txt"

v1.11.1
fix  : `LZ4_resetStreamHC()` could write out of bounds at levels >= 10, on a
state containing garbage (since v1.11.0)
perf : faster decompression on ppc64 (+12% to +24% on silesia),
`LZ4_FAST_DEC_LOOP` enabled, by @runlevel5
perf : `lz4 -l` compresses small files up to 10x faster : no more threads than
blocks
api  : restored the unprefixed lz4frame enums and types
(`LZ4F_ENABLE_OBSOLETE_ENUMS`), employed by zstd, now deprecated (compilation
warning), reported by @diizzyy
cli  : help (`-h`, `-H`, `--help`) outputs to stdout, requested by @tansy
cli  : `--list` reads standard input again (since v1.10.0)
cli  : various fixes (`--list`, `--stdout`, `--force`, multiple inputs, Windows
pipes, modification time, output creation), by @lee3Q, @immanuwell and
@rudycelekli
build: `lz4file.h` usable from cmake (since v1.10.0) and meson installations,
reported by @rudycelekli
build: MinGW builds with clang and lld (since v1.11.0), reported by @tansy
build: `make` with `BUILD_STATIC=no` or `BUILD_SHARED=no` (since v1.11.0), by
@xry111

v1.11.0
fix  : data corruption in valid usage : ring buffer decoding
(`LZ4_decoderRingBufferSize()`, since v1.9.0), rare cases of streaming or
`destSize` compression, one reported by @freedom-winds
fix  : single-thread `lz4` could truncate the decoding of concatenated frames
with block checksums
fix  : multithreaded decompression could write out of bounds after 2^31 frames
(since v1.10.0), by @arshsmith1
fix  : `LZ4F_compressBegin_usingDict()` ignored the dictionary with independent
blocks
fix  : some periodic data compressed up to 30x worse at fast levels, and very
slowly at level 12, reported by @martinus
fix  : invalid arguments (negative sizes, `NULL`, invalid `blockSizeID`, extreme
levels) no longer crash nor overflow, by @arthuz-th, @jaypatrickhoward,
@louislafosse, @akashdeshmukh-git, @rinsuki
fix  : lz4file reports truncated files and write failures, and accepts files <
19 bytes, by @axiqia
perf : faster decompression on aarch64 and x86-64 (up to +19%, +4% on
silesia.tar), `LZ4_FAST_DEC_LOOP` on aarch64 with clang and on riscv64, by
@Nicoshev and @arpadpanyik-arm
perf : faster compression of small blocks at fast levels, with reused states (up
to +80%) or dictionaries (up to +35%), partly proposed by @BiplabRaut
perf : faster levels 11 and 12 (+8% to +27%), level 2 compresses ~0.8% better
perf : x86 builds avoid the JCC erratum : up to +12% compression and +31%
decompression on Intel Skylake-family cpus
api  : multithreaded lz4frame compression (experimental
`LZ4F_preferences_t.nbWorkers`) : output independent of the nb of workers and of
the context's history
api  : random access within frames and lz4 files : `LZ4F_resumeFrame()`,
`LZ4F_seek()`, `LZ4F_tell()` (static)
api  : `LZ4_decompress_safe()` returns distinct error codes : `-1` malformed
input, `-2` `dstCapacity` too small, `-3` missing dictionary
api  : lz4frame compression accepts any `dstCapacity`, and only fails if the
output doesn't fit
api  : removed from headers : functions deprecated since v1.7.x / v1.8.0 (still
exported by liblz4), unprefixed lz4frame enums ; `LZ4_resetStream()` and
`LZ4_resetStreamHC()` are deprecated
api  : `LZ4F_compressOptions_t` must be zero-initialized ; reserved fields are
scalars (flatten positional initializers) ; `LZ4F_uncompressedUpdate()`
deprecated (use `.uncompressed`)
api  : custom allocators for lz4file (`_advanced()` functions),
`LZ4_USER_MEMORY_FUNCTIONS` also for lz4frame and lz4file ; `LZ4F_cctx_size()`
and `LZ4F_dctx_size()` by @felixhandte
api  : HC states include the buffer of levels 10+ (+64 KB per state) : no
allocation during compression
cli  : multithreaded compression relies on liblz4 : same output with any nb of
threads and without multithreading support ; `-T#` within a memory budget
(`--memory=#`) ; new `--single-thread`
cli  : decodes Firefox's mozlz4 files, proposed by @UnitedMarsupials, and legacy
frames with the Linux kernel end marker, requested by @benjarobin (frame format
documentation by @Artoria2e5)
cli  : safer file handling : an output identical to the input is refused, a
source modified during compression is detected, `--rm` keeps the source after
failures, by @Furan666, @Nexory and @immanuwell
cli  : benchmark (`-b`) measures frames, compressed as `lz4` does with the same
options
cli  : various fixes (`--list`, legacy format, benchmark, `-t -m`, numeric
arguments), by @tansy, @jmestwa-coder, @akashdeshmukh-git, @arshsmith1, @jlee303
and @Nexory
build: dynamic library multithreaded by default, static library single-threaded
; cmake `lz4` multithreaded
build: cmake : exported `lz4::lz4` target by @dg0yt, CMake 4 support by
@GeorgH93, `CMAKE_POSITION_INDEPENDENT_CODE` by @ds-sloth
build: cmake : as a subproject, the `lz4` program is no longer built by default
(`-DLZ4_BUILD_CLI=ON` restores it), by @crueter
build: reproducible static library by @rpurdie, AIX support by @shubhamhii,
meson fixes by @grobian, @bgilbert and @eli-schwartz, other fixes by @hotschmoe,
@iwamatsu, @doraorak, @JCash and @brainy
port : RISC-V with `Zicclsm` uses unaligned memory accesses, by @Polaris-911

--===============0798386916199015010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lz4-upgrade-1.10.0-1.11.1.patch"

RnJvbSA1OGYwMTkyZWNhZmJmYmY4ZDdlMDhmNmZmN2Q1YzEzZDAyMGRlYWNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDY6MDU6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ejQ6IHVwZ3JhZGUgMS4xMC4wIC0+IDEuMTEuMQoKdjEuMTEuMQpmaXggIDogYExaNF9yZXNldFN0
cmVhbUhDKClgIGNvdWxkIHdyaXRlIG91dCBvZiBib3VuZHMgYXQgbGV2ZWxzID49IDEwLCBvbiBh
CnN0YXRlIGNvbnRhaW5pbmcgZ2FyYmFnZSAoc2luY2UgdjEuMTEuMCkKcGVyZiA6IGZhc3RlciBk
ZWNvbXByZXNzaW9uIG9uIHBwYzY0ICgrMTIlIHRvICsyNCUgb24gc2lsZXNpYSksCmBMWjRfRkFT
VF9ERUNfTE9PUGAgZW5hYmxlZCwgYnkgQHJ1bmxldmVsNQpwZXJmIDogYGx6NCAtbGAgY29tcHJl
c3NlcyBzbWFsbCBmaWxlcyB1cCB0byAxMHggZmFzdGVyIDogbm8gbW9yZSB0aHJlYWRzIHRoYW4K
YmxvY2tzCmFwaSAgOiByZXN0b3JlZCB0aGUgdW5wcmVmaXhlZCBsejRmcmFtZSBlbnVtcyBhbmQg
dHlwZXMKKGBMWjRGX0VOQUJMRV9PQlNPTEVURV9FTlVNU2ApLCBlbXBsb3llZCBieSB6c3RkLCBu
b3cgZGVwcmVjYXRlZCAoY29tcGlsYXRpb24Kd2FybmluZyksIHJlcG9ydGVkIGJ5IEBkaWl6enl5
CmNsaSAgOiBoZWxwIChgLWhgLCBgLUhgLCBgLS1oZWxwYCkgb3V0cHV0cyB0byBzdGRvdXQsIHJl
cXVlc3RlZCBieSBAdGFuc3kKY2xpICA6IGAtLWxpc3RgIHJlYWRzIHN0YW5kYXJkIGlucHV0IGFn
YWluIChzaW5jZSB2MS4xMC4wKQpjbGkgIDogdmFyaW91cyBmaXhlcyAoYC0tbGlzdGAsIGAtLXN0
ZG91dGAsIGAtLWZvcmNlYCwgbXVsdGlwbGUgaW5wdXRzLCBXaW5kb3dzCnBpcGVzLCBtb2RpZmlj
YXRpb24gdGltZSwgb3V0cHV0IGNyZWF0aW9uKSwgYnkgQGxlZTNRLCBAaW1tYW51d2VsbCBhbmQK
QHJ1ZHljZWxla2xpCmJ1aWxkOiBgbHo0ZmlsZS5oYCB1c2FibGUgZnJvbSBjbWFrZSAoc2luY2Ug
djEuMTAuMCkgYW5kIG1lc29uIGluc3RhbGxhdGlvbnMsCnJlcG9ydGVkIGJ5IEBydWR5Y2VsZWts
aQpidWlsZDogTWluR1cgYnVpbGRzIHdpdGggY2xhbmcgYW5kIGxsZCAoc2luY2UgdjEuMTEuMCks
IHJlcG9ydGVkIGJ5IEB0YW5zeQpidWlsZDogYG1ha2VgIHdpdGggYEJVSUxEX1NUQVRJQz1ub2Ag
b3IgYEJVSUxEX1NIQVJFRD1ub2AgKHNpbmNlIHYxLjExLjApLCBieQpAeHJ5MTExCgp2MS4xMS4w
CmZpeCAgOiBkYXRhIGNvcnJ1cHRpb24gaW4gdmFsaWQgdXNhZ2UgOiByaW5nIGJ1ZmZlciBkZWNv
ZGluZwooYExaNF9kZWNvZGVyUmluZ0J1ZmZlclNpemUoKWAsIHNpbmNlIHYxLjkuMCksIHJhcmUg
Y2FzZXMgb2Ygc3RyZWFtaW5nIG9yCmBkZXN0U2l6ZWAgY29tcHJlc3Npb24sIG9uZSByZXBvcnRl
ZCBieSBAZnJlZWRvbS13aW5kcwpmaXggIDogc2luZ2xlLXRocmVhZCBgbHo0YCBjb3VsZCB0cnVu
Y2F0ZSB0aGUgZGVjb2Rpbmcgb2YgY29uY2F0ZW5hdGVkIGZyYW1lcwp3aXRoIGJsb2NrIGNoZWNr
c3VtcwpmaXggIDogbXVsdGl0aHJlYWRlZCBkZWNvbXByZXNzaW9uIGNvdWxkIHdyaXRlIG91dCBv
ZiBib3VuZHMgYWZ0ZXIgMl4zMSBmcmFtZXMKKHNpbmNlIHYxLjEwLjApLCBieSBAYXJzaHNtaXRo
MQpmaXggIDogYExaNEZfY29tcHJlc3NCZWdpbl91c2luZ0RpY3QoKWAgaWdub3JlZCB0aGUgZGlj
dGlvbmFyeSB3aXRoIGluZGVwZW5kZW50CmJsb2NrcwpmaXggIDogc29tZSBwZXJpb2RpYyBkYXRh
IGNvbXByZXNzZWQgdXAgdG8gMzB4IHdvcnNlIGF0IGZhc3QgbGV2ZWxzLCBhbmQgdmVyeQpzbG93
bHkgYXQgbGV2ZWwgMTIsIHJlcG9ydGVkIGJ5IEBtYXJ0aW51cwpmaXggIDogaW52YWxpZCBhcmd1
bWVudHMgKG5lZ2F0aXZlIHNpemVzLCBgTlVMTGAsIGludmFsaWQgYGJsb2NrU2l6ZUlEYCwgZXh0
cmVtZQpsZXZlbHMpIG5vIGxvbmdlciBjcmFzaCBub3Igb3ZlcmZsb3csIGJ5IEBhcnRodXotdGgs
IEBqYXlwYXRyaWNraG93YXJkLApAbG91aXNsYWZvc3NlLCBAYWthc2hkZXNobXVraC1naXQsIEBy
aW5zdWtpCmZpeCAgOiBsejRmaWxlIHJlcG9ydHMgdHJ1bmNhdGVkIGZpbGVzIGFuZCB3cml0ZSBm
YWlsdXJlcywgYW5kIGFjY2VwdHMgZmlsZXMgPAoxOSBieXRlcywgYnkgQGF4aXFpYQpwZXJmIDog
ZmFzdGVyIGRlY29tcHJlc3Npb24gb24gYWFyY2g2NCBhbmQgeDg2LTY0ICh1cCB0byArMTklLCAr
NCUgb24Kc2lsZXNpYS50YXIpLCBgTFo0X0ZBU1RfREVDX0xPT1BgIG9uIGFhcmNoNjQgd2l0aCBj
bGFuZyBhbmQgb24gcmlzY3Y2NCwgYnkKQE5pY29zaGV2IGFuZCBAYXJwYWRwYW55aWstYXJtCnBl
cmYgOiBmYXN0ZXIgY29tcHJlc3Npb24gb2Ygc21hbGwgYmxvY2tzIGF0IGZhc3QgbGV2ZWxzLCB3
aXRoIHJldXNlZCBzdGF0ZXMgKHVwCnRvICs4MCUpIG9yIGRpY3Rpb25hcmllcyAodXAgdG8gKzM1
JSksIHBhcnRseSBwcm9wb3NlZCBieSBAQmlwbGFiUmF1dApwZXJmIDogZmFzdGVyIGxldmVscyAx
MSBhbmQgMTIgKCs4JSB0byArMjclKSwgbGV2ZWwgMiBjb21wcmVzc2VzIH4wLjglIGJldHRlcgpw
ZXJmIDogeDg2IGJ1aWxkcyBhdm9pZCB0aGUgSkNDIGVycmF0dW0gOiB1cCB0byArMTIlIGNvbXBy
ZXNzaW9uIGFuZCArMzElCmRlY29tcHJlc3Npb24gb24gSW50ZWwgU2t5bGFrZS1mYW1pbHkgY3B1
cwphcGkgIDogbXVsdGl0aHJlYWRlZCBsejRmcmFtZSBjb21wcmVzc2lvbiAoZXhwZXJpbWVudGFs
CmBMWjRGX3ByZWZlcmVuY2VzX3QubmJXb3JrZXJzYCkgOiBvdXRwdXQgaW5kZXBlbmRlbnQgb2Yg
dGhlIG5iIG9mIHdvcmtlcnMgYW5kIG9mCnRoZSBjb250ZXh0J3MgaGlzdG9yeQphcGkgIDogcmFu
ZG9tIGFjY2VzcyB3aXRoaW4gZnJhbWVzIGFuZCBsejQgZmlsZXMgOiBgTFo0Rl9yZXN1bWVGcmFt
ZSgpYCwKYExaNEZfc2VlaygpYCwgYExaNEZfdGVsbCgpYCAoc3RhdGljKQphcGkgIDogYExaNF9k
ZWNvbXByZXNzX3NhZmUoKWAgcmV0dXJucyBkaXN0aW5jdCBlcnJvciBjb2RlcyA6IGAtMWAgbWFs
Zm9ybWVkCmlucHV0LCBgLTJgIGBkc3RDYXBhY2l0eWAgdG9vIHNtYWxsLCBgLTNgIG1pc3Npbmcg
ZGljdGlvbmFyeQphcGkgIDogbHo0ZnJhbWUgY29tcHJlc3Npb24gYWNjZXB0cyBhbnkgYGRzdENh
cGFjaXR5YCwgYW5kIG9ubHkgZmFpbHMgaWYgdGhlCm91dHB1dCBkb2Vzbid0IGZpdAphcGkgIDog
cmVtb3ZlZCBmcm9tIGhlYWRlcnMgOiBmdW5jdGlvbnMgZGVwcmVjYXRlZCBzaW5jZSB2MS43Lngg
LyB2MS44LjAgKHN0aWxsCmV4cG9ydGVkIGJ5IGxpYmx6NCksIHVucHJlZml4ZWQgbHo0ZnJhbWUg
ZW51bXMgOyBgTFo0X3Jlc2V0U3RyZWFtKClgIGFuZApgTFo0X3Jlc2V0U3RyZWFtSEMoKWAgYXJl
IGRlcHJlY2F0ZWQKYXBpICA6IGBMWjRGX2NvbXByZXNzT3B0aW9uc190YCBtdXN0IGJlIHplcm8t
aW5pdGlhbGl6ZWQgOyByZXNlcnZlZCBmaWVsZHMgYXJlCnNjYWxhcnMgKGZsYXR0ZW4gcG9zaXRp
b25hbCBpbml0aWFsaXplcnMpIDsgYExaNEZfdW5jb21wcmVzc2VkVXBkYXRlKClgCmRlcHJlY2F0
ZWQgKHVzZSBgLnVuY29tcHJlc3NlZGApCmFwaSAgOiBjdXN0b20gYWxsb2NhdG9ycyBmb3IgbHo0
ZmlsZSAoYF9hZHZhbmNlZCgpYCBmdW5jdGlvbnMpLApgTFo0X1VTRVJfTUVNT1JZX0ZVTkNUSU9O
U2AgYWxzbyBmb3IgbHo0ZnJhbWUgYW5kIGx6NGZpbGUgOyBgTFo0Rl9jY3R4X3NpemUoKWAKYW5k
IGBMWjRGX2RjdHhfc2l6ZSgpYCBieSBAZmVsaXhoYW5kdGUKYXBpICA6IEhDIHN0YXRlcyBpbmNs
dWRlIHRoZSBidWZmZXIgb2YgbGV2ZWxzIDEwKyAoKzY0IEtCIHBlciBzdGF0ZSkgOiBubwphbGxv
Y2F0aW9uIGR1cmluZyBjb21wcmVzc2lvbgpjbGkgIDogbXVsdGl0aHJlYWRlZCBjb21wcmVzc2lv
biByZWxpZXMgb24gbGlibHo0IDogc2FtZSBvdXRwdXQgd2l0aCBhbnkgbmIgb2YKdGhyZWFkcyBh
bmQgd2l0aG91dCBtdWx0aXRocmVhZGluZyBzdXBwb3J0IDsgYC1UI2Agd2l0aGluIGEgbWVtb3J5
IGJ1ZGdldAooYC0tbWVtb3J5PSNgKSA7IG5ldyBgLS1zaW5nbGUtdGhyZWFkYApjbGkgIDogZGVj
b2RlcyBGaXJlZm94J3MgbW96bHo0IGZpbGVzLCBwcm9wb3NlZCBieSBAVW5pdGVkTWFyc3VwaWFs
cywgYW5kIGxlZ2FjeQpmcmFtZXMgd2l0aCB0aGUgTGludXgga2VybmVsIGVuZCBtYXJrZXIsIHJl
cXVlc3RlZCBieSBAYmVuamFyb2JpbiAoZnJhbWUgZm9ybWF0CmRvY3VtZW50YXRpb24gYnkgQEFy
dG9yaWEyZTUpCmNsaSAgOiBzYWZlciBmaWxlIGhhbmRsaW5nIDogYW4gb3V0cHV0IGlkZW50aWNh
bCB0byB0aGUgaW5wdXQgaXMgcmVmdXNlZCwgYQpzb3VyY2UgbW9kaWZpZWQgZHVyaW5nIGNvbXBy
ZXNzaW9uIGlzIGRldGVjdGVkLCBgLS1ybWAga2VlcHMgdGhlIHNvdXJjZSBhZnRlcgpmYWlsdXJl
cywgYnkgQEZ1cmFuNjY2LCBATmV4b3J5IGFuZCBAaW1tYW51d2VsbApjbGkgIDogYmVuY2htYXJr
IChgLWJgKSBtZWFzdXJlcyBmcmFtZXMsIGNvbXByZXNzZWQgYXMgYGx6NGAgZG9lcyB3aXRoIHRo
ZSBzYW1lCm9wdGlvbnMKY2xpICA6IHZhcmlvdXMgZml4ZXMgKGAtLWxpc3RgLCBsZWdhY3kgZm9y
bWF0LCBiZW5jaG1hcmssIGAtdCAtbWAsIG51bWVyaWMKYXJndW1lbnRzKSwgYnkgQHRhbnN5LCBA
am1lc3R3YS1jb2RlciwgQGFrYXNoZGVzaG11a2gtZ2l0LCBAYXJzaHNtaXRoMSwgQGpsZWUzMDMK
YW5kIEBOZXhvcnkKYnVpbGQ6IGR5bmFtaWMgbGlicmFyeSBtdWx0aXRocmVhZGVkIGJ5IGRlZmF1
bHQsIHN0YXRpYyBsaWJyYXJ5IHNpbmdsZS10aHJlYWRlZAo7IGNtYWtlIGBsejRgIG11bHRpdGhy
ZWFkZWQKYnVpbGQ6IGNtYWtlIDogZXhwb3J0ZWQgYGx6NDo6bHo0YCB0YXJnZXQgYnkgQGRnMHl0
LCBDTWFrZSA0IHN1cHBvcnQgYnkKQEdlb3JnSDkzLCBgQ01BS0VfUE9TSVRJT05fSU5ERVBFTkRF
TlRfQ09ERWAgYnkgQGRzLXNsb3RoCmJ1aWxkOiBjbWFrZSA6IGFzIGEgc3VicHJvamVjdCwgdGhl
IGBsejRgIHByb2dyYW0gaXMgbm8gbG9uZ2VyIGJ1aWx0IGJ5IGRlZmF1bHQKKGAtRExaNF9CVUlM
RF9DTEk9T05gIHJlc3RvcmVzIGl0KSwgYnkgQGNydWV0ZXIKYnVpbGQ6IHJlcHJvZHVjaWJsZSBz
dGF0aWMgbGlicmFyeSBieSBAcnB1cmRpZSwgQUlYIHN1cHBvcnQgYnkgQHNodWJoYW1oaWksCm1l
c29uIGZpeGVzIGJ5IEBncm9iaWFuLCBAYmdpbGJlcnQgYW5kIEBlbGktc2Nod2FydHosIG90aGVy
IGZpeGVzIGJ5IEBob3QKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgNTAwMCBj
aGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1l
bnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQve2x6NF8x
LjEwLjAuYmIgPT4gbHo0XzEuMTEuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQv
e2x6NF8xLjEwLjAuYmIgPT4gbHo0XzEuMTEuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuMTAuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2x6NC9sejRfMS4xMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS4xMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9sejQvbHo0XzEuMTEuMS5iYgppbmRleCA1YTM5Zjg5ODcxLi40ZGM0YTZkMzYyIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuMTAuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuMTEuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWIvTElDRU5TRTttZDU9NWNkNWY4NTFiNTJlYzgz
MmIxMGVlZGIzZjAxZjg4NWEgXAogCiBQRSA9ICIxIgogCi1TUkNSRVYgPSAiZWJiMzcwY2E4M2Fm
MTkzMjEyZGY0ZGNiYWRjYzVkODdiYzBkZTJmMCIKK1NSQ1JFViA9ICJhYTQ2NDdmYWQ1NzVkMDFh
ODc0YWFhYWRjZGJlOGU2YTQwZTA3MmY1IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
bHo0L2x6NC5naXQ7YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSBcCiAg
ICAgICAgICAgIGZpbGU6Ly9yZXByb2R1Y2liaWxpdHkucGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============0798386916199015010==--
