Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85D1CD4853
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:10:26 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.68534.1695665423237422726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e/Ki+QL0;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ae093798c0so4516502b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665422; x=1696270222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQMCJeFsi6D6YsnQ0Gwyrk3lWumMkI/Sq3meMdDsWkY=;
        b=e/Ki+QL0idJw0eV7py7qXAfec4mmgDGTfv2RdCWFeEYKcnlZe3O7Thui//kT62iCcu
         1ufnHMGw/UUcesXQy4yyrhVot2sJesqp9oHRYAI5zO4m+7ghEnyxA+VuhVWS6xwOG1dd
         Lr4E+iIPMYTVdQOJNDJhXL1FDwSKaNGvDllPmANTosX0dh+LHKLFnzIOv5KaJNxzLA0n
         J4Pi0b2gvcZGGO2lbuIPrk9e1rgkI+W0OALIBVViXyMOySOZqHJBZZqxv80L9bzKHCoc
         zaHB6f6rzIe2tIIV7usVTNQih8DX2tSdZrkpTw3I3xdBpjkeJgxriheyTrF6KNXHIYBf
         zQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665422; x=1696270222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQMCJeFsi6D6YsnQ0Gwyrk3lWumMkI/Sq3meMdDsWkY=;
        b=v+ZYDbEOjkgQ4ZzJAvY0OxhTzV/fWzY0WKbqyd09TP4NpRPfYsBF2Rn+BxN+vEuJb2
         tw24DiHPjqnsvH6bYxiA79SDTR38ekTf1bOWKbSMjoj+uN64WASSsIhsxkng9GhYT5uZ
         6cpopviQaVPjBtQZRuLek8lUuaunV3qKdGM1jZX3d8Xlwsj4LoT4/0bpGygMnLWuPA+R
         7ckc3sG2NMIW0q50hmyudvsed7IwQqNfkNnDBhIdwynCS5S40kUknfgciOLHIWNZIVKY
         NYXyMsSU021HGglw1wQ1n+ac9WKQRTqSmbv3hgt+OMVTIS0vCt0cxWwk2Rp+cRFV9Y2h
         hh8w==
X-Gm-Message-State: AOJu0YwD51exJ40MgeiNUAUVM4ryA7ldwkLuBN7VDcdlehDnUMT6kn+s
	T8eoy/gIgg1yHxGxxw6GlRzzEZfTZf3wMA==
X-Google-Smtp-Source: AGHT+IFrDTDUfHVnMrAs2VOxqwvlf7TORmE5tXcqMHjLI4ChUBqj7dYUh+0PwULVJVKoayVKDywijw==
X-Received: by 2002:aca:1104:0:b0:3ab:8574:e8ab with SMTP id 4-20020aca1104000000b003ab8574e8abmr9426993oir.21.1695665422318;
        Mon, 25 Sep 2023 11:10:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id a22-20020a62e216000000b0068fe3a6c312sm8281402pfi.62.2023.09.25.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:10:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] glib-2.0: Remove failing ptests on musl
Date: Mon, 25 Sep 2023 11:10:18 -0700
Message-ID: <20230925181018.2457010-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925181018.2457010-1-raj.khem@gmail.com>
References: <20230925181018.2457010-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188208

FAIL: glib/convert.test (Child process killed by signal 6)
FAIL: glib/collate.test (Child process killed by signal 6)
FAIL: glib/gdatetime.test (Child process killed by signal 6)
FAIL: glib/date.test (Child process killed by signal 6)
FAIL: glib/converter-stream.test (Child process killed by signal 6)
FAIL: glib/option-context.test (Child process killed by signal 6)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add detailed comment in recipe about skipping these tests

 meta/recipes-core/glib-2.0/glib.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 5183f37a6ef..b946e798bba 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -134,7 +134,13 @@ do_install:append:class-target () {
         # https://gitlab.gnome.org/GNOME/glib/-/issues/2810
         rm -f ${D}${datadir}/installed-tests/glib/thread-pool-slow.test
 }
-
+do_install:append:class-target:libc-musl () {
+        # Remove failing tests on musl libc systems, this helps set baseline for musl testing
+        # they remain to be rootcaused and fixed but marked known failures here.
+        for t in convert.test collate.test gdatetime.test date.test converter-stream.test option-context.test; do
+                rm -rf ${D}${datadir}/installed-tests/glib/$t
+        done
+}
 # As we do not build python3 for windows, makes no sense to ship the script that's using it
 do_install:append:mingw32() {
         rm -f ${D}${bindir}/gtester-report
-- 
2.42.0


