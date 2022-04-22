Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0450EC35296
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.4433.1650600356497613817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 21:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iDjzDkqY;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t4so6384703pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKY+WRChDTSzpkel2xp0aKDzfy0cfxpWuFUSLkUrMZI=;
        b=iDjzDkqYFC2O5fPH2SDD6hNw/idU9BaSg8mKxkVQObf6x8D9VRuQHaNxhTjqIDufxw
         a1ka87YzPHrG2oNRXyXXcW2EMa4YVnrD4thYNlRMez0lpxhJj1+pRwYvtheP88f7LIT8
         eHfL8XUtMGNzajGxfvykqPgLWKoHjmS4MhKR7mGlEx7gf1LEnHnF8A9vaSwhi0qMR+Kj
         wigTManwgrT5EkDGEPuykdiK2Q1AEfH4jtNAPiCA2yoHxDx6fDkjV/MZ299AY9/FKBcd
         JlQSCHXvbNn8pBKcAI2/ioyiL8qidDcsSPLyNRYOjbZbLaDx94rxuCrhVENl3QFVJf1C
         qAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKY+WRChDTSzpkel2xp0aKDzfy0cfxpWuFUSLkUrMZI=;
        b=HKUz3SbUky+4OkoruPE5RqeIQdlRjjAqXTLXkIwbuO53D27KnVmUEhbYa51Oh0iUOv
         p7xLM7ihKY0scvjgg/Ra4WV9lGwNib78GN3q6UtM8FMqwRf75cjVUZ4kNj9RcnCMWKE2
         YjHwl6XLLvo+8W1aBknf6mWlP85dGF8aHVkI9GEHlbjacacn4pEhuhlmCaPEiveEuWCd
         J8AL9bFvR+iSht8nDiQciMgaQ7Q486l5tq2KKClxtx4MP5CaeHMxK1UIgKHpPCrIUYrp
         MUsXkzqDsLDSm6Xy/9X3/a3niayX/sMKX/GaA6IbP6vZFN3RNvQOG6CHaoyjougGUshh
         k37A==
X-Gm-Message-State: AOAM532PvATeP2y9oHtPnRFaLTkm16mxAQtieIrTMG2C/AMGETQaMghz
	zX4Fn+TaERFFw+4VW822lmqjgT190Krw1w==
X-Google-Smtp-Source: 
 ABdhPJxIZsHupT5ShCLfUWSov1oY635szOuwhID10Ulc9S49Oy4HefSfBrNlLhwbF+ey303EL2ZvrA==
X-Received: by 2002:a63:de41:0:b0:398:db26:bb6 with SMTP id
 y1-20020a63de41000000b00398db260bb6mr2337158pgi.516.1650600355732;
        Thu, 21 Apr 2022 21:05:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001cd4989febcsm4399089pjb.8.2022.04.21.21.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 21:05:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] musl: Fix build when usrmerge distro feature is enabled
Date: Thu, 21 Apr 2022 21:05:51 -0700
Message-Id: <20220422040552.2528282-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164771

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 044ed9c064b..4b854013608 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -49,7 +49,7 @@ CONFIGUREOPTS = " \
     --bindir=${bindir} \
     --libdir=${libdir} \
     --includedir=${includedir} \
-    --syslibdir=/lib \
+    --syslibdir=${nonarch_base_libdir} \
 "
 
 do_configure() {
@@ -62,14 +62,14 @@ do_compile() {
 
 do_install() {
 	oe_runmake install DESTDIR='${D}'
-	install -d ${D}${bindir} ${D}/lib ${D}${sysconfdir}
+	install -d ${D}${bindir} ${D}${sysconfdir}
         echo "${base_libdir}" > ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
         echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	ln -rs ${D}${libdir}/libc.so ${D}${bindir}/ldd
 }
 
-FILES:${PN} += "/lib/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path"
+FILES:${PN} += "${nonarch_base_libdir}/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path"
 FILES:${PN}-staticdev = "${libdir}/libc.a"
 FILES:${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
                     ${libdir}/libpthread.a ${libdir}/libresolv.a \
-- 
2.36.0


