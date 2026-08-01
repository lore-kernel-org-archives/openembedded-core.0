Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E3DC55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 12:15:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4421.1785586504098364346
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 05:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OKe3Kfnl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so910594f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785586502; x=1786191302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B9an8ZUTfp7u8FMTPzJgxi5UYBQWdLhW3v3//+lGCkE=;
        b=OKe3KfnlJSPxUgrHe8esXgQ1MtxqPwsNoiJY8Npw+KQIQjtVzzxGHM4FD9B6MSAfIJ
         CRK7lQj2NdkouTULntwnIIFLkrEKxlRjD9qiKwlTTMJuBiHDRv7011nY6kFjJZtupGOw
         rp2r862cmFAL1jJ4CYUe9Azl6ZYfIUPxWLIHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586502; x=1786191302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B9an8ZUTfp7u8FMTPzJgxi5UYBQWdLhW3v3//+lGCkE=;
        b=sBbS8mgSGq5T5UBrfuF4g6SSz9jK12PZZjBJhp9vZfFJI0sGRMi/eFZVBmLgwz8PuK
         LYZFkjQ69sqvbMRQJLzVrt8/95B5FduBY8KdgHGYx14NcvPKILbg7js13tnSy3CMnXS4
         2ixPphH7i41rNiqUHlkoDwkIbrO3V3Nz47hByjWCRBVaoNTmhMYwavmEER2inYKMwpH2
         C1UrM8/cv8mcmsKR6GpUn2KJiHhzl93SpACjdetvyf/VOM65HacvoaAGn4Nt15AYVgQf
         N95+SuDfyXE1x5nWfY0yqdj2fsodF/pFzZ9PcRT9VX0+7SI8ekJQ4LvAFUlxZF2wtnAv
         w6lQ==
X-Gm-Message-State: AOJu0Yz1nwGisAaoJUVyMQYffTRuCXa1COA09gKfpM3RbYOaJn/fLzUM
	l+JdM4rpb2sLzZw+NQida5knE2OvviYGHSTCz0OCjx+rhqVtB/4tODW9jen/c+xkh39gnF5ymLt
	/qAcyabY=
X-Gm-Gg: AR+sD13QjsWzY7c5reO2II/4PYixjudx4iOlnq1dVZnjalK/62MmzQqBhVU66Z9QEz0
	yFaD5AgcQnINfVj/u6/ycIqS16tXiwVf1P4Mec0gVnaSGqteLKMI8jJF2tBzbZkCPCOnqJl0T5m
	KPbvLnYraw5MPe/czjxTHzK8csq60e+CXZ4Zyo/XxKeejE2g35GFxJTsIntY87hI8GcxgqliWJ6
	rsTNNeNGnxB3LjhsspkWdSZBOyaXsji7Sqa0DuQ8TGJimav3OuQ4XlIG8yJiYgTopZN/LnZ/gmt
	Q7CYUKFsL9k2NnfeAnhh7nMD+MxgsY0dOjKdrRLRyNgWkKQrK83RvPv4S+W/oAxc/KupQa+S3T4
	1bfuOjQrNyLGKJKaoV1moEYJUJowd8X0kBqTzWWthRSMrj6v4b2Zndw4qw9whks+ClZYc75L1iF
	71ApdrTOEFqCCTiMrPt827giIXtnDb6/MtXyZcTHQCIfG251DS3dpq9BM1rodsb9CRo2BrKswZm
	xjtdCa66c7/9uOf9A==
X-Received: by 2002:a5d:584f:0:b0:473:6e8d:7f3 with SMTP id ffacd0b85a97d-47fd72a8e5dmr7737503f8f.1.1785586502343;
        Sat, 01 Aug 2026 05:15:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm16518796f8f.14.2026.08.01.05.15.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:15:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] spirv-llvm-translator: upgrade 22.1.2 -> 22.1.5
Date: Sat,  1 Aug 2026 13:14:53 +0100
Message-ID: <20260801121454.2770123-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 12:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242494

27afcfe3 [Backport to 22] Read old SPV_INTEL_float4 type for StochasticRound*ToE2M1INTEL (#3926)
699789f4 [Backport to 22] Fix OpGroupNonUniformRotateKHR mangling (#3863) (#3905)
f167fe94 [Backport to 22] Add missing coverage for SPV_EXT_long_vector (#3889)
f172a708 [Backport to 22] Add 2 opcodes back from old SPV_INTEL_fp_conversions spec (#3880)
08310a8e [Backport to 22] Represent FP4 E2M1 with SPV_EXT_ocp_microscaling_types (#3867)
64fa6b0a [Backport to 22] Keep VectorAnyINTEL for VectorCompute modules with SPV_EXT_long_vector (#3829)
36e45764 [Backport to 22] Use SPV_EXT_long_vector extension for non-standard vector size (#3777)
e123849a [Backport to 22] Implement SPV_INTEL_subgroup_scaled_matrix_multiply_accumulate (#3831)
c88a2e4a [Backport to 22] Support SPV_INTEL_rounded_div_sqrt extension (#3770)
6c3fc37e [Backport to 22] Preventing generating FPRoundingMode for arithmetic constrained intrinsics (#3771)
9c688012 [Backport to 22] Update SPV_INTEL_fp_conversions to the latest spec revision (#3782)
521e409d [Backport to 22] Support `SaturatedToLargestFloat8NormalConversionEXT` decoration (#3767)
1d5546f5 [Backport to 22] [SPIRV->LLVM] Fix missing spir_func CC on builtin FP4/i4 conversion calls (#3746)
e10ca9b4 [LLVM 22] Add workaround to translate casts from target ext types to int (Originally: #3476) (#3684)
beefc64b [Backport to llvm_release_220] Remove internal values for SPV_INTEL_predicated_io (#3723)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...lvm-translator_22.1.2.bb => spirv-llvm-translator_22.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.2.bb => spirv-llvm-translator_22.1.5.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
index 2ee9819060d..1f80c6a27f5 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_220"
-SRCREV = "f676199fd00f2229fb35006d5124687c0785a01d"
+SRCREV = "27afcfe385cf542197dfde8c658e1f5ff53fc2fc"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "

