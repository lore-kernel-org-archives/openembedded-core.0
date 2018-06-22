Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF3560234
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 00:27:56 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g18-v6so4911819wro.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yk0G+OaSxsqHIBPQSazHqYv6ymMn9xAwwy/WVt6dW5Y=;
	b=f9X0Eobs4SYMieUumORPrhaDegkX/trGl8Gi1nA5FZPVrsWy6FTlejAzHauZ+q19Dj
	+9BW//u0pD+3OpQaJ4MlUYAuxv0O6uH4OjLxpQ7NTtyYUwv/NU17izKyDzzf+iX9ixcI
	HCIzgnvpK1TC9gLlRdsJlKW+U4IwZzALMe8ZB5dtcrz5u75V5y9vvvIQ0cGUcIAHf1wt
	wC0Om/o9td0T8keAUltNOUEnwCp+Fjw2mu/4F9V5qWxdaqFkS+tdO5+P2DlAajR9Cp1S
	r1IJi+DQXyL7deIIOJdNgcdFK8uEPxeFbvX0f9CnFIkeXkqjWfmmbp+UciEK19EofjOp
	tOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yk0G+OaSxsqHIBPQSazHqYv6ymMn9xAwwy/WVt6dW5Y=;
	b=D3rF1wMuf0U465ufZIbxDVSL3IWybZTugtQEuUwbb0/qkfJ4vUY1OmhrPpb56BIzHm
	n6Mj3QSJED7rq6fYF2lCDayJxKWbGPWajaZbmKc0c9oH2zI2l6jReS5abugivf4VohGX
	CuCg9+/o+/Cnq5FuRqnlvftko39JGp4FOvSYV26KyU8FISVHhWcA9mnUusYzjwAhgCs1
	Sz28NOLLuay24KHrufu7ADMVmDUhwcuO3fa79Seud4txmx3QKnIYuqA+2L6TmMQXbfX0
	uRwqP8bhjHzTHulc2akeyByhBRMqC2lff+SYpJqxtbidJNM58BhIm77DUuojnSCjzQjt
	jbxg==
X-Gm-Message-State: APt69E2lQDuS0vUyTya7WeFbFpAuqbEBVzBBkeE9x4xkir4OT9IzE+lR
	6Df3kGfYgaKWQzBdSvjltBGKWA==
X-Google-Smtp-Source: AAOMgpcvYBnouseteePUgl9NN3QjS8GhHwTHfujVAfYJvc3NbVpRo7OgB/a/kYqK1Yt0i6Rcls+T2w==
X-Received: by 2002:adf:acc3:: with SMTP id
	o61-v6mr2933732wrc.34.1529627276708; 
	Thu, 21 Jun 2018 17:27:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f81-v6sm487147wmh.32.2018.06.21.17.27.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jun 2018 17:27:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 00:27:56 +0000
Message-Id: <20180622002756.19634-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mdadm: fix one more issue when building with gcc8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 00:27:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../files/0001-Disable-gcc8-warnings.patch    | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
index 8cf52406c4..739652cd55 100644
--- a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
@@ -6,6 +6,14 @@ Subject: [PATCH] Disable gcc8 warnings
 This is needed until
 https://bugzilla.redhat.com/show_bug.cgi?id=1553958
 
+Fix super0.c issue which is triggered only in DEBUG_BUILD with -O1 (or any
+configuration without -ftree-vrp or with -fno-tree-vrp)
+
+super0.c: In function 'examine_super0':
+super0.c:238:32: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
+   snprintf(nb, sizeof(nb), "%4d", d);
+                                ^
+
 Upstream-Status: Inappropriate [Workaround]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -16,8 +24,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  super-ddf.c   | 4 ++++
  super-intel.c | 6 ++++++
  super1.c      | 5 +++++
- 5 files changed, 22 insertions(+), 1 deletion(-)
+ super0.c      | 2 +-
+ 6 files changed, 22 insertions(+), 1 deletion(-)
 
+diff --git a/super0.c b/super0.c
+index f5b4507..264b598 100644
+--- a/super0.c
++++ b/super0.c
+@@ -231,7 +231,7 @@
+ 	     d++) {
+ 		mdp_disk_t *dp;
+ 		char *dv;
+-		char nb[11];
++		char nb[12];
+ 		int wonly, failfast;
+ 		if (d>=0) dp = &sb->disks[d];
+ 		else dp = &sb->this_disk;
 diff --git a/Monitor.c b/Monitor.c
 index 802a9d9..23b246b 100644
 --- a/Monitor.c
-- 
2.17.1


