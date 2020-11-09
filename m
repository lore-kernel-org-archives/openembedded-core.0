Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.4411.1604880144122057184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rcKGmKFP;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id v12so6173101pfm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J2sivXZJG2eKhNopNGfH/DeEsIS9fHoQZT/5K4uhh6E=;
        b=rcKGmKFPckgeYJ4+ag8RyGFrZNZUGI6fPatMOAyoDERm0fEPtuhhwLnjtfuva/oSnP
         P9hHXCag+eLj1geSj6ewqy4FmsyTlrRLGvNwq3xkBZRscakrK/z8XiFdzU1IiKwfhEPX
         wrHGXrkcf48glpjRIgTl8lVpbtO88tUnj72Nsssca2RFN3I1dN5hCY+vllyrRuzfvU2l
         wL+tDOMkgzNJ5qs4Z0BW8MZJZsjlMWzyDVJR3X4jzuSAo4SlarpdBCFWlSNeU9tQNFrr
         VAf+JzHSJU3t3jNJnHEkiFNObmuO384jgC49qnHNys5qn1aZcC4SWqMPI7eD1uskakeH
         XbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J2sivXZJG2eKhNopNGfH/DeEsIS9fHoQZT/5K4uhh6E=;
        b=B2U6SDXdg/IVyD7DUvNmtO7n3xtIUKFby/NXvqb8bvV3M48/JgNub3sQGkjpJHpz4T
         rIzZJv9MwhR1IBCqKS2JBuepDYHn8zfjZdj5MyJ6cxsDVb/VV+0U1C7XRIcbiOgR4yPA
         nBeUIhfToZ34rScd5FqCEZuOq6VWKlQOaBkGMlNjIHPJc0NoN79tGV3A2J7Wz1L30BQE
         q0MESbJ0hmEYo7mlXR3jVMGTOeX8sAN7G36NSL/LPmIVAdPELU0E4iexsF38EeWnia5M
         w6qiWN0TGJIIHwfrbiypqQqGiE4Eg/M/R3ltMv2QhN41p8WmsZcGvy30RDYR+tkHdi8S
         pw4Q==
X-Gm-Message-State: AOAM531u0O3UmWN6DMKt9+69UUjCKdlaPLVJKuNeidh80b9AyrhZsyaQ
	aAvvJH1FK6jiYgi2b/hbv6zBv8O0ZmuiDw==
X-Google-Smtp-Source: ABdhPJzR+2JE1wXN+s+gNn9IZR+bbA6yRfIeGISMDO+6V68msHaoW5kAkYjDXL5dmTz8bOVvk2dtrg==
X-Received: by 2002:a17:90a:9602:: with SMTP id v2mr10261361pjo.28.1604880143384;
        Sun, 08 Nov 2020 16:02:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 03/11] lto.inc: Add -ffat-lto-objects and -fuse-linker-plugin
Date: Sun,  8 Nov 2020 16:02:09 -0800
Message-Id: <20201109000217.3008448-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps to improve LTO and ensure the libs can be linked with non-LTO
objects too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index fe0f6c9f44..d7fea26c64 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -20,7 +20,16 @@ LTO_pn-libbsd = ""
 
 # Override it for additional or different options if needed e.g.
 # with clang thin-lto might be better for compile speed
-LTO ?= "-flto"
+#
+# ffat-lto-objects
+# object files that contain both the intermediate
+# language and the object code. This makes them
+# usable for both LTO linking and normal linking
+#
+# -fuse-linker-plugin
+# ensures that libraries participate in LTO by supplying intermediate
+# code from .a files to linker
+LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin "
 
 SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
-- 
2.29.2

