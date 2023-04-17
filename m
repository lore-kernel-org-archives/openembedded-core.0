Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3950C77B61
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:04:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.47910.1681711477845155487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YABzHERU;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-51b6d0b9430so477825a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 23:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681711477; x=1684303477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DmoJt5HSWAdnragDVSzI4xlHynZbAmbQ8i6dTZdiIqs=;
        b=YABzHERULrzFT4/LrgfhplGkIEhbX9EH5EOfpmZ2E45A29sF2Aux+8EsnovK6IBSqs
         lvPkuyZ4xbpPaWrmaA0QK9R3+Z20TxiAHpipkJDI6oTgIpUMuS76gsXBdU6hftoLAt8p
         SX5jIEC99k6uQLMSJQQbo38iLdj+EduaSaw1SphVHio3obMliRoQif5mQBsd1x640oL0
         YOEZ79J/etINOZG6DhLUrW357+v8eMIGHf4g+3TzmjqgiuBObQcRmPXL5e6pOu6XnW/c
         sDi0OCDnvDjz1ARwG/IaNruD4beBL6rzk3UAA75BpB1/k4AQiJ6n33toatpZ95gRsIc0
         07iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681711477; x=1684303477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmoJt5HSWAdnragDVSzI4xlHynZbAmbQ8i6dTZdiIqs=;
        b=TlR8DRGdmA38lIJJuekUiLaBEhp7ESzQM+whMPyyakrW5lTWnUX/l6RJI+GRSOEZjS
         JgUR4VA9E8kxCb5LzcqE5/UJKY1yPEYFMOiSzNO6zG6WGOrFFqREo2ovRkMXZMO2MbRy
         bvSU4/72TijfVt4Gxia7s9kgefHgNiLA9Kxutcs3KDtbSqAgD3GS06vNJ4NGltONiqWb
         FhlgDUDblpU3JxkYMxSCGxIb7e3Crkb5spx3DNiQi9B/BKfio+79rnW5gHfVA8ANWNvr
         tyiWZsho5L2DikNj9Kbh2Vc9+coZCPOpom6nrHXR4pG11bIia1n/f99kVktTq/CRG9B6
         uZjQ==
X-Gm-Message-State: AAQBX9fl8riTdpaOceQgGLcJJ4aKCZRwPcVh1q50U2HX+w4FE+9b1EHA
	CT/8u14obBfDPDZRBTh7KK0umZB2X03qAg==
X-Google-Smtp-Source: AKy350YtTNbHMqFOsn2YkGG7gi/leRMaE79nPWpuBlXhuwUtli7Wj1MDAiUdAuW3bifTrDftItMQYQ==
X-Received: by 2002:a05:6a00:1794:b0:63b:877f:ee53 with SMTP id s20-20020a056a00179400b0063b877fee53mr7277077pfg.17.1681711476871;
        Sun, 16 Apr 2023 23:04:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0063aa1763146sm6552127pfo.17.2023.04.16.23.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 23:04:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libxml2: Disable icu tests on musl
Date: Sun, 16 Apr 2023 23:04:33 -0700
Message-Id: <20230417060433.3830941-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180119

these tests do not work with musl's iconv implementation and would need
enabling icu support using --with-icu which we do not enable by default

Additionally enable locale with musl too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxml/libxml2_2.10.3.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.3.bb b/meta/recipes-core/libxml/libxml2_2.10.3.bb
index 6b3dd3ec42..0ccd48964f 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.3.bb
@@ -40,15 +40,15 @@ inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
-RDEPENDS:${PN}-ptest += "bash make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
+RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS:${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
 
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                            glibc-gconv-ibm1141 \
                                            glibc-gconv-iso8859-5 \
                                            glibc-gconv-euc-jp \
-                                           locale-base-en-us \
                                          "
 
 # WARNING: zlib is required for RPM use
@@ -85,6 +85,11 @@ do_install_ptest () {
     fi
 }
 
+# with musl we need to enable icu support explicitly for these tests
+do_install_ptest:append:libc-musl () {
+	rm -rf ${D}/${PTEST_PATH}/test/icu_parse_test.xml
+}
+
 do_install:append:class-native () {
 	# Docs are not needed in the native case
 	rm ${D}${datadir}/gtk-doc -rf
-- 
2.40.0


