Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web08.181.1617288214127681418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 07:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K7oZXGGg;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id i20-20020a4a8d940000b02901bc71746525so622672ook.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oI+SK5I4UJte8JEzvxgthdoSIV/OZUYiMYlZZwUFRaQ=;
        b=K7oZXGGgYEpckQzuXM0MjWVtmFxRrf4wMTOE2cBR5JIW6259rMVGvcCY0biy9nM+6g
         ZdVRzeU7RiQ+GaBgaQ3ElcVS1jUpPn719eSvsaejbhDfBUl1O/53LH+NIIi/BXcoEHds
         ReR3Aj7nJ+tf35J/A+zgbr9v08sp/EDUYFi8roWbhqSlcJY649hcyFv6QiAVSsF6hg48
         Vu8mTslXYYeHP9/3Q2WYGH/xbcgf9IrJdNAu7h44FncDEKQa/gFnUs44Xc99mVcY9E+/
         DZVfCdpzbaNEgm+Pnm/Bkqe1Hje9h2GywXDiYz13Lf0Kw/0HWOEPVZXWLkr5o3/8IRQe
         n2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oI+SK5I4UJte8JEzvxgthdoSIV/OZUYiMYlZZwUFRaQ=;
        b=ryRnn6/9KucePpgSkZUaPzgbdE8reIGxHuNO1zCKqELusrYev5GAgnLLxatOND93Cb
         3nhG8uzWdbHFIP3Njy3a0lPPi7Z9ipNWORbDyqdFqzSiTd0hEvDmUEvAECzAkjQiaLEq
         fLbhqF2AwICi250Lng/6qGEUvLmYJO0fsgPnwzAbWg+snsS0j4Sfr1zTuwsdPtp5oWoB
         Qjoq753wdUM60gUooyLrZmxmd7TmFSzx1VANhFdfsh2jvmwHTCr3oo2COSNd/fZgl0Pq
         gIEisGXRx6xn1uK3K4Jx+/xu9N/3gewkcbFon96i+1ADw6H9Cd/PwTlqXiQlV/JVrGlX
         Zi4Q==
X-Gm-Message-State: AOAM532HBrZGfTt3hsT77GZIRI39yj8KlYKGpkRPqgSo4Buy87yqH8Cu
	6Tm5ykkQzO2MiSOkKDsGOlWXdzryZ+o=
X-Google-Smtp-Source: ABdhPJzsnD4xJd5cY4AVcIAXCKax1c2QBhDi4S+OQGTebR0CfaCSrY3Zh6moueAbpaFYggDox2ZDKA==
X-Received: by 2002:a4a:9671:: with SMTP id r46mr7458697ooi.69.1617288212986;
        Thu, 01 Apr 2021 07:43:32 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id b12sm1217281oti.17.2021.04.01.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:32 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] bitbake.conf: Limit the number of OpenMP threads
Date: Thu,  1 Apr 2021 09:43:29 -0500
Message-Id: <20210401144329.28522-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limits the number of OpenMP threads to match BB_NUMBER_THREADS. This
prevents OpenMP (libgomp in particular) from falling back to using all
the available CPUs, which behaves poorly when attempting to limit build
usage, especially when attempting to build in a container.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d87d7cafb6..385fc7dd55 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -810,6 +810,10 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
+# Limit the number of threads that OpenMP libraries will use. Otherwise they
+# may fallback to using all CPUs
+export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
@@ -891,7 +895,8 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
-    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES"
+    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
+    OMP_NUM_THREADS"
 BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR SSTATE_DIR "
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
-- 
2.30.0

