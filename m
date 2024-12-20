Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE6CE7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 17:14:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.156833.1734714889589237596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 09:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AqyDWlfm;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216401de828so20462065ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 09:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734714889; x=1735319689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HMYqn+YjHo1Qra5OEgzM/FcgciTZRbGozOejnch5us=;
        b=AqyDWlfmG8Q4VhB666NlW3LhE5VN4jFa8CAcKrHDAZo9h6b2fe2ggjAC+YGiP09Qpq
         boidj3UMIbI0yEVv2yoCwx5LtMcx3ctBbpF/IE7MVct/gToRROL+8VUdUZdCFDzC3Tzz
         9ELT2BrtGovjlXBOBN/QKsRA8SqY6ww0XyZRm6tzS65eFbQaEIX0bbo7EHf+lARdLWQ/
         +izWu2qES7B5vree+hQcRtOW3hodTmUmd47mQctsEeKdRG+UtzwGJXU00PLJTL/dIEvu
         mG6ETsl5R69pW59x1hdc4gGE1qEDN2o5gbekPlK5P6ffzGSw2LqsW8afjwEvJkEi1xF0
         1j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734714889; x=1735319689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HMYqn+YjHo1Qra5OEgzM/FcgciTZRbGozOejnch5us=;
        b=skWxl6pEYQ9R0vPfq/Z433iZGBXa6p3rZBaDvpK8sKKuGRj0ZmYtRDsJ5yb8HPIVaj
         O2a1ByqAn7UW25QIpi8wygvk9c3hCb/nX9S9j4ZqCKk23Uhsdm32hx8TViuhNmmf5EEo
         tIyiQXIfhmWSDli7xlqOuikVZI9M5G9OrR3Utq/v6+dabjW8B1zD968PEv+ual72RkJJ
         0EDkNIbca70iGUubhOl1xpjnWvHN1IwIfzjyG3czsfiU+N0l7dOlz9JThoRiVw9hoVdx
         In6VODmkF9JtTe+vKXk8i1xYyyJVkafdiEDQ7yeEE8XsVtZNT6oaXaLHd3Lma4ewsfZ5
         KJiA==
X-Gm-Message-State: AOJu0YzNxoR5TjsO8jBiWqp1S5IFcY4cFJLZMSj/famODLRwBVlvjTax
	8wGz0I5m6ybGeZcR+p0/ysleRCvoB8bEwuOtVUB6AeZYfsV1Dq/wxgR8pB3v
X-Gm-Gg: ASbGncurxsF+YCDoBQbkFqYAtc6IdBjUKpcXpKw6duZcJRJB7hHKRt7cIzI7R9UJBt3
	7Q82ijXuUBeFPIPt5KvmHT2474PWtJH1A/USWHOFkqC0WCLg2nNrh038RVqrCOtaIXc0nhMYLoJ
	4M4L9jwjHsTxuqmMtk95Y7kkMzIgaJpqVxicYoeThyE0pUKJ+r5raPx7xcX//3e4Z5FIwKtofz4
	7tJ8vJfq5LRF0I3tVK7bERs7oeRXQlwpsqYXD96nN0hzcpbQQfKZ6q3t9Y=
X-Google-Smtp-Source: AGHT+IFrdM2HhhSSyNTUSQdDw1xQTlvEfBe5SzK6FSVPA/wog5ZZG6XFkonTPrKdBuxR7tyuaEw/kw==
X-Received: by 2002:a17:903:2a8c:b0:216:55a1:369 with SMTP id d9443c01a7336-219e6e9faa0mr45601505ad.18.1734714888710;
        Fri, 20 Dec 2024 09:14:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::ae1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96294bsm31514905ad.36.2024.12.20.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:14:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nfs-utils: Use v2 of upstream patch for tpyecast fix
Date: Fri, 20 Dec 2024 09:14:46 -0800
Message-ID: <20241220171446.2497798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 17:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208985

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-typecast-warning-with-clang.patch | 31 ++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
index 4b38db1f747..f493a3051ef 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
@@ -1,29 +1,32 @@
-From bbed752dfad73738baefe518e5959b5c0f038c75 Mon Sep 17 00:00:00 2001
+From 0a64c5ad17786796d84390e480a38b4f762229ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 19:20:39 -0800
-Subject: [PATCH] Fix typecast warning with clang
+Subject: [PATCH v2] Fix typecast warning with clang
 
 Fixes
 file.c:200:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
 
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173457863307678&w=2]
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173463533411103&w=2]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Benjamin Coddington <bcodding@redhat.com>
 Cc: Steve Dickson <steved@redhat.com>
 ---
- support/nsm/file.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+v2: Make base as const char pointer insread of trying type punning
+
+ support/nsm/file.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/support/nsm/file.c b/support/nsm/file.c
-index de122b0..0fa6164 100644
+index de122b0f..68f99bf0 100644
 --- a/support/nsm/file.c
 +++ b/support/nsm/file.c
-@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)
- 
- 	base = strrchr(pathname, '/');
- 	if (base == NULL)
--		base = pathname;
-+		base = (char*)pathname;
- 	else
- 		base++;
+@@ -184,7 +184,8 @@ static char *
+ nsm_make_temp_pathname(const char *pathname)
+ {
+ 	size_t size;
+-	char *path, *base;
++	char *path;
++	const char *base;
+ 	int len;
  
+ 	size = strlen(pathname) + sizeof(".new") + 1;

