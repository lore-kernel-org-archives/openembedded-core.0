Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.17145.1592946543313613626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 14:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LUdMcyF8;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id rk21so215861ejb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sc13CeXKhsguy2wQwFYJG7ZXnYSPIvLqhVuqlgkZxqI=;
        b=LUdMcyF8x9qNucpqjZcIKMjuZVkI/m80BOnjE2g+8BFAGbwAkRWZoXsuBCbAF/qz2B
         7NrYX2n6v5WlCWu4ZQtVJliUQU2Kw2ly5eekq/McMW0f9ZxKWe8NM5VGUqD8X+/BLa3u
         MhOlTueZvO9RBK5EM46CTnEIAGedg711/sWbhx8oadgHx7fYSlrtY0Cr7BZ2yExtKgzx
         e6pUJtSVGq558MoRq3c3Yj3qHC/8GiMqkQvx5VVZKOJAbmN31LgHV3uANwhaV1NfGr1h
         wQU5LNcA4xMxqh2fD6M6nfhZUUhKT5uB3fK8yfbeCl6em+XXc6ovmei5ex7c9+Ln+fVY
         UmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sc13CeXKhsguy2wQwFYJG7ZXnYSPIvLqhVuqlgkZxqI=;
        b=epiwlFSOoUqZ7Q+Ydbla8mx0LC/G5YJS0lD+hO20myFGAcwGnv9z/P7KbA6s60HIqx
         q6vH71r69rR7hyEywHOvP9HjdFQyOKFltja0bhnXtu7eOUJDgAzcEmmBwIVM6M8J44GR
         Sc886tmCVfo8FW5fbpyhy4Mp4hT1aLIBTiGmFsMFap+FI/eLs/XY3+YB40YwQCJK9YNG
         CQUiMVKBNgb2PPZTjwmWS5vewQPh1CQ/yqhzE3qHd2osgRKzjbOnapIclFigS9wy/EAg
         zsuZwMFHzuUjJNJd50SIRmAEzLqqtOjyuOISgLOse3tHbvqkpRRzeg+CSfARKfyr7FNN
         OebA==
X-Gm-Message-State: AOAM530AQZykl9nZuflnCS5XUTg6bGyJGsH9RhTpRAQGtACfNDssH+OK
	Oj4hCOEQnCAgi4TTNLlL/pRcFoC/2+Y=
X-Google-Smtp-Source: ABdhPJx8Juvb54E5IhOPp1yOB9uQm0K8WYDjJrPLSq0U9Ne7JVNdL6YJ0UMFiquPCBu5TIpZTMNMHQ==
X-Received: by 2002:a17:906:5283:: with SMTP id c3mr7796440ejm.22.1592946541651;
        Tue, 23 Jun 2020 14:09:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id q3sm136435ejb.118.2020.06.23.14.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 14:09:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] icu: make filtered data generation optional, serial and off by default
Date: Tue, 23 Jun 2020 23:08:37 +0200
Message-Id: <20200623210837.26222-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623210837.26222-1-alex.kanavin@gmail.com>
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

icu data generation was found to be racy, and causig AB failures;
making it serial and leaving it on is not an option as it regresses
to several minutes.

The specific bug is that rules.mk has:

LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/gencnval -s . -d ./out/build/icudt66l mappings/convrtrs.txt

which creates a file and numerous rules like

LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/genrb -s ./misc -d ./out/build/icudt67l -i ./out/build/icudt67l -k -q numberingSystems.txt

which quietly read it. There is no prerequisite for the former to complete first.

The race is extra complicated to fix as rules.mk is itself
generated through a custom in-tree python tool.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/icu/icu_67.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
index 5814fa41bd..9e8091ba01 100644
--- a/meta/recipes-support/icu/icu_67.1.bb
+++ b/meta/recipes-support/icu/icu_67.1.bb
@@ -120,7 +120,11 @@ UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
 
 EXTRA_OECONF_append_libc-musl = " ac_cv_func_strtod_l=no"
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[make-icudata] = ",,,"
+
 do_make_icudata_class-target () {
+    ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
     cd ${S}
     rm -rf data
     cp -a ${WORKDIR}/data .
@@ -135,7 +139,7 @@ do_make_icudata_class-target () {
     LDFLAGS='${BUILD_LDFLAGS}' \
     ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
     ./runConfigureICU Linux --with-data-packaging=archive
-    oe_runmake ${PARALLEL_MAKE}
+    oe_runmake
     install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
 }
 
-- 
2.27.0

