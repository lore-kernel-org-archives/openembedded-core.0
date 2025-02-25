Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2194DC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:57:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.19976.1740517011419487078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s3uiLqUU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2211cd4463cso124243295ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517011; x=1741121811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7OtbAan6CU3bGmax9rTVUqj8lUbYed774a7bZEdri0=;
        b=s3uiLqUUXa5mCvouuwVUanK3knFTkTZVypgmoUfnIONHQn5Aasn0HdKYx7dPf2sTC5
         M+VzdRjyhfb3/QN9tzIK2Ylk2aHlIh6GWgfaueLWjkjpxq8RVNEteqB15kum2/hi2Ykk
         D56jRn/2d8kyzfMwUOCpZcSOmSZfMiqbSAlkJ0cShv/dsavMQW5io6SBN2S8OdV9LpPQ
         fe9ke3HWlJMqawRLhS8o78RfqgPODTFjGkEXVA8/X/vkP7IHESjC8Wwqzi3krrtou8hh
         uP0oSIygTpVL6yMlWMpuOBef9LO2mk9CmYwHZCxgxxkfxOc00ddWBtCNyyssIyB5gN7p
         8rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517011; x=1741121811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7OtbAan6CU3bGmax9rTVUqj8lUbYed774a7bZEdri0=;
        b=QzjP3HxCj2UIdyippcjmMY7KcS/SBEj1REUqdLie4J/j/Oi95mMfwtcY2zqyrfy+8U
         9SzLov1NxFsZ+Mzqxu5CiG25bRFowN6jkyv3xG73sLfy3L/Np8MOC9t3BdZynmAuD8yE
         Obky8wUQqkol1YVfnIJgAaB7jCf27B6Um7WLELPiVIHULt0/1tyKK7PZzrEG9T7GgalR
         E3/lmgossFQszwtTPUKgmfEg9Q8ZyH2MRstNkxoW3HJIBmbiRNBOg0o2spXsksd0lNtU
         SrvV1Ia3+dFKA2H+pbxOzSLmrfRoObXlWH9Jyzqw93C3OV9StDgN+haZ3DLEygh7+Td8
         sRfw==
X-Gm-Message-State: AOJu0Yy5XDWXMWAcCkYp87b26jvKLGvsutgerp5sogExfMwJyHb9qAPp
	jGUWh8fotk/2khBbNUUfGkHSHNC5NYH0S8gn09izfQXN87KV/24tcVqpOlcRYYS1VdZ7vzq0vwn
	1
X-Gm-Gg: ASbGnctiDAw4Ii+cn7zHRQvLejzwp819B1y3xHwcEqWEVJlaub9OKBLgz6gukIKyCGE
	6IMQstYsV6AXUzx0GOi+fmtkn+LLUu4NRdycGA/DWLtdcY91zxOuO1pLSlHCLZMLooP4Fd8gxOU
	pxAs4HgTLFqlnw5kdW6L0brE2isF7M1sQ0+ElV6SFBHHKP+tmmOeNvdoIDByA9p8Q3NT9Zs833X
	l5V6S9vXeH9pTtWrSgLIRU9n4jGXZel6izKdjPYU2hCx4w+sBERlpLdm0gzCDltdGJa4Fhp7m6A
	k5RktQxTAnJhdtYe/Q==
X-Google-Smtp-Source: AGHT+IGuH+V66M0eHnuceG1xf5Mi+Q3B6Db6XHtpIqqXswWESw8DJ/OAbZmHyriUzfHHn0dHCeOWzg==
X-Received: by 2002:a17:902:d48c:b0:216:7ee9:220b with SMTP id d9443c01a7336-22307b4cc17mr62019645ad.22.1740517010678;
        Tue, 25 Feb 2025 12:56:50 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] libxml2: upgrade 2.12.9 -> 2.12.10
Date: Tue, 25 Feb 2025 12:56:31 -0800
Message-ID: <4540dd4bb71e00b7f8c1a3f5a9e10d482e0b2abd.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211932

From: Peter Marko <peter.marko@siemens.com>

https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.10

Security
* [CVE-2025-24928] Fix stack-buffer-overflow in xmlSnprintfElements
* [CVE-2024-56171] Fix use-after-free after xmlSchemaItemListAdd
* pattern: Fix compilation of explicit child axis
Regressions
* parser: Fix detection of duplicate attributes
Bug fixes
* xpath: Fix parsing of non-ASCII names
Portability
* python: Declare init func with PyMODINIT_FUNC
* tests: Fix sanitizer version check on old Apple clang
Build
* autotools: Set AC_CONFIG_AUX_DIR
* cmake: Always build Python module as shared library
* cmake: Fix compatibility in package version file

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.12.9.bb => libxml2_2.12.10.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.9.bb => libxml2_2.12.10.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.9.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.9.bb
rename to meta/recipes-core/libxml/libxml2_2.12.10.bb
index 7777c9f181..c4f76c281d 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590"
+SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.43.0


