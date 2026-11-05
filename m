Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27746.1793856424668652193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SBQbmkZ9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Mw9Xer0J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1aa2cc74c-8e280b22-3c54-4032-a9de-723103f812a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793856423;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mfiBEv8iMVWN/C2hrf0vKmKX7qfeGCAuHcKDb4uulCY=;
	b=SBQbmkZ97wd6Iuc7hNhCkl9z9ujvKKVC4ajDORg5Ff9LaHzon4m89fPOuKOF+hSa
	JTkgAmtrgNADBp/lTHKCZIWu0rvPi8OETeDoy87IK3UTr5npeqp4EIZgin0qlG9U1p0
	fOSevRpkG0+koc4echpA5hfptuRmQqSo7XGrcKbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793856423;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mfiBEv8iMVWN/C2hrf0vKmKX7qfeGCAuHcKDb4uulCY=;
	b=Mw9Xer0JVZTdEGZn8i/Sf+if+PejreIS4ROCjPSQt+Z3FB3VWts3fmS4qD1rWuML
	hV3P0bxWWpJqOypd49BsiMg4YPenn97+h6rp+vxWdwZV105AxRs/qsuse0I5j12ZSdo
	vRUJ2HgxJQH/evN6jNgrzwFrbllZsfQFVrIJUYxw=
Content-Type: multipart/mixed; boundary="===============4283675938372117366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lz4: upgrading to 1.11.0 FAILED
Message-ID: <010101a1aa2cc74c-8e280b22-3c54-4032-a9de-723103f812a5-000000@us-west-2.amazonses.com>
Date: Thu, 5 Nov 2026 05:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249426

