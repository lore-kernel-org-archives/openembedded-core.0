Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.891.1618449206565008963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 18:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBsNwxjr;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so13434338pji.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 18:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TR1z0V38CxMJ9sP3oAlQ/5R7vQ3JcFs6ApPqsGb668E=;
        b=OBsNwxjrHJ0TyWM+aMw4I0ggsXLSJn8Mkg1F7FF0psvaKRkruhP1/SILw0pfbN1EuZ
         nwNzDhu6m1BY40DR4+EgoYNZPp7btCtBZiCA44efdkpmJaPZfavHdoj/diT1NsR5xRQZ
         yr4KQi1r1Y6rHyKa9f1FGC4N7pxVQOqUxHz5FVx7FyIoMOSDKszVDrV9J6nM8lLRX3hk
         Y2aPW4ecR46NWDNxQ0LFXPCxEgxXwtfvwEp3xvVedosPQZk0BGOAtJR1bwRMpK1cdPBQ
         CEth8+zCpwh/x3sT/+FJtKYA0PxKe7S4lZFcR51c0oN/dX1z+O2ZD7sEKVF7zzwAXK3N
         xsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TR1z0V38CxMJ9sP3oAlQ/5R7vQ3JcFs6ApPqsGb668E=;
        b=d/+Z+JdDQzWlOqQ6FRKtAaDCP3Ynqspo5m4fr1Z+QsK+x7X71C3DQ5jb0h8PorxnUe
         5VErHLze2Q6Tumo29xT3Zo/oslXykeEF272udDpjuC8st8pMgXiiprcYemICSSmYvpvC
         Z+NBgHq0v4WQ7ulXkaBleL1ZbmTpYxPcZbGCr+7QiJGox8dAtPNbEBj07vk2KOjPzTHM
         c4XWsd6ByGCMgnCao8uAmKp8Jldf+xxWs1uB/yohtWEKQ5pPWxa2nZ5vEu/ZwDLrOsPk
         A4BmEJBbiZtgFr5Qpvy7nROVHUgXnzeihSkDf2GB6MOXz3xE0kMNn7ECwCcrQgMxO4/T
         k8SQ==
X-Gm-Message-State: AOAM531/0NX1TaJ5i5x5tpGDk0Xdkh7Rydh+WeMWyOl0x+YANrNty6JI
	+h8KNByetMvs3+mEBXevHnZDufNYnGONog==
X-Google-Smtp-Source: ABdhPJxS/UUUqSRInprSFe/0n32xzmzAnpCbN/A5xx3xc7a+fAyxiXurLg6BEQxDyrsTXFKBdvqaVw==
X-Received: by 2002:a17:90a:6407:: with SMTP id g7mr936864pjj.206.1618449205805;
        Wed, 14 Apr 2021 18:13:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id 8sm485482pfw.118.2021.04.14.18.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 18:13:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-runtime: Make DEBUG_PREFIX_MAP relative to S
Date: Wed, 14 Apr 2021 18:13:22 -0700
Message-Id: <20210415011322.2754152-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current definition of SLIB is actually equal to S but is hardcoded, this
means when we have altered location of S, then the regexp for
DEBUG_PREFIX_MAP will not be effective, which could result in S being
emitted into debug_line sections. Simplify the maps to use S variable
instead of SLIB

Secondly, rename SLIB_NEW to REL_S to make it more appropritate to what
it represents

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 9dcce26536..2aca96c408 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -49,16 +49,17 @@ RUNTIMETARGET_libc-newlib = "libstdc++-v3"
 # libiberty
 # libgfortran needs separate recipe due to libquadmath dependency
 
-SLIB = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-SLIB_NEW = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+# Relative path to be repaced into debug info
+REL_S = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 DEBUG_PREFIX_MAP_class-target = " \
    -fdebug-prefix-map=${WORKDIR}/recipe-sysroot= \
    -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
-   -fdebug-prefix-map=${SLIB}=${SLIB_NEW} \
-   -fdebug-prefix-map=${SLIB}/include=${SLIB_NEW}/libstdc++-v3/../include \
-   -fdebug-prefix-map=${SLIB}/libiberty=${SLIB_NEW}/libstdc++-v3/../libiberty \
-   -fdebug-prefix-map=${B}=${SLIB_NEW} \
+   -fdebug-prefix-map=${S}=${REL_S} \
+   -fdebug-prefix-map=${S}/include=${REL_S}/libstdc++-v3/../include \
+   -fdebug-prefix-map=${S}/libiberty=${REL_S}/libstdc++-v3/../libiberty \
+   -fdebug-prefix-map=${S}/libgcc=${REL_S}/libstdc++-v3/../libgcc \
+   -fdebug-prefix-map=${B}=${REL_S} \
    "
 
 do_configure () {
-- 
2.31.1

