Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.1375.1623708077973553166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 15:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mY7Nhvwk;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so502062pjs.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVsGdZvbYFMsfBvmHqoVTodRgPsWshOrNKvfZ8oIQvE=;
        b=mY7Nhvwk77KPTIuAwKhwZJU6fw3Dds/eP0tiETru/D8NX+n1Oc7dwdLnCVzDs7FHz/
         RZQnBiT2to2LNgIowTidQCrz89quoT/jswCT/GLvmClaafPnD133jyEDeeIK7WuGJSaq
         AjSZdjrcFW+SdIqL2TbD650lYsqmkClatBvqSTnHEWr6LhYnkBcjH3bcSx9t3BQKQWKf
         DW5Zva3Rih/ANwy3pwf91PTDxlk+vqOPlJV5aOOrJ+eG+3OnSXfD8nPXp7haHtY83SQW
         5mTN6JsmiMTpwN0kWNyr+52eGMEcoLwZ8qBzQVK2bBqroySTNVJUO3bG21YHsjGTG9O4
         EgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVsGdZvbYFMsfBvmHqoVTodRgPsWshOrNKvfZ8oIQvE=;
        b=kut8N1wnqWJY7QXvBaZM+SFr5pzYtEt2S6Y699MigNwlufX4ePAN/fP3bf3Axxp8Ys
         jKr9hWdEFQI4zN/aN3l0vhPQ+rVpYXMoax5tikPvJfo5JNs+k34tGPYuz7JtHjGlGeb8
         Bf4QS89Psz8fgPhH0H5HWXvH3lVS/5wgehh24IF0JRJj6uDB5ss/s4a54BJPxAfMDmmv
         pDFBZVaWgkPwudwWJUTbWh1jy2hS98r+nDbaEQqCF7yh5I4yd4PkSqD5CAhnQUc9u+uM
         Mp7HIT2Rbx5obd+AiCLR4NmnIjbjWwytrqHZbroNecES/BLfHqMOszS1vZyHCsq6U6aU
         +0iw==
X-Gm-Message-State: AOAM5313C/6nKtOAFRFVkrRQGI2pfrjM1G/+qrYL9BEOsKqQQ76YppBH
	CNnefMTDm9Kt6XfXYa0Y5KwHVdeerq+Vaw==
X-Google-Smtp-Source: ABdhPJxmQ6XurB8MZesmCjeygYU0bQjOpleEyRJzMeMebaGtQTdoIxjwZn+9ZTm5RhUlhGYTvGQ0SQ==
X-Received: by 2002:a17:90a:ea96:: with SMTP id h22mr1304513pjz.221.1623708077011;
        Mon, 14 Jun 2021 15:01:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id n6sm5544612pgt.7.2021.06.14.15.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:01:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcompat: Create symlinks to glibc ldso locations
Date: Mon, 14 Jun 2021 15:01:12 -0700
Message-Id: <20210614220112.3956295-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210614220112.3956295-1-raj.khem@gmail.com>
References: <20210614220112.3956295-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures the glibc based binaries can find it in right place

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/gcompat_git.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index e1ae052c44..863ba8dbf0 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -14,14 +14,16 @@ SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig linuxloader
+inherit pkgconfig linuxloader siteinfo
 
 DEPENDS += "musl-obstack"
 
 GLIBC_LDSO = "${@get_glibc_loader(d)}"
 MUSL_LDSO = "${@get_musl_loader(d)}"
 
-EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} LOADER_NAME=`basename ${@get_glibc_loader(d)}`"
+EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} \
+                LOADER_NAME=`basename ${GLIBC_LDSO}` \
+                "
 
 do_configure () {
 	:
@@ -33,8 +35,16 @@ do_compile () {
 
 do_install () {
 	oe_runmake install 'DESTDIR=${D}'
+	if [ "${SITEINFO_BITS}" = "64" ]; then
+		install -d ${D}/lib64
+		lnr ${D}${GLIBC_LDSO} ${D}/lib64/`basename ${GLIBC_LDSO}`
+	fi
 }
 
+FILES_${PN} += "/lib64"
+
+INSANE_SKIP_${PN} = "libdir"
+
 RPROVIDES_${PN} += "musl-glibc-compat"
 #
 # We will skip parsing for non-musl systems
-- 
2.32.0

