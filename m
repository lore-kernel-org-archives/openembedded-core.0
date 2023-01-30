Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9FDC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:03:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.34321.1675055026879754014
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CK4XQtet;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d3so10354668plr.10
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 21:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XokW4Pljzp2TL9OoAzqz54SZlLgVpPEjnSHnzQwi4xk=;
        b=CK4XQtetxFBLCmp8k03egS8rADAtFPJMhqT5xQ6r7vMqWD13/2czmfeBhtFSu0VQ2v
         YKCbT4IvUAVA5prjsNs2WHeUx1U3uTla9XgWFt3cq8AqPJu5uZsWg2fn5Wxh8QYYJRFM
         JrSK72HYgzSpb248PNVwEuafYM5bI7bl8zp5/6fUInHSW64JoSsVS1sX91FMY9ynQwiD
         1HEqu8pwbvWv8W4F6uqimoPea5v1iHUQYuiWLKgTY3XiQjSuy+5PwjbEKNpQxBDTKG9f
         s1YsC3hAPA2kwsgUfn3sgVVamHC2JKD9ryKJ9Purh7/hTl7nu5ZGrDHE3ywou3mtJUDR
         dquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XokW4Pljzp2TL9OoAzqz54SZlLgVpPEjnSHnzQwi4xk=;
        b=lTtCXw0+aw6DJsSjdBg3HxsfE2MY+qnvN+/WSjlgkGpT643k53kCIFC1FSFARbxB3x
         ezS8+2mGGBgJZFTCfG8F8ef1JlQS+IgAQNMWiDbfEwcPitF6LHZs8doChS+mb9V/g9a/
         ZrtBD8D1r1wkL91PIpSuIlo06OhDLG7yMD9O/Z9emz+rwNlhEpxOB9JQ/mTBoBVrAuvA
         7S+jKYS1Fv2sxb3qAKknhecA8Vb9TnNr9lxbaCS2dYiOi5Bhuo5+bbmSAhryBbddCioh
         G0AzzfLdluW0bSPTkHWVD8iC3RBPOL77guWJh9SKNpkK8gC+BYNIX/xfbTKYaGDbcd8F
         /d7A==
X-Gm-Message-State: AO0yUKVShJT4Nbz3igimdwZR7iHTROIo7bOrx3m6HZJsYuV0nS7ng1d+
	RSgT1TJgzT6LmQvo7FFgxGBUdAOGozOKDw==
X-Google-Smtp-Source: AK7set9MJx/3L8A2A7p4BKVf30oIjjICwG2KWo31+CsDcABk96UxyMH02febazC6/nCuW3oJcH39zA==
X-Received: by 2002:a05:6a20:8e15:b0:be:972a:f5e9 with SMTP id y21-20020a056a208e1500b000be972af5e9mr648142pzj.34.1675055025931;
        Sun, 29 Jan 2023 21:03:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id a1-20020a056a001d0100b00580f445d1easm6297152pfx.216.2023.01.29.21.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:03:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] scons: Pass MAXLINELENGTH to scons invocation
Date: Sun, 29 Jan 2023 21:03:42 -0800
Message-Id: <20230130050342.130715-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 05:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176479

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
2.39.1


