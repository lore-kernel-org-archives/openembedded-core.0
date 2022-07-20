Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B937CCA488
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.51614.1658306698678729601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=by4tm5lI;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ss3so31738537ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z20M/qp8JBMaqa6Rgw4wJdiNVS+/MA0mk20E2JyceGo=;
        b=by4tm5lIAOK79K4oPY80tJE4uYGuPCyJX7TrIOLxjdkEhcGq3LnjjyPxWq9OTM3Abm
         KPkDegGKwC67zVH7AKP8dY9bF4B0Sa5NxTjw7bNFGtVRQx/79QXrCIALAvPQPN8G2guQ
         DbUENPtvXc400bz4tgnS1XcN6iTX2l5v6DIlrKoB4jVUy4OPc/2aHmkhNZD+0b2NejV4
         5I3/PjXSsdtqj+eTEIUr0fqt+QjH0YW7OnmQZoLiGcw80God4B2SCOpTTYLGmXvqst9F
         bXhUNU59aa0rNmCi60oUubmVvUyoaZ9nt4z/e9zRwiTYrpwkjUqk9a7DRv6RP1ZAdJiz
         RfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z20M/qp8JBMaqa6Rgw4wJdiNVS+/MA0mk20E2JyceGo=;
        b=DZBZNoTH4dBEIqLUdklQM0a5vILDlEbN5acxbIvly2msOwlDkEtTndKRDaVE97oxS7
         tmD4rWgERpuaNzwRDyFr/qZtNVtP1ItvWDusUVTaytrsycsqaJpHTYO7EXZk22hiDqco
         khjjGAnSEOsJ8lv7RrVxGQ1fJPrmx0MdL83dF775q/k7h1/p7GkQLtUmnCh6apYka28t
         Qtxqs89KHAVmK2BtVoDEv/EoXwXAtSDTUgKJ730Hizp2rA/YWo30pIOP+uta8vKkAMm7
         CCpMdI3GhvYTkuJ9TnsaFA3ZuXDJ9TK0oZ2S1kyKd5E7oSNKjrN98D9O0Hg4Gmnx35sw
         EQbw==
X-Gm-Message-State: AJIora+yskjK6NE/5mJp/XUxmsLgxfahBeNTlmBY2C1TE2s7vhx9mqVV
	orqCnXBb7M3VZVvtnxKmge3Q6jdZIaw=
X-Google-Smtp-Source: 
 AGRyM1tCPSlracsGYpxgUXaQWlPv/tH3BOm7MQAzh5BMOiq3G6lISmH0Akt+PON7GDZkUT00IhgLhw==
X-Received: by 2002:a17:907:75f2:b0:72b:564c:465e with SMTP id
 jz18-20020a17090775f200b0072b564c465emr33116406ejc.689.1658306734929;
        Wed, 20 Jul 2022 01:45:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/51] sqlite3: upgrade 3.39.0 -> 3.39.1
Date: Wed, 20 Jul 2022 10:44:37 +0200
Message-Id: <20220720084442.2940187-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168340

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.39.0.bb => sqlite3_3.39.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.39.0.bb => sqlite3_3.39.1.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.39.0.bb b/meta/recipes-support/sqlite/sqlite3_3.39.1.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.39.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.39.1.bb
index a44a752893..39ddbfb908 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.39.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.39.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "e90bcaef6dd5813fcdee4e867f6b65f3c9bfd0aec0f1017f9f3bbce1e4ed09e2"
+SRC_URI[sha256sum] = "87c8e7a7fa0c68ab28e208ba49f3a22a56000dbf53a6f90206e2bc5843931cc4"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2


