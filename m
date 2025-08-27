Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0B3CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.6612.1756330237534290928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nYir5kQx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3253f0c8788so409265a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330237; x=1756935037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/oz1RTDZ6mg5uW9TtT79vxhrA7+LGXf0Ql/wu1hJc0=;
        b=nYir5kQxujgTFLHWCt5IzDLts31quuMxRcWFDhpom/jKFIAWL3AtPZ0iJUHcK0LH5s
         CozSaTVsaZ2xLACgHsokXS8VZZPPzMO/tjOBKxLg6FQDLoY/6mnQuRsVmXBxG9oapGKq
         autmcvcPD7XtqFQNv3/KoIfqiT0FI7XErKjJuk6muWNMcwPUeyjB6n8jmgMduaj7Jbwf
         3kkrvvWKKw0FGZu3kIaiyO1+1PI2QQtMPMiPWI9w0NxuhITkH85x9NiN9+N4EoWxYXoo
         skwWzMK8fuXuUXn/+Y/oepTLgF8dSOirU1m2hu1ZHONndwbNgIrAIo7wmMgwJ3NaIlsJ
         xj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330237; x=1756935037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/oz1RTDZ6mg5uW9TtT79vxhrA7+LGXf0Ql/wu1hJc0=;
        b=AqhQctNjCBrYBcLNjICL5veK/pIEJtc4K15Ax4LJ1hZZfvjFs+Eo6VLlw/AEVwmmp5
         TAiK0ezGxLXlb1NnQerxCg3ZCuTyQvOd3UbVrBESgOSmI1UC887hB8em7L2496exaZTF
         C3Ix1SCzCLG007PBP38mi4w+opiypA2Ybm9qNLzOJRGzZZdydrIbmZRqbzxhVzEFAxWF
         341lzuCGqdHYOLYKeh468EWOVghfP8MuPb6+miIo5nQhYozJMXzHNoYwYPZL9BAe/ggZ
         Okwd+kmpRjKrS8NT70BTsLAYK4/dPNnYdzkFZJWcge2KGwIUa/xuq27V5ekkBbOJXEoP
         TZpw==
X-Gm-Message-State: AOJu0YxzWp4RTuEV1uflc+jMMJMUodF1sQYmJt9cAAhA0qc6GjCvAP1h
	MMSE4jCt5ZlJsF5vk1n+T03S9+uHRnIHlq9X+v5DUKgQbp0XV1P9+M7rjzT6dirIApOCt9nKC6G
	OpKMM
X-Gm-Gg: ASbGnctD+wPTKWs1hDsVnIZMJySEu9sh1LzNbqiI2TPrbAmin7lXXHOpLKbh9unbEm1
	VkBP/t6jVmcnvVbJCt3IpA0H2eQpKGOaxzQENwkcWbAKdFA2wfiki/JVnswqzBnmdfFS5KSZPxj
	YTgBcO//1vW08xjnGdBT0vXkfiLsWw9ix+FaXJ4kfzbxpv/Orl4QtME0QxueiWwu9rVdRbiKKws
	HXy/z4czJXDs3Y8tSWtnmVwmefyliln0KzwzP+YjZIU0L8P34cHB0yVoXDWHF0qpQN6RohG6vu5
	ylRjniqfQiKp1Op1ETCt7cJY1wdItVrPOwwV4OPZsEwq1HMt/HbssZurJ2k9dnltazSU9wTxO8J
	kvpwnoevHqHenuQ==
X-Google-Smtp-Source: AGHT+IHT+nzJjnn7wvLoxjlNFqsa9iMz3jJ2uLdaeG/hSc6U+67zunjZ5Re7W7PZHLtyI2XEqJBhjA==
X-Received: by 2002:a17:90b:1d4f:b0:323:4fe5:deec with SMTP id 98e67ed59e1d1-32515eda4efmr25891217a91.25.1756330236625;
        Wed, 27 Aug 2025 14:30:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/33] libtirpc: Fix build with gcc-15/C23
Date: Wed, 27 Aug 2025 14:29:32 -0700
Message-ID: <65036ab0a519c14338fb26ac8162d159d965da2b.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222533

From: Khem Raj <raj.khem@gmail.com>

Update declarations to allow building with gcc-15 with C23 std
being default now.

Fixes:
error: conflicting types for 'xdr_opaque_auth

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rations-to-allow-compile-with-gcc-15.patch | 64 +++++++++++++++++++
 ...d-key_call-declarations-to-allow-com.patch | 60 +++++++++++++++++
 .../libtirpc/libtirpc_1.3.4.bb                |  2 +
 3 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
new file mode 100644
index 0000000000..7bfe7c2924
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
index 0000000000..83e2105a1a
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
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
index aa526e9e1c..198cefacfb 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
@@ -11,6 +11,8 @@ PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
 	file://ipv6.patch \
+        file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch \
+        file://0002-update-signal-and-key_call-declarations-to-allow-com.patch \
 "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-- 
2.43.0


