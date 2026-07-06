Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447F6C44506
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155325.1783358258847248940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MZkDgwIv;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so32764325e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358257; x=1783963057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPr3WkeyvoQsZtQF0HAPiDv3l2QTplb0Hd+YiwCrh3E=;
        b=MZkDgwIvGKPlPV+OTN6j8Wj71sVgMNvpGf22EyLd3YD7I5FbySq7b5rGsdYIkkngmO
         RpDK3/0cRgUi+wX1VjxUVFOkylfgbCbAErLTrrSnl2LmWUu/dnQz5HQjojRYSMP4mgbL
         L/StM6MuEetGDMzmQ97eMzsgDFEbNVDC7SRCi3n5T8BhuRGQIprwk9EpKEZYzN2PCMaY
         36MHnWioeBRi5uX3UFbQVU5df4IYglddj/RcTxCs6uxCe+VcNRETEmCTZdxIfA67CH4d
         HCeW7QKBtfjUIiHM//7wn4Mv+B4rRtHUeBG6BRA5kl0CshEfpHyezLngWS/JWnw8F3KI
         No7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358257; x=1783963057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dPr3WkeyvoQsZtQF0HAPiDv3l2QTplb0Hd+YiwCrh3E=;
        b=ID9sNWm2Pdw0QTP6R5oemQe46z1/t61IbwHtYaRBjWmjwd3CGwU3ADp1Cd8TMAq0pB
         yQ6uzmUgq/xoIpGWaBdBSUBjDDXiURtYO4Xcu83gmXSeMiOKgGg53BQAwRG5I1k8r7wJ
         /Fp7HvcmWvF5YijXoe523BtLRzklkcdDSX79hHXUuEKg1sYixlYp1KHb18mhlY3Peq94
         XIEjeLjQX7/NNMOR6Gb9CXzSU9Ux0hwIx35iII1EczhxcprfIPLls3klfQeheNsGyV8D
         kXg7slBXMh9r0s4MMyS0NB/MyZyuTHV4xqlysFCAh0zjk8yBl/QXtwfE+8ol26BorsUM
         J2eQ==
X-Gm-Message-State: AOJu0Yz84ldKZCfdG/CqqJ8E8s/oIqyPYm+HGkm9GXFvKGo2363gObwG
	77JmU9MBcXtJ9XXsM00O2zatjDaSegD+ukT/PtqDb6VCGcaZBnOV4oFJavpFrw==
X-Gm-Gg: AfdE7clsdrVSSfAaChIDZmv2eBqT8yC14IAFxhl3TgNpDtfvwAFetSjGZ45G1Y84f9g
	SmgyanjpGCAyhk3xI8kj91rF+EYE6QEX0BX/yYk42BAgCd6BbJpYkc/RNmfO7mXDfD3cyQ0lIu0
	ioRUua7wiXmi7oTKeNN7lPn+w7Yl0uJNC9pDDIYaMgG9Lr2IyompPk5NDPk8Hrcso3oboO7vAy4
	5yQHtmqEi1R41x/M8zOpoYGHYb2DSOQ9HNkdga5TanJYmQvh0dS5H9Rf33c7KfW2Hdj3f0GCPAy
	K/asdpitJkZZ1dA6lDt+Yzuj+/uJBPKgryYJ3aoj+Fv30tiEYwJXjNuVwaCWysmLWsYijKE4gFS
	UyYDPQ5tKqQmV0j3Uur22pulsVKxxlIM+2hZ8xyxf5L+J4HkmpxyLVjQjWZeAPJ4DAMVLSSJfEn
	OkAwcCdoXx0C2GFpeW1lSRXAPaPBdiIDaxf1hiA2Lt0u7lXnbEqVjXA1utGbg=
X-Received: by 2002:a05:600c:3b03:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-493df0a0271mr17097155e9.35.1783358257047;
        Mon, 06 Jul 2026 10:17:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/45] socat: upgrade 1.8.1.1 -> 1.8.1.3
Date: Mon,  6 Jul 2026 19:16:50 +0200
Message-ID: <20260706171701.70536-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240322

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-fix-compile-procan.c-failed.patch      | 11 ++++-------
 .../socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb}      |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb} (94%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
index ea00dfa0a9..9f44c9a070 100644
--- a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
+++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
@@ -1,4 +1,4 @@
-From c4c3d5f2d4dfe8167205e8d20b4cb7a197706c16 Mon Sep 17 00:00:00 2001
+From 15c33fde40777ddbc8eb51f8b424032f2dd77189 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Nov 2024 04:09:59 -0800
 Subject: [PATCH] fix compile procan.c failed
@@ -32,10 +32,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 631d31d..103d4d1 100644
+index 629cb7e..4368a3f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -110,7 +110,7 @@ socat: socat.o libxio.a
+@@ -112,7 +112,7 @@ socat: socat.o libxio.a
  	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS)
  
  procan.o: $(srcdir)/procan.c
@@ -44,7 +44,7 @@ index 631d31d..103d4d1 100644
  
  PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
  procan: $(PROCAN_OBJS)
-@@ -132,9 +132,9 @@ install: progs $(srcdir)/doc/socat.1
+@@ -134,9 +134,9 @@ install: progs $(srcdir)/doc/socat.1
  	mkdir -p $(DESTDIR)$(BINDEST)
  	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)/socat1
  	ln -sf socat1 $(DESTDIR)$(BINDEST)/socat
@@ -57,6 +57,3 @@ index 631d31d..103d4d1 100644
  	$(INSTALL) -m 755 procan $(DESTDIR)$(BINDEST)
  	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
  	mkdir -p $(DESTDIR)$(MANDEST)/man1
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
similarity index 94%
rename from meta/recipes-connectivity/socat/socat_1.8.1.1.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.3.bb
index e662c79a75..636c75b117 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b"
+SRC_URI[sha256sum] = "25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418"
 
 inherit autotools
 
-- 
2.47.3


