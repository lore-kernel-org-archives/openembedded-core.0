Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.6401.1623744767664197229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZYe5Ur78;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id u24so49878198edy.11
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3n3FS92raIhkyet7FqHeX+ULzG29pBRXoHJ2wjZC4Tc=;
        b=ZYe5Ur78x2n15aTPikSfKKOQ0tN7vZavj9S3AyNn1WmyQmv3YwznySXnpF0Ho1HTxr
         j74MyOp4lmW78TLOWEfk8C4jVPCebkMN5Ftvrx/BAD7I+/mbyJPtSe8uhdo11RAjs+hc
         Cs80ledB3j0dDzFjnyWRxzdoJjZY9gucXhowKc0pwdhp6argHTC2pVv+vMiudRcy4PYI
         ve1zsSGvGJj+pmWQvH3ejjMNzMf3aNUYlNDqgMgagap7dE2JeKpOJA4nLMHmCu62ISJS
         Nqf3UIEnbqrdm1J5iPWaATRLnznhUIWUqaCOJdnwYAArxUjycVJTXxTmypPYEaf2tmr8
         /AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3n3FS92raIhkyet7FqHeX+ULzG29pBRXoHJ2wjZC4Tc=;
        b=I/uvjJnvRv8u7ChY4MHjv0MdXJ56bXedlTcS1XjfIQeStg8KMqdFMbPDO05m1KgNB5
         WazGsHHZP5aNhXZXsHWCjv9L2zChOG7/gu9QGkLDkzlYaI+eawSPNmsIsgdLCLbh38St
         3ZH7b18hk/lnMmCG3XfR/BWt0U8ysHccaem0P2815Wc0GESqSa9kPNqZTuWGSgFcJh0N
         d/KHlUpbEeji31wnpe8czY2JeTvggln+9OAZfbPEJtWCpfYd5YYV6EsJ0+DUL/0coRnj
         3F++HqyGy9XGpxPBni745Hkk81OWNTU/CdslUC1NMvSCZEu0S6t/Mn0LqrSzZyM8KXhR
         N52w==
X-Gm-Message-State: AOAM532Wph0cuEqrTuVgSgkj2AJeMjMPNYsMWZyoxQnGXV6rmO61KnY2
	RtIr72nBfGNF5bOKZjagVfXXsuapLnUm9A==
X-Google-Smtp-Source: ABdhPJzGyD/D24pYdh1lHED82lBgDSY9lB2QrClsNQiEaMfZOu1/WMRH0U08wDMzA2houKkPk2RPOA==
X-Received: by 2002:aa7:cdc8:: with SMTP id h8mr948116edw.323.1623744766268;
        Tue, 15 Jun 2021 01:12:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/31] gdb-cross: enable debuginfod
Date: Tue, 15 Jun 2021 10:12:11 +0200
Message-Id: <20210615081240.1734087-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows avoiding having gdb inside the target image, which might
be too resource-constrained, or otherwise inconvenient.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 meta/recipes-devtools/gdb/gdb-cross.inc          | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index c9daf25a41..edb05b6f18 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -11,12 +11,13 @@ DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core \
                          nativesdk-python3-codecs nativesdk-python3-netclient \
                          "
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
+PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, nativesdk-elfutils"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index ebe329f6d3..f8a113da8f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -5,9 +5,10 @@ DEPENDS = "expat-native ncurses-native flex-native bison-native"
 inherit python3native
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-native"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
+PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils-native"
 
 do_compile_prepend() {
     export STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}"
-- 
2.31.1

