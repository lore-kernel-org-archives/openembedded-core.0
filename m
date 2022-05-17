Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542F4C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:17 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.1181.1652811913558112204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7TlcKGna;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y199so944185pfb.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Jj2J5sv53e6Obuh4d3kFXLiOgMfc3mW0zmdRJSOBOi4=;
        b=7TlcKGnaxFGSwh2CGJfWVrrylfwWmRauj29wkgMr3pJMXTX0MXCaAQRuTyUnNXBctV
         V2CH6XLBRUqGL+2Z3b5WuQQ3w23G9n82BXICkzgZEtmTHKUOOzHQusJK+aBqMN/viXmk
         a3xCljAPMPlOYPDGXBs9NiND61nljGsk+3P/3QiQxYeVMSlKgA6c+rAGkaqadJZmxzpW
         3+zWd6MpYs/U0oM+32BDLoqAEcKTDaAkLIFJHrhnNjLZTMVwfqcD1sTkifq86hfFGXG+
         7oS/OWz6TNqjemujaSzL5awDFCr//IMH8q2Dk/fYVcgXhwgndeBtjrsYwyFsBI1vITAk
         KAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jj2J5sv53e6Obuh4d3kFXLiOgMfc3mW0zmdRJSOBOi4=;
        b=Dz0uX/Wrt/MKMJcWTaS5JosjiyzQcfF7ByzqjiGRgTuJ+xatJhr2fO/3EgWrSDVt8H
         7p+99yppBJvfAPijU/eI69ukM3zSQsQ4U+Re3o8IHZF7jxBOu4itF5ewWG/mQDWOjtFY
         pxrwEoQlgGZwp1zbCTiztPVThmEwtG0YTP8YLCcmUCtbEiAiSe2nyD3oYe9XprnHTrDY
         jUPwiLpYg3WkIV48h2I2eROkq0WxZGTcw1P+3oDovrhlsnCtiwPMBL04rP9TQQsmYdhx
         lzf+VIP4D24xwGT05sdKVOTfME7kcZ+F+iZiQGlFLMAqkeotTQHq/GkQXgdknWo9SuCa
         zNeA==
X-Gm-Message-State: AOAM531SlO+X72xsYbvy2TJrkiivjkRjeks3hHJcAUQRvqTWMXgWykA0
	o4J1QtQCzFa7ZYkyW+W2I7U8+0ZZYDs3DXQ0
X-Google-Smtp-Source: 
 ABdhPJyVgpTGbZQL1FStmTWv6Vppzt62oSz2AL8VXtsby0f0Qz2oidL3NXNiAk4bOSgivmgblZun+g==
X-Received: by 2002:a63:5304:0:b0:3db:2e57:6f34 with SMTP id
 h4-20020a635304000000b003db2e576f34mr20473997pgb.88.1652811911831;
        Tue, 17 May 2022 11:25:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/31] sqlite3: upgrade 3.38.2 -> 3.38.3
Date: Tue, 17 May 2022 08:24:01 -1000
Message-Id: 
 <c78ac7ef2d14a8b6167922a12e8c7f35c4b11bfb.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165760

From: Alexander Kanavin <alex.kanavin@gmail.com>

2022-04-27 - Version 3.38.3
Version 3.38.3 fixes a bug in the automatic-index and Bloom filter construction
logic that might cause SQLite to be overly aggressive in the use of ON clause
constraints, resulting in a incorret automatic-index or Bloom filter that excludes
some valid rows from output. The bug was introduced in version 3.38.0.
Other minor changes were tossed in to complete the patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1efd89a4572bb2f39728fd53a1d4db944b06ff38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/{sqlite3_3.38.2.bb => sqlite3_3.38.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.2.bb => sqlite3_3.38.3.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.2.bb b/meta/recipes-support/sqlite/sqlite3_3.38.3.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.3.bb
index a37aff6fe7..286987b708 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.3.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "e7974aa1430bad690a5e9f79a6ee5c8492ada8269dc675875ad0fb747d7cada4"
+SRC_URI[sha256sum] = "61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


