Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B3FC64EC4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:27 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.19495.1676150659841718988
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hH/nRAzb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id x31so5924576pgl.6
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9/HHPvkbGVqR5X+GtlU2oeFll4Ks0rnW7/p61e8XUA=;
        b=hH/nRAzb0XvC7HMICM1lmHPeRlIZeS8GBwsv3kY5957f1JCUJmhnaugfuZZNKFun2g
         MMYOsQfVGRcrmGMvIjaklq1A+U0LQlZCKWYWi2/guEbSeqW6VTxMKQlZSIMGBvu/57oC
         nhu+HjxT8q8Y17xashJFAW+jxlFeOT1erkeB7AkLZbbS52IrJMo+KkmvlleE8qS88mcy
         W+nWsGoiqDA5fS3nSg4+pgUqa3Y883jBRV3ggeHLF5XmYZyLR4Aqgl6Caq+B5oaSjvhl
         34EQIkICnJ7RFj7UneK3FcDYXYyFYlKb2qHxIyNX+2tWswbglLrIXOFIL1311uRwSu95
         F/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9/HHPvkbGVqR5X+GtlU2oeFll4Ks0rnW7/p61e8XUA=;
        b=ahdDLl7Gy9LWzSUZv5sawUc9FM4njye5f2CDHjvPoX42ycqFOnfVt6Tlco/ONFxIkV
         VkQEZ62QoLO6+k5LL1UwhXB0SRGQWLZG5pQrwGlDdfP8a7R9CFqz/234wGVeICgIvP+3
         FHjCX9QNSaFjdd0VBRLdVyLJT4gntsLUvtL6q8h5iFaxJkvQcie1HSFgL0Id3vysj3pc
         SCtrSb3ZwB3T34sLvxHLAMVg2UVHX7/+IS1loeEqheLDCxE129SCKs92NkvbzJOk+sUG
         kMG/ERBRr56UuXOTPAgNpCU/19TVMT1y2ZnenUN6oeyZOwReg3Ps9+mXZDWpKGUL9Ufh
         fwIg==
X-Gm-Message-State: AO0yUKU+mENwyOOnxKNF+9BkhiovmBfoaDG9SVJ3RrB2aUY7ev1g6bh7
	CDDwdHPR3DZkp9IbvPnUNt9LU8WK2+aJaP2lUFA=
X-Google-Smtp-Source: AK7set+2Ze+zIeJt5J9uTiWUjRVti1U+NcDwB1IDuU9sVPUHNYTf0LWGIS2FhAQi1Gq5Rxuwcrbjkw==
X-Received: by 2002:a62:15d8:0:b0:590:7708:2be3 with SMTP id 207-20020a6215d8000000b0059077082be3mr15722985pfv.33.1676150658690;
        Sat, 11 Feb 2023 13:24:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/28] scons: Pass MAXLINELENGTH to scons invocation
Date: Sat, 11 Feb 2023 11:23:35 -1000
Message-Id: <d361b7ddfb92e2b14e217377e02ca06cb936a54f.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177022

From: Khem Raj <raj.khem@gmail.com>

This helps in overcoming a problem when using scons with ccache enabled.
When commands get longer, then it resorts to using response files to do
the operations e.g. @/tmp/tmp96j6icra.lnk when this response file is
inboked by compiler it works ok, however, this does not when ccache is
used to invoke the complilation. We see errors e.g.

ccache @/tmp/tmppsyij_0v.lnk
ccache: error: execute_noreturn of @/tmp/tmppsyij_0v.lnk failed: No such file or directory

Using MAXLINELENGTH setting ensures that we can use ARG_MAX to extend
the length of commandline and hence avoid using response files. This
issue is also reported in mongodb [1]

[1] https://jira.mongodb.org/browse/SERVER-38389

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 29558f6218f4676b459f2c78f82d245339d51c8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/scons.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/scons.bbclass b/meta/classes-recipe/scons.bbclass
index 5f0d4a910b..d510c12b9b 100644
--- a/meta/classes-recipe/scons.bbclass
+++ b/meta/classes-recipe/scons.bbclass
@@ -9,11 +9,12 @@ inherit python3native
 DEPENDS += "python3-scons-native"
 
 EXTRA_OESCONS ?= ""
-
+# This value below is derived from $(getconf ARG_MAX)
+SCONS_MAXLINELENGTH ?= "2097152"
 do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" = "${B}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
-			${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
+			${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} prefix=${prefix} ${EXTRA_OESCONS}
 		fi
 
 		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
@@ -22,13 +23,17 @@ do_configure() {
 }
 
 scons_do_compile() {
-	${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
-	${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
 
+do_configure[vardepsexclude] = "SCONS_MAXLINELENGTH"
+do_compile[vardepsexclude] = "SCONS_MAXLINELENGTH"
+do_install[vardepsexclude] = "SCONS_MAXLINELENGTH"
+
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.34.1


