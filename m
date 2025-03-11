Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887B5C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 22:01:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.23080.1741730462811239701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 15:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFn2fTU1;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22548a28d0cso28083885ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 15:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741730462; x=1742335262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1sIn0daQNz+qXcHjt+P45iKL7T+7caXCVjn1GgD+M0=;
        b=BFn2fTU1otYLnb2+8tgR7nI3X5rXsLsaQhVrQqC1pFINQlMCC74KQ0eT6ORIJouVKI
         71UbPWvZP0PRzcFw7Qy/8xeCvYv8MwJqZlX9/PPFAyLaL4bmhF1zQqlWUICXYEFl3end
         D5U3QX0f1tUVHRAeOQaK9kg9kHqB9mSJMApkKT4Zjg90ZkqWPHZFHtEsbMmdjSxzDN6W
         zu8c2ZMcVOQeudLamZtkCePi4BarWRr1tl8oXM+sMfwQMCTr5M1P67vO2Xxl0XXXu2ej
         4c56/QRGi8SAg6E9pv62bjP0Sa88+3Kjl1xSNYRYAT4DaW3WUPoVqLjv9lY67AGCmd63
         xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730462; x=1742335262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1sIn0daQNz+qXcHjt+P45iKL7T+7caXCVjn1GgD+M0=;
        b=cCyUdfhbmpQ8UYsVKaRUtOoXxEPnxHunE1bttgTj2W5jzuKpAHbujydOi9lcReygKG
         y+hb7PuPjP+cmuFgBiloB6/tCs6dP31Uj10YKhwjALq7A/LdEQfpEMKQ6EqGET3q1SWS
         UOTjk5Ux8LmnOHfh/HPMKRzGPUXH7GfWIsujn4iXyHvfCLILjs+jgz3xYWCjQCqoMmCU
         AZN0oY9yBg69SZRdi3h8CXujMd3mSGYUPA1eyUg4Oq+eqCkiLZHyomjc7b1tkPKEnPMh
         vlWtLBGLe+/EMTJxeOwUG6VF75/9K9iGPq4WvSq9Lg9qtw5NEbqIOc/HvxwBmMtbaupS
         8/aA==
X-Gm-Message-State: AOJu0YzVy7ZT/YPQNqXWs8UbLdAWMVn+ByooTj+aqdjgSsTvvwufrIcR
	nJ+6mTdWpbygba+RKrFIbO3cDVtQfTQLEhtyAYXZ12jNkrnaCE9rIqVn+vT7
X-Gm-Gg: ASbGncsBurnpTY0wM+Tw+yBGDPV+qu4P7a7szJ/IHYrNo94oOyZTDsCGlajZy1IfSxW
	IiRqEZegvV542MvsosyKX1Hyv5v6wNe7MT9VkpC2NksS2YYjisc6k24/Wu9HrC3Jux2XPwnTy3U
	ywX483W7cSZNHMvXkhzfjq7/ZE6yfLgwYmUX065QB7q0w9vUqB/K12iDhx4yMbxNY09booNxStj
	5rR3eI/PzZROx16AIBVX1o8mtOSSTTnn4E4xTEP6qu7iO+oPNSkuZpZ9Pf4T8cNg2RIcVnXjlow
	Gade+jfSnM0UJpCO2FjotmU/y1QQX1UgeSdq
X-Google-Smtp-Source: AGHT+IFxnzDaIiLstJsDhWkwoYCBphwqOeULW7+K+vQxUBtPLk1Ap9EfGISUyxb5gmVaT9HXzwtQSg==
X-Received: by 2002:a17:903:40cb:b0:223:377f:9795 with SMTP id d9443c01a7336-22428504334mr288540055ad.0.1741730461828;
        Tue, 11 Mar 2025 15:01:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a908a0sm103576175ad.162.2025.03.11.15.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:01:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libtirpc: Fix build with gcc-15/C23
Date: Tue, 11 Mar 2025 15:00:58 -0700
Message-ID: <20250311220058.1763943-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 22:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212634

Update declarations to allow building with gcc-15 with C23 std
being default now.

