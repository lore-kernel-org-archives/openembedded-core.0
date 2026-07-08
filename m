Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BD5C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 07:55:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3533.1783497295180344907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 00:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XB/VqWDG;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so2196355e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783497293; x=1784102093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/dfuXcDgTxSQsjhyBHQNe5lcPS3B2SYBLGtfZK8Qx8=;
        b=XB/VqWDGOMQ3xbfLwq5CZABPY5WNxEkc1xmB0dIxEAJJ9OIJPSUjmQNMd2bFzxiBzP
         //JRKhfT3bxZAGWWAUDv0Bb1Cm4r3NBOW8LnT3hjDyViiFDNoHrW6yDptpYnQgx7hY9w
         W/jASSfYVNp4ET3ifqBcmtBwNEHmYCQcNv9hlFiEvUGIGwWxWFePfnQF853eWP8Zv8EC
         gCKFmCvWhIJMiuYMD6IBSuiXyAV8UnP2cYGdfhLwiPvNbzTbQ3pPYKaaBmeqh8P6unvt
         kOvrM+HXp0S0JvmMTBTr2rI7/m9+MStac0xF76LzkZDaBowrr5BXz63pCV+yyIFZNP3e
         77zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497293; x=1784102093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/dfuXcDgTxSQsjhyBHQNe5lcPS3B2SYBLGtfZK8Qx8=;
        b=NYGoDV+0jW3rQSDTaopa49Mug7JdooptXnh/MXHf0SbdQqwcxVISozrLs8uKO7Lzo4
         2JPqKo8hWVtNXIRvhsbmDDLmd0WVGbE0lcww+etE0ALmOI3ohLucjsVcCOYaD3Lsp9bS
         ZvNAQG2EsPF38O2kuFVrIrJk3kOC701dl7xr1XDPTrqiQs8gTk6YnVusSGh16LpUwHkm
         xEZ4WUQP2CasmOfvGViPOZAHFs5oyjkoJkdQ0j6aWpRKUBJmIILeho9uXWMKKgZj8nHO
         kPTEOxOVp2s7eBWo+ZTekdlI9y0HExNAwouXexj5AOK9HgwRWlvUM0RfGJSRl213PsfF
         qj8Q==
X-Gm-Message-State: AOJu0YyVRWfrpDtpJJFr4hjBdi9CCJtfOcz6bSlV9TI2DP9a5EW2bJFF
	0Ld/NsYqauQG1igfzRsvNnxXKoPYwdTlyzF33jKAsL+juxHcpgVKq12w4pHwJA==
X-Gm-Gg: AfdE7cnWjn/3RYapmGLbjkWzVCbEULE5ZGTwFbFQEng1ZWiKGUezLnNoaZOvJOG4l7P
	zIjP92huwyBvKGIB1LEDiQsVZGMZBkAJPzW8Q1sPh23LQaEWfiEklfjJhYxAypIh/laFGYJ0iKr
	JZY0JKd3rj2lNiC2NTVzqQU0Se8439OXjDKL7s5SzIdojZUCdqRVwjdJSm1I0UrCzR5v2gvgmIg
	XY3pQYfucXmNd7CXOQAPuEBsaX5ntQsezQMk69nS1g4K9UoImwUANkjK9MQStEoRTef19lwU+3I
	KGlRpt4VckAMZ2NTPtZqkDQDmy20MiR/+ozXj4Xmf3UN++p7d6Gry5QgtdKXb7PkgyMDGQ/319M
	3NIkezj+NUpKQsLNZvHuwVLwfkC2GEksrT22QN3NaBphfSJ6h1CY8NyngpAwtEV+vgmRfcMsuo9
	3Ou1GJ8DR3Wfz0SmoWM0p5aXGOAukKR/54HujI7YS6uZKBJuXgkBpyDN5DdT+6WwvpsX7I8xfG
X-Received: by 2002:a05:600c:c48f:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-493e63a57a0mr13899935e9.18.1783497293207;
        Wed, 08 Jul 2026 00:54:53 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fccf2dsm126374685e9.15.2026.07.08.00.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:54:52 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] scdoc: Upgrade 1.11.4 -> 1.11.5
Date: Wed,  8 Jul 2026 08:54:43 +0100
Message-ID: <20260708075442.1425232-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240442

Changes from 1.11.4:

  Runxi Yu (1):
      Substitute "-" with "\-"

  Sotiris Papatheodorou (1):
      Fix bold text followed by underlined text

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../scdoc/{scdoc_1.11.4.bb => scdoc_1.11.5.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/scdoc/{scdoc_1.11.4.bb => scdoc_1.11.5.bb} (88%)

diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.4.bb b/meta/recipes-extended/scdoc/scdoc_1.11.5.bb
similarity index 88%
rename from meta/recipes-extended/scdoc/scdoc_1.11.4.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.5.bb
index 059150df4687..05dfafb37b92 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.5.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 
 DEPENDS = "scdoc-native"
 
-SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
-SRCREV = "70de0e5e5d3bc40134ee65c35f1631656199f4be"
+SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master;tag=${PV}"
+SRCREV = "24be30ef17d5ca0162f11b35258c8fa2413d556a"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install

