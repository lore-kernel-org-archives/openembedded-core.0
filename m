Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DD2C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:41:24 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.10300.1675327280081239665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LBpcLjG3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so1149197pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 00:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gsFGGNSdW2EMKvXbx/gQWIHTO3Ad8czDpnj3JOuazic=;
        b=LBpcLjG34aUzCuD193RPjDKJ9QrsHjqnl+DENGUgvj3zlASOLvdhw5K6lOCN4cOtwl
         Coql26DB1QX3ZL+OqWnhQ41DC9nZqcS3YCnhPQ+sN0Nq7S8PyXLqILnxPzlWrU+1sx2U
         j3ifQsbBDEugD7A4BnEH54MbG9CXEOfA4+WfXthc0Sv+f3e8eWx0kJZgod2MUaI+WyPs
         4LP6OaoZRCn2aKUZr3Z3+AMUY5TwR6mAYffS5vMkpekBUnIqrvG3Pp12Nf0Rwbx2Bkk0
         PmZCz6S/4RbSFWsGsqEn2/nIvYBtKIhz8KzipKAWh8Jq8LiIhn8EdpbvFob8C4wEf9lc
         F3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsFGGNSdW2EMKvXbx/gQWIHTO3Ad8czDpnj3JOuazic=;
        b=5bPHuowQCehTMCqnrEk8fyrZxr7GbyP5PFkBRcbQRlDHFP19xY7Pt3LauedPRshrlS
         PBNaChb0D1dbMfRlDIxf2xn2qkT2KuovWWJieii2a/rcZv8ht4F4Ew0+i4IpImfNvZJH
         geC9nv0nWcMMUmMWsqfPhqjMaAssZvyWXRpENlPXA0wdWN/WcSssdqGm+E9rlKzAlClL
         pdDBmNWYYk4kn5gdSx2n5vPNcNPcBz6h/74W+P6V+TVv2bZ+fCNk86zGfFXowitGZ92s
         J1EQv+t04TABZ+UgyjjnhryfKl8Lzew9S+f6df4OfnME+YswxIlNF69Jr1cnDHQIgM+8
         mpww==
X-Gm-Message-State: AO0yUKUlS+hb7dtsPAGxHT8e5ovtz9H9Dmsn43IJsdJoXfw34JmLz+rN
	TuKukVMiW0abxMxr7W2kFhftC4DJFvUcoQ==
X-Google-Smtp-Source: AK7set+8TkgD+Ip+Fn6mwY0TV8AFOiVl70cBLbEs67BZAvIcbOuBvZxKr2wmM14qcGhw/qngzzQEVw==
X-Received: by 2002:a05:6a21:338a:b0:bc:6e88:7f58 with SMTP id yy10-20020a056a21338a00b000bc6e887f58mr7311789pzb.51.1675327279130;
        Thu, 02 Feb 2023 00:41:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id j69-20020a638048000000b004f01a88e135sm2908464pgd.85.2023.02.02.00.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 00:41:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] scons.bbclass: Make MAXLINELENGTH overridable
Date: Thu,  2 Feb 2023 00:41:16 -0800
Message-Id: <20230202084116.2583868-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176684

older scons do not support MAXLINELENGTH and some packages still may be
using older scons, these recipes can clear SCONS_MAXLINELENGTH in them
and get going. Set

SCONS_MAXLINELENGTH = ""

in such recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
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
2.39.1


