Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D16C71131
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.90701.1749571762444742795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qdiWQU0R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2352400344aso49617115ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571762; x=1750176562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IjQZv52TY9VtUziikhiqHANvkYzYbCC+qu8MzTn7g4=;
        b=qdiWQU0RZzHn6kQ37r9yF83RpQSvON4Y3HJg2JOGcJYpu5nqLBTdSRJlfTDV+dwxh1
         uDS8RYEfKBdx80782KYI+ERWdjxnWQU+2dL0sbsLlkzdvDr+uHOihI4ffwbVnkCoWtfP
         I0smLro9ZPn1EMQc1IDhPo+q1TjPaU1iMkmzht/X8vvnVAHPaaC60xO0TZi5At6CxD5l
         EXurF3N0RM0qc7y+EJdeLtOw8R4QL2N3f1duiJlEEMCk71pHcMF1qv1/sHg1Tu5cmN7X
         /RGBABLMyuQ4L1zdMLjLVu93iUu/MGL3s60Vxv/cQW2irm0q8az5/Gt4sk1ZcV0NEL2I
         ot0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571762; x=1750176562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IjQZv52TY9VtUziikhiqHANvkYzYbCC+qu8MzTn7g4=;
        b=hZdvKldvWQuniHbXEYBt/bKP8nF++eIMJNmzn01/9tunLXmOWeoWgRSFhRteHjsiZR
         KxTJ/Avaf0DqlRECFoQVttzri4KBEIRdoMEJBBhmrRlW7X0y3wz2SKJcGHnE5hhOX+ou
         AeVjqqRayzxUnp9kWiv9nD1RkIA+ts3fMC5bCB0CmaTtnx/RPya0K50+xhtq6MAtsXSf
         CL32JVXJQsKmg8WphudZ/Vt7dVQiW4e7K/cf3HAnm6vPTQRQE98z46/ujX7cuOEOqWTS
         DTr/JTsJUAy0PyqNFkT4kruCZ7uGQwVBNRZxUY5kif2gJF1Z2IYApJRPemefOnzNY6jC
         FHVQ==
X-Gm-Message-State: AOJu0Yxqhdt8tBfW62nKRKUmJBIZUjgsBLOLzhifJNX6DXwiCxh1BlDI
	W+ai2lCXGn/WdTD2hxd2bb6KkWkaFMKZpWzGvItgQFBZks3umMpCWAWisIFHmMhAartwn+i1+99
	HeuhS
X-Gm-Gg: ASbGncsWwv/WjGUSzswaV0N0N2oeWOYtVw3LShMMgme/P18q9Xk/Gvcg2Ii2anmm0KE
	3npz6L5CEx/sMFtuIW7uQ7wlxSV+SY6uux8p3IVWIZkQw26SJryZ8JhztYKeyptyhaPV1PN6n02
	/TKVXIhFwddYCRV8FU1i3rcDQX1SoNxxS+XiZluS6rEgVmFW28S0O5rbNCG5dq7nXzlzI86n+Xt
	+jFW8NLC9IAw7/9VCozTZq5yqYXvgwvveqWcVVKFkoY52P/b2uEW0u1uIjckmQwAH6R6mEal/ul
	C9YzJlvrUD0i09dlb/jOVhjlKrJ6L3W+7CQqYPxdhgQ95KnQk7h46g==
X-Google-Smtp-Source: AGHT+IF+066rmwGy8fS1Pel5XrVnYGYmijomXFp+vVVw1sJ4PL9jNJ24LemYFiON5quVOVme+MgQUw==
X-Received: by 2002:a17:903:1d2:b0:224:76f:9e4a with SMTP id d9443c01a7336-23640c86807mr6475565ad.14.1749571761629;
        Tue, 10 Jun 2025 09:09:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 18/32] libsoup-2.4: fix CVE-2025-4948
Date: Tue, 10 Jun 2025 09:08:31 -0700
Message-ID: <080c655c5a4590c55e8cc7d0e7a90676a3ed78ab.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218387

From: Changqing Li <changqing.li@windriver.com>

Refer:
http://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
new file mode 100644
index 0000000000..b15b8c763d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
@@ -0,0 +1,38 @@
+From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index dd93973..ce2fc10 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = soup_buffer_new_subbuffer (flattened,
+ 						       split - flattened->data,
+-						       end - 2 - split);
++						       end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b771805723..911d95901e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-2.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-32907.patch \
+           file://CVE-2025-4948.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


