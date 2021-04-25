Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.5358.1619377714613123751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 12:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yy7wnqax;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id b17so1646213pgh.7
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 12:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ra78ptrh92fEVFTLzq+CHDbKU8tag1B77koD0lIhE8=;
        b=Yy7wnqaxXRPDXjh73y+BwP1qvdP/i5BHZpjVSzL5OR4MbKu0rVcnYsZT3b2TTda1O7
         femlJ7y3RVlYY6DCOdnX4Ch9jCfonA26d6+WHkoHMkWLl0Eyqs6m+PIAMWmr+fyBAfDS
         vpysZzYhjrPs9nncvJbgfBG5XI/26p6AdlXBXMcXk+g9STShB7NJ/urubpjAfprp90xp
         lKYs7Oupvm4bVmADF/sSni4WdCrg02Mw00rUWLOzjvnKUt8FfWI8qV2tn69nl+h/u8rM
         iTrJvgQZOEPF/+MUv/ZVgD/hrJmXDmNoNX33tIoM4Rw5vZ7bttdquIf4Mn9GM4igIDKd
         /wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ra78ptrh92fEVFTLzq+CHDbKU8tag1B77koD0lIhE8=;
        b=FlPmpHcKZxALJ4f5a69osSZkxf4DqwO83269Fh3JbLkuOJVQYo+HQO312Ec3ajbIIc
         NYGOjmgHXnw4TjV5o908phs6tdEpPXBaKhkRfokca2kh59BizEakhUS6yXZvnAxYDpoC
         kSgzFFga60lvCPmLV2qP2M06SlAgXtmWTUUChVZDp8R7eGsH7SK5mu09f9AxkKakCS+h
         ZUNprhyQYVMY4kghdLfx8fZtQLCkY4XIy/lfsCZ8HMR3h73PXpT3IwonVD9gl0Mv76t4
         FIzzbDPyp8f3/zZVKMDxfhfC3MfrW02Vlrl4Tnot0OEgtxQN9tjnkqGwdet7ndF/fn7n
         Fqdg==
X-Gm-Message-State: AOAM5335NazbpPTxcoIjfdjR9PyXXSY/tsKgRu0iOCe0jHIyrIf79BWY
	6SXw4j8jOUXK+dt+y7yE659ME70QCryrtQ==
X-Google-Smtp-Source: ABdhPJz8lLWBPqoozAOcZdXyHo0lzdSsLGs1hzyftApB9ZeuD2GkWw6ksOUh/B90TNxU5O8EX1b9gQ==
X-Received: by 2002:aa7:8608:0:b029:258:838a:23bb with SMTP id p8-20020aa786080000b0290258838a23bbmr13676204pfn.37.1619377713996;
        Sun, 25 Apr 2021 12:08:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id g185sm9136349pfb.120.2021.04.25.12.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 12:08:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] gcc-cross-canadian: Install LTO linker plugin to BFD searchable location
Date: Sun, 25 Apr 2021 12:08:28 -0700
Message-Id: <20210425190829.2056705-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210425190829.2056705-1-raj.khem@gmail.com>
References: <20210425190829.2056705-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps binutils provided tools ar/ranlib/nm to find the LTO linker
plugin automatically as well which makes it equivalent to gcc-ar/gcc-nm/gcc-ranlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index d3875c94d3..878feaf810 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -75,6 +75,7 @@ FILES_${PN} = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.* \
+    ${libdir}/bfd-plugins/*.so \
     ${includedir}/c++/${BINV} \
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \
@@ -92,6 +93,8 @@ EXEEXT = ""
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
 BINRELPATH = "${@os.path.relpath(d.expand("${bindir}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
+# linker plugin path
+LIBRELPATH = "${@os.path.relpath(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${libdir}/bfd-plugins"))}"
 
 do_install () {
 	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h-forbuild install-unwind_h )
@@ -136,8 +139,12 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
+	# install LTO linker plugins where binutils tools can find it
+	install -d ${D}${libdir}/bfd-plugins
+	ln -sf ${LIBRELPATH}/liblto_plugin.so ${D}${libdir}/bfd-plugins/liblto_plugin.so
+
 	chown -R root:root ${D}
-	
+
 	cross_canadian_bindirlinks
 
 	for i in linux ${CANADIANEXTRAOS}
-- 
2.31.1

