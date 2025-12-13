Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503FBD5AE5B
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2980.1765620041538731405
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGqyD9tr;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29d7b019e0eso29283655ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620041; x=1766224841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3skgfdAlrhCraKUftRX+8Wv5wuMVtGluanSOu6+oufk=;
        b=LGqyD9tr+SfNk6eGNQL+vpBcsjWsCABi3+n9a0Yq1ASqndz/QwV1A9bCYlcE1rFl21
         aWsR4SAtarmMeERYbrq5nVotINk6Sq8HIpcUqMXYaxaBKmdGIkzXGz5ip+0KGeKBvXNz
         HFCI98av1750m48Zagxw4GUczYFudeDYWirGZ+qZlS9Wvv3sLtkPnTPpC7CcPasyRdcW
         dbvR/IAcAWnHK5q23ZVd/W14M2TEI0QGe9EKsDINs1F31xSBbwufTfLRi133Gz5pCouO
         EN/ETDFmtGdpgNZ8ukn4BWeqErH5PxmbD4GCRiBWhJFxJtLzhXd38FHWyKc4Ch6BbgG4
         l30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620041; x=1766224841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3skgfdAlrhCraKUftRX+8Wv5wuMVtGluanSOu6+oufk=;
        b=dj1/nZpsjNWc/NkLKCA/pcGGSzaxNi/3vBqGkGSk50xPUv2aS1kkRAakKGTFe5R+Xa
         rEyENtuspe0wWi+qMbkHDjVv8sb/fX9+sU0O3N1R6cUjMOs6dwQVMJW9x+2Wir4KXUlS
         Dh+bQSOgkVjH25YfDhkyajcLKD/LUC4uXfqtXJGNdOixFtRiFJ92zOqa3Vn7YGx+A+Rt
         o1qktl9puRUySDsrZv+95YSS/Iqie2Q5ODKbRwDnrIcgE3xTXKK8oT+o1kr+b35iYRSi
         n6S568Y/hplIzqptXq4qg2iY5tFmgwMQhmc418CWafVpiU0fLj+zgatdcY5A28QSLjVB
         P3fA==
X-Gm-Message-State: AOJu0YxNDXB4erG3OrcSqR+crVh9q/ejwTqd2/Mp2nwXmEjRXygSW0c4
	wfnoD4zC6hM03whtdMIbUXxiFSIUkc/cHQfTWX8g48TKioDF5BKCZseew1vTk6q8
X-Gm-Gg: AY/fxX5caVcsmvnrV6GYDRNqXZvB1m44OGOtfXWMK+YeHlvkmttG3koA9pmC73fYEs5
	bOBeymTDjkktsmUnzbWJUP9jtsdNv/CkaFMJ005IVtBuVmq2xf/anT5dYIid2PqeRF8Y8eHeaUY
	jI7mVRfreZcKBngbd9GgkjEGOj5j7ZAilAKRfIlsQi8FO+mosZxWReREEeKaI40II8QZTwaGWwv
	oJsOIQmLQ4h4gUZLtQHKYy+Vf18V4uroc/dOHxucum/8b7KAubWq0pAQ9+PF8n/Cv2cSnOoVBNG
	h+JLS4oxL0w3OJvkeOYVyxF3lwU5X5/CzZezY2rdqn4PGba5ewg46KZwrTM2JstEBiglIPkPrpx
	qT50Tcjs0DOIycm2PaagL9/T6Ai9QdxOqP8CK6Y8ytX8xBfFUPruMrpn9LPmmjmasFKlyTfLfcy
	rj32wk5M2ZWxCKeTu5qy1KR6fh
X-Google-Smtp-Source: AGHT+IG1SgyaRUBbiESSD4dj4qsatbBd2Yskn8UlD7m8DJCCwKQMJTGyOkAU/TQ5XiKWMaWZvrXR2Q==
X-Received: by 2002:a17:903:249:b0:297:e3f5:4a20 with SMTP id d9443c01a7336-29f23b77162mr48336135ad.26.1765620040782;
        Sat, 13 Dec 2025 02:00:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 23/67] dos2unix: upgrade 7.5.2 -> 7.5.3
Date: Sat, 13 Dec 2025 15:28:47 +0530
Message-ID: <20251213095931.2571498-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227641

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 9c1533a312bb6c5300b600df08852f467ad56a0e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.2.bb => dos2unix_7.5.3.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
index c3803f457b..ae69110c39 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=49ec74e0139712398b9ddb06d824929a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0802ff257bfeb9bb07ae4e4de04e3223"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "c16a0b31a64c7eb6b2d76960e5144732b57f2993"
+SRCREV = "9df44447947a7b311c62ea0383be94080edcaf85"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 

