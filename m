Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.5470.1619377715272845177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 12:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BoEoRLe4;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id t3so468735plz.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g8P4wNVDLQExPeyiAfxnqAuKLYBGl3TwS0Vjqp2Ag6c=;
        b=BoEoRLe4tOE2RswVkQAjwJkKP5JmyZyRs2oDK+faw9QI3/GeTx6S5TvwfpZ63rxr1T
         v8T8PADGDWAmRxaEvAtycCg7aZYQqyDDW9Sof7HzPZ0c1QAvfBn82Hu/fGUeGtT5jRVY
         VQw8EHLocy91N6mlcT83aty5o4volqcdegvojva2AErvVrfmyylNwYaUFmdlU/RQAF2P
         oPVtfM7922Qss0T5UKOOhW0z05Twe7uY9PSt+nalycvkVBtO49/ipjDfx2gi8pExbFTu
         piQlJ7I6HSh9B9nthkx6mRIyN4KMrbfI8BfgSsXbLq75ryta62l/eRGrqr5HgayOZdA/
         bYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g8P4wNVDLQExPeyiAfxnqAuKLYBGl3TwS0Vjqp2Ag6c=;
        b=bootDFFqS5ZHHJnIfqFR47zr1UQw+Z7JnNve25HqOGc+LW7FPVGQd43L3q/1CNSw6c
         PyJJJ2weoGgISkvtgmXgp9x3tbr/S8rUigYqxNf8lT3dYenwhkiK7Sg51IfG5r0hsM14
         8xSUmlnojaYtAeW8rx7SzaQ36Qtsop5cQhWzIVZDZerXT/VqqlP3Rn9UiFuFzxlfdt1p
         EcwFcjx890kQkL2oZNESo74wyQ0TN/47m9PlW93FwyjF//a3rKdLGsSeRfY24QzzGHcj
         A1j6xHuyhKGIY9Mi/04LFXC+3bKp9ByKauQ/dOT/LcoVl8nGlrDhoUcy4Oq2nJG1Kcdh
         hNpw==
X-Gm-Message-State: AOAM5325jMZzfiO6rhpA0TOgTeHVVr23p59CmtOPt3aZgIyoicgwgKEV
	tUr7iH8garRbGL73FL06lQg42470yAvD4Q==
X-Google-Smtp-Source: ABdhPJwfB15d55S7/L8lp/cf7GojvJKWsQybza2qGlQszPIm+rqH5Szb+SY8mgQr0A2G3kfpe73QWw==
X-Received: by 2002:a17:90a:bb93:: with SMTP id v19mr4212752pjr.127.1619377714683;
        Sun, 25 Apr 2021 12:08:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id g185sm9136349pfb.120.2021.04.25.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 12:08:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] gcc-cross: Install linker LTO plugin for bintutils tools
Date: Sun, 25 Apr 2021 12:08:29 -0700
Message-Id: <20210425190829.2056705-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210425190829.2056705-1-raj.khem@gmail.com>
References: <20210425190829.2056705-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will ensure that ar/ranlib/nm can load the lto linker plugin like
gcc-ar, gcc-nm, gcc-ranlib does, this will let the behaviour match
between gcc wrappers for these tools, this should help LTO builds for
packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index e08807afad..dca4036ab5 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -83,6 +83,8 @@ INHIBIT_PACKAGE_STRIP = "1"
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
 BINRELPATH = "${@os.path.relpath(d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
+# linker plugin path
+LIBRELPATH = "${@os.path.relpath(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/bfd-plugins"))}"
 
 do_install () {
 	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h-forbuild install-unwind_h )
@@ -92,7 +94,7 @@ do_install () {
 	install -d ${D}${target_libdir}
 
 	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
-	# gfortran is fully backwards compatible. This is a safe and practical solution. 
+	# gfortran is fully backwards compatible. This is a safe and practical solution.
 	if [ -n "${@d.getVar('FORTRAN')}" ]; then
 		ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
 		fortsymlinks="g77 gfortran"
@@ -118,6 +120,10 @@ do_install () {
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
 	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
+
+	# install LTO linker plugins where binutils tools can find it
+	install -d ${D}${libdir}/bfd-plugins
+	ln -sf ${LIBRELPATH}/liblto_plugin.so ${D}${libdir}/bfd-plugins/liblto_plugin.so
 }
 
 do_package[noexec] = "1"
-- 
2.31.1

