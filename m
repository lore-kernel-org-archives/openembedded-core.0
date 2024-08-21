Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C436C5472D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:54 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.18791.1724244647956207693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tcTMCBco;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d28023accso4878517b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244647; x=1724849447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/JqamKBIcLrdMFyOO9inMD98NYlz5sTVswIWzvbXmU=;
        b=tcTMCBcoCEiAqX/+8ISje5S6OEqjLvkRZzK2hpAcHtnCcsWrMNH2BHyff5h+1cV0qY
         J1Fw5vDcDEAiwYwGn+yUV30JytztcIiNri+YA1knIMADIYrIWd4VPaZCM9nF6lzZvd3j
         pO0G0MR1MV81AyheC14IrOP+4v8Qa7IQu5TKeh1FdCgJWgoWL9XzDoW8EPQ3E3+b2Esj
         168ENFF/f4GazgHo6Nd5L/YpK0uJN2XQAIv4T/FAWeHjRAlwsJJV9GXBKH9rLcAYUiOc
         VikNBIEm69iByDjLqUGlsIl8NwbfIiMNmBNROkhJ/WrE5+gTU1xCXRqFdULAVXqhQ6JD
         k9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244647; x=1724849447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/JqamKBIcLrdMFyOO9inMD98NYlz5sTVswIWzvbXmU=;
        b=Bwjho8t0bFB16GJKjG29IY2PLQygDx4uCG9/TcQLO3KmkcEIZanZ/YoEBEpVAjyiAA
         iD+svbOl6ysdgU6prb7MOyuag9EvHhwERXRBS/pPBYv6kC586S6UBavmw+d1Bhj/BI1t
         TEmpUGcosskjSye/j4txYkycQ9H8FP1eHRCHIxxw8WoYEc85chbUTSar1SGtYZe7DeN8
         YXdtqvEjCAo/HuTkZV9Kd7JYXfcIMxBx9y9RW0CbjGc/RYY0Vi7Tp2pcfwOrkAl3MKxw
         /G19FNi+vUeLF2OCYzJtlTGv1KowOTOFtafSJ8bgR1XM6NWt3mbtp9AuNiwYULHAERzu
         LgoQ==
X-Gm-Message-State: AOJu0Yz8MUA9k9EELJaOsvc95UvQukKPkVSRq56CjQHX9S57abzgkSRr
	yAXL2mAv3FsJbUHwAghDEUMgV5LRJsKOXqGYPd8FAc4vnqDKsHCHX+qExL9eC0vy/rxXwEUpeSW
	YdvA=
X-Google-Smtp-Source: AGHT+IFJ3tSAaNaNsVuYm0C93cmY/5+epVYzpwrZxVM48ESmSabjJC7eyRSm5Zq0na0zFE/2cRRKhg==
X-Received: by 2002:a05:6a21:9614:b0:1c3:b0b5:cbd1 with SMTP id adf61e73a8af0-1cad816342amr2575261637.38.1724244647156;
        Wed, 21 Aug 2024 05:50:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/18] glibc: fix fortran header file conflict for arm
Date: Wed, 21 Aug 2024 05:50:20 -0700
Message-Id: <58a5ddeff446bf459a719f10b07abd731c6c5634.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203597

From: Kai Kang <kai.kang@windriver.com>

There is a file conflict for arm when multilib enabled:

| Error: Transaction test error:
|   file /usr/include/finclude/math-vector-fortran.h conflicts between attempted installs of
    lib32-libc6-dev-2.39+git0+312e159626-r0.armv7at2hf_neon and libc6-dev-2.39+git0+312e159626-r0.cortexa72

Install math-vector-fortran.h to the gfortran default search directory
which is arch specific to avoid the conflict.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d2165543e796d4558c632af24eb7b115bca45969)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1ef987be0a..b90ff66612 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -39,7 +39,7 @@ FILES:sln = "${base_sbindir}/sln"
 FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal ${libdir}/gcc/${TARGET_SYS}/*/finclude"
 RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
 FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdir}/nscd* ${nonarch_libdir}/tmpfiles.d/nscd.conf \
@@ -169,6 +169,12 @@ do_install_armmultilib () {
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
 }
 
+do_install_armmultilib:append:class-target() {
+    gcc_version=$($CC -dumpversion)
+    mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${gcc_version}/finclude
+    mv ${D}${includedir}/finclude/math-vector-fortran.h ${D}${libdir}/gcc/${TARGET_SYS}/${gcc_version}/finclude/
+    rmdir --ignore-fail-on-non-empty ${D}${includedir}/finclude
+}
 
 LOCALESTASH = "${WORKDIR}/stashed-locale"
 bashscripts = "mtrace sotruss xtrace"
-- 
2.34.1


