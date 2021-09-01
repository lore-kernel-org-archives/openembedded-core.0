Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.8122.1630503927951435388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Inmo9sZE;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso3516969otv.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSIyLee/KgPCMKaNlngMUKfy0+hzxoXjHUgL/rH0+Is=;
        b=Inmo9sZE/2I4NQmmCEGv6AW01lZYFxy/pCz03eQNRUTWAfdiqSn6ccCbMWRe/LnEWc
         7TTkgaI+JnfNxCVhWlAymDZN5OfJaj3F0xVWZVXtTcayn891vVNk2rPJXrvTHIT8Cw5L
         osSJVdMREKyjnktdTwMcNWuglccJjnHGjvIlUsLtW/b41OSaBcbkm2d5jlF2rPpo94Ne
         Tatelmzlhc6zP0x1Tve+6RFiFd1hYDzGnwPn7E+keLPuZhwJ4IO2sioq5aM/lotWpCtg
         ZEhpr4UMhkrJVGreD8aVsfix4S7FeotYags7tcIYzrYqNogU7y13RuZqJDnA5pkz0Oxa
         N4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSIyLee/KgPCMKaNlngMUKfy0+hzxoXjHUgL/rH0+Is=;
        b=acvpYnQ2VRgfeaHV5kBf1XAuc7rVCHbGwjv0YK0bhOf6M58JZt7oFePPZDEpKDTfYI
         AJfZ8C+BZcqGkG1yrPat2p6ae4IEdbuoooXH7Ot1mC9YsNHoqkkdEI91OI6DkvehpLCS
         L1I9O+7vki2cw1D7eXF4D3NltHwDmOlOsVwCyaSIKRISm3qXUF/08RdAWvG+PniOotvJ
         YtCTzTGPkp0tgsVSq0tGZzvwJ3N9ik/tKqw57/IX8YdC+9URZIDY/QIw1NcU5YHZ2GBF
         FxkEo0pcuS6QmRwrcVO+Dfttz3kzgH9fIlnWO2uZmiGOJ3VRLHTn24NwI68puk0aBA2c
         OedQ==
X-Gm-Message-State: AOAM533xjopfKLL1yUWvsN7I90iP1VVXwX7pK0LBRcI07Z+UnPIe6nF/
	uYDkUg72FvEVsR4VrCTsjoyUhHPDSpo=
X-Google-Smtp-Source: ABdhPJwM8ZKVinzD/0KRXPigSfWZymHDMvK5tryizN2XgPTXkCusduEk7H56Kpr4qeraZ5W7F6UhFg==
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr29195374otk.157.1630503926826;
        Wed, 01 Sep 2021 06:45:26 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:26 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 09/31] classes/create-spdx: extend DocumentRef to include name
Date: Wed,  1 Sep 2021 08:44:48 -0500
Message-Id: <20210901134510.29561-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Saul Wold <saul.wold@windriver.com>

This will create a more uniq DocumentRef, which will allow
the individual spdx files to be merged into a single SBOM
file reflecting the image. Do the same with the runtime dependencies
also

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index aa3e977b02..72c1385feb 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -427,7 +427,7 @@ python do_create_spdx() {
         package_doc.creationInfo.creators.append("Person: N/A ()")
 
         recipe_ref = oe.spdx.SPDXExternalDocumentRef()
-        recipe_ref.externalDocumentId = "DocumentRef-recipe"
+        recipe_ref.externalDocumentId = "DocumentRef-recipe-" + recipe.name
         recipe_ref.spdxDocument = doc.documentNamespace
         recipe_ref.checksum.algorithm = "SHA1"
         recipe_ref.checksum.checksumValue = doc_sha1
@@ -566,7 +566,7 @@ python do_create_runtime_spdx() {
         runtime_doc.creationInfo.creators.append("Person: N/A ()")
 
         package_ref = oe.spdx.SPDXExternalDocumentRef()
-        package_ref.externalDocumentId = "DocumentRef-package"
+        package_ref.externalDocumentId = "DocumentRef-package-" + package
         package_ref.spdxDocument = package_doc.documentNamespace
         package_ref.checksum.algorithm = "SHA1"
         package_ref.checksum.checksumValue = package_doc_sha1
-- 
2.32.0

