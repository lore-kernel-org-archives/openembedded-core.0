Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C98EC32792
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:58:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.21184.1660683471657513325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DVSuT/qz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id z12so13995082wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=62Biv7q/8xuopHUqthRHNrgDp0uX57HhkFHvz1b8HNI=;
        b=DVSuT/qzXZWJrrEnJNTmZR+/gFHPYwJulXtNMifsUY5O4YXwlUh5YnQ3TwAwkrcOyR
         oftAVL5BQuo7gwY8MSUwjLPyTX2m5wqIaKzYLAnGfonLnJSAAgo70XlFWBHYeHMPrTCN
         FIQoYXqN5GwE1ZY4IJjq9d1mCg8t0y9Gj8NEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=62Biv7q/8xuopHUqthRHNrgDp0uX57HhkFHvz1b8HNI=;
        b=Vg7LqgHd+818yvnhU1769aX1NgCykqVKxDshnFfEcUPkIsMHQ2nuIBS1AMJ6KZjhHu
         TGnmh83BNh2WRHG2rVhe/JFjoOmhHQ0QlcV8Ddi5STv5gEMdCVjnAOUFUzq2ne0exNJk
         SixU09og7K9RzI9yZp3mnd6sZ0kfad5HJbZX19oZclUpCAhm+z3g4zgz1VJjXH/6kq6G
         fXjV+Qky/ThYIGWUd631d1jDhvH3v/+6u0ajZ15QULz4PGywA8j6FXUd25sCW7qL+HM+
         ykua9AK3oBh6S/12LhFMzIlZMha2CI+AZ/kL3uyhPMhjD1HKzM1CD+DgjcZn9pBps1PZ
         ArXA==
X-Gm-Message-State: ACgBeo1gJA4czyKOnW6pq8SfMt+U6r2Z8PQMhRNiRDvr1hSOIMzwcKdP
	4BJWsTYEuclDm3BtJwcVHQIIwjhNBx7CTg==
X-Google-Smtp-Source: 
 AA6agR6wHBaEhnVJjoome6on+7AIfAPVTwwqCIowHchutLMmmbxbzx+NHN0XSateEvD0IMZRU7xVsw==
X-Received: by 2002:a5d:6c65:0:b0:221:d33f:f1db with SMTP id
 r5-20020a5d6c65000000b00221d33ff1dbmr12657743wrz.553.1660683469704;
        Tue, 16 Aug 2022 13:57:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] python3-cython: Update code to match debug path changes
Date: Tue, 16 Aug 2022 21:57:42 +0100
Message-Id: <20220816205746.1672987-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169458

Match the changes to debug prefixes in bitbake.conf.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-cython_0.29.32.bb          | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.32.bb b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
index 26333cb2718..28a1386310b 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.32.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
@@ -20,17 +20,19 @@ do_install:append() {
 PACKAGEBUILDPKGD += "cython_fix_sources"
 
 cython_fix_sources () {
-	for f in ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Actions.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c \
+	for f in ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FlowControl.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FusedNode.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Scanning.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Visitor.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Actions.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Scanners.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
+		echo $f >> /tmp/rp5
 		if [ -e $f ]; then
-			sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
+			echo sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g'  >> /tmp/rp5
+			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
 		fi
 	done
 }
-- 
2.34.1