--===============4283675938372117366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lz4* to *1.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lz4-upgrade-1.10.0-1.11.0.patch
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
From e5648229fed972c884c1477bf089565406278a24 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 5 Nov 2026 05:26:57 +0000
Subject: [PATCH] lz4: upgrade 1.10.0 -> 1.11.0

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
---
 meta/recipes-support/lz4/{lz4_1.10.0.bb => lz4_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/lz4/{lz4_1.10.0.bb => lz4_1.11.0.bb} (96%)

diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.11.0.bb
similarity index 96%
rename from meta/recipes-support/lz4/lz4_1.10.0.bb
rename to meta/recipes-support/lz4/lz4_1.11.0.bb
index 5a39f89871..d04df5b0ca 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.11.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
 
 PE = "1"
 
-SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
+SRCREV = "c72c7c0ec132ad2ce2fe9fad7b0c728d9faee2fc"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https;tag=v${PV} \
            file://reproducibility.patch \
-- 
2.47.1


--===============4283675938372117366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="lz4-changelog.txt"

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

--===============4283675938372117366==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lz4-upgrade-1.10.0-1.11.0.patch"

RnJvbSBlNTY0ODIyOWZlZDk3MmM4ODRjMTQ3N2JmMDg5NTY1NDA2Mjc4YTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNSBOb3YgMjAyNiAwNToyNjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
NDogdXBncmFkZSAxLjEwLjAgLT4gMS4xMS4wCgp2MS4xMS4wCmZpeCAgOiBkYXRhIGNvcnJ1cHRp
b24gaW4gdmFsaWQgdXNhZ2UgOiByaW5nIGJ1ZmZlciBkZWNvZGluZwooYExaNF9kZWNvZGVyUmlu
Z0J1ZmZlclNpemUoKWAsIHNpbmNlIHYxLjkuMCksIHJhcmUgY2FzZXMgb2Ygc3RyZWFtaW5nIG9y
CmBkZXN0U2l6ZWAgY29tcHJlc3Npb24sIG9uZSByZXBvcnRlZCBieSBAZnJlZWRvbS13aW5kcwpm
aXggIDogc2luZ2xlLXRocmVhZCBgbHo0YCBjb3VsZCB0cnVuY2F0ZSB0aGUgZGVjb2Rpbmcgb2Yg
Y29uY2F0ZW5hdGVkIGZyYW1lcwp3aXRoIGJsb2NrIGNoZWNrc3VtcwpmaXggIDogbXVsdGl0aHJl
YWRlZCBkZWNvbXByZXNzaW9uIGNvdWxkIHdyaXRlIG91dCBvZiBib3VuZHMgYWZ0ZXIgMl4zMSBm
cmFtZXMKKHNpbmNlIHYxLjEwLjApLCBieSBAYXJzaHNtaXRoMQpmaXggIDogYExaNEZfY29tcHJl
c3NCZWdpbl91c2luZ0RpY3QoKWAgaWdub3JlZCB0aGUgZGljdGlvbmFyeSB3aXRoIGluZGVwZW5k
ZW50CmJsb2NrcwpmaXggIDogc29tZSBwZXJpb2RpYyBkYXRhIGNvbXByZXNzZWQgdXAgdG8gMzB4
IHdvcnNlIGF0IGZhc3QgbGV2ZWxzLCBhbmQgdmVyeQpzbG93bHkgYXQgbGV2ZWwgMTIsIHJlcG9y
dGVkIGJ5IEBtYXJ0aW51cwpmaXggIDogaW52YWxpZCBhcmd1bWVudHMgKG5lZ2F0aXZlIHNpemVz
LCBgTlVMTGAsIGludmFsaWQgYGJsb2NrU2l6ZUlEYCwgZXh0cmVtZQpsZXZlbHMpIG5vIGxvbmdl
ciBjcmFzaCBub3Igb3ZlcmZsb3csIGJ5IEBhcnRodXotdGgsIEBqYXlwYXRyaWNraG93YXJkLApA
bG91aXNsYWZvc3NlLCBAYWthc2hkZXNobXVraC1naXQsIEByaW5zdWtpCmZpeCAgOiBsejRmaWxl
IHJlcG9ydHMgdHJ1bmNhdGVkIGZpbGVzIGFuZCB3cml0ZSBmYWlsdXJlcywgYW5kIGFjY2VwdHMg
ZmlsZXMgPAoxOSBieXRlcywgYnkgQGF4aXFpYQpwZXJmIDogZmFzdGVyIGRlY29tcHJlc3Npb24g
b24gYWFyY2g2NCBhbmQgeDg2LTY0ICh1cCB0byArMTklLCArNCUgb24Kc2lsZXNpYS50YXIpLCBg
TFo0X0ZBU1RfREVDX0xPT1BgIG9uIGFhcmNoNjQgd2l0aCBjbGFuZyBhbmQgb24gcmlzY3Y2NCwg
YnkKQE5pY29zaGV2IGFuZCBAYXJwYWRwYW55aWstYXJtCnBlcmYgOiBmYXN0ZXIgY29tcHJlc3Np
b24gb2Ygc21hbGwgYmxvY2tzIGF0IGZhc3QgbGV2ZWxzLCB3aXRoIHJldXNlZCBzdGF0ZXMgKHVw
CnRvICs4MCUpIG9yIGRpY3Rpb25hcmllcyAodXAgdG8gKzM1JSksIHBhcnRseSBwcm9wb3NlZCBi
eSBAQmlwbGFiUmF1dApwZXJmIDogZmFzdGVyIGxldmVscyAxMSBhbmQgMTIgKCs4JSB0byArMjcl
KSwgbGV2ZWwgMiBjb21wcmVzc2VzIH4wLjglIGJldHRlcgpwZXJmIDogeDg2IGJ1aWxkcyBhdm9p
ZCB0aGUgSkNDIGVycmF0dW0gOiB1cCB0byArMTIlIGNvbXByZXNzaW9uIGFuZCArMzElCmRlY29t
cHJlc3Npb24gb24gSW50ZWwgU2t5bGFrZS1mYW1pbHkgY3B1cwphcGkgIDogbXVsdGl0aHJlYWRl
ZCBsejRmcmFtZSBjb21wcmVzc2lvbiAoZXhwZXJpbWVudGFsCmBMWjRGX3ByZWZlcmVuY2VzX3Qu
bmJXb3JrZXJzYCkgOiBvdXRwdXQgaW5kZXBlbmRlbnQgb2YgdGhlIG5iIG9mIHdvcmtlcnMgYW5k
IG9mCnRoZSBjb250ZXh0J3MgaGlzdG9yeQphcGkgIDogcmFuZG9tIGFjY2VzcyB3aXRoaW4gZnJh
bWVzIGFuZCBsejQgZmlsZXMgOiBgTFo0Rl9yZXN1bWVGcmFtZSgpYCwKYExaNEZfc2VlaygpYCwg
YExaNEZfdGVsbCgpYCAoc3RhdGljKQphcGkgIDogYExaNF9kZWNvbXByZXNzX3NhZmUoKWAgcmV0
dXJucyBkaXN0aW5jdCBlcnJvciBjb2RlcyA6IGAtMWAgbWFsZm9ybWVkCmlucHV0LCBgLTJgIGBk
c3RDYXBhY2l0eWAgdG9vIHNtYWxsLCBgLTNgIG1pc3NpbmcgZGljdGlvbmFyeQphcGkgIDogbHo0
ZnJhbWUgY29tcHJlc3Npb24gYWNjZXB0cyBhbnkgYGRzdENhcGFjaXR5YCwgYW5kIG9ubHkgZmFp
bHMgaWYgdGhlCm91dHB1dCBkb2Vzbid0IGZpdAphcGkgIDogcmVtb3ZlZCBmcm9tIGhlYWRlcnMg
OiBmdW5jdGlvbnMgZGVwcmVjYXRlZCBzaW5jZSB2MS43LnggLyB2MS44LjAgKHN0aWxsCmV4cG9y
dGVkIGJ5IGxpYmx6NCksIHVucHJlZml4ZWQgbHo0ZnJhbWUgZW51bXMgOyBgTFo0X3Jlc2V0U3Ry
ZWFtKClgIGFuZApgTFo0X3Jlc2V0U3RyZWFtSEMoKWAgYXJlIGRlcHJlY2F0ZWQKYXBpICA6IGBM
WjRGX2NvbXByZXNzT3B0aW9uc190YCBtdXN0IGJlIHplcm8taW5pdGlhbGl6ZWQgOyByZXNlcnZl
ZCBmaWVsZHMgYXJlCnNjYWxhcnMgKGZsYXR0ZW4gcG9zaXRpb25hbCBpbml0aWFsaXplcnMpIDsg
YExaNEZfdW5jb21wcmVzc2VkVXBkYXRlKClgCmRlcHJlY2F0ZWQgKHVzZSBgLnVuY29tcHJlc3Nl
ZGApCmFwaSAgOiBjdXN0b20gYWxsb2NhdG9ycyBmb3IgbHo0ZmlsZSAoYF9hZHZhbmNlZCgpYCBm
dW5jdGlvbnMpLApgTFo0X1VTRVJfTUVNT1JZX0ZVTkNUSU9OU2AgYWxzbyBmb3IgbHo0ZnJhbWUg
YW5kIGx6NGZpbGUgOyBgTFo0Rl9jY3R4X3NpemUoKWAKYW5kIGBMWjRGX2RjdHhfc2l6ZSgpYCBi
eSBAZmVsaXhoYW5kdGUKYXBpICA6IEhDIHN0YXRlcyBpbmNsdWRlIHRoZSBidWZmZXIgb2YgbGV2
ZWxzIDEwKyAoKzY0IEtCIHBlciBzdGF0ZSkgOiBubwphbGxvY2F0aW9uIGR1cmluZyBjb21wcmVz
c2lvbgpjbGkgIDogbXVsdGl0aHJlYWRlZCBjb21wcmVzc2lvbiByZWxpZXMgb24gbGlibHo0IDog
c2FtZSBvdXRwdXQgd2l0aCBhbnkgbmIgb2YKdGhyZWFkcyBhbmQgd2l0aG91dCBtdWx0aXRocmVh
ZGluZyBzdXBwb3J0IDsgYC1UI2Agd2l0aGluIGEgbWVtb3J5IGJ1ZGdldAooYC0tbWVtb3J5PSNg
KSA7IG5ldyBgLS1zaW5nbGUtdGhyZWFkYApjbGkgIDogZGVjb2RlcyBGaXJlZm94J3MgbW96bHo0
IGZpbGVzLCBwcm9wb3NlZCBieSBAVW5pdGVkTWFyc3VwaWFscywgYW5kIGxlZ2FjeQpmcmFtZXMg
d2l0aCB0aGUgTGludXgga2VybmVsIGVuZCBtYXJrZXIsIHJlcXVlc3RlZCBieSBAYmVuamFyb2Jp
biAoZnJhbWUgZm9ybWF0CmRvY3VtZW50YXRpb24gYnkgQEFydG9yaWEyZTUpCmNsaSAgOiBzYWZl
ciBmaWxlIGhhbmRsaW5nIDogYW4gb3V0cHV0IGlkZW50aWNhbCB0byB0aGUgaW5wdXQgaXMgcmVm
dXNlZCwgYQpzb3VyY2UgbW9kaWZpZWQgZHVyaW5nIGNvbXByZXNzaW9uIGlzIGRldGVjdGVkLCBg
LS1ybWAga2VlcHMgdGhlIHNvdXJjZSBhZnRlcgpmYWlsdXJlcywgYnkgQEZ1cmFuNjY2LCBATmV4
b3J5IGFuZCBAaW1tYW51d2VsbApjbGkgIDogYmVuY2htYXJrIChgLWJgKSBtZWFzdXJlcyBmcmFt
ZXMsIGNvbXByZXNzZWQgYXMgYGx6NGAgZG9lcyB3aXRoIHRoZSBzYW1lCm9wdGlvbnMKY2xpICA6
IHZhcmlvdXMgZml4ZXMgKGAtLWxpc3RgLCBsZWdhY3kgZm9ybWF0LCBiZW5jaG1hcmssIGAtdCAt
bWAsIG51bWVyaWMKYXJndW1lbnRzKSwgYnkgQHRhbnN5LCBAam1lc3R3YS1jb2RlciwgQGFrYXNo
ZGVzaG11a2gtZ2l0LCBAYXJzaHNtaXRoMSwgQGpsZWUzMDMKYW5kIEBOZXhvcnkKYnVpbGQ6IGR5
bmFtaWMgbGlicmFyeSBtdWx0aXRocmVhZGVkIGJ5IGRlZmF1bHQsIHN0YXRpYyBsaWJyYXJ5IHNp
bmdsZS10aHJlYWRlZAo7IGNtYWtlIGBsejRgIG11bHRpdGhyZWFkZWQKYnVpbGQ6IGNtYWtlIDog
ZXhwb3J0ZWQgYGx6NDo6bHo0YCB0YXJnZXQgYnkgQGRnMHl0LCBDTWFrZSA0IHN1cHBvcnQgYnkK
QEdlb3JnSDkzLCBgQ01BS0VfUE9TSVRJT05fSU5ERVBFTkRFTlRfQ09ERWAgYnkgQGRzLXNsb3Ro
CmJ1aWxkOiBjbWFrZSA6IGFzIGEgc3VicHJvamVjdCwgdGhlIGBsejRgIHByb2dyYW0gaXMgbm8g
bG9uZ2VyIGJ1aWx0IGJ5IGRlZmF1bHQKKGAtRExaNF9CVUlMRF9DTEk9T05gIHJlc3RvcmVzIGl0
KSwgYnkgQGNydWV0ZXIKYnVpbGQ6IHJlcHJvZHVjaWJsZSBzdGF0aWMgbGlicmFyeSBieSBAcnB1
cmRpZSwgQUlYIHN1cHBvcnQgYnkgQHNodWJoYW1oaWksCm1lc29uIGZpeGVzIGJ5IEBncm9iaWFu
LCBAYmdpbGJlcnQgYW5kIEBlbGktc2Nod2FydHosIG90aGVyIGZpeGVzIGJ5IEBob3RzY2htb2Us
CkBpd2FtYXRzdSwgQGRvcmFvcmFrLCBASkNhc2ggYW5kIEBicmFpbnkKcG9ydCA6IFJJU0MtViB3
aXRoIGBaaWNjbHNtYCB1c2VzIHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMsIGJ5IEBQb2xhcmlz
LTkxMQotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC97bHo0XzEuMTAuMC5iYiA9PiBsejRf
MS4xMS4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC97bHo0XzEuMTAuMC5iYiA9
PiBsejRfMS4xMS4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2x6NC9sejRfMS4xMC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjExLjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bHo0L2x6NF8xLjEwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejRf
MS4xMS4wLmJiCmluZGV4IDVhMzlmODk4NzEuLmQwNGRmNWIwY2EgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS4xMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2x6NC9sejRfMS4xMS4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL2xpYi9MSUNFTlNFO21kNT01Y2Q1Zjg1MWI1MmVjODMyYjEwZWVkYjNmMDFmODg1
YSBcCiAKIFBFID0gIjEiCiAKLVNSQ1JFViA9ICJlYmIzNzBjYTgzYWYxOTMyMTJkZjRkY2JhZGNj
NWQ4N2JjMGRlMmYwIgorU1JDUkVWID0gImM3MmM3YzBlYzEzMmFkMmNlMmZlOWZhZDdiMGM3Mjhk
OWZhZWUyZmMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sejQvbHo0LmdpdDticmFu
Y2g9cmVsZWFzZTtwcm90b2NvbD1odHRwczt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgZmlsZTov
L3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============4283675938372117366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.1.99+snapshot-a05a922e53229d4140e42da63853926b9adcd130"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a05a922e53229d4140e42da63853926b9adcd130"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 293 Local 278 Mirrors 0 Missed 15 Current 298 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1053 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_recipe_qa)
NOTE: Running task 1451 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_create_recipe_spdx)
NOTE: recipe lz4-1_1.11.0-r0: task do_recipe_qa: Started
NOTE: recipe lz4-1_1.11.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe lz4-1_1.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1478 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_fetch)
NOTE: recipe lz4-1_1.11.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lz4-1_1.11.0-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1479 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_unpack)
NOTE: Running task 1480 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.11.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1499 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_patch)
NOTE: recipe lz4-1_1.11.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.11.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1481 tasks of which 1475 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261105052642.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261105052642.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.0/temp/log.do_patch.50529
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: lz4-1_1.11.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4/reproducibility.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.0/sources/lz4-1.11.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.0/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Applying patch reproducibility.patch
patching file lib/Makefile
Hunk #1 FAILED at 55.
Hunk #2 FAILED at 102.
2 out of 2 hunks FAILED -- rejects in file lib/Makefile
Patch reproducibility.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lz4/1.11.0/temp/log.do_patch.50529
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.11.0.bb:do_patch) failed with exit code '1'

--===============4283675938372117366==--
