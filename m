Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358ABD5AE58
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2873.1765620027596428392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f1Rvl2hT;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0a33d0585so871495ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620027; x=1766224827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKMz+51R3I1Gp/2P9enw1vCpqu1CSnanMxP9rtUYby8=;
        b=f1Rvl2hTfBjk7TK8dD5Y9S4t7wi8nVgEZpE6gLqXQNeN93wuWADhhjfI3XsD1Mm1Kd
         6Ag74dAHeyLFXjt7ygGOlXg3IieVVRSChgaKlJdIA1V8ldrosVxDp6QJkt9fl5roR8/4
         hf5SFoaeC0VnKQZXxDryljECcFiD1NMuzkmwTJYI/zcYrQ0RcKZYbtqaUXB9W4G8wtoH
         /cEp+ElAJOMoezONMe9TteThcPXCunhd/rMWOerMEWbVQDEuAcMnb3wQg2x+sglMVP7n
         tyzeUnZ7CNEH/rm4Hh3g5MZRuwsei5ljhkGOFHJPElv/D1pqy35ibBkd33QjaBoQGlHb
         YqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620027; x=1766224827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKMz+51R3I1Gp/2P9enw1vCpqu1CSnanMxP9rtUYby8=;
        b=amfge0LCfQTOlZrn299cnMAODpjREkApfWHEcIgQeQqgbcXDTedfIS04GKnbSjBLOl
         Ob+kKm6FIs7jgpwslcyoEsYfKbZCeKUurtdI0CLTUTGzQV5wvvKvGhDLueWHaS+H0BE2
         4QkHrQfS6VE7VHQ6HC7No/4t4Uq8yKCrjx6vukIzJ2HuRRPVIf4GRfNzB1YoQKiWwie2
         czb9PO52ZeLKyxV4PcIUPPZ1p8hOV12WvA1NIBmWLDCr16PQfE4a9Nby8+3J8ODxMpS6
         B2BRykGu8MVUvQyAVd5nWH79j8jF9HEZureK9mOa2+57YaayzuuqY1qYiXLK4nNAisgE
         VyoQ==
X-Gm-Message-State: AOJu0YyOmzUqWO01EaEBHBJZtSrdLEOx92DJmVYKLD33eph1jffcq/rZ
	Y2dvUi4xMbGckGYHpbwOhiC/WJf74ZlInAE+OzNpYvPQDCgXMEUrYSIuw3AIJHCF
X-Gm-Gg: AY/fxX4vzbqUmbTbCxmWKJj4c/Xly+zgrt3pXvwqkR7ruw8p+PkDYLlFrtuCFc0xL3S
	ZKkAz/07jbQbKkOPNV01KilDsjoBOLQlraETOGQ5UYODkUT1D6RMU70Pxip/32voFNW+RcEeBcq
	tEuOPAqqhV7SP+CbJZj+4nhTPLKB7pOg3UkC62acjO5VI+GLMC49Ovd/M2ktpwIw1JM52OH1QW6
	fs4wjzJ35QJoP4Ihbkc3S7/wNwSuQntrfZ3gsTninRL8bon4PKjzNiTFtsIOEMyzp9ACZLBjjE0
	vmNdXNLAeEUMT5mQeEJ0rzCZGAbm6yTL5Bg11W+KmU7UJq+1BQsDpOrM5L9J57RwP3gn2dgqQ5O
	kvkom9Lbjj2A1510sPAe8cZHcw+mPMn6HdTbZ5nkTXLovHfNGEORXyE+uEoSnLr46fdWbQC1+8L
	A+55rn6TSLoDcY52YG12Tjq3nz
X-Google-Smtp-Source: AGHT+IEVFnpEo/76++mu6DUL+enXWvk3bj+CSnt3643W48DU8CWkZL4DxUrDFUZn88/gagIbeGtbCw==
X-Received: by 2002:a17:902:e74b:b0:297:c4b0:8d58 with SMTP id d9443c01a7336-29f2435a097mr47390945ad.46.1765620026820;
        Sat, 13 Dec 2025 02:00:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][whinlatter][PATCH 18/67] resolvconf: upgrade 1.93 -> 1.94
Date: Sat, 13 Dec 2025 15:28:42 +0530
Message-ID: <20251213095931.2571498-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227636

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 69325b9fb2975bfccb31794e9b18497a98f4e5ee)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../resolvconf/{resolvconf_1.93.bb => resolvconf_1.94.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.93.bb => resolvconf_1.94.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
index c10c57267a..b2c85f9593 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
+SRCREV = "505c258d1efb287ffdbf132531a86437d2bf0513"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

