Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C034DCCD19F
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:09:04 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.4653.1760584140090902854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CzshvCL+;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-78defc1a2afso6731156d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584139; x=1761188939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQe8TiIPFKHB6mJ3sPoVQi1luMb+PTqUl1W1BhkcQNg=;
        b=CzshvCL+Lpv86TZ9j7W3DQy+vjoxXkKhsrXoDHysh3yvxt3++m5SxNI1wkEwiZ+0TL
         gsTpewmyWuijsRP+EglmcUDglDalsNMmaUlpoL9g1BOnaTC7fZUOHj9XvLUj3a3mkD6l
         /NQ83FJcbv/IVJWU4TuLdeo4gyie6R8H2MLCQHNIt0PNLcsokuGEw7V8HxanszgGlDsG
         z4Bni47D0RpyxBYYpSeh4rONJtM6q5t3NXSSj85Egn3kBJab9bF5+5QuvX975O6145xZ
         4qXSRsRWNKXEDsVq60ZUdMd4GKsK3HQx8X53Hj1q3oHgPU5t6rPhe7eu3Ijmv2oJCuPp
         vLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584139; x=1761188939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQe8TiIPFKHB6mJ3sPoVQi1luMb+PTqUl1W1BhkcQNg=;
        b=hV+kMwThgTTW88inAxF9AoDmX7m/qlHke4pzNxhvBV6uk0UoADgS96HG29EAE8PfSc
         59sGCW+tLNdlRCDTwX/IPU3RrNZcYiZXA8tsZzojYjHfzRK/GktEOBuhemDnxmSRuL21
         7Rqfhtk9EYSayL8LRhn+Ezeh3aSYwe4S9WvZBIQgPCV2rvGDKc0m5rT0AbKiDT2YYklj
         9/0a6+rOEn1Kwa0NpshzY8PdPb999QEdKAji2SI0RsZpu4TaWmxt8uuf37A5QDNWC1Lb
         z3mj508/zaisNw+8MpF96KTvTAJwP42axRTZw4Crcpjgsmg4u8bRsXXYe8Xb7VjjYiN3
         I09w==
X-Gm-Message-State: AOJu0YxF8ji1dF8IT/l4wmH6h1yBf9Z3qFSstj3hu9BaJk8vb2vn0kkd
	vhM6CjELtxcvb78zoIGnpQDqF2Inoa1K3XAtDFzrxjkyDqgfeAeGlV8h
X-Gm-Gg: ASbGncsDVnhZ0P8HAAaxpZny5JPIaji+aKVHecus0qzLKczmfqPrNDvkGgjpXH832Iz
	JD1zfNBqT+lBw2o/RpuAJn9ygxlGO7XHVAhojRdTjoE1dFs15Y2/hU+JQXFZTdLt0ZTFLPYSKsd
	uCssUB/U0bU7DmKLYpiqtTYrzIYDMteBsm8EPSCH2RonlbKWf1R/G+dF8hujU2C+NLyU83WtRcu
	WwAwtyEUPGkElOld1swuaLx4b0VbxjyOg50IeX79n8RtBamN5xOEgTkikigY8bH03bPUqomRTGP
	GrHdaIUnkMSKKtdFitYy4obVDIa3P5yDSjDToFqhp1VvvFvOiRCMDqAXXdn9Abu0MU5ra2Kq/uk
	swJnnzCkVU7Ggo+Z/y5qjm7jcBChRDOEYYdkYM3umJhOx/opr+lNVLVPTvFZVK2aNbtmQAjRCck
	wM2vZM4sfCOict4iN8dN+zQ3qjypdyww45OpsDatmvl+pcf2Fy164Shbp18VcOaFPBGL6Nqv2At
	Rob
X-Google-Smtp-Source: AGHT+IG31k24rFywzycoASe06BUviRgFmtPb+qYmlkug1heWoabKfaAzbvb0hlFLDDLv6AMoY3GVZg==
X-Received: by 2002:a05:6214:528f:b0:877:81d2:4c27 with SMTP id 6a1803df08f44-87b2ef38450mr389840446d6.57.1760584138977;
        Wed, 15 Oct 2025 20:08:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] kern-tools: fix symbol_why for v6.18-rc1+
Date: Wed, 15 Oct 2025 23:08:43 -0400
Message-Id: <2825ef5ac79081dd3f980ba39155c628783709fa.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224925

From: Bruce Ashfield <bruce.ashfield@gmail.com>

commit f589e1df23251d8319063da0a61c1016b2a0bf85 (HEAD -> master)
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Wed Oct 15 18:12:20 2025 -0400

    tools/Kconfiglib: add support for transitional attribute

    We need to update the parser to handle:

    commit f9afce4f32e9a120fc902fa6c9e0b90ad799a6ec
    Author: Kees Cook <kees@kernel.org>
    Date:   Tue Sep 23 14:34:18 2025 -0700

        kconfig: Add transitional symbol attribute for migration support

        During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
        existing .config files need to maintain backward compatibility while
        preventing deprecated options from appearing in newly generated
        configurations. This is challenging with existing Kconfig mechanisms
        because:

        1. Simply removing old options breaks existing .config files.
        2. Manually listing an option as "deprecated" leaves it needlessly
           visible and still writes them to new .config files.
        3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
           etc) prevents the option from being processed at all.

        Add a "transitional" attribute that creates symbols which are:
        - Processed during configuration (can influence other symbols' defaults)
        - Hidden from user menus (no prompts appear)
        - Omitted from newly written .config files (gets migrated)
        - Restricted to only having help sections (no defaults, selects, etc)
          making it truly just a "prior value pass-through" option.

        The transitional syntax requires a type argument and prevents type
        redefinition:

            config NEW_OPTION
                bool "New option"
                default OLD_OPTION

            config OLD_OPTION
                bool
                transitional
                help
                  Transitional config for OLD_OPTION migration.

        This allows seamless migration: olddefconfig processes existing
        CONFIG_OLD_OPTION=y settings to enable CONFIG_NEW_OPTION=y, while
        CONFIG_OLD_OPTION is omitted from newly generated .config files.

        Added positive and negative testing via "testconfig" make target.

        Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
        Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
        Reviewed-by: Nathan Chancellor <nathan@kernel.org>
        Tested-by: Nathan Chancellor <nathan@kernel.org>
        Link: https://lore.kernel.org/r/20250923213422.1105654-2-kees@kernel.org
        Signed-off-by: Kees Cook <kees@kernel.org>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 84b8b10a26..9240ee5db8 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "fe67c98d2e9b74af44d0c4b660fa18e3a95e7edd"
+SRCREV = "f589e1df23251d8319063da0a61c1016b2a0bf85"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


