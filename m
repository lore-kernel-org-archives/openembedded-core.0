Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12521.1795501916225555901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dZFMgKf/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TAbDnUti;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a20c40fd30-09625d77-1e3c-4348-8016-91485a23fc72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795501915;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=+EnFM2WOZL3Yla2Ki9puToQk+YB8BSW51jF8FZu9VW4=;
	b=dZFMgKf/OLP/x2J+RBsrKBTrCVrP3RTnc7tv4kt2cRRAeO3vcBfNY8YhwxrOK8iV
	cSj4Ee7+1c+Lfxu8QvnuwqDW7c6bYvfyD7toF50wNRcJFNkCydw68cw/nnUNTmJp4MQ
	ANY0HqS2wBi3wLyh7OZY98MNwcYrJVjTyZ1eXdZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795501915;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=+EnFM2WOZL3Yla2Ki9puToQk+YB8BSW51jF8FZu9VW4=;
	b=TAbDnUtiqRjInIWWDsd5revkAvZxVKzvOdCSnVVtuCoVK6czwNeXd8cSOq7Om+uc
	Mkl762bijwtucaxHQJ/bgGzZyovo0d2fO7/rJLMjAdwmWSNTrJIUYq9KxpOPUDaeYBU
	cz5J6QjaTyihGIScRCNU9DZtMdeOgIDddo2q31TU=
Content-Type: multipart/mixed; boundary="===============8881487140757467923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.6.0 SUCCEEDED
Message-ID: <010101a20c40fd30-09625d77-1e3c-4348-8016-91485a23fc72-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 06:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250957

--===============8881487140757467923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *zstd* to *1.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.5.7-1.6.0.patch
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
From a6a064b59c57a9ba9484c14919b167c16a9381e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 24 Nov 2026 06:20:56 +0000
Subject: [PATCH] zstd: upgrade 1.5.7 -> 1.6.0

