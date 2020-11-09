Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.4521.1604880145193714135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KDf7lGFW;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id q10so6214761pfn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYJtQa0YpzQYzBvPXgY3ZX9Cb6gcaoRPZNmJbYmGuUQ=;
        b=KDf7lGFW1I06ElQaIiAgcd2MIxDAZekyQKLdWj/GU12k5PKjll5gdxKislJEgVKErG
         +QVX5mngOkDjYfr3Nj9/+LYGVOb53ksmO9xkPErZw90K5xwqcjJnQUScrwXo29UH/ZDj
         TNH50vDeA3vYLNXcsgaf61REN/yMnJRiPbF0GkBTfz31ovVf5mU5ViT4dYy0A8KneiCB
         PQ4tZU1iuNw97C3k9Fbg8YBysql6fNdJDR03+wBEj0YgFKKFZkoj2o4I6++s366o06OO
         yC/cg/bK/7EtvFr7e72Itsbb8UN9dXpDUOgTwVgxF55fgY3S56hDGmaVcApgm4I3SK9T
         QI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYJtQa0YpzQYzBvPXgY3ZX9Cb6gcaoRPZNmJbYmGuUQ=;
        b=B56Vjbo+JUnn8LsFXfvvWFKgIyeTbr6GTlh+Z2F9bO4CIbK6GScRbHlI8uAlKW7nXr
         9YqqcssOltqWRwRYGyoW3hrgKOlsL77k7k2w2EqAIaGjThcf7YIAQOvzAEfdNGr0OL9S
         cGkNTG7m9PLGEFR3Y0zoJu6O/3aMbN2rkxVEY6rs/zSdf5eqYfVLJNgqgmOtl8720aEJ
         GwDB9D1MNCj32fyqQ0NCZOwdtkraS9wgk9j4vhybjG04QHS98PZLhn00KbiaxcOZx12s
         XZgEfTPu8oVLGtbxyJ91BHuhpNNEXaUzzqKdqo9jBiyVIUCSbnQ4VPk1glnXa00rOJXj
         07Sw==
X-Gm-Message-State: AOAM532uKFCs1BlRowobzORlmFQYBElFhxCTmeoaVhmwMoMFYD+EQ/E+
	yQ01AtcpmqPidaaAh+lRBo6xb7oTDtuCtw==
X-Google-Smtp-Source: ABdhPJzgQj0mSYc3joMdyj7+Nwce00FjKW78n99DknjGNcuqrMRO7oqwQJ9EOzhvFtfEuDiQ1ScKRQ==
X-Received: by 2002:a17:90b:316:: with SMTP id ay22mr10299605pjb.8.1604880144539;
        Sun, 08 Nov 2020 16:02:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 04/11] lto: Introduce LTOEXTRA variable
Date: Sun,  8 Nov 2020 16:02:10 -0800
Message-Id: <20201109000217.3008448-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain packages may need additional flags to enable LTO, therefore
LTOEXTRA can be used to pass those flags

Add -flto-partition=none for alsa-lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index d7fea26c64..eb36b892ca 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -18,6 +18,13 @@ LTO_pn-libcap = ""
 LTO_pn-libproxy = ""
 LTO_pn-libbsd = ""
 
+# Custom LTO flags
+# disable partitioning/streaming algorithm since its uses ASM
+# constructs not compatible with lto
+LTOEXTRA_pn-alsa-lib = "-flto-partition=none"
+
+LTOEXTRA ?= ""
+
 # Override it for additional or different options if needed e.g.
 # with clang thin-lto might be better for compile speed
 #
@@ -29,9 +36,9 @@ LTO_pn-libbsd = ""
 # -fuse-linker-plugin
 # ensures that libraries participate in LTO by supplying intermediate
 # code from .a files to linker
-LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin "
+LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin ${LTOEXTRA}"
 
 SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 
-SELECTED_OPTIMIZATION[vardeps] += "LTO"
+SELECTED_OPTIMIZATION[vardeps] += "LTO LTOEXTRA"
-- 
2.29.2

