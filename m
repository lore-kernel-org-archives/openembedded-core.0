Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD12C64ED6
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6.1676236278486361097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2ER40/Uf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id e17so2771582plg.12
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1kyxxXCrFZdLP77nhHHbxg9vlb0U+Vb4alYasQtHnI=;
        b=2ER40/Ufsomm0MNsFzgYAH21TaYRSABaxE1K0epootFRZB0KyybS2LTVyVIEYO2+A4
         VL/AQ+BkAHui+QbakQQAL9mziFNB2lEQ+2gKbJZaShbvaoUJ0rBz4V4Kv1vBHXq+ydaE
         7S3xSeeDBqhmknqRYz4/x57fPCCouTwQE0+cyJNnjEWMijk+qEPK/pfTySy/u7fK2k86
         waMGNaq4n/LikLl7W8jkTCJZj/FrpULgL0U74VgsAozpUIP79d3/D4V3V/5g/pODpnoc
         DaBpjVl0UDrOfhztR27NftELRd/+7omW2hmzqy3iCrhoawzN7Z5yYoVuBW7wxKawGv/T
         ys0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1kyxxXCrFZdLP77nhHHbxg9vlb0U+Vb4alYasQtHnI=;
        b=Pt5nsxEgvIJl6y27MDBTa9qtSWJj8OaG+hUAIcswNlJu7Ee1fgWJyMVGtd+u5RoQ1G
         wAnDYwDBY4tUZQBgg5TeqhaMmwbwKbMOGYCtbmT1l6EeHaVAFBHG0KiivlQo6D33nuym
         H8amO4BuXSSQsuu/QLNuBfOOTGN537pqs6RcZZx+JweZwUHuVzsImM9sXkx47bJHWNjD
         2ypkx6c/xzmtyhze0TIctzZ61/o5lt2r+w6W7MTYvlsGiv1aFP9tqN1xUf0ZruzWzEdg
         5gG468gSO/PutMSJ699mJ5/2G9tgVvU5jiorFIDHDgWhtDuAKtxkhBWgJWFA9AcuLdis
         4AEQ==
X-Gm-Message-State: AO0yUKUymJtvghuaa2GEN/L/j7WTZCN75rckBEcszIIdiFWX2REbWBIP
	m6uhMvah+b/YapWnhb+S/m6z/38bEP6qz7kBcTg=
X-Google-Smtp-Source: AK7set83zKfHO8QkpPA08hH9SpY+/o5Q8s+K7DziXGUggcdQ5vTYjdqN1io8mJaloY3J4Pej5VtU2Q==
X-Received: by 2002:a17:902:ced0:b0:196:725c:6ea with SMTP id d16-20020a170902ced000b00196725c06eamr27302360plg.19.1676236277577;
        Sun, 12 Feb 2023 13:11:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/27] scons.bbclass: Make MAXLINELENGTH overridable
Date: Sun, 12 Feb 2023 11:10:30 -1000
Message-Id: <b4eaa248077305b75c551acb94223dbc524fc7a3.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177057

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
 meta/classes/scons.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 72422d8884..ffe43bb7c9 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -4,11 +4,12 @@ DEPENDS += "python3-scons-native"
 
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
@@ -17,12 +18,12 @@ do_configure() {
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


