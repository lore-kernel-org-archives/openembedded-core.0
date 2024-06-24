Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F782C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:20 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.150928.1719257535030392457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=livHHX9z;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d23a0a32afso2354389b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257534; x=1719862334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3rFm5LzyeYIMSAZ2s+xbcgesuUxyJtIKwVd8qwSc+0=;
        b=livHHX9zRPJqxtQoxB3WIF9cAS9Zg/LzG1wHE1d7Wm+8OBCNgS4njS0lj6PLNzZagc
         G3qLYb8XIcBDOgUx+XB0qdyJeO3x4ago0/4y1pKD53+shxnWduRUZy76LhgHHKnH8wlQ
         FSh8TFnO1qe9FY7LuOgo/isVD3o9c9htdTy811EUaWl/lQFLgquHz0JL3H2+zIGXewHk
         pa6aT8TekIYKFljfzvP9Fk/iR+2CvUx4Mi/bagUsPnuyDHwEJ86eupbQdf6nLdVqAsq2
         +yPeFvzVOLh6NFKyRRjiPBS7B8sit90zKS3eBVVbRmatHoMX4wp6Wn6hVxPwZxcB6bdh
         FqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257534; x=1719862334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3rFm5LzyeYIMSAZ2s+xbcgesuUxyJtIKwVd8qwSc+0=;
        b=QEViEf03iE5Wq98mNn7d4xGDxHrEnHJSZDPivPOeU8u1QBTVuYXq0dlDJyRyY23EId
         irvzv8ilEBrULVZjLUoZMTC84gLlpwqL9XqQnuhnVawsxeEkZsIIZiV8AGea11iBkiH0
         rrF0o7TqNm+1LcB1si2FeO68uot8KBAGrilJHWM6FxSQeD9Sitpv/z76ZZncguE2jS8H
         ueA32fAuCVItjhXVEAYavnEbZEAkUax7phdFJ1zl5PYtU3YRa6q6GfZM46G+oAfTkT+6
         +OMh7/J517g1fm++NpYFkVpE1SIsyFPKxrUZ3NZOagKrRYb3A4b1+DpjREQmYZHQcp3o
         KZsw==
X-Gm-Message-State: AOJu0Yz+9xhtuSl1ul5V1acN8/kPEiNUMrsSeQKPlgePKiBjHfVza1e1
	DYUidTdjolSjzoC/+efjeSbTTIYOx7jC8sm9LN9skcpM05h/u6GbctakIw==
X-Google-Smtp-Source: AGHT+IGBb3NQUoeJ5p0o978DnY/n3p7naMA18bQVmAlg9jB/P+VgTM7Y4vWmt0HNnER4QC2EZSg3Ew==
X-Received: by 2002:a05:6808:1806:b0:3d2:2293:9990 with SMTP id 5614622812f47-3d545962d36mr6947825b6e.2.1719257533597;
        Mon, 24 Jun 2024 12:32:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 09/10] classes/spdx-common: Move SPDX_SUPPLIER
Date: Mon, 24 Jun 2024 13:10:59 -0600
Message-ID: <20240624193151.1645802-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201111

Move the SPDX_SUPPLIER variable to create-spdx-2.2 since it's format
only has meaning in SPDX 2.2 (SPDX 3 uses SPDX_PACKAGE_SUPPLIER with a
different format)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 8 ++++++++
 meta/classes/spdx-common.bbclass     | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3ebf92b5e12..99061320e53 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -8,6 +8,14 @@ inherit spdx-common
 
 SPDX_VERSION = "2.2"
 
+SPDX_ORG ??= "OpenEmbedded ()"
+SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
+SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
+    this recipe. For SPDX documents create using this class during the build, this \
+    is the contact information for the person or organization who is doing the \
+    build."
+
+
 def get_namespace(d, name):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 9dee325ba6b..6dfc1fd9e4c 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,13 +37,6 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
-SPDX_ORG ??= "OpenEmbedded ()"
-SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
-SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
-    this recipe. For SPDX documents create using this class during the build, this \
-    is the contact information for the person or organization who is doing the \
-    build."
-
 def extract_licenses(filename):
     import re
 
-- 
2.43.2


