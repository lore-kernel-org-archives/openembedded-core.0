Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DACCD4F27
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16003.1695367489627163816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dcl8gC7u;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5335d9045b4so1086560a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367488; x=1695972288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmFdknbNhpCrN2AXWfWeh0BbX7UkLsSWOTKHwXDC7og=;
        b=Dcl8gC7uzwABzpxkNnsTgASSsldyvAOR3v2anElY3u+oMN5VMMwSPqR0jmllECXU3+
         5BWBtYJoW03FJkiNRNWUZo0N9XNxlfq7ztypsTTGnFL5NST2rJwinQU7B/DIPClHfF9I
         lc/27w69gpHbi+koXXnn5CPlRKg/zK+zPskN1KqdQYwURlVE3XHdMrbLtCvNnLYP0dYF
         zAyLVRcwVtsEWd3qgkTDLLv1X2lJ16M5nrJsLQdGSUaVBUTS+Y7brUTe3pXalWz1jM9l
         iXsy5FetM9uRdCcQnMywy5lteuvn9Vo+dEbhr6Zrx8ppDe4Z16pG3yrayFxPUMMeZYYe
         Zocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367488; x=1695972288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmFdknbNhpCrN2AXWfWeh0BbX7UkLsSWOTKHwXDC7og=;
        b=KwRqpixPTBPMlvIl6eG/KWPM9rpj4qc/faiQoVj1Zmp+1cLaaL4wMmoe8Ovr3+JXSa
         hpNLetgDdo5GjDLS5mxb413dz4hbimL5L/0sFzYAy+BqSMJUcmI7Wpetvk5aY4b/7QuX
         0vrh1jrCIyMVeLehi0e9b2slysfIdKlrUAHFDSaNb6ULJR2JRLhY5rYdIpbcrGiZmzLe
         vpC6hfZ1XP4A3MMpDiCJWPkBURDXNhZiDK1zqQp7VKQeDOoQgDcQIwoh9YYt6LhFyeqt
         EvI45Jtm7QbQazLgLgB0amakrPiRUTsMiUQFs98+P5L1wErPsPaoR3BNbbgCS/CuIYBA
         Lu0g==
X-Gm-Message-State: AOJu0YzGd3SpwJMGITjl/2H24C4f9lUqWFTqLOU5CsHpMq1nepJdHPda
	lZvknctOpomMOz2v+Vyc99ZOS0lNjog=
X-Google-Smtp-Source: AGHT+IGZw8R1sR+1yutI1tm5vYOuNkssftZ4O+PMHfOodz9FgYxVRCdPA7kfexIhWwpfCCyjs3vohQ==
X-Received: by 2002:a17:906:1bb1:b0:9ad:ef31:6ef6 with SMTP id r17-20020a1709061bb100b009adef316ef6mr6396391ejg.20.1695367487996;
        Fri, 22 Sep 2023 00:24:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/40] libarchive: upgrade 3.7.1 -> 3.7.2
Date: Fri, 22 Sep 2023 09:24:12 +0200
Message-Id: <20230922072431.1481743-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188064

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libarchive/{libarchive_3.7.1.bb => libarchive_3.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.1.bb => libarchive_3.7.2.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.1.bb b/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.2.bb
index e40c3e7ed0b..a09f607fcf8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "5d24e40819768f74daf846b99837fc53a3a9dcdf3ce1c2003fe0596db850f0f0"
+SRC_URI[sha256sum] = "df404eb7222cf30b4f8f93828677890a2986b66ff8bf39dac32a804e96ddf104"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.30.2


