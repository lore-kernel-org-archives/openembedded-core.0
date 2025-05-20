Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD02C54E92
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.422.1747770513635915158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cL0MzGY+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so3496425b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770513; x=1748375313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP+h2BWmfK6m/ll9LiPhX5ICf844dpvFcTNoOtVU4lo=;
        b=cL0MzGY+4sBCnBIzBjZ4xlYtxMqU2hYTyQI05rj20CnkGwRHLeWFHx7pz4XNb80LhD
         zFcKZYzH5ZD8OBLz6AYkdImai9a8aOAgUktN/Q8njlePcN+MC1xQq96HcclOPuiZHnTo
         ZAgKov7bMHPXmZNg7GrPJNMccP2KI/sa27yOJKP9pnoHtwEhWabKp3YjSHHI9AD3G8CC
         6cQ28mFIlVrU2erd3SW9vQf3FYAaWztu/rgc0beVANJYyYSQa2uUNTc74e86nIA42MBa
         N19NfEjT2n2L8BfYiO9GPikNnXtGYLE7YhrqiAy4KGQTN2OgxFKLrOtorli76YeDqThB
         gBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770513; x=1748375313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP+h2BWmfK6m/ll9LiPhX5ICf844dpvFcTNoOtVU4lo=;
        b=Er4gMfN/yt/cY+AlydU+3axU2uBR0pHGuzKMPbcc8lTY3OllzWaj+zePSL8cmPFR9Y
         46/8bdoyqf2TGtma5mhdq9sNW0cMePivOHRKrbUdIODjcdnx6+xslw8g2lP6cr82NQyv
         5QNWtc9ZwRIWcGjXOJMDAt3/Jwo4bIUbs/ve2TS4mkkn1KH/Bp6lLTwvrTtyhsmVQDYd
         iby3KeOMJjZqJuhuBdXukRmf0lDQBUDJj1pB115Ch9wczxY65NQTV8CCVvGdJ1OwZF3e
         c9BxvSAZoGoe10eyStnVu9rXk+U1/2GLrb1N6lYPk6X4hF0JgzHPHVdVWRj0ExgkDqmi
         Qv5Q==
X-Gm-Message-State: AOJu0YxAe7i2HC57+vuKQj89AjBgRSyfRMD+rVe+5eqhRoflVHB4tn5R
	x6oA3KyOZUQCWLn2463vvQU8NG0k8G8c+/1zKrp1eO+MssH/O+6/TLpWPh4djAggzs6qXtT0Kth
	wKNsJ
X-Gm-Gg: ASbGncsa2m73SARMsJV068HxE+uUbV5Y5DUXjrVHwlxew9OHK02JkqMYyWHLgyR+h6I
	CNfd6cU9Z70MtBUYWu0PFoEq7ykk/1pwmXVduRtljcbgEl5C4QIn5eVs6CR3Zm5P3unpfstil89
	pq4CBQPl9P3nuTyiFCWx24d7+oUOhY+dSA/qNEyOQJY+agdrAdUICWcF/iKWxz+63wFnhljmXv0
	hW0QZH9nBgg4hnjzlmXyzNa5A/8xwIvtZdsi7T+UJYrVcZN4fCCZhS7x2tSMf5c9Y81zdmgAeYN
	XTOfpvIr2igLzBEh11yGWyia9wZt+82WdUEigAzC3Q==
X-Google-Smtp-Source: AGHT+IGUE6560rjvBoyu9sYybCDMfeBVqhrrYkrnp7hlmUZSupKfgpZo/AzKKsgPOTo1h/xzjI8omQ==
X-Received: by 2002:a17:90b:2c8c:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-30e7d555a3bmr26372099a91.15.1747770512849;
        Tue, 20 May 2025 12:48:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 6/8] libxml2: upgrade 2.13.6 -> 2.13.8
Date: Tue, 20 May 2025 12:48:13 -0700
Message-ID: <0b5f433c99f9528947a49349180386e76acfe457.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216939

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-32414 and CVE-2025-32415.

Changelog:
===========
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.7
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.8

Regressions

* tree: Fix xmlTextMerge with NULL args
* io: Fix compressed flag for uncompressed stdin
* parser: Fix parsing of DTD content

Security

* [CVE-2025-32415] schemas: Fix heap buffer overflow inxmlSchemaIDCFillNodeTables
* [CVE-2025-32414] python: Read at most len/4 characters. (Maks Verver)

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b24113405ab0bbb3200bb47fa8ed6abeaa7481b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.13.6.bb => libxml2_2.13.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.6.bb => libxml2_2.13.8.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.13.6.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.6.bb
rename to meta/recipes-core/libxml/libxml2_2.13.8.bb
index 3b3ca87e96..e82e0e8ec3 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
+SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.43.0


