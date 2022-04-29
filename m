Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C86CC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.12057.1651248114054172636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SQ7aAtaU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id b12so7522830plg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rWmP+WQw464rSDQdyO0k/+gnHGGSmWWefxb23+aSadA=;
        b=SQ7aAtaU5JG/8ewfrR1yM8Lv+rCFZ8znL6p4bwA34tQPpivPHiXvyhl0+NUNp/G2YV
         c6q71kKzFUww7Rk90ChYbG2hC60tzR9S9dLijKsgO5AGNTSSNu5mC+6wTI52/cEiQ0ch
         O3I9GyzojucnL3wY2xhq7dGI0U7eDRHQd1eZdbjk9sWB2qc9oaHvlL2pvRareGj+aAzR
         j407/4I4J2frzpgGPq7y7mCj0dkkMFFXfaeq6SZWtbwMEJjG4aSZFwCe30vY5qdbUYxR
         PNKpsf67RpTcIuhKBP0qa3MMWGFRcB2ca0xln0bNlv3aDTcMHnvwUuHUbALQmosthISu
         vufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWmP+WQw464rSDQdyO0k/+gnHGGSmWWefxb23+aSadA=;
        b=MnHooZYIRO7qhwkDAvYTUu0cPI4XegakTbfSEhEr6Aq90JFBKR+AW+1g3QOb5NszfQ
         aogNhnU/6B2p8rniaiapxaw0UD8WHuzMcb1ceVzGP0+09hrsJD9si98ZQjImAKfU3uoM
         eFZ5oSmgyRdC5FGHrJRF36MbH+mZgdCFnubaUbk2+opzRuRcgVSr4CYKcw6ktFRCqdWq
         xfLjcAnWz5kEjq07v17DjdyNfmEUUyFTNOyaL9XbA1Vwx/7i1VODsRX3XLGeZE0VqJyF
         wzt4hxxqPt9qkFAar6xgKJdyQABv4tl5VRHHw9bZ+ZiAtmgs08JtlaBeNpaKVuPqklyC
         Cxgg==
X-Gm-Message-State: AOAM531HLIHCI6Nte11RpOfSCX5Vwe9JTN35MUhXz78ehkFwCb6XFSZi
	RgGQa4V/QPX5Tca7+jnImbhnVUVKln/mHEXogGg=
X-Google-Smtp-Source: 
 ABdhPJwfDtw10604VXyuyJsMniL8uFzKb7AvUnugCuqamKhV1C8VFXr1FLh/Kajz7MzUi8NUb7HYLQ==
X-Received: by 2002:a17:902:edc7:b0:15b:4196:1957 with SMTP id
 q7-20020a170902edc700b0015b41961957mr60445plk.161.1651248112821;
        Fri, 29 Apr 2022 09:01:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/34] musl: Fix build when usrmerge distro
 feature is enabled
Date: Fri, 29 Apr 2022 06:00:32 -1000
Message-Id: 
 <8a9f1d5a11b01de3145b16c19d98c3f030473326.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165032

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02fd8e760cac1d2e0e25a4e3dbea3f2844b9fd01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/musl/musl_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 044ed9c064..4b85401360 100644
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
2.25.1


