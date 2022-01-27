Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D816CC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.26830.1643278836215019633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FTW9aDT6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso3058326wms.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a09VycTgC14Yk5tWgSIGQMc3+OJL4ElZdq+OxKTx21M=;
        b=FTW9aDT62ehWmsp21EQ2aRJJo/QK++JNJKCZ54iUQ33+eNuwnfI+93vjNBUXIOhcIE
         K2K3gI0SToT1Yl7hQN9qtLaJJTjPfWK8aXMVm7+yrCebznrZqu9Ch/sfvQG7hmGB3Mab
         dgbIfk6OGKImFz5jGkv0DKWsDZHf0p0HStLnDEEBOsf8nneSYkJUA81sa6j0P/fLndlF
         HVLqtACl4Pg+qAuCh/2Ew70iWw5PlOL3787GQHqER1018/tTWGPH8tJI9kMXuR1gfnas
         V/7SFsUoBCCccEo21cLTBJvXAmYU1XvKrM9U6GzHPL3IH7/rQgmwyaYWS2zvIBuACIgN
         Myrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a09VycTgC14Yk5tWgSIGQMc3+OJL4ElZdq+OxKTx21M=;
        b=eJBQpPJSpGuDin6dNeIHErBJivhnyGsQtyROunBphF4mIxTjQm3+7du9TaoPp0wJqC
         MfUmBZRKWdgMM7EOq6M3+SAc32cCBuvb+oAonXogxMVxB9lXDydfKbiOm1x+HLr/BM47
         JLu5RmSUupqq2zq7n4RuMe6YwPqqDVI5a4p/GgxWuabKfz3nvPTsM4chl00sFpiCt24U
         I5JBNAjNbeI8W0PgDCq38CrZ2w1PD7v53g+9PgICyHMGONA6fDeIS0dl1jtLEX0DnpQa
         y1s5aj3+yVI9i8MYt7Cr5/jfD7c1u1OZRc4UZ4SiBfvXee3R+M2erdVbv5YrCCROUBL7
         eqPQ==
X-Gm-Message-State: AOAM532VYmLHzm/GxKwW/h+G8ihQJ9e52TqRg5xzeIOeEoYTBdPYZ3Iz
	AiUTaARizgWyKjfTusxVEMaNxBJ+cNg=
X-Google-Smtp-Source: 
 ABdhPJyYbCXSOPSou6mZHqWYIdZCeUhatr6fNlfPJG8sjBVP+objZtI+V3LWIfoFEnukYA632DG2ZA==
X-Received: by 2002:a05:600c:35d5:: with SMTP id
 r21mr11110233wmq.142.1643278834642;
        Thu, 27 Jan 2022 02:20:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/17] libbsd: upgrade 0.11.3 -> 0.11.5
Date: Thu, 27 Jan 2022 11:19:56 +0100
Message-Id: <20220127102005.3050843-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161030

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libbsd/{libbsd_0.11.3.bb => libbsd_0.11.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.11.3.bb => libbsd_0.11.5.bb} (90%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.3.bb b/meta/recipes-support/libbsd/libbsd_0.11.5.bb
similarity index 90%
rename from meta/recipes-support/libbsd/libbsd_0.11.3.bb
rename to meta/recipes-support/libbsd/libbsd_0.11.5.bb
index 8daea9f762..bb8766a070 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.3.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.5.bb
@@ -29,12 +29,12 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=adf6172075bcc5837e33a8a688eb7e22"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0b31944ca2c1075410a30f0c17379d3b"
 SECTION = "libs"
 
 SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ff95cf8184151dacae4247832f8d4ea8800fa127dbd15033ecfe839f285b42a1"
+SRC_URI[sha256sum] = "1a9c952525635c1bb6770cb22e969b938d8e6a9d7912362b98ee8370599b0efd"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