v1.6.0 (Nov 2026)
fix: streaming decompression of malformed data could expose uninitialized memory
fix: multithreaded compression with `ZSTD_CCtx_refPrefix()` could rarely emit a
valid frame encoding wrong data, depending on thread timing
fix: out-of-bounds read and write in the DDict hash table when using
`ZSTD_d_refMultipleDDicts`
fix: use-after-free of a `ZSTD_DCtx_refPrefix()` prefix after
`ZSTD_DCtx_reset()` following a malformed frame header
fix: out-of-bounds read with `ZSTD_c_stableInBuffer` after an abandoned frame or
a changed input buffer, reported by @IlyaGrebnov
fix: multithreaded compression use-after-free when freeing or resetting a
context during an abandoned frame
fix: multithreaded streaming compression accepted a wrong pledged source size,
producing corrupted frames
fix: prepared dictionary decompression now rejects matches into formatted
dictionary headers
fix: on a static DCtx, `ZSTD_DCtx_loadDictionary()` and `ZSTD_DCtx_refPrefix()`
return `ZSTD_error_memory_allocation` for nonempty dictionaries
fix: wild reads when compressing with large dictionaries whose repcodes point
into discarded content
fix: memory corruption in `ZSTD_compressSequences()` and
`ZSTD_compressSequencesAndLiterals()` with small `dst`, overflowing lengths, or
some invalid sequences (#4918, #4989, #5004)
fix: out-of-bounds write with `ZSTD_c_targetCBlockSize` and `ZSTD_compress2()`
into a `dst` smaller than `ZSTD_compressBound()`
fix: high compression levels read uninitialized statistics with some
dictionaries
fix: 32-bit multithreaded compression with large windows (#4946, #4948)
fix: 32-bit builds rejected valid dictionary IDs above 4294967176
fix: excessive memory usage with long distance matching and small windows
fix: CDict and DDict creation and size estimation reject dictionary sizes that
overflow
fix: crash when a custom allocator fails (#4613), data race when resizing a
thread pool
fix: legacy decoders: out-of-bounds reads, wrong streaming output, and offset
validation (#4555, #4815, #4816, #4817, #4913, #4955, #4957)
api: legacy format support is now disabled by default
api: experimental `ZSTD_d_refMultipleDDicts` requires an exact dictionary ID
match: a missing nonzero ID returns `ZSTD_error_dictionary_wrong` instead of
falling back to the current dictionary
api: disabling experimental `ZSTD_d_refMultipleDDicts` releases every dictionary
reference of its set
api: removed the deprecated experimental functions `ZSTD_copyCCtx()` and
`ZSTD_copyDCtx()`
api: promoted `ZSTD_getFrameHeader()` and `ZSTD_FrameHeader` to the stable API
api: promoted `ZSTD_createDDict_byReference()`,
`ZSTD_DCtx_loadDictionary_advanced()`, and `ZSTD_CCtx_loadDictionary_advanced()`
to the stable API, along with `ZSTD_dictContentType_e` and
`ZSTD_dictLoadMethod_e` (#4283, #3723)
api: `ZSTD_decompressDCtx()`, `ZSTD_decompress_usingDict()` and
`ZSTD_decompress_usingDDict()` reset an unfinished streaming session, as
documented
api: `ZSTD_DCtx_loadDictionary()` returns `ZSTD_error_dictionary_corrupted` for
a corrupted dictionary, instead of `ZSTD_error_memory_allocation`
api: `ZSTD_compressSequencesAndLiterals()` enforces its documented limits on
block size and `litBufCapacity` (#4741, #4782)
api: `ZSTD_decompressContinue()` returns `ZSTD_error_stage_wrong` when not
preceded by `ZSTD_decompressBegin()`
api: new experimental `ZSTD_isDeterministicBuild()`
perf: faster decompression on AArch64 (#4413, #4414, #4418, #4509), by
@arpadpanyik-arm
perf: faster compression on AArch64 with SVE2 (#4411), by @arpadpanyik-arm
perf: faster `ZSTD_compressSequencesAndLiterals()` on AArch64 with Neon and SVE2
(#4429, #4440), by @arpadpanyik-arm, and on RISC-V with RVV (#4399), by
@zijianli1234
perf: faster row match finder on RISC-V with RVV (#4481), by @w1m024
cli: new `--patch-apply` command, equivalent to `-d --patch-from`
cli: `-B#` renamed `--jobsize=#`, and benchmark `--blocksize=#` renamed
`--split=#`; old names remain supported
cli: `--filelist=` supports process substitution
cli: size arguments accept `G`, `GB` and `GiB` suffixes (#4609), by @Integral-
Tech
cli: `--memory=` also limits `.xz` and `.lzma` decompression
cli: benchmark mode uses 1 thread by default
cli: warn when multiple threads are requested for decompression
cli: safer file handling: no output through symbolic links (#4906), `-r` no
longer follows links and junctions on Windows (#4905), better same-file
detection on Windows (#4884), robust to concurrent renames (#4962, #4999, #5003,
#5009)
cli: `--output-dir-flat` fails on output filename collisions before processing
(#4974), by @daniellerozenblit
cli: fix `zstd -l` infinite loop on a large skippable frame
cli: fix `--memlimit-decompress=` parsing (#4916), `--adapt` bounds (#4982),
`--patch-from` with an empty file (#4896), `--check` with `--format=lz4`
cli: fix `ZSTD_NBTHREADS=0` (#4334),
cli: fix decode-only benchmark of multiple files (#4714, #4945)
cli: `zstdgrep` exits 0 when any of several files matches
zdict: fix out-of-bounds

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch | 4 ++--
 meta/recipes-extended/zstd/{zstd_1.5.7.bb => zstd_1.6.0.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.7.bb => zstd_1.6.0.bb} (98%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
index d7559f7269..6163201bf2 100644
--- a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 5182d7671cb65346b55d3ff8eda6388f876a7431 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
 Date: Thu, 27 Aug 2026 12:00:00 +0000
 Subject: [PATCH] cli-tests: skip zstd --max level when memory is insufficient
@@ -15,7 +15,7 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/cli-tests/compression/levels.sh b/tests/cli-tests/compression/levels.sh
-index b8230f2..7846d3e 100755
+index b8230f2a3..7846d3ec0 100755
 --- a/tests/cli-tests/compression/levels.sh
 +++ b/tests/cli-tests/compression/levels.sh
 @@ -16,8 +16,8 @@ zstd --fast=10 file -o file-f10.zst -q
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.6.0.bb
similarity index 98%
rename from meta/recipes-extended/zstd/zstd_1.5.7.bb
rename to meta/recipes-extended/zstd/zstd_1.6.0.bb
index 4c3b377c14..a4a6acc435 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https;tag=
            file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch \
            "
 
-SRCREV = "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
+SRCREV = "916e8e70b33317d469a41ee837e47317807815c8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.47.1


--===============8881487140757467923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gcc/gcc-doc: PKGSIZE changed from 117855 to 3364129 (+2754%)
packages/x86-64-v3-poky-linux/zstd/libzstd: FILELIST: removed "/usr/lib/libzstd.so.1.5.7", added "/usr/lib/libzstd.so.1.6.0"
Changes to packages/x86-64-v3-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so.1.5.7 moved to /usr/lib/libzstd.so.1.6.0
packages/x86-64-v3-poky-linux/zstd/zstd-ptest: FILELIST: removed "/usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-dir-without-write-perm.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-stdin-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-stdout.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-stdin-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-stdout.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-file.sh.stderr.exact", added "/usr/lib/zstd/ptest/tests/cli-tests/cltools/zstdgrep-multiple-files.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/setup /usr/lib/zstd/ptest/tests/cli-tests/cltools/zstdgrep-multiple-files.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-stdin-to-file.sh.stderr.glob
  /usr/lib/zstd/ptest/tests/cli-tests/determinism/basic.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/basic/memlimit_alias.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/basic.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/decompression/skippable-overlap.sh /usr/lib/zstd/ptest/tests/cli-tests/compression/mt-stream-size.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-handling/mtime-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/determinism/basic.sh /usr/lib/zstd/ptest/tests/cli-tests/compression/mt-stream-size.sh /usr/lib/zstd/ptest/tests/cli-tests/determinism/multithread.sh /usr/lib/zstd/ptest/tests/cli-tests/determinism/multithread.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/multithread.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-stdout.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-stdin-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/basic/memlimit_al
 ias.sh /usr/lib/zstd/ptest/tests/cli-tests/determinism/setup_once /usr/lib/zstd/ptest/tests/cli-tests/dict-builder/sample-count-overflow.sh /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/compression/patch-from.sh /usr/lib/zstd/ptest/tests/cli-tests/determinism/reuse.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/reuse.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-handling/source-identity.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/memlimit_alias.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/basic/bench-decompress-multiple.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/source-size-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/output_dir_collision.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/file-handling/concat-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handli
 ng/create-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/dst-rm-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/sigint-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/same-file-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/common/parent-race.c /usr/lib/zstd/ptest/tests/cli-tests/determinism/reuse.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/directory-fd-lifetime.sh /usr/lib/zstd/ptest/tests/cli-tests/decompression/skippable-overlap.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/decompression/skippable-overlap.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-stdout.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-dir-without-write-perm.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/basic/list-short-skippable.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/output_dir_collision.sh /usr/lib/zstd/ptest/tests/cli-tests/common/source-identity.c /usr/lib/zstd/p
 test/tests/cli-tests/cltools/zstdgrep-multiple-files.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/source-rm-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/search-only-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/output_dir_collision.sh.exit"
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.15/site-packages/packaging-26.4.dist-info moved to /usr/lib/python3.15/site-packages/packaging-26.3.dist-info
Changes to packages/x86_64-linux/zstd-native (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so.1.5.7 moved to /usr/lib/libzstd.so.1.6.0

--===============8881487140757467923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.5.7-1.6.0.patch"

RnJvbSBhNmEwNjRiNTljNTdhOWJhOTQ4NGMxNDkxOWIxNjdjMTZhOTM4MWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjQgTm92IDIwMjYgMDY6MjA6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB6
c3RkOiB1cGdyYWRlIDEuNS43IC0+IDEuNi4wCgp2MS42LjAgKE5vdiAyMDI2KQpmaXg6IHN0cmVh
bWluZyBkZWNvbXByZXNzaW9uIG9mIG1hbGZvcm1lZCBkYXRhIGNvdWxkIGV4cG9zZSB1bmluaXRp
YWxpemVkIG1lbW9yeQpmaXg6IG11bHRpdGhyZWFkZWQgY29tcHJlc3Npb24gd2l0aCBgWlNURF9D
Q3R4X3JlZlByZWZpeCgpYCBjb3VsZCByYXJlbHkgZW1pdCBhCnZhbGlkIGZyYW1lIGVuY29kaW5n
IHdyb25nIGRhdGEsIGRlcGVuZGluZyBvbiB0aHJlYWQgdGltaW5nCmZpeDogb3V0LW9mLWJvdW5k
cyByZWFkIGFuZCB3cml0ZSBpbiB0aGUgRERpY3QgaGFzaCB0YWJsZSB3aGVuIHVzaW5nCmBaU1RE
X2RfcmVmTXVsdGlwbGVERGljdHNgCmZpeDogdXNlLWFmdGVyLWZyZWUgb2YgYSBgWlNURF9EQ3R4
X3JlZlByZWZpeCgpYCBwcmVmaXggYWZ0ZXIKYFpTVERfREN0eF9yZXNldCgpYCBmb2xsb3dpbmcg
YSBtYWxmb3JtZWQgZnJhbWUgaGVhZGVyCmZpeDogb3V0LW9mLWJvdW5kcyByZWFkIHdpdGggYFpT
VERfY19zdGFibGVJbkJ1ZmZlcmAgYWZ0ZXIgYW4gYWJhbmRvbmVkIGZyYW1lIG9yCmEgY2hhbmdl
ZCBpbnB1dCBidWZmZXIsIHJlcG9ydGVkIGJ5IEBJbHlhR3JlYm5vdgpmaXg6IG11bHRpdGhyZWFk
ZWQgY29tcHJlc3Npb24gdXNlLWFmdGVyLWZyZWUgd2hlbiBmcmVlaW5nIG9yIHJlc2V0dGluZyBh
CmNvbnRleHQgZHVyaW5nIGFuIGFiYW5kb25lZCBmcmFtZQpmaXg6IG11bHRpdGhyZWFkZWQgc3Ry
ZWFtaW5nIGNvbXByZXNzaW9uIGFjY2VwdGVkIGEgd3JvbmcgcGxlZGdlZCBzb3VyY2Ugc2l6ZSwK
cHJvZHVjaW5nIGNvcnJ1cHRlZCBmcmFtZXMKZml4OiBwcmVwYXJlZCBkaWN0aW9uYXJ5IGRlY29t
cHJlc3Npb24gbm93IHJlamVjdHMgbWF0Y2hlcyBpbnRvIGZvcm1hdHRlZApkaWN0aW9uYXJ5IGhl
YWRlcnMKZml4OiBvbiBhIHN0YXRpYyBEQ3R4LCBgWlNURF9EQ3R4X2xvYWREaWN0aW9uYXJ5KClg
IGFuZCBgWlNURF9EQ3R4X3JlZlByZWZpeCgpYApyZXR1cm4gYFpTVERfZXJyb3JfbWVtb3J5X2Fs
bG9jYXRpb25gIGZvciBub25lbXB0eSBkaWN0aW9uYXJpZXMKZml4OiB3aWxkIHJlYWRzIHdoZW4g
Y29tcHJlc3Npbmcgd2l0aCBsYXJnZSBkaWN0aW9uYXJpZXMgd2hvc2UgcmVwY29kZXMgcG9pbnQK
aW50byBkaXNjYXJkZWQgY29udGVudApmaXg6IG1lbW9yeSBjb3JydXB0aW9uIGluIGBaU1REX2Nv
bXByZXNzU2VxdWVuY2VzKClgIGFuZApgWlNURF9jb21wcmVzc1NlcXVlbmNlc0FuZExpdGVyYWxz
KClgIHdpdGggc21hbGwgYGRzdGAsIG92ZXJmbG93aW5nIGxlbmd0aHMsIG9yCnNvbWUgaW52YWxp
ZCBzZXF1ZW5jZXMgKCM0OTE4LCAjNDk4OSwgIzUwMDQpCmZpeDogb3V0LW9mLWJvdW5kcyB3cml0
ZSB3aXRoIGBaU1REX2NfdGFyZ2V0Q0Jsb2NrU2l6ZWAgYW5kIGBaU1REX2NvbXByZXNzMigpYApp
bnRvIGEgYGRzdGAgc21hbGxlciB0aGFuIGBaU1REX2NvbXByZXNzQm91bmQoKWAKZml4OiBoaWdo
IGNvbXByZXNzaW9uIGxldmVscyByZWFkIHVuaW5pdGlhbGl6ZWQgc3RhdGlzdGljcyB3aXRoIHNv
bWUKZGljdGlvbmFyaWVzCmZpeDogMzItYml0IG11bHRpdGhyZWFkZWQgY29tcHJlc3Npb24gd2l0
aCBsYXJnZSB3aW5kb3dzICgjNDk0NiwgIzQ5NDgpCmZpeDogMzItYml0IGJ1aWxkcyByZWplY3Rl
ZCB2YWxpZCBkaWN0aW9uYXJ5IElEcyBhYm92ZSA0Mjk0OTY3MTc2CmZpeDogZXhjZXNzaXZlIG1l
bW9yeSB1c2FnZSB3aXRoIGxvbmcgZGlzdGFuY2UgbWF0Y2hpbmcgYW5kIHNtYWxsIHdpbmRvd3MK
Zml4OiBDRGljdCBhbmQgRERpY3QgY3JlYXRpb24gYW5kIHNpemUgZXN0aW1hdGlvbiByZWplY3Qg
ZGljdGlvbmFyeSBzaXplcyB0aGF0Cm92ZXJmbG93CmZpeDogY3Jhc2ggd2hlbiBhIGN1c3RvbSBh
bGxvY2F0b3IgZmFpbHMgKCM0NjEzKSwgZGF0YSByYWNlIHdoZW4gcmVzaXppbmcgYQp0aHJlYWQg
cG9vbApmaXg6IGxlZ2FjeSBkZWNvZGVyczogb3V0LW9mLWJvdW5kcyByZWFkcywgd3Jvbmcgc3Ry
ZWFtaW5nIG91dHB1dCwgYW5kIG9mZnNldAp2YWxpZGF0aW9uICgjNDU1NSwgIzQ4MTUsICM0ODE2
LCAjNDgxNywgIzQ5MTMsICM0OTU1LCAjNDk1NykKYXBpOiBsZWdhY3kgZm9ybWF0IHN1cHBvcnQg
aXMgbm93IGRpc2FibGVkIGJ5IGRlZmF1bHQKYXBpOiBleHBlcmltZW50YWwgYFpTVERfZF9yZWZN
dWx0aXBsZUREaWN0c2AgcmVxdWlyZXMgYW4gZXhhY3QgZGljdGlvbmFyeSBJRAptYXRjaDogYSBt
aXNzaW5nIG5vbnplcm8gSUQgcmV0dXJucyBgWlNURF9lcnJvcl9kaWN0aW9uYXJ5X3dyb25nYCBp
bnN0ZWFkIG9mCmZhbGxpbmcgYmFjayB0byB0aGUgY3VycmVudCBkaWN0aW9uYXJ5CmFwaTogZGlz
YWJsaW5nIGV4cGVyaW1lbnRhbCBgWlNURF9kX3JlZk11bHRpcGxlRERpY3RzYCByZWxlYXNlcyBl
dmVyeSBkaWN0aW9uYXJ5CnJlZmVyZW5jZSBvZiBpdHMgc2V0CmFwaTogcmVtb3ZlZCB0aGUgZGVw
cmVjYXRlZCBleHBlcmltZW50YWwgZnVuY3Rpb25zIGBaU1REX2NvcHlDQ3R4KClgIGFuZApgWlNU
RF9jb3B5REN0eCgpYAphcGk6IHByb21vdGVkIGBaU1REX2dldEZyYW1lSGVhZGVyKClgIGFuZCBg
WlNURF9GcmFtZUhlYWRlcmAgdG8gdGhlIHN0YWJsZSBBUEkKYXBpOiBwcm9tb3RlZCBgWlNURF9j
cmVhdGVERGljdF9ieVJlZmVyZW5jZSgpYCwKYFpTVERfREN0eF9sb2FkRGljdGlvbmFyeV9hZHZh
bmNlZCgpYCwgYW5kIGBaU1REX0NDdHhfbG9hZERpY3Rpb25hcnlfYWR2YW5jZWQoKWAKdG8gdGhl
IHN0YWJsZSBBUEksIGFsb25nIHdpdGggYFpTVERfZGljdENvbnRlbnRUeXBlX2VgIGFuZApgWlNU
RF9kaWN0TG9hZE1ldGhvZF9lYCAoIzQyODMsICMzNzIzKQphcGk6IGBaU1REX2RlY29tcHJlc3NE
Q3R4KClgLCBgWlNURF9kZWNvbXByZXNzX3VzaW5nRGljdCgpYCBhbmQKYFpTVERfZGVjb21wcmVz
c191c2luZ0REaWN0KClgIHJlc2V0IGFuIHVuZmluaXNoZWQgc3RyZWFtaW5nIHNlc3Npb24sIGFz
CmRvY3VtZW50ZWQKYXBpOiBgWlNURF9EQ3R4X2xvYWREaWN0aW9uYXJ5KClgIHJldHVybnMgYFpT
VERfZXJyb3JfZGljdGlvbmFyeV9jb3JydXB0ZWRgIGZvcgphIGNvcnJ1cHRlZCBkaWN0aW9uYXJ5
LCBpbnN0ZWFkIG9mIGBaU1REX2Vycm9yX21lbW9yeV9hbGxvY2F0aW9uYAphcGk6IGBaU1REX2Nv
bXByZXNzU2VxdWVuY2VzQW5kTGl0ZXJhbHMoKWAgZW5mb3JjZXMgaXRzIGRvY3VtZW50ZWQgbGlt
aXRzIG9uCmJsb2NrIHNpemUgYW5kIGBsaXRCdWZDYXBhY2l0eWAgKCM0NzQxLCAjNDc4MikKYXBp
OiBgWlNURF9kZWNvbXByZXNzQ29udGludWUoKWAgcmV0dXJucyBgWlNURF9lcnJvcl9zdGFnZV93
cm9uZ2Agd2hlbiBub3QKcHJlY2VkZWQgYnkgYFpTVERfZGVjb21wcmVzc0JlZ2luKClgCmFwaTog
bmV3IGV4cGVyaW1lbnRhbCBgWlNURF9pc0RldGVybWluaXN0aWNCdWlsZCgpYApwZXJmOiBmYXN0
ZXIgZGVjb21wcmVzc2lvbiBvbiBBQXJjaDY0ICgjNDQxMywgIzQ0MTQsICM0NDE4LCAjNDUwOSks
IGJ5CkBhcnBhZHBhbnlpay1hcm0KcGVyZjogZmFzdGVyIGNvbXByZXNzaW9uIG9uIEFBcmNoNjQg
d2l0aCBTVkUyICgjNDQxMSksIGJ5IEBhcnBhZHBhbnlpay1hcm0KcGVyZjogZmFzdGVyIGBaU1RE
X2NvbXByZXNzU2VxdWVuY2VzQW5kTGl0ZXJhbHMoKWAgb24gQUFyY2g2NCB3aXRoIE5lb24gYW5k
IFNWRTIKKCM0NDI5LCAjNDQ0MCksIGJ5IEBhcnBhZHBhbnlpay1hcm0sIGFuZCBvbiBSSVNDLVYg
d2l0aCBSVlYgKCM0Mzk5KSwgYnkKQHppamlhbmxpMTIzNApwZXJmOiBmYXN0ZXIgcm93IG1hdGNo
IGZpbmRlciBvbiBSSVNDLVYgd2l0aCBSVlYgKCM0NDgxKSwgYnkgQHcxbTAyNApjbGk6IG5ldyBg
LS1wYXRjaC1hcHBseWAgY29tbWFuZCwgZXF1aXZhbGVudCB0byBgLWQgLS1wYXRjaC1mcm9tYApj
bGk6IGAtQiNgIHJlbmFtZWQgYC0tam9ic2l6ZT0jYCwgYW5kIGJlbmNobWFyayBgLS1ibG9ja3Np
emU9I2AgcmVuYW1lZApgLS1zcGxpdD0jYDsgb2xkIG5hbWVzIHJlbWFpbiBzdXBwb3J0ZWQKY2xp
OiBgLS1maWxlbGlzdD1gIHN1cHBvcnRzIHByb2Nlc3Mgc3Vic3RpdHV0aW9uCmNsaTogc2l6ZSBh
cmd1bWVudHMgYWNjZXB0IGBHYCwgYEdCYCBhbmQgYEdpQmAgc3VmZml4ZXMgKCM0NjA5KSwgYnkg
QEludGVncmFsLQpUZWNoCmNsaTogYC0tbWVtb3J5PWAgYWxzbyBsaW1pdHMgYC54emAgYW5kIGAu
bHptYWAgZGVjb21wcmVzc2lvbgpjbGk6IGJlbmNobWFyayBtb2RlIHVzZXMgMSB0aHJlYWQgYnkg
ZGVmYXVsdApjbGk6IHdhcm4gd2hlbiBtdWx0aXBsZSB0aHJlYWRzIGFyZSByZXF1ZXN0ZWQgZm9y
IGRlY29tcHJlc3Npb24KY2xpOiBzYWZlciBmaWxlIGhhbmRsaW5nOiBubyBvdXRwdXQgdGhyb3Vn
aCBzeW1ib2xpYyBsaW5rcyAoIzQ5MDYpLCBgLXJgIG5vCmxvbmdlciBmb2xsb3dzIGxpbmtzIGFu
ZCBqdW5jdGlvbnMgb24gV2luZG93cyAoIzQ5MDUpLCBiZXR0ZXIgc2FtZS1maWxlCmRldGVjdGlv
biBvbiBXaW5kb3dzICgjNDg4NCksIHJvYnVzdCB0byBjb25jdXJyZW50IHJlbmFtZXMgKCM0OTYy
LCAjNDk5OSwgIzUwMDMsCiM1MDA5KQpjbGk6IGAtLW91dHB1dC1kaXItZmxhdGAgZmFpbHMgb24g
b3V0cHV0IGZpbGVuYW1lIGNvbGxpc2lvbnMgYmVmb3JlIHByb2Nlc3NpbmcKKCM0OTc0KSwgYnkg
QGRhbmllbGxlcm96ZW5ibGl0CmNsaTogZml4IGB6c3RkIC1sYCBpbmZpbml0ZSBsb29wIG9uIGEg
bGFyZ2Ugc2tpcHBhYmxlIGZyYW1lCmNsaTogZml4IGAtLW1lbWxpbWl0LWRlY29tcHJlc3M9YCBw
YXJzaW5nICgjNDkxNiksIGAtLWFkYXB0YCBib3VuZHMgKCM0OTgyKSwKYC0tcGF0Y2gtZnJvbWAg
d2l0aCBhbiBlbXB0eSBmaWxlICgjNDg5NiksIGAtLWNoZWNrYCB3aXRoIGAtLWZvcm1hdD1sejRg
CmNsaTogZml4IGBaU1REX05CVEhSRUFEUz0wYCAoIzQzMzQpLApjbGk6IGZpeCBkZWNvZGUtb25s
eSBiZW5jaG1hcmsgb2YgbXVsdGlwbGUgZmlsZXMgKCM0NzE0LCAjNDk0NSkKY2xpOiBgenN0ZGdy
ZXBgIGV4aXRzIDAgd2hlbiBhbnkgb2Ygc2V2ZXJhbCBmaWxlcyBtYXRjaGVzCnpkaWN0OiBmaXgg
b3V0LW9mLWJvdW5kcwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyA1MDAwIGNo
YXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVu
dCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLmNsaS10ZXN0cy1za2lwLXpzdGQtbWF4LWxldmVs
LXdoZW4tbWVtb3J5LWlzLWluc3VmZmkucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC96c3RkL3t6c3RkXzEuNS43LmJiID0+IHpzdGRfMS42LjAuYmJ9ICAgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC97enN0ZF8xLjUuNy5iYiA9PiB6c3RkXzEuNi4wLmJifSAo
OTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGQvMDAwMS1j
bGktdGVzdHMtc2tpcC16c3RkLW1heC1sZXZlbC13aGVuLW1lbW9yeS1pcy1pbnN1ZmZpLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZC8wMDAxLWNsaS10ZXN0cy1za2lwLXpz
dGQtbWF4LWxldmVsLXdoZW4tbWVtb3J5LWlzLWluc3VmZmkucGF0Y2gKaW5kZXggZDc1NTlmNzI2
OS4uNjE2MzIwMWJmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0
ZC8wMDAxLWNsaS10ZXN0cy1za2lwLXpzdGQtbWF4LWxldmVsLXdoZW4tbWVtb3J5LWlzLWluc3Vm
ZmkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZC8wMDAxLWNsaS10
ZXN0cy1za2lwLXpzdGQtbWF4LWxldmVsLXdoZW4tbWVtb3J5LWlzLWluc3VmZmkucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUxODJkNzY3MWNiNjUzNDZiNTVkM2Zm
OGVkYTYzODhmODc2YTc0MzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQcmF0aWsg
RmFya2FzZSA8cHJhdGlrLmZhcmthc2VAZXN0LnRlY2g+CiBEYXRlOiBUaHUsIDI3IEF1ZyAyMDI2
IDEyOjAwOjAwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNsaS10ZXN0czogc2tpcCB6c3RkIC0t
bWF4IGxldmVsIHdoZW4gbWVtb3J5IGlzIGluc3VmZmljaWVudApAQCAtMTUsNyArMTUsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBQcmF0aWsgRmFya2FzZSA8cHJhdGlrLmZhcmthc2VAZXN0LnRlY2g+CiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3Rlc3RzL2NsaS10ZXN0cy9jb21wcmVzc2lvbi9sZXZlbHMuc2ggYi90ZXN0cy9jbGkt
dGVzdHMvY29tcHJlc3Npb24vbGV2ZWxzLnNoCi1pbmRleCBiODIzMGYyLi43ODQ2ZDNlIDEwMDc1
NQoraW5kZXggYjgyMzBmMmEzLi43ODQ2ZDNlYzAgMTAwNzU1CiAtLS0gYS90ZXN0cy9jbGktdGVz
dHMvY29tcHJlc3Npb24vbGV2ZWxzLnNoCiArKysgYi90ZXN0cy9jbGktdGVzdHMvY29tcHJlc3Np
b24vbGV2ZWxzLnNoCiBAQCAtMTYsOCArMTYsOCBAQCB6c3RkIC0tZmFzdD0xMCBmaWxlIC1vIGZp
bGUtZjEwLnpzdCAtcQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0
ZF8xLjUuNy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS42LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQv
enN0ZF8xLjUuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8x
LjYuMC5iYgppbmRleCA0YzNiMzc3YzE0Li5hNGE2YWNjNDM1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC96c3RkL3pzdGRfMS42LjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2ZhY2Vib29rL3pzdGQuZ2l0O2JyYW5jaD1yZWxlYXNlO3Byb3RvY29sPWh0
dHBzO3RhZz0KICAgICAgICAgICAgZmlsZTovLzAwMDEtY2xpLXRlc3RzLXNraXAtenN0ZC1tYXgt
bGV2ZWwtd2hlbi1tZW1vcnktaXMtaW5zdWZmaS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
UkVWID0gImY4NzQ1ZGE2ZmYxYWQxZTdiYWIzODRiZDFmOWQ3NDI0MzkyNzhlOTkiCitTUkNSRVYg
PSAiOTE2ZThlNzBiMzMzMTdkNDY5YTQxZWU4MzdlNDczMTc4MDc4MTVjOCIKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIENWRV9QUk9EVUNU
ID0gInpzdGFuZGFyZCIKLS0gCjIuNDcuMQoK

--===============8881487140757467923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.la /lib/lib*.so /lib/*.o"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11473425 to 11273993 (-2%)
packages/x86-64-v3-poky-linux/gcc/gcc-dbg: PKGSIZE changed from 1590491640 to 1590491656 (+0%)
packages/x86-64-v3-poky-linux/gcc/gcc-doc: PKGSIZE changed from 117855 to 3364129 (+2754%)
packages/x86-64-v3-poky-linux/python3/python3-dbg: PKGSIZE changed from 54974688 to 54974672 (-0%)
packages/x86-64-v3-poky-linux/zstd: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd: SRC_URI changed from "git://github.com/facebook/zstd.git;branch=release;protocol=https;tag=v1.5.7 file://run-ptest file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch" to "git://github.com/facebook/zstd.git;branch=release;protocol=https;tag=v1.6.0 file://run-ptest file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch"
packages/x86-64-v3-poky-linux/zstd/libzstd: PKGSIZE changed from 841712 to 849904 (+1%)
packages/x86-64-v3-poky-linux/zstd/libzstd: FILELIST: removed "/usr/lib/libzstd.so.1.5.7", added "/usr/lib/libzstd.so.1.6.0"
packages/x86-64-v3-poky-linux/zstd/libzstd: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/libzstd: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
Changes to packages/x86-64-v3-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so.1.5.7 moved to /usr/lib/libzstd.so.1.6.0
packages/x86-64-v3-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 26267608 to 25033912 (-5%)
packages/x86-64-v3-poky-linux/zstd/zstd-dbg: FILELIST: removed "/usr/lib/.debug/libzstd.so.1.5.7", added "/usr/lib/.debug/libzstd.so.1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-dbg: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-dbg: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd-dev: PKGSIZE changed from 213011 to 219513 (+3%)
packages/x86-64-v3-poky-linux/zstd/zstd-dev: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-dev: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd-doc: PKGSIZE changed from 37147 to 38267 (+3%)
packages/x86-64-v3-poky-linux/zstd/zstd-doc: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-doc: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd-locale: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-locale: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd-ptest: PKGSIZE changed from 1600124 to 1615044 (+1%)
packages/x86-64-v3-poky-linux/zstd/zstd-ptest: FILELIST: removed "/usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-dir-without-write-perm.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-stdin-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-stdout.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-stdin-to-file.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-stdout.sh.stderr.exact", added "/usr/lib/zstd/ptest/tests/cli-tests/file-handling/search-only-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/source-size-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/output_dir_collision.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/compression/mt-stream-size.sh /usr/li
 b/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-dir-without-write-perm.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/determinism/multithread.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/memlimit_alias.sh /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-stdin-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/cltools/zstdgrep-multiple-files.sh /usr/lib/zstd/ptest/tests/cli-tests/decompression/skippable-overlap.sh /usr/lib/zstd/ptest/tests/cli-tests/decompression/skippable-overlap.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/decompression/skippable-overlap.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/setup /usr/lib/zstd/ptest/tests/cli-tests/cltools/zstdgrep-multiple-files.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/cltools/zstdgrep-multiple-files.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-handling/concat-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/create-parent-race.sh /usr/lib/zstd/ptest/
 tests/cli-tests/file-handling/dst-rm-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/sigint-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/source-rm-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/memlimit_alias.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-stdout.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/determinism/basic.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/common/source-identity.c /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-stdin-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/basic/memlimit_alias.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/basic/output_dir_collision.sh /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/file-handling/directory-fd-lifetime.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/bench-decompress-multiple.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/sam
 e-file-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/file-handling/mtime-parent-race.sh /usr/lib/zstd/ptest/tests/cli-tests/compression/mt-stream-size.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/multithread.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/reuse.sh /usr/lib/zstd/ptest/tests/cli-tests/common/parent-race.c /usr/lib/zstd/ptest/tests/cli-tests/determinism/multithread.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/file-stat/decompress-file-to-file.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/file-handling/source-identity.sh /usr/lib/zstd/ptest/tests/cli-tests/determinism/basic.sh /usr/lib/zstd/ptest/tests/cli-tests/file-stat/compress-file-to-stdout.sh.stderr.glob /usr/lib/zstd/ptest/tests/cli-tests/determinism/reuse.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/reuse.sh.stdout.exact /usr/lib/zstd/ptest/tests/cli-tests/determinism/setup_once /usr/lib/zstd/ptest/tests/cli-tests/dict-builder/sample-count-ov
 erflow.sh /usr/lib/zstd/ptest/tests/cli-tests/compression/patch-from.sh /usr/lib/zstd/ptest/tests/cli-tests/basic/output_dir_collision.sh.exit /usr/lib/zstd/ptest/tests/cli-tests/determinism/basic.sh.stderr.exact /usr/lib/zstd/ptest/tests/cli-tests/basic/list-short-skippable.sh"
packages/x86-64-v3-poky-linux/zstd/zstd-ptest: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-ptest: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd-src: PKGSIZE changed from 3735003 to 3529566 (-6%)
packages/x86-64-v3-poky-linux/zstd/zstd-src: FILELIST: directory renamed /usr/src/debug/zstd/1.5.7/tests -> /usr/src/debug/zstd/1.6.0/tests, directory renamed /usr/src/debug/zstd/1.5.7/programs -> /usr/src/debug/zstd/1.6.0/programs, directory renamed /usr/src/debug/zstd/1.5.7/lib/compress -> /usr/src/debug/zstd/1.6.0/lib/compress, directory renamed /usr/src/debug/zstd/1.5.7/lib/dictBuilder -> /usr/src/debug/zstd/1.6.0/lib/dictBuilder, directory renamed /usr/src/debug/zstd/1.5.7/lib -> /usr/src/debug/zstd/1.6.0/lib, directory renamed /usr/src/debug/zstd/1.5.7/contrib/pzstd -> /usr/src/debug/zstd/1.6.0/contrib/pzstd, directory renamed /usr/src/debug/zstd/1.5.7/lib/decompress -> /usr/src/debug/zstd/1.6.0/lib/decompress, directory renamed /usr/src/debug/zstd/1.5.7/contrib/pzstd/utils -> /usr/src/debug/zstd/1.6.0/contrib/pzstd/utils, removed "/usr/src/debug/zstd/1.5.7/lib/common/pool.c /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v01.c /usr/src/debug/zstd/1.5.7/lib/common/zstd_trace.h /usr/s
 rc/debug/zstd/1.5.7/lib/legacy/zstd_v02.h /usr/src/debug/zstd/1.5.7/lib/common/compiler.h /usr/src/debug/zstd/1.5.7/lib/common/pool.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v01.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v02.c /usr/src/debug/zstd/1.5.7/lib/common/threading.h /usr/src/debug/zstd/1.5.7/lib/common/bits.h /usr/src/debug/zstd/1.5.7/lib/common/threading.c /usr/src/debug/zstd/1.5.7/lib/common/entropy_common.c /usr/src/debug/zstd/1.5.7/lib/common/cpu.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v06.c /usr/src/debug/zstd/1.5.7/lib/common/huf.h /usr/src/debug/zstd/1.5.7/lib/common/fse.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v07.c /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v06.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v07.h /usr/src/debug/zstd/1.5.7/lib/common/xxhash.h /usr/src/debug/zstd/1.5.7/lib/common/zstd_common.c /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v04.c /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v05.c /usr/src/debug/zstd/1.5.7/lib/common/xxhash.c /usr/src/de
 bug/zstd/1.5.7/lib/legacy/zstd_v04.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v05.h /usr/src/debug/zstd/1.5.7/lib/common/bitstream.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v03.c /usr/src/debug/zstd/1.5.7/lib/common/error_private.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_v03.h /usr/src/debug/zstd/1.5.7/lib/legacy/zstd_legacy.h /usr/src/debug/zstd/1.5.7/lib/common/zstd_internal.h /usr/src/debug/zstd/1.5.7/lib/common/error_private.c /usr/src/debug/zstd/1.5.7/lib/common/debug.c /usr/src/debug/zstd/1.5.7/lib/common/allocations.h /usr/src/debug/zstd/1.5.7/lib/common/fse_decompress.c /usr/src/debug/zstd/1.5.7/lib/common/mem.h", added "/usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v06.c /usr/src/debug/zstd/1.6.0/lib/common/compiler.h /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v05.h /usr/src/debug/zstd/1.6.0/lib/common/fse.h /usr/src/debug/zstd/1.6.0/lib/common/huf.h /usr/src/debug/zstd/1.6.0/lib/common/mem.h /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v06.h /usr/src/debug/zstd/1.6.0/lib/lega
 cy/zstd_v05.c /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v07.h /usr/src/debug/zstd/1.6.0/lib/common/xxhash.h /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v07.c /usr/src/debug/zstd/1.6.0/lib/common/xxhash.c /usr/src/debug/zstd/1.6.0/lib/common/pool.h /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_legacy.h /usr/src/debug/zstd/1.6.0/lib/common/pool.c /usr/src/debug/zstd/1.6.0/lib/common/zstd_trace.h /usr/src/debug/zstd/1.6.0/lib/common/fse_decompress.c /usr/src/debug/zstd/1.6.0/lib/common/allocations.h /usr/src/debug/zstd/1.6.0/lib/common/entropy_common.c /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v04.c /usr/src/debug/zstd/1.6.0/lib/legacy/zstd_v04.h /usr/src/debug/zstd/1.6.0/lib/common/zstd_common.c /usr/src/debug/zstd/1.6.0/lib/common/debug.c /usr/src/debug/zstd/1.6.0/lib/common/bits.h /usr/src/debug/zstd/1.6.0/lib/common/bitstream.h /usr/src/debug/zstd/1.6.0/lib/common/zstd_internal.h /usr/src/debug/zstd/1.6.0/lib/common/error_private.c /usr/src/debug/zstd/1.6.0/lib/common/error_private.h /us
 r/src/debug/zstd/1.6.0/lib/common/threading.h /usr/src/debug/zstd/1.6.0/lib/common/threading.c"
packages/x86-64-v3-poky-linux/zstd/zstd-src: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-src: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd-staticdev: PKGSIZE changed from 7203170 to 7232142 (+0%)
packages/x86-64-v3-poky-linux/zstd/zstd-staticdev: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd-staticdev: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
packages/x86-64-v3-poky-linux/zstd/zstd: PKGSIZE changed from 1838470 to 1740402 (-5%)
packages/x86-64-v3-poky-linux/zstd/zstd: PV changed from "1.5.7" to "1.6.0"
packages/x86-64-v3-poky-linux/zstd/zstd: PKGV changed from 1.5.7 [default] to 1.6.0 [default]
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.15/site-packages/packaging-26.4.dist-info moved to /usr/lib/python3.15/site-packages/packaging-26.3.dist-info
Changes to packages/x86_64-linux/zstd-native (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.7 to libzstd.so.1.6.0
  /usr/lib/libzstd.so.1.5.7 moved to /usr/lib/libzstd.so.1.6.0

--===============8881487140757467923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="zstd-changelog.txt"

v1.6.0 (Nov 2026)
fix: streaming decompression of malformed data could expose uninitialized memory
fix: multithreaded compression with `ZSTD_CCtx_refPrefix()` could rarely emit a
valid frame encoding wrong data, depending on thread timing
fix: out-of-bounds read and write in the DDict hash table when using
`ZSTD_d_refMultipleDDicts`
fix: use-after-free of a `ZSTD_DCtx_refPrefix()` prefix after
`ZSTD_DCtx_reset()` following a malformed frame header
fix: out-of-bounds read with `ZSTD_c_stableInBuffer` after an abandoned frame or
a changed input buffer, reported by @IlyaGrebnov
fix: multithreaded compression use-after-free when freeing or resetting a
context during an abandoned frame
fix: multithreaded streaming compression accepted a wrong pledged source size,
producing corrupted frames
fix: prepared dictionary decompression now rejects matches into formatted
dictionary headers
fix: on a static DCtx, `ZSTD_DCtx_loadDictionary()` and `ZSTD_DCtx_refPrefix()`
return `ZSTD_error_memory_allocation` for nonempty dictionaries
fix: wild reads when compressing with large dictionaries whose repcodes point
into discarded content
fix: memory corruption in `ZSTD_compressSequences()` and
`ZSTD_compressSequencesAndLiterals()` with small `dst`, overflowing lengths, or
some invalid sequences (#4918, #4989, #5004)
fix: out-of-bounds write with `ZSTD_c_targetCBlockSize` and `ZSTD_compress2()`
into a `dst` smaller than `ZSTD_compressBound()`
fix: high compression levels read uninitialized statistics with some
dictionaries
fix: 32-bit multithreaded compression with large windows (#4946, #4948)
fix: 32-bit builds rejected valid dictionary IDs above 4294967176
fix: excessive memory usage with long distance matching and small windows
fix: CDict and DDict creation and size estimation reject dictionary sizes that
overflow
fix: crash when a custom allocator fails (#4613), data race when resizing a
thread pool
fix: legacy decoders: out-of-bounds reads, wrong streaming output, and offset
validation (#4555, #4815, #4816, #4817, #4913, #4955, #4957)
api: legacy format support is now disabled by default
api: experimental `ZSTD_d_refMultipleDDicts` requires an exact dictionary ID
match: a missing nonzero ID returns `ZSTD_error_dictionary_wrong` instead of
falling back to the current dictionary
api: disabling experimental `ZSTD_d_refMultipleDDicts` releases every dictionary
reference of its set
api: removed the deprecated experimental functions `ZSTD_copyCCtx()` and
`ZSTD_copyDCtx()`
api: promoted `ZSTD_getFrameHeader()` and `ZSTD_FrameHeader` to the stable API
api: promoted `ZSTD_createDDict_byReference()`,
`ZSTD_DCtx_loadDictionary_advanced()`, and `ZSTD_CCtx_loadDictionary_advanced()`
to the stable API, along with `ZSTD_dictContentType_e` and
`ZSTD_dictLoadMethod_e` (#4283, #3723)
api: `ZSTD_decompressDCtx()`, `ZSTD_decompress_usingDict()` and
`ZSTD_decompress_usingDDict()` reset an unfinished streaming session, as
documented
api: `ZSTD_DCtx_loadDictionary()` returns `ZSTD_error_dictionary_corrupted` for
a corrupted dictionary, instead of `ZSTD_error_memory_allocation`
api: `ZSTD_compressSequencesAndLiterals()` enforces its documented limits on
block size and `litBufCapacity` (#4741, #4782)
api: `ZSTD_decompressContinue()` returns `ZSTD_error_stage_wrong` when not
preceded by `ZSTD_decompressBegin()`
api: new experimental `ZSTD_isDeterministicBuild()`
perf: faster decompression on AArch64 (#4413, #4414, #4418, #4509), by
@arpadpanyik-arm
perf: faster compression on AArch64 with SVE2 (#4411), by @arpadpanyik-arm
perf: faster `ZSTD_compressSequencesAndLiterals()` on AArch64 with Neon and SVE2
(#4429, #4440), by @arpadpanyik-arm, and on RISC-V with RVV (#4399), by
@zijianli1234
perf: faster row match finder on RISC-V with RVV (#4481), by @w1m024
cli: new `--patch-apply` command, equivalent to `-d --patch-from`
cli: `-B#` renamed `--jobsize=#`, and benchmark `--blocksize=#` renamed
`--split=#`; old names remain supported
cli: `--filelist=` supports process substitution
cli: size arguments accept `G`, `GB` and `GiB` suffixes (#4609), by @Integral-
Tech
cli: `--memory=` also limits `.xz` and `.lzma` decompression
cli: benchmark mode uses 1 thread by default
cli: warn when multiple threads are requested for decompression
cli: safer file handling: no output through symbolic links (#4906), `-r` no
longer follows links and junctions on Windows (#4905), better same-file
detection on Windows (#4884), robust to concurrent renames (#4962, #4999, #5003,
#5009)
cli: `--output-dir-flat` fails on output filename collisions before processing
(#4974), by @daniellerozenblit
cli: fix `zstd -l` infinite loop on a large skippable frame
cli: fix `--memlimit-decompress=` parsing (#4916), `--adapt` bounds (#4982),
`--patch-from` with an empty file (#4896), `--check` with `--format=lz4`
cli: fix `ZSTD_NBTHREADS=0` (#4334),
cli: fix decode-only benchmark of multiple files (#4714, #4945)
cli: `zstdgrep` exits 0 when any of several files matches
zdict: fix out-of-bounds reads with small training sets (#4690, #4710, #4922),
and COVER results no longer depend on memory addresses
contrib: seekable_format: fix out-of-bounds reads, infinite loops and error
recovery on malformed seek tables (#4712, #4717, #4902, #4941, #4942, #4958)
contrib: zlibWrapper: no longer writes an empty gzip member after `Z_FINISH`
build: `ZSTD_LEGACY_SUPPORT` defaults to `0` in all build systems (#4554, #4781)
build: root `CMakeLists.txt` wrapper
build: cmake: C++ only required for tests (#4357), ASM only enabled when needed
(#4504), separate export groups (#4494), static API visibility applied to the
shared library (#4789), Android build
build: fix cmake with clang-cl (#4810, #4972),
build: fix meson on Windows (#4322), duplicate `LC_RPATH` on macOS 15.4+
(#4371), Swift module map (#4531), musl (#4336), OpenBSD and NetBSD
build: meson calls `meson.override_dependency()` (#4472), by @bgilbert
build: Windows release binaries support lz4 (#4327), and new Windows ARM64
binaries
portability: RISC-V 64-bit detection
doc: clarified `Block_Maximum_Size` in the format specification

--===============8881487140757467923==--
