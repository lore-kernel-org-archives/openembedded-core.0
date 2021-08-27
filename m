Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.7267.1630067082788678031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 05:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TDklQL0u;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id v10so10147682wrd.4
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0z0uRmHi9YGiTiZkCd+YFwU+rEo6Hvsxf4WVWb3wDWA=;
        b=TDklQL0ukfM4RJrEg23gdzTfZRvUqgEgplwhvuMGQ/wOdw3CEUtAXYoN7ntk62tDcK
         q+9aGt4D7JwCLg120c9OXO8MGv4tYCZ/P/PBxVZoB+wsn7/Nkb/41ngzkY6qxyacJ8SV
         lquhGr5L+hjX6KZ4LVGLIg+4H/kB63TVutWBVojRr/RCp/FPzjYPxsaaY03C/EHgqviX
         w4HhjHoSYrQJxox4RjD0bA6g1F4JvCFFym7ChzNAY3zzi+wtjr4/V95/jstno3n1ffd2
         L9BwHPcfbm5JQM1F9P+dHzCsKaJyn6tHKoanOwFKWg8BqgpP7Ou5jbNCi8Mm25gee1Xw
         ahlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0z0uRmHi9YGiTiZkCd+YFwU+rEo6Hvsxf4WVWb3wDWA=;
        b=dJ/9pgp/awDrGPFLPjeTp6SJnAbPl+BHpNkrtI/rzTvKGXz0xa3WFl4ixxKF/sjsg2
         4Kg4OqYog/qv41e+wSJGbvZSwlOpMWPzgEQtGkj19d3xFgNa9lv1EaRkRupBCk7P6tk+
         1qko+/PZE3N7b9QP5TLyryobcfa6XUGr5GYKgOU06N1xzkRnTJp46SYT+MCkbRk0UTCu
         pEN4KHdzfOjUR/YsfFkkVzuZ+PbMb43/QzYX9u4KcCNJflofSpzxfhz3xwmEq6gWGAL7
         KsbWuzF82NLMFdmx3vhsPUgKar4OSavyjDyTwEslcsdxkPC701q1MvoOEeq7+Nd5Nijd
         pXNg==
X-Gm-Message-State: AOAM530+FJuzvIIbDxegmL0P9bbNIeICenVyHywcLLOlVPCw/lKZ8wox
	ZLzziX19ZVWVcNF7i+gb5DqdMfJ4+Z2vSw==
X-Google-Smtp-Source: ABdhPJxzviz89rEiSdy0rPM3dLH+9nWA0b1kPUgEkwCyqhI++poyYtE1xrqFzCUQdQznq3MsJpIV6w==
X-Received: by 2002:adf:ba08:: with SMTP id o8mr10034334wrg.234.1630067081195;
        Fri, 27 Aug 2021 05:24:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id c3sm6488780wrd.34.2021.08.27.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 05:24:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] rust: fix upstream version checks
Date: Fri, 27 Aug 2021 14:24:36 +0200
Message-Id: <20210827122436.847043-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rust/rust-source.inc                    | 3 +++
 meta/recipes-example/rust-hello-world/rust-hello-world_git.bb | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 52502fb49f..1529ecfafe 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,3 +1,6 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
 
 RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
+
+UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
+UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
index c29eac34e5..3ebd9cc661 100644
--- a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
+++ b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
@@ -8,6 +8,8 @@ SRC_URI += "\
     file://0001-enable-LTO.patch \
     "
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 SUMMARY = "Hello World by Cargo for Rust"
 HOMEPAGE = "https://github.com/meta-rust/rust-hello-world"
 LICENSE = "MIT | Apache-2.0"
-- 
2.31.1

