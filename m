Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199BEC982F5
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:10 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43669.1789974425902344001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y+BM0YEd;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso18941335e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974424; x=1790579224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CGV1yH2ZYU3KGlybNEk5VWxOCeSgu80haHf7j32jCuA=;
        b=Y+BM0YEdUGC0X2Vde/2UnFrllMvc1D+WKsAksV5aUXlKLJbkxWPptoUfxdlVy3TpuP
         EL129bP6EKWpn0rAYdmQds3FvquTRxaKWIeDYqt3+dPnpdcF+dHwwZ0qC7ww/L/oNvL3
         370LbgyFE4NLPBSCdfO48nStuzaAN54ql13bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974424; x=1790579224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CGV1yH2ZYU3KGlybNEk5VWxOCeSgu80haHf7j32jCuA=;
        b=ilPZKOcKGMXdV/X/2LbxMwoiMGfEieIeozb8EnYiPaarD3EKxrzGYBJ2f/eXpP0CmE
         ChUY622JmPiyyWobH0oU7fyoQYnZJfyekzzdaqoIHBRJcoWUIringbb/uX4Gc0sjvKi6
         7r3aAir3IufmAhwi8V5dGbxUrLhyGGF03sKyuo1mpPzXJKvs2VfW46NK/0WlrsdkFHTS
         XQCd26qgCYTML0hN0x4mqv9oVydnp8TX4gRFRt2FQncl/AHXdCeT2+dFqrgNsv14NkKD
         C0j1RNFR07SbAZcTRkIlA1O0EUhXgFHJhN22GhkC/FcXBoYu97KmWywsgPBgL1m0jwKz
         RnQw==
X-Gm-Message-State: AFuF++nxC19W/9rG/6R7UaUta+MGcVM3ky5o2UKYKVxsr0YZ4+BmqVfv
	feE5+6OXBpuw5MmPr5m0nagPIIcjjKaJfyaAkrXhYuAWPOUrq/tidbs4psdsttHq8htf1kDvdEr
	imYK8ro8=
X-Gm-Gg: AYBFou3xLy9MXMG8FWIK8R+UzygcW6uoOrZFJoRNaTuiAfWDc/OE145Ax5B7tbAodn8
	q0Kxc6IfgDNED1TvAmk8tjdoj9MxGFDy1lKChuvOSF0lkYFEcuRD/RR2A0beSpuBn0fXsXxTfI0
	mjeoC1KO3flZ45u23aaQO9iR3KbomljKNUOtxXO7E03Z1lxSi4+rk5beSo0N90VZLOldavfM3mS
	E2xnIUZrXSOBHpGsJAFO72qH7BHFKJyDnHKqmgqYVPBGuyxyoE2JTHTh0NK7WTWp1d8pDU15TkU
	eLlCc9HSHlR3f1FcSSVzxELjuOwhIw0lBl0g9THsTqneSG68lED3M1BpL33chTyZgcoTtgoqO/x
	tL+wT3GcVaNGMfwI7QArbljWe+rbnDSUoaPrRpRizbfTp/fzAbUvvCr28nSvvs4xzC64HTRgde0
	bE4qh2Qis+QIwJnwYj5wvJLDjsJ6U0G5XQqHSyQctJC59zeGvM8LfRuxAK6PT7TKcsbRcDhSzyj
	BfykWT6nSomSNLsUlsPuSp3jVw=
X-Received: by 2002:a05:600c:1986:b0:49e:7d25:f397 with SMTP id 5b1f17b1804b1-49fc56b60d7mr127330535e9.15.1789974423932;
        Mon, 21 Sep 2026 00:07:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/20] xxhash: upgrade 0.8.3 -> 0.8.4
Date: Mon, 21 Sep 2026 08:06:41 +0100
Message-ID: <20260921070656.521680-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246292

v0.8.4
- perf : added RISC-V Vector extension (RVV) implementation, by @zijianli1234, @BoBoDai and @camel-cdr
- perf : added LoongArch LASX implementation and improved LSX, by @24bit-xjkp
- perf : prefer NEON over SVE on AArch64, improving XXH3 speed by 25-40%, by @Nicoshev
- perf : improved XXH3 streaming speed for very small updates, suggested by @aleksazr
- api  : `XXH_memcpy()`, `XXH_memset()` and `XXH_memcmp()` can be redirected at compile time
- api  : new `XXH_NO_EXTERNC_GUARD` build macro for complex C++ integration
- cli  : added 64-bit seed support (`-s`, `--seed`), by @d06i
- cli  : options can appear after filenames; `--` terminates option parsing, #1098 reported by @unterkomplex
- cli  : continue processing subsequent files after read errors, #1064 reported by @ZoomRmc
- cli  : support long and special Windows paths, #1060, based on #1061 by @t-mat
- cli  : improved benchmark accuracy, error handling and unit labels, #1051 reported by @calgray
- fix  : unaligned reads could be miscompiled by GCC under strict aliasing, #1013 by @lassipulkkinen
- fix  : `XXH_INLINE_ALL` compatibility with `XXH_NAMESPACE` and x86 runtime dispatch, by @pps83, #1071 reported by @Dr-Hex
- fix  : avoid including system headers inside an `extern "C"` block, #1122 reported by @andreas-schwab
- fix  : compilation with MSVC link-time optimization and warnings as errors, #1038 reported by @mi2think
- build: improved runtime dispatch detection for cross-compilation and non-x86 targets, with help from @eworm-de, #1081 reported by @PotMJ
- build: `LIBXXH_DISPATCH=1` now applies to static and dynamic libraries, #1058 reported by @xiota
- build: Make builds now isolate objects by configuration and support parallel test builds
- build: moved CMake integration to `build/cmake` and improved cross-compilation detection
- install: improved package metadata and installation paths on Windows and FreeBSD, by @iwamatsu, @chitao1234 and @sunpoet
- portability: fixed compilation on ARM with GCC < 8, by @mstorsjo
- portability: fixed C++ compilation on Solaris and illumos, by @luqmana
- portability: AVX-512 implementation no longer requires AVX-512BW, by @NexusXe
- doc  : expanded `xxhsum` documentation and clarified the algorithm specification files
- doc  : document non-cryptographic collision properties, notably for XXH3's mid-size path (#1127 by @thomasahle)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/xxhash/{xxhash_0.8.3.bb => xxhash_0.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/xxhash/{xxhash_0.8.3.bb => xxhash_0.8.4.bb} (93%)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-support/xxhash/xxhash_0.8.4.bb
similarity index 93%
rename from meta/recipes-support/xxhash/xxhash_0.8.3.bb
rename to meta/recipes-support/xxhash/xxhash_0.8.4.bb
index dc9bbe55634..736270435b2 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
 SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "e626a72bc2321cd320e953a0ccf1584cad60f363"
+SRCREV = "c87183a77d67f7d37e3d2d1b7eaac5e7c695e4f0"
 
 CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
 

