Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E93C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 11:06:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.16634.1678705604659263433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 04:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IXzD8F0n;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so2133181wmb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678705603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GQ0lJvHpB1+AasQgIdZ4Pj9cL126t0Re3bJ6qhKGhY=;
        b=IXzD8F0nj6TDJjYOn6tqPfM5S62zTIaaDFenSlI+TC1jyZyFeUQ4Qq0JF4QsAPC8Ke
         /0JR/4aFt3Rer3ABIwhqBk3AeJR7xeK3vUmOa0SuIPp1EKCTZ3p04JBoi7w9nyWE6oDa
         Tz653kqYKFiJKa03lNsDl9VOZeSCLb9VFVi/jgjNkhIrQVvf/EKDcVanI/9uF/aQkEFQ
         K7pqZPf81Km+m6hRw6L7k5JowEGSQm9fpIXuZaxZ9UB2yHyIfvKkCXO+SW4avwcitnpB
         YgYM2CkH7eHQMZQHUhR1i26bVC3I9/Sa8+u65qpxbbUSW4G4JA1YxF/2tkzGrzy4Qc1g
         9H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678705603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GQ0lJvHpB1+AasQgIdZ4Pj9cL126t0Re3bJ6qhKGhY=;
        b=ZmqxXYrO8jAyhZ/Rbiy+AaZEGCc4Y4B6auKueOrTxWsM2Om6HQgoVVnRq3ByFKARj2
         SE4FVihWYr3Ok8tKxQfviQ3ez5mxhxjg2r6ab6IBrptJRnzC2NwgzQcegampTybk/rlJ
         Y7Xt5NZBBVE1ItBShMw82CnxRNLS4tJHpk7eH7VaefALSXdzRVDg9PPWZDayUAa4Mggv
         uYFjDRjCna6FuxtawTGIxiXf7SS48xpBD5e6Y0QaMr8x/V5cMSpj6r6XC7PlsjG6IS/b
         k3pIOVv4W41ghHG0PzVCjHISTosFMKSOlclfNKCLyfit47ZQ4B+W+jRST8YbVXD5hrIi
         8CsA==
X-Gm-Message-State: AO0yUKXbdIfbQ08ASqxHuOplvztDE93ahwv31ILfMdWpxoVJQmbg25qP
	efEwng9z/AXOkuZ2Jc/7OSFZP209RvQ=
X-Google-Smtp-Source: AK7set8YpKosTD2SLOAAfsyWc7HGJUrD3dxuXzPaPmJA57O52kj6ynjT2e8ojf/eoT8YnO7z4+g1HQ==
X-Received: by 2002:a05:600c:5408:b0:3ea:ecc2:daab with SMTP id he8-20020a05600c540800b003eaecc2daabmr11545947wmb.3.1678705603111;
        Mon, 13 Mar 2023 04:06:43 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b003e209186c07sm9739434wms.19.2023.03.13.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:06:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] tzdata: use separate B instead of WORKDIR for zic output
Date: Mon, 13 Mar 2023 12:06:31 +0100
Message-Id: <20230313110631.3591204-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110631.3591204-1-Martin.Jansa@gmail.com>
References: <20230313110631.3591204-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 11:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178430

* avoid copying whole exec_prefix over base_prefix as there
  were only zoneinfo files anyway

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index ce725008c0..dd1960ffa7 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -16,17 +16,21 @@ TZONES = " \
 # "fat" is needed by e.g. MariaDB's mysql_tzinfo_to_sql
 ZIC_FMT ?= "slim"
 
+do_configure[cleandirs] = "${B}"
+B = "${WORKDIR}/build"
+
 do_compile() {
 	for zone in ${TZONES}; do
-		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null ${S}/${zone}
-		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null ${S}/${zone}
-		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds ${S}/${zone}
+		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo -L /dev/null ${S}/${zone}
+		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo/posix -L /dev/null ${S}/${zone}
+		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo/right -L ${S}/leapseconds ${S}/${zone}
 	done
 }
 
 do_install() {
-	install -d ${D}$exec_prefix ${D}${datadir}/zoneinfo
-	cp -pPR ${WORKDIR}$exec_prefix ${D}${base_prefix}
+	install -d ${D}${datadir}/zoneinfo
+	cp -pPR ${B}/zoneinfo/* ${D}${datadir}/zoneinfo
+
 	# libc is removing zoneinfo files from package
 	cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
 	cp -pP "${S}/zone1970.tab" ${D}${datadir}/zoneinfo
-- 
2.39.2


