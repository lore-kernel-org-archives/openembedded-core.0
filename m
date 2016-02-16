Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id C6E786011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 21:14:17 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id o6so72128010qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 13:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U22UD6KX1i2x4GuhswFnEDQVr8hha36qKyqHxaXQsa0=;
	b=ddtTcy9HH2AtY6v5P2vQMAMipxEmt17fg80m6Ov5LZSzKAgXGDpqAQxUXVEmVeCi1t
	sfgztCG4TyfQFpO0revGXndvPxne3Fsm6AfVEXBKx0pmo72FF0nyb6jl+oZi3c5g8mnH
	4sJ/nTeQ6VkONr3N+oo14Iur79svS8iVs04sCAgL3Vu5fp82tzjhD7DRDx0jmNxwMDEG
	Po+uD2DsTon9CRlmxQMoc8tCAT9l2rlR2mV7yZBKnKRjjXMyvzmJMpnWn2Bq24Tdov9h
	/fO/oRgZaYLvgQDrfIdH8C43X2I+URRBMXkSV7luhwsaQDPidycpTDVooERn43Cpl+bv
	Z7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U22UD6KX1i2x4GuhswFnEDQVr8hha36qKyqHxaXQsa0=;
	b=P0ZcDZSOyqxVjYnn4Z7CWp/rjUZv2xeqHgz0NpI7Ck69tfAkLnJotUu99h1AAP3SZ9
	NO0MCyMft43kand3J2VyXIyOzBCK7Lpwu39D2w4/CGjeVnUgkmy/nRgkNTxTgS0m9UO0
	BYgJ/3MUW8Dy+WDRyy31NMP19vEa/Gf+2NRk6tmflCYppWvBaZ5uFJgv7GGs4v8uHfG6
	um+5d4+aGfAVSx1s/M3EIkflPvOwsHaBtl2MoMAj9Yxobdd1QUT6+EKJe+3NbdHAlGDQ
	SEpsenZugZZXcjFO/1s5n6eec0hOe/ZzcpG5Im3OdoNcWYLOIV7LFmAiXHZiJJwXJYyM
	1aVw==
X-Gm-Message-State: AG10YORyhMrnPFgSwkzH6gYslaI+KjjuFVlUojqxFwDzPWep/VgWQ8Q+q8ICVenzmWo4+Q==
X-Received: by 10.55.79.86 with SMTP id d83mr30405847qkb.22.1455657258122;
	Tue, 16 Feb 2016 13:14:18 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	z93sm13528477qge.18.2016.02.16.13.14.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 13:14:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 21:14:10 +0000
Message-Id: <1455657250-10214-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1455657250-10214-1-git-send-email-raj.khem@gmail.com>
References: <1455657250-10214-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] socat: Fix build with musl
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
X-List-Received-Date: Tue, 16 Feb 2016 21:14:17 -0000

NETDB_INTERNAL is a glibc define

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fine-NETDB_INTERNAL-to-1-if-not-available.patch | 32 ++++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.3.1.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch

diff --git a/meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch b/meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch
new file mode 100644
index 0000000..4bbd367
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch
@@ -0,0 +1,32 @@
+From e6a7d96fa3675bdd3f4d7a3d7682381789eef22f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Feb 2016 20:25:34 +0000
+Subject: [PATCH] define NETDB_INTERNAL to -1 if not available
+
+helps build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ compat.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/compat.h b/compat.h
+index c8bee4d..bfb013a 100644
+--- a/compat.h
++++ b/compat.h
+@@ -666,6 +666,10 @@ typedef int sig_atomic_t;
+ #  define NETDB_INTERNAL h_NETDB_INTERNAL
+ #endif
+ 
++#if !defined(NETDB_INTERNAL)
++#  define NETDB_INTERNAL (-1)
++#endif
++
+ #ifndef INET_ADDRSTRLEN
+ #  define INET_ADDRSTRLEN sizeof(struct sockaddr_in)
+ #endif
+-- 
+2.7.1
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
index c215e04..b9a8a2f 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://Makefile.in-fix-for-parallel-build.patch \
+           file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
 "
 
 SRC_URI[md5sum] = "334e46924f2b386299c9db2ac22bcd36"
-- 
1.8.3.1


