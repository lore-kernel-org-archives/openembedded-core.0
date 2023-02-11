Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C86AC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:27 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.19570.1676150661664574974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tqGhVPkw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id c29so1816353pgm.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LViFbnyBpBwyOb1jyBHc3U6NYykOvtARp1EuUQsTbPM=;
        b=tqGhVPkwhMAgK8NePov/FlkF+WC1szOyFJclZxpgkisRydhhPmxxP0c1sDVh+fYPNG
         t7Jam9iksjmKOlRGgJB0B2KKJKaX52YmnRr/nz7rCNBN3cwaETMSrp+u1e17YLfPeF+n
         xqA2gGTz4VyGCe9dJQVPP0Kc01FYWV07MHBIajnQvhUJeVLeFycvszv3Qo8HOBPK8spw
         6ym5JPBu+eVDLRjYkFi4dxqBwVdTEkxKCB+4A2bL1ITrlGvyiXQdTNj3Q/+5Adh2BH6O
         bY2+BlRzFUT1hok1seq1keBESNj1FSSHcaoCq+RZ26KfBdowkb9cwpjMa7xolHknP8Ci
         qYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LViFbnyBpBwyOb1jyBHc3U6NYykOvtARp1EuUQsTbPM=;
        b=Ip65NqLWylczRVPWX/ODGmvBTxAFqZ1LPCkSXL4gWgtq+vRW9gigDdVKvcTGld1W1E
         LSxKaS1jJVvum4Yrcf06AGmeZX1Wu4kTVUVY+vb30zcpgw5Pj5HckRfCIDWC/4WaSrhw
         2zvJBdOIyfTzR+jHD/wXcfmt8J4cFXeWoWTPlH1wBlg52mUkaMwOXquDDg5ZDvuVb1bm
         KcF3qYurUl8jfAAjmIG9fYUV3RbsF9FhOw0NCyLTkbABHt7VASZc4mqiEvd3YQG9dD5F
         ppjGtMypZuhJdfYSPIa3HbyMPNJK9aZnhLWGrIgsCN1cNY77uENM8mjn2wvTFQyVcAdU
         bZnw==
X-Gm-Message-State: AO0yUKXgFD5hvDM8hvak5vkp6eizPAWOMtg0VzQNCl/7xT9nea1oLHhb
	/o2MSGl0DggfBRsxxGxy3JTB5B59Xa/JsEM6348=
X-Google-Smtp-Source: AK7set8AAsG5XDCiee2+RUCI3MES+F2lLLyzQ2D4n2+on74+EgBXxxYgwgd/EPbcrIA1+OSEIBdKTg==
X-Received: by 2002:aa7:9599:0:b0:5a7:a075:febc with SMTP id z25-20020aa79599000000b005a7a075febcmr14633626pfj.17.1676150660684;
        Sat, 11 Feb 2023 13:24:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/28] scons.bbclass: Make MAXLINELENGTH overridable
Date: Sat, 11 Feb 2023 11:23:36 -1000
Message-Id: <625ed0898518bcd699cb16f6e1cc0813eca0c48f.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177023

From: Khem Raj <raj.khem@gmail.com>

older scons do not support MAXLINELENGTH and some packages still may be
using older scons, these recipes can clear SCONS_MAXLINELENGTH in them
and get going. Set

SCONS_MAXLINELENGTH = ""

in such recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34de57d12c0a752f66c962d29e5335c1035db066)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/scons.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/scons.bbclass b/meta/classes-recipe/scons.bbclass
index d510c12b9b..d20a78dc6e 100644
--- a/meta/classes-recipe/scons.bbclass
+++ b/meta/classes-recipe/scons.bbclass
@@ -10,11 +10,12 @@ DEPENDS += "python3-scons-native"
 
 EXTRA_OESCONS ?= ""
 # This value below is derived from $(getconf ARG_MAX)
-SCONS_MAXLINELENGTH ?= "2097152"
+SCONS_MAXLINELENGTH ?= "MAXLINELENGTH=2097152"
+EXTRA_OESCONS:append = " ${SCONS_MAXLINELENGTH}"
 do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" = "${B}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
-			${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} prefix=${prefix} ${EXTRA_OESCONS}
+			${STAGING_BINDIR_NATIVE}/scons --directory=${S} --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
 		fi
 
 		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
@@ -23,12 +24,12 @@ do_configure() {
 }
 
 scons_do_compile() {
-	${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
-	${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=${S} install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
 
-- 
2.34.1


