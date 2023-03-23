Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B50C761AF
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.85134.1679605512413192627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aeGIYMbo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id kq3so53821plb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srVgYZqL0cc3Sui5ROQfCTJ3ZyxWjbFjKyU7VzIlK+s=;
        b=aeGIYMbokL/wqsba2UHa5cbjDh8FPYp8OsoeMA6seIWFnJC7On4lYf4i4KDlJt7wru
         fddvPpXu/fy3Cg6ABNjtu1rdPzUiRCI3surCVOE5EBjq3gGsKoeGXOvW4EJCRAubf50N
         S2DJYZkSol+r7C37Y9Mn1OREU9+FUFimz6pHfO8QdZpUAd8yzVh7gaY3NiVYJNFDH9eB
         lozX0Lski5mS2aisALJa878IAD4uUo7zx2+ESPyiY6uUHxipm6SHOmgv+mxOEzRVlnNw
         BRR/3nbh1ijo1wqpmantOm50JlqHSATQ/FCavd+fBwxIKQObzbTmCwjgBDBmrextBbct
         U2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srVgYZqL0cc3Sui5ROQfCTJ3ZyxWjbFjKyU7VzIlK+s=;
        b=BTRa8waIa5p+NviY5e/eZ7rtjDGcTGaTsOL8/dJ9B3iXGrvk1qeT4J5UG7QfAe2xXj
         xZnuFkKyn6uFF25GOosGdgJ/LyFsqZi3lcy5nOF8T05TIlpUkNR223nnrM3zFm3RJijI
         elzg87bsz8o5OR1H0i7zCWnhKeIokVMjARcg24d6dFygve4YYjsE6k6ZFZxfO5PVT7CN
         JrJgedDJ9EXtO9Ep/saF178kNkFrJcwQpDiruFaZAKNCWXRCkwD9HJ2Td9vjJpQbzVUT
         AT1IXLK8Dm7iWOi6CHyu17Bo+2dJc542wC6Scgm7QoEsTv42Yb4dRLGKnrpHPESsphUI
         5BLQ==
X-Gm-Message-State: AAQBX9e/X59QtkMJ4RGnY/POu3AFbt6XRKQdNAwIXB72Vg7j7PbauJls
	RL/y63ruT3djFmvs7b8Is9Y4BHTN/5lFNnG9PXA=
X-Google-Smtp-Source: AKy350Zg5jzmm47KZhpmbazG0F1nIVrRPAKa3hPm6bdsSyeq4dVrykHEL3E6eI/EyGRbZ8++vNZthQ==
X-Received: by 2002:a17:902:f90d:b0:19c:dbce:dce4 with SMTP id kw13-20020a170902f90d00b0019cdbcedce4mr244631plb.15.1679605511459;
        Thu, 23 Mar 2023 14:05:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/14] tzdata: use separate B instead of WORKDIR for zic output
Date: Thu, 23 Mar 2023 11:04:38 -1000
Message-Id: <cf96296296a71d0d164f4e528991f0946efe9b29.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179004

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


