Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B35BC761A6
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.44018.1679494930688844403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cp1Tb/BV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso1158256pjc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srVgYZqL0cc3Sui5ROQfCTJ3ZyxWjbFjKyU7VzIlK+s=;
        b=cp1Tb/BV3sN5qKfOzGhn1VsxeMO4mz5k6O8mUpFvZ2PpZPqh2pUJgJEQF/L+MBqvvC
         noJX/kYw4GTZyftzG8I9vd1FSEQvNucKojGSMt3cY6lVIr4+iykwu/x9E5Ns9Yl1pHxR
         NOY+//1Bpm7VKigslDVLrbs9GZeJ7ZHOcWiMmWyxyqGGsAqQhvtich1fsu7nLrEVC1s8
         h5mZL3R0xLWz/i32U0hHu6IgCY5EN4qVuF2BXipTezXFaatb96h9bcMMH3NXtvcUBbRT
         t9OPFzVQwoh+axhg8Z5vwMA+/hp8W2gN4olw4YraMMgsvcl2XTGLksUlJMIwMm3qHjEy
         +WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srVgYZqL0cc3Sui5ROQfCTJ3ZyxWjbFjKyU7VzIlK+s=;
        b=5qDfe4SWFhpJRH0aefQYl35x2q0YhCFVrHnwyfREfxHwg+ztjQBy9tjWZeS3NQbtFM
         q+DKOcf4m3XWqAXXYX8ikBR/jJOJzlN5Q0D6ZaoiuIuJgnM8vpFqvKsjZb0wfXTfn1IZ
         29t4IpI3Oyz5NN+SzUPDcs0g3rQmmHm/AVbPjVb0Z0TSznQK3KelOZiUEstwMMYnr1AY
         t9kNKNbYqVsGxTviZjzGJ9fysgc38TM1ToBN8iIKUo/t4H9vN3QCZpI6a+c2hRMr6KtA
         YJP5Dm6ppbFtgE9rSWSmmdDM59LS3mxqsQXYQFR+t79eS/K/vi/u/hCC2dKyhI0qbNrT
         XRdA==
X-Gm-Message-State: AO0yUKWBX6RIV4401x8999XgS9YQ7M02c6YWFZ0EJUevOH3+yk4mv4uz
	vt741g551hUxVBUO95fqAtXqttU4agbTr75uWAY=
X-Google-Smtp-Source: AK7set8MNJrub+fELONLFOUiOF1GqBfmAH03Of+xTQPh1WvY/YW9UxQxAZLWwrmwAa7z9RKi7ILCFg==
X-Received: by 2002:a05:6a20:41a:b0:d8:e105:eb25 with SMTP id a26-20020a056a20041a00b000d8e105eb25mr4892576pza.7.1679494929734;
        Wed, 22 Mar 2023 07:22:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/21] tzdata: use separate B instead of WORKDIR for zic output
Date: Wed, 22 Mar 2023 04:21:31 -1000
Message-Id: <9b6dcbf40c10bfb640f51ecf2a1a8ea7d487a0f3.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178937

From: Martin Jansa <Martin.Jansa@gmail.com>

* avoid copying whole exec_prefix over base_prefix as there
  were only zoneinfo files anyway

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37846f8735683ed0fab5ef5c12d77c6041348801)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


