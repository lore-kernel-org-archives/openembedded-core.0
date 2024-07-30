Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB1DC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 11:19:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.15314.1722338330368533382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 04:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aIFLz5RB;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd70ba6a15so29166575ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722338329; x=1722943129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPTMZOvMY8HO2Q+dpzkQiXzT9dCk00cle5963sxxY6Y=;
        b=aIFLz5RBpigan3/uoP7HNsKRjKlmO0nUOvZo9lM2scnXjtybyJ5qwB9xuVS/On+vGi
         KsMpGPjEnYNOPtdcUa4uReHT4NILZWNEu9JtaHDk0W1t/hG0hTVGQipPI3j83998H3oB
         NjPpg4Qx4s1lk9z2BQYycmDtxtt2N2K2tmog4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722338329; x=1722943129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPTMZOvMY8HO2Q+dpzkQiXzT9dCk00cle5963sxxY6Y=;
        b=b5ZcfONIm9lbccMiF5HnnxF27WG/irm5A2+N7Z9MZ85bNd9bafbAbHMT/1KaV3WH/9
         1jLMdKEBNSAJncKT37iyuuoyiEHTxVeCY55SYmNtEaToIR/+eEU5IRViDIQoidDQagN8
         YKCjhJCxYGauVc4zsgniqBhKAHI6bkKb28W206lxxyShNc3ScJBf3o3ZeMAxCuEmDY8m
         +VXgg6hpcOts0ZOveaabPYsrNchlV5n6aLdtdpqzVk33oFl8UMOWHlMHxV6dsMQAlawh
         9DqaoDSWAlCR2eNBsEDQPczjgdqF+OWM0F/5YaE6jieAppZvA0b7GLRSKQWKWa6Bui8m
         p5Lw==
X-Gm-Message-State: AOJu0YzXt6uEMmeg7KXe08YoKoc/ed87fybg44rw4mTXhiVJtnJar78n
	XGa90eYugZEsVTR2seykj53lvbV1QJyQqySUNuwxgNYEIqerZWRdeUOVW3PO4Q12kln3+MZg1Qu
	S
X-Google-Smtp-Source: AGHT+IE138+GyaF3moynQ7oVOKWJfi6s4Cnc3xYu+aVkN7pRIddvqHXJT+x+qzE73EJn9Sc1TRVrOQ==
X-Received: by 2002:a17:902:f54f:b0:1fb:8797:beff with SMTP id d9443c01a7336-1ff0484da96mr85443405ad.36.1722338329263;
        Tue, 30 Jul 2024 04:18:49 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.82.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1cdcasm99213645ad.198.2024.07.30.04.18.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 04:18:48 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 30 Jul 2024 16:46:33 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH V2] bind: Upgrade 9.18.24 -> 9.18.28
Date: Tue, 30 Jul 2024 16:46:31 +0530
Message-Id: <20240730111631.19777-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 11:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202673

Includes security fixes for:
			CVE-2024-1975
			CVE-2024-1737
			CVE-2024-0760
			CVE-2024-4076

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/CHANGES

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../bind/{bind_9.18.24.bb => bind_9.18.28.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.28.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.24.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.24.bb
rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
index fbbebe89ad..67628a8650 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.35.7


