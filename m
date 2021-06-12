Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.9613.1623526999634011188
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jun 2021 12:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AGdtYl+h;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id k5so7522857pjj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jun 2021 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjy/8A5TXYs8C3HbL4CHFDV0TEY6ymO+AmZTWUwrUxU=;
        b=AGdtYl+hgkKlCSSPw3ZV6yLRzyd/QSztIt7xzFVbZeC3yyYAUEkzAURcT8nwe5qGv7
         JQ41hCBsEalLbTpTXEVEz4HjvYw148EV1uZ2iRSYCUZdZVbM08QMuSHVhGhusB+Xg6ge
         zqoHK3HH3wO4jpJ2ajCggAmQ1anQh/iYnYjyUpRTYaBND/c//Rgf4Wllok1u45COv26l
         /Ieatd5/5gI9iGsRGMFzxBdu7d5ckskYHtNUnjYaAkjVXnYJZf4jmHBuD1T5wVqySrH7
         dme8O+iNVVEC84gtSBAEmYeSRjTaSN//fenDrCg9uDswf6oGNbMjIsTU/Xd+V6/zNu21
         prlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjy/8A5TXYs8C3HbL4CHFDV0TEY6ymO+AmZTWUwrUxU=;
        b=qzan88YgrSTXn6V2PXvz+iWFL6MiN2d1wnEMywr5Yu0kchrDoYmi/JLsZJ+lH7F5Kk
         aMS4djVbBSvxzFYNhopsnzeXTS6rhp+NV3vKdChZcCfonmWvynQtjfidOEGp2+JTyV1N
         EWZDXQEd54JMPdpIJ+IA4vaDe5asoYCqa9TV+uCu3Yh0MX2eR3wdzq30OvITZMEZojoC
         2Ez9mIrwEFz9S140a/O58aQrYgdB6SJrl19yues+MHRQ1vQwcoM1+dYf7D5/bl41G1TZ
         cTW3/UCfyYIKL7TboV8gz7gKBN0C+jBY+N47EQ5J5sBcm8v3ffI5rNrd+mOvLIBm2G3P
         TLag==
X-Gm-Message-State: AOAM531h4e40tiBpocilRqr+tArwIVkFnkSxcvDiR2pz22iijhc2BFj+
	QribibU78iBoHL6bvoMA+p90bhfBdeVgqQ==
X-Google-Smtp-Source: ABdhPJxjYdTnWt9Fa0cyxgSWDGHuyTIpx0hkLGZ3pvH9RXUA/fdmA2iBG4BwKW2mTDbmrSCo2VD+Tw==
X-Received: by 2002:a17:902:bb94:b029:116:1eb9:9c74 with SMTP id m20-20020a170902bb94b02901161eb99c74mr9697787pls.48.1623526999055;
        Sat, 12 Jun 2021 12:43:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id i22sm8369667pfq.6.2021.06.12.12.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 12:43:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] musl: Do not package glibc loader
Date: Sat, 12 Jun 2021 12:43:15 -0700
Message-Id: <20210612194315.676681-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210612194315.676681-1-raj.khem@gmail.com>
References: <20210612194315.676681-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was a ad-hoc solution which did not really work in all cases, now
gcompat is provided to deal with glibc based prebuilts, therefore there
is no need to provide this package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/gcompat_git.bb | 2 ++
 meta/recipes-core/musl/musl_git.bb    | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 6792c0be70..e1ae052c44 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -34,6 +34,8 @@ do_compile () {
 do_install () {
 	oe_runmake install 'DESTDIR=${D}'
 }
+
+RPROVIDES_${PN} += "musl-glibc-compat"
 #
 # We will skip parsing for non-musl systems
 #
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 795b888bb3..6569d1b37b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -68,13 +68,9 @@ do_install() {
         echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
-	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
 }
 
-PACKAGES =+ "${PN}-glibc-compat"
-
 FILES_${PN} += "/lib/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path"
-FILES_${PN}-glibc-compat += "${GLIBC_LDSO}"
 FILES_${PN}-staticdev = "${libdir}/libc.a"
 FILES_${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
                     ${libdir}/libpthread.a ${libdir}/libresolv.a \
-- 
2.32.0

