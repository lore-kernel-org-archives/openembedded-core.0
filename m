Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E2ACA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.2525.1755816211806922758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b8AxpPeU;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso228494166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816210; x=1756421010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfOeCtUwKaFPVC/P/pg/gnzgjG4uIZg+y8Aw825vz78=;
        b=b8AxpPeUGc7esMj4GhW/36SzJnY2o/YoaNMH8pRy5xqhmvDwNtoVQONJ72tsdQYXfW
         32svPr7Izf5rO4G9OykD9G4CtEqhmRAeEwJWMUExuvOpOAQTc+osSqWpS4E/dFHiPy6D
         gmk8MxVeF9Bg/tXNlQ0Sd9zJApqtw2GH4LnyApD4fN2cqLOMOc6nhvGluDugc6+x9Rsl
         +9yf/ltkV55e5X3w7cTq60lJbTYzzhScJVHOLNHslKzW0wNKpVvklPSYFenPacwPsgzB
         cJZARdcmCvrixvd2FYHAyf33DEgYIwxDo4YjOiz4LjRw2laLdC+RD/7M4c2+xG4iAc9Z
         fVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816210; x=1756421010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfOeCtUwKaFPVC/P/pg/gnzgjG4uIZg+y8Aw825vz78=;
        b=ocOh8ClkITejtl2J3x7ZZVOnZ7R/+ggpT+xFzA9ygLvLcyBX/W/Zsz9Ui41i/7Q9xf
         5YIuELU8ChVaDlcEDhlSYblu7ye3CR0WEQInRfGmzLBVY5AspKgzKp0AiucCsiLkxZFx
         gbDgqetDB7M69LjesSz/EXr3O1aAp/7xHDbB9URuvhoxt4O1xa2Jmch9QJVDy4X7iHf2
         wnL7LLsiQb9CWf4KK1Ltrjf51VOzMIf8JhYUnUuRIa+gUyAncpY/C1m46SIu2dPAZ2vY
         4mYyhCPQFHToSfugXRuzDGzkLMPUEuIO+yizqPVmrJXJ5RYMDBZm0+gGVjgU3eOwBLcN
         1v/g==
X-Gm-Message-State: AOJu0YzX1hVrF2apGKJXdNnJ7InPqymkrgV+fpDG8pat3y2PQyk74pIO
	35ltPZTe2BmtQbvhePgUX3KhKL+Xq2PS90f4lCJVFQhAak/BahdvieAH9dyePg==
X-Gm-Gg: ASbGncsUrlcI8B5qYycmUaqU3KzGzdcdtQVnf+xky5GCLb7GqFuvP5J3X9Y40GZBpze
	mAoSCCeDP5eOmRHoNH82A5kjf6adRzUlC7u0z84cX/PsPwe0hrBZLlaAwDri5TruDhGexcGvQPt
	ppnq4HThJYIkJrPfZT16iDyr5QlfDj5yhv+T5ZsZP8KysRM/v1QSf8S38JIs1Rbm97iHHsjhxz/
	xhHME3V9Qwxs4aQl3AEQe3Y79kHYrlNxMJVnEmAZ20xZNHe3udhKtSWTUQIU4erfDKjXDS5PC6f
	gxjI/A1zBMkTCzGisSFZg9a5YqNWJBdtP4LC5qv10pYJsFVOgpTBYYtYy5jRpFYTXzJvDIKH1St
	TnuQ5faOVQfEZtMCp7HFKS97e0fcZTdrCK04jvUrH2G1gb430nqALWN/K
X-Google-Smtp-Source: AGHT+IEY0Osf0fF/Yx1E3oCzYHdtZ4z/l0R0pwIuEZEVxQduTfs9KD9og6sHhMBeuQuHZ7Qg2T2Sjg==
X-Received: by 2002:a17:906:eecc:b0:afa:1d2c:2dc7 with SMTP id a640c23a62f3a-afe296ec4acmr67028366b.57.1755816210000;
        Thu, 21 Aug 2025 15:43:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded2bad79sm474115866b.9.2025.08.21.15.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 10/15] libtirpc: Fix build with gcc-15/C23
Date: Fri, 22 Aug 2025 00:43:04 +0200
Message-ID: <20250821224314.1690103-10-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222295

From: Khem Raj <raj.khem@gmail.com>

Update declarations to allow building with gcc-15 with C23 std
being default now.

Fixes:
error: conflicting types for 'xdr_opaque_auth

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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

