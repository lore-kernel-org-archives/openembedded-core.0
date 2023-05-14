Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C671EC7EE23
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.69680.1684081923017055645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=S3to+IS+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-530638a60e1so4427660a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081922; x=1686673922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=150ICT9y+ttVleVrnlWIr/EB22qXKsRIQZY6Hkq26VM=;
        b=S3to+IS+COGZDCJLWaOJai5FM/FWYoK0UWayJxx+zv5x3yfuVpeKUHWetFUZb+XhwL
         jG2an5u1Cwp/FBrAKH2iRurJY+umul3yujFbuDqKmBXAvC5EWiSQ94AM4AHfgZzZXxXi
         raubqKYiixuFUv927MFTrplNYJ62qhWGe3fTWCIS7OxVIL1fUQRZWqaGhWC2dZmU8TKc
         mm00Eh+sNy7x3vmzYcm4SI2+JHkHZNMEs1pftfAMKSilFES7/L5Q1OxF4BGZ4hSnwUs8
         qjai/+cxEhzfJS2bQtTGrFGFfSlo4NAu6yzRK+g5l+YmN/p7hkO4XAlbeKU9O+mlJEVy
         96IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081922; x=1686673922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=150ICT9y+ttVleVrnlWIr/EB22qXKsRIQZY6Hkq26VM=;
        b=KGGYAV7VwrLBxTP17971fF1SdABYWHvOlWeaWY5cdTyU8tdvB2i/Je0QQtKh5qnvd4
         f8TrNruIRqaQbktJRixWmbxu3rm9Y4fzrlfcJsCSkUGvnG5Jctgsi1bh4fR27Y1aPZpD
         DZB0kH282fLhpao3Lo/1lek0slaZfV2gx3FvY7yJHKgddw4mip/rJ5HhMoskoMJP9OtN
         EBXuIBuw9UHaD/R1AYQoGBxouqawJhOjUGrUQkP95ly5BplCOSREuZdGRFTKgeh5NcLA
         W8jyt4xwNS0lzIUatsPDot+01rqF5QF512I3PwXMylAVJxK2rkizYdTsjRxVhmyrw6lS
         cfKQ==
X-Gm-Message-State: AC+VfDy/2E33Ny7HBFqdJy0C5aLf1gEx+0gWYFKODOr26WwvEDQhw196
	Nf3RCvd98FR4Pj4/xHdM2AkMjjR4gYpkZmt4XBM=
X-Google-Smtp-Source: ACHHUZ7qtKgD33Xp56WLTfOKp+mhjhB7tnW3SOnxCNY4S8kCaKJAwfRvr5Vk3uGpHoLwalqV+XW/yw==
X-Received: by 2002:a05:6a20:1587:b0:102:f744:a70c with SMTP id h7-20020a056a20158700b00102f744a70cmr19866792pzj.3.1684081921971;
        Sun, 14 May 2023 09:32:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/15] libxml2: Disable icu tests on musl
Date: Sun, 14 May 2023 06:31:34 -1000
Message-Id: <1fbab00c9d887285a9e966e81ff75a7fc7039baa.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181210

From: Khem Raj <raj.khem@gmail.com>

these tests do not work with musl's iconv implementation and would need
enabling icu support using --with-icu which we do not enable by default

Additionally enable locale with musl too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 03980db15fa1de2f970705364c2316f17428a3aa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