Fixes:
error: conflicting types for 'xdr_opaque_auth

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rations-to-allow-compile-with-gcc-15.patch | 64 +++++++++++++++++++
 ...d-key_call-declarations-to-allow-com.patch | 60 +++++++++++++++++
 .../libtirpc/libtirpc_1.3.6.bb                |  5 +-
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
new file mode 100644
index 00000000000..7bfe7c29248
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
@@ -0,0 +1,64 @@
+From b526c0a90953f47d4cbf7ef01e9ac13e9e76904a Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 12 Dec 2024 04:16:02 -0500
+Subject: [PATCH 1/2] Update declarations to allow compile with gcc-15
+
+This patch fixes some of the compile errors with gcc 15-20241117.
+
+In addition the follow declarations need to be fixed:
+  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
+  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
+  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
+  des_block *(*__key_gendes_LOCAL)() = 0;
+
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=d473f1e1f6ba80bfaee4daa058da159305167323]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/auth_none.c     | 2 +-
+ src/getpublickey.c  | 2 +-
+ src/svc_auth_none.c | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/auth_none.c b/src/auth_none.c
+index 0b0bbd1..aca6e71 100644
+--- a/src/auth_none.c
++++ b/src/auth_none.c
+@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_auth *);
+ static bool_t authnone_refresh (AUTH *, void *);
+ static void authnone_destroy (AUTH *);
+ 
+-extern bool_t xdr_opaque_auth();
++extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
+ 
+ static struct auth_ops *authnone_ops();
+ 
+diff --git a/src/getpublickey.c b/src/getpublickey.c
+index be37a24..4e96c7c 100644
+--- a/src/getpublickey.c
++++ b/src/getpublickey.c
+@@ -52,7 +52,7 @@
+ /*
+  * Hack to let ypserv/rpc.nisd use AUTH_DES.
+  */
+-int (*__getpublickey_LOCAL)() = 0;
++int (*__getpublickey_LOCAL)(const char *, char *) = 0;
+ 
+ /*
+  * Get somebody's public key
+diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
+index 887e809..5ca98e9 100644
+--- a/src/svc_auth_none.c
++++ b/src/svc_auth_none.c
+@@ -37,8 +37,8 @@
+ 
+ #include <rpc/rpc.h>
+ 
+-static bool_t	svcauth_none_destroy();
+-static bool_t   svcauth_none_wrap();
++static bool_t	svcauth_none_destroy(SVCAUTH *);
++static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, ...), char *);
+ 
+ struct svc_auth_ops svc_auth_none_ops = {
+ 	svcauth_none_wrap,
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch b/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
new file mode 100644
index 00000000000..83e2105a1a4
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
@@ -0,0 +1,60 @@
+From 55452e6ae71869880f8c85d5dba9aa24d7147d8b Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 2 Jan 2025 08:46:24 -0500
+Subject: [PATCH 2/2] update signal and key_call declarations to allow compile
+ with gcc-15
+
+Follow up patch addressing the following declarations:
+  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
+  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
+  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
+  des_block *(*__key_gendes_LOCAL)() = 0;
+
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=240ee6c774729c9c24812aa8912f1fcf8996b162]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/auth_time.c | 4 ++--
+ src/key_call.c  | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/auth_time.c b/src/auth_time.c
+index 936dd76..c21b1df 100644
+--- a/src/auth_time.c
++++ b/src/auth_time.c
+@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
+ 	char			ut[64], ipuaddr[64];
+ 	endpoint		teps[32];
+ 	nis_server		tsrv;
+-	void			(*oldsig)() = NULL; /* old alarm handler */
++	void			(*oldsig)(int) = NULL; /* old alarm handler */
+ 	struct sockaddr_in	sin;
+ 	int			s = RPC_ANYSOCK;
+ 	socklen_t len;
+@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
+ 		} else {
+ 			int res;
+ 
+-			oldsig = (void (*)())signal(SIGALRM, alarm_hndler);
++			oldsig = (void (*)(int))signal(SIGALRM, alarm_hndler);
+ 			saw_alarm = 0; /* global tracking the alarm */
+ 			alarm(20); /* only wait 20 seconds */
+ 			res = connect(s, (struct sockaddr *)&sin, sizeof(sin));
+diff --git a/src/key_call.c b/src/key_call.c
+index 9f4b1d2..43f990e 100644
+--- a/src/key_call.c
++++ b/src/key_call.c
+@@ -72,9 +72,9 @@
+  * implementations of these functions, and to call those in key_call().
+  */
+ 
+-cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
+-cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
+-des_block *(*__key_gendes_LOCAL)() = 0;
++cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) = 0;
++cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) = 0;
++des_block *(*__key_gendes_LOCAL)(uid_t, char *) = 0;
+ 
+ static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
+ 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
index 6834e06c257..6ea9a725dbf 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
@@ -9,7 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+           file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch \
+           file://0002-update-signal-and-key_call-declarations-to-allow-com.patch \
+          "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[sha256sum] = "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508"

