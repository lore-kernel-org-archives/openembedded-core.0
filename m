Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F63D58083
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.17079.1732536094601408682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMD2I+qG;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a044dce2so8755785e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536093; x=1733140893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1TaMxGHbGQi1eVJi35SZLMP4rVeEVqBwu1rrJhf/FY=;
        b=cMD2I+qGuFt1P+fJrvI3PoXXG7ZvEfKt4tllcPGfiz/V8sCEvONAEFHGxbVRDLF3Fi
         rziMyFeGJW+cQkVD3O8HSakrJBOqfLXKxPg6SXgCI3SOXyN3Lr4Z8XD0h86EPYjI9T6B
         f/PVvXFGw8xaWOatcoBzNPfHC9jhhxxgKjoPLAdFymd3535wrvb4cNVgEfDvcm28szDr
         6GKNoJ2lKXXvABW8A5W00ZJO/+CEo7fYITXjUlwu7/eFzVJ4S/26pPrRe8ZdGaF1KulP
         5E/b/YZ1CyuEKFX1CvHG1WRcZOYBSPTWNLGmY8LZ6FXZYK7jOjjSVPKnnyOZpYO3/cyg
         xKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536093; x=1733140893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1TaMxGHbGQi1eVJi35SZLMP4rVeEVqBwu1rrJhf/FY=;
        b=ZoxWPuku4sP+a7Ne8P0C+miZl/c1Qt/2cm6V2YeVdfqVuEYZE0x1ZPaGYall7ehHhX
         KCNS4JxmXtevLeygh4bM1IC/0jhVYsrt+U/0wzWkApxbES0oo7Q2b94WyL049NX6rGMf
         6tGLhRVBcJUxII3js+FEJMrLb3mYVD8Yx0t4lT1vH+R/BWBSDsjZF15joN4o7Bm9xoky
         B3GHSsIXpG7+kdEIkoxdgtBGbzvFs/uSTOqtPEbxlBm6UkAjdidxc8hJ4VkkULfpXstC
         w3NTyKvHryVeDvtIBzsYpH5dgbOBs9mGRWg3xCXSghH7KntlX9gcTUnOt4mdd7iUUd8C
         fB+w==
X-Gm-Message-State: AOJu0Ywaf2mbm7vYTTUNArF83VuDMnq/U3UEZxbKp8+2ydN/RH49dNqW
	AHcIIBFkGSAVgfaz7V671UYmr4nCScogh/vlnl1wd3G1qpa24Deq8WARzQ==
X-Gm-Gg: ASbGncuUXlk3F0IdYAzNZe4/Fc/23Bz4GrMuAXGhW2+kchMmRhKd7yB2P7oHQ3tgEse
	u7pq23kU96eUIXI9GAppaLKIZWXMN6o5JCzj1PT10VUZVx3Y4PnFiL4wUb06MOOBhAk87qJ8YM0
	1HnDvQsluHibIAQT49cHKGu03KbuOGhjokN0hfBf4iwG0kPvZHQP8qFFYZI8ZExkb4OM/YIFbS/
	B3I4isKQIHNbAdigzq7tYF5l7LqlCCOSkIWQmfcW5YVXI1SlQd/5Idz2kXIHwtioRsQZWHE33sQ
	zK9y7l+kA0I=
X-Google-Smtp-Source: AGHT+IGKne5xJbiCDga2SYtsC9133/eszKSI3zP0oU8wE+Poq7R71S0jjetfjQZozRasHKKY3btrmg==
X-Received: by 2002:a05:600c:c8f:b0:434:a30b:5445 with SMTP id 5b1f17b1804b1-434a30b56b9mr2870125e9.19.1732536092661;
        Mon, 25 Nov 2024 04:01:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/35] createrepo-c: upgrade 1.1.4 -> 1.2.0
Date: Mon, 25 Nov 2024 13:00:57 +0100
Message-Id: <20241125120127.2205232-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207752

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 5 +----
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch          | 5 ++---
 .../{createrepo-c_1.1.4.bb => createrepo-c_1.2.0.bb}         | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.4.bb => createrepo-c_1.2.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index b63fe539441..1d2e81f281d 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
+From 5d974eddfd59291fbbf9bf9b352431d8565011d2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -23,6 +23,3 @@ index a31b14d..01fd8ca 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index b7e5710b391..e7f3d32e088 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From eb66326c3fc6e942282d01ddd56659c78ed7400b Mon Sep 17 00:00:00 2001
+From d1a474e4002b978a54c918d46423c35bfbadad8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
 Subject: [PATCH] include rpm/rpmstring.h
@@ -11,13 +11,12 @@ on 'rasprintf'; ISO C99 and later do not support implicit function declarations
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/xml_file.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/xml_file.c b/src/xml_file.c
-index d2400b8..871109c 100644
+index 44b38f9..de5176b 100644
 --- a/src/xml_file.c
 +++ b/src/xml_file.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
index 0a37c761870..60523d5318c 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "a5a8990ff84b7977218976ea14c703330fb52875"
+SRCREV = "7085e047dc9f58a1de6ee6f3faf733826e60b963"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


