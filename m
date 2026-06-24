Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC78CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:29:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7144.1782307787022117642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 06:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lV2qFzJS;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4631679f204so1110167f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782307785; x=1782912585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZdurTAp8abezk+0dADuhG4qtzdfP51zr9UJ2hL8LYE=;
        b=lV2qFzJScg6nMfGT8VjQXA5lQGTVnOKXfgF7B+OsULcmg/h7x+CYpePPhVmTIUslRS
         d/eQSgc1pHccI7qXmiU3y0UYf447PDUiEmlKBuE/QxuHz7slBTk5tTb+4kQvUBGiEQcT
         EcbGgCFs1fWJUoMSP9e6kTT7yY8qGL5LclCEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307785; x=1782912585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZdurTAp8abezk+0dADuhG4qtzdfP51zr9UJ2hL8LYE=;
        b=SMy+lpVJT46rE1GMz/TPEAjHgRj2OGKy86W6ph5owYiEH6QctfcIDIYvkSNU3IawdA
         Tk33Ifh7yBLaEKfyvPD6cHHQiPLOPLS+Sds1qU6EuXZWD8NTUS4huZjV/spY743FXFq9
         +kKuLEsT02/93G3ODIP7IZXsap8E2EK8L3F2aR+46ThprdKAdXWA1P1BoE/zG2HfkNMC
         sTu+9QpJf1WaYgiYe/FKwC3bS4JDFSbqpTlSkFzcoGi0ia04xL2LcWDYXz5z6+j0ArUd
         fi3/txGXL9jm2yvo2yaGUMp45jzqPTTcktVVAehvE3n8iOE3cS3wb4uS4Toi+1nPU7EV
         hE0A==
X-Gm-Message-State: AOJu0YwH/n3SNtyDBT34X0n+bfaogp10xS5O00IjyGhawe+uEuPbrv/A
	T8xXjSGQYyjXhDQfkU+XBcOtu1oUs4RM+WceQGqEoalcbiGN+dL7FhjoQG4qDsT0zoDSWGFYod4
	mw5hH
X-Gm-Gg: AfdE7clzc7YIbLm5b8Sl5ZM0MizcExAavFVuC/XYxY5gl9Grwz/tYUnS1pceeh+vfYK
	Eq7Ya9ZOgsoviPJ8TFaNfq269kjErnCj7I7uVKXj3zkH3Mt+rw2FB4R8nVZxfA9A7MCWjnDPixc
	dYHTbYSkXBPd7SoLocGiQ4XD7b4pTtw8oXhKupZO6sfJyxgq/e9/sPv+km7N3C4xctCZiPIUYE/
	ktjLQw2uVBEhxUwH3f1drYDmyxg682UslnHIPxt6Bnf6wbVYo9oZEVVN9TjThpaAgJF9r/a1ySf
	lIYrZO/dtSZn9VLh/IQ6xwV5NWl9bZPQicP/FKNMo0h3yhVcJ1CHuT4jYTBmfDOjRASEwHdWBIr
	J0iM+FaLm1sNJ2mayoTUBGVF4Kb78foThfZULeLMP0Hn45Q3GPfaj2EChCMlZ8dtAlGvr8FpSg6
	upiF7VIua0EONyF3wbcZAh6rLeFoynv3VD+Z5Gn7yPBcN3uSyhpEvLIrSUONCmc4sh8AEFPoqQt
	9/h3fe6rqfmk24zKA==
X-Received: by 2002:a5d:5e81:0:b0:460:1c93:6eb6 with SMTP id ffacd0b85a97d-46a80c7aeebmr12427828f8f.20.1782307785086;
        Wed, 24 Jun 2026 06:29:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00f2ebd4aef93feb0a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f2eb:d4ae:f93f:eb0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm4325768f8f.3.2026.06.24.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:29:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] gawk-native: fix gcc-15/C23 compilation issues
Date: Wed, 24 Jun 2026 15:29:27 +0200
Message-ID: <20260624132927.1614585-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 13:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239506

From: Yoann Congal <yoann.congal@smile.fr>

On Ubuntu 26.04, GCC 15 defaults to std=c23 and that results in build
failure:
| ../gawk-5.3.0/io.c: In function ‘iop_alloc’:
| ../gawk-5.3.0/io.c:3389:31: error: assignment to ‘ssize_t (*)(int,  void *, size_t)’ {aka ‘long int (*)(int,  void *, long unsigned int)’} from incompatible pointer type ‘ssize_t (*)(void)’ {aka ‘long int (*)(void)’} [-Wincompatible-pointer-types]
|  3389 |         iop->public.read_func = ( ssize_t(*)() ) read;
|       |                               ^

Fix this by (partially) backporting an upstream patch.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Fix-some-C23-compilatio-issues.patch | 35 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch b/meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch
new file mode 100644
index 00000000000..7082e62beb6
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch
@@ -0,0 +1,35 @@
+From e4015d209ddc31bd1256fa568612372407e0b9c5 Mon Sep 17 00:00:00 2001
+From: Arnold D. Robbins <arnold@skeeve.com>
+Date: Mon, 12 Aug 2024 06:33:28 +0300
+Subject: [PATCH] Fix some C23 compilatio issues.
+
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=7a521fe4b37f8554ca53ef3236f0352e391aaa1d (in v5.3.1)]
+Backport: Only kept the code change, dropped comment changes
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ io.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/io.c b/io.c
+index c595c009e..44671ebd1 100644
+--- a/io.c
++++ b/io.c
+@@ -3386,7 +3386,7 @@ iop_alloc(int fd, const char *name, int errno_val)
+ 
+ 	iop->public.fd = fd;
+ 	iop->public.name = name;
+-	iop->public.read_func = ( ssize_t(*)() ) read;
++	iop->public.read_func = ( ssize_t(*)(int, void *, size_t) ) read;
+ 	iop->valid = false;
+ 	iop->errcode = errno_val;
+ 
+@@ -4446,7 +4446,7 @@ get_read_timeout(IOBUF *iop)
+ 		tmout = read_default_timeout;	/* initialized from env. variable in init_io() */
+ 
+ 	/* overwrite read routine only if an extension has not done so */
+-	if ((iop->public.read_func == ( ssize_t(*)() ) read) && tmout > 0)
++	if ((iop->public.read_func == ( ssize_t(*)(int, void *, size_t) ) read) && tmout > 0)
+ 		iop->public.read_func = read_with_timeout;
+ 
+ 	return tmout;
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index e38c1f84366..b1d1fe7ae47 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -21,6 +21,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
+           file://0001-Fix-some-C23-compilatio-issues.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"

