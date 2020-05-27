Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.1527.1590612672925449565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 13:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gPrQDz4j;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id s69so2122365pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FB3qDKl6tsUvhPLRYn6nqbG9c425w3xS2zIYuNBc/O0=;
        b=gPrQDz4jTYJ0DLyqyrMXj3fdsynaegthEvK6TzZn3z06I1U60QxqXFH7yFnKzQR7+K
         kBogh3QAYy/RdptjVd+URmiaU0YzHVVrhllbM3kRukv7f/HX78kFyc42rW0D9XSqiFy6
         fU8kPOFUGucQux3xURXVFyiYlTD4Ggfv1RfAOcAGwT4EI53WLNxYrcJCML2GF25BsgCX
         EK8RCJgVMM236Rj3HpdsXZzLSY0yn0YBZAyzL2dTA8gdbT9VowZlWQF612k+bpL4dYoo
         p2287QZ3WDiW9G6xl0WIITZ04tolt/iAB3NcNJBYMWNnkt+OimdcvEzxC5JyPHynBrFN
         0upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FB3qDKl6tsUvhPLRYn6nqbG9c425w3xS2zIYuNBc/O0=;
        b=Wsan7fmCYJLP/Uh1aNLygK2xwbDQZZ3ImstK88rqROE2RDnWcNzy9Z5mCr0ad8aIKS
         H3KiC4csOdxH3GaCJYznLmV/xUOT+3VRjerUo4cuOQWmZAsf92DAGKLlc+ICGOIqfr+M
         7C6TSJVBy5HoaWuq2H6JMSONd4pZZ1P1TB0/cH0KWA+9mIzdBMnW/UtcPRwzBMLCLIAc
         IKGQxv3ucfAhl9aAWzhT7opwAXDzD72NPmrI4BFIEJyt+kVeDjSxTVko9zkwr4ZOELKn
         BMWB8z9XJOI0/VtJEsWupAXFTStFfzk14pl8jKwZTHp2QX9BoSw5KzD2Ht9AVBNvhjEm
         iRDw==
X-Gm-Message-State: AOAM5315adwUTHWG19fy+z+kfCLrIE3W5Yo8hT/GdIlnGDuovSWqyiPz
	kNgEBaLVUopDOXdkFl8dhRVrO+S9ERI=
X-Google-Smtp-Source: ABdhPJz7Ey2BqgS3R5WzkeyhxXy6Y4pRGIv2GRhUzpyJ0A3XOA2nGZX5b1ddNVchKQIToOC0Z5eMcQ==
X-Received: by 2002:a17:902:59d2:: with SMTP id d18mr192959plj.199.1590612671899;
        Wed, 27 May 2020 13:51:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id s23sm210602pfs.56.2020.05.27.13.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 13:51:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v3] make-mod-scripts: Fix a rare build race condition
Date: Wed, 27 May 2020 13:51:07 -0700
Message-Id: <20200527205107.985500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a build break which rarely happens but is seen often enough
with 4.1 kernel based builds

/bin/sh: 1: scripts/basic/fixdep: Permission denied
scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
make[3]: *** [scripts/dtc/srcpos.o] Error 126

this patch sequences the build targets so it can work reliably with
different kernel versions

Divide the target into scripts_basic scripts is not
strictly necessary and was simply what was used for
testing on kernel 4.1, which is quite an old kernel

perhaps just using scripts is sufficient, but it is not tested to not
known will cause the build race as seen above.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
v2: Improve commit msg
v3: Make commit msg coherent

 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 0be1422a24..c7edb20ee4 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
 #
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
-
+	for t in prepare scripts_basic scripts; do
+		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
+	done
 }
-- 
2.26.2

