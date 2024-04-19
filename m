Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F70C04FF6
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.19253.1713529202927446501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jFKUQd3P;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-571c25a329eso2177137a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529201; x=1714134001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDuEM/nlqDeSFirabfuKLNP3x1dUFnw+YuqHBQydRoY=;
        b=jFKUQd3P7ZOfoRFR/NCNR4R75HHsDoa7b2I5p6MyyvVHJ+XpT197Qn/aS9Dfy3pfBv
         8ALUHLMJcKbTxico5k16sHxXfFaEwbVkBG7U26uteDwOqyhh4fxhAgaTzJZz7IHg5aKa
         6ag1awdOnKBKn1SSqAJQrzTLHa6p3LMP9Dmb7AkU+MHN5vv3duM+tJ6vq2UlAPc6O3KV
         WL6yBlKkTWEmCcn8EJjPTqnotyD6kAwVkikrO3GUlD99xHnsku5jbfi9GMCFlsRygd/l
         p3Uj5c0+32vI6JPRKgU0Qfxg3CR4ZFkUwog18CqpvdujZ5NK7430Oi7cmCe4QLrGSb/U
         Du1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529201; x=1714134001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDuEM/nlqDeSFirabfuKLNP3x1dUFnw+YuqHBQydRoY=;
        b=s/eGJAsaZYzaiaRZGt2oGCb3g5axKZvjSpj1RPgZtAdoyRieRzjEOEGVv+Fzwyff8o
         pQDuspK0bd5HI848hTQ4tlFIz4x1vXbpIA6SmxXBuBcEfZPRKnQv+5vTtMUf63epr2Nb
         RKhbjTlnR19CaEdy9lKixyFVOLzoo8Df/ZuoYCALux/NTYe+75Bn48Z2gXkxHxnDuL4/
         cE0vFl6W9WqPqJol51Fm5IBKvt64YvBmTUjMCfNxlnrx6yuHIGg9at7EtveLW5cF8QJL
         hXmQatS3LsBt8LVmOTlxpMcatx+MyiMY5snBRQYQ3hQFiq0Wt3MZ8LrfMxHZ+F+KwiYS
         CMwQ==
X-Gm-Message-State: AOJu0Yw8J/0WjWt2gFpIm/9Er4dwNM5aQLouR1A0mLdULkumu7G2cwhs
	aS4SfzEZbESa00Wgz2SFJr44OzU4vT8XXKxd8c17Qasi54/YcTQ0s2w1nQ==
X-Google-Smtp-Source: AGHT+IFs8YFPB5MimkgQsp8WxbyzEyWt2LV4J7Pe/V0YoXfsUGTr3g7u87ilde/A0SKDob4wRX6moQ==
X-Received: by 2002:a50:d6d8:0:b0:56d:eb1e:17be with SMTP id l24-20020a50d6d8000000b0056deb1e17bemr2009825edj.1.1713529201183;
        Fri, 19 Apr 2024 05:20:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:20:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/19] connman: make 0002-resolve-musl-does-not-implement-res_ninit.patch libc-agnostic
Date: Fri, 19 Apr 2024 14:19:44 +0200
Message-Id: <20240419121945.1920944-18-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198546

The patch is reworked to take musl-specific path only if the functions are
undefined by libc (which can be checked via __RES, as explained in
https://www.openwall.com/lists/musl/2020/10/23/16 ).

This should make it more suitable for upstream submission.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ve-musl-does-not-implement-res_ninit.patch | 105 ++++++++++--------
 .../connman/connman_1.42.bb                   |   2 +-
 2 files changed, 60 insertions(+), 47 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index aefdd3aa065..71efd9035e9 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,75 +1,88 @@
-From 01974865e4d331eeaf25248bee1bb96539c450d9 Mon Sep 17 00:00:00 2001
+From 60783f0d885c9a0db8b6f1d528786321e53f1512 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
-Subject: [PATCH] resolve: musl does not implement res_ninit
+Subject: [PATCH] gweb/gresolv.c: make use of res_ninit optional and subject to
+ __RES
 
-ported from
+Not all libc implementation have those functions, and the way to determine
+if they do is to check __RES which is explained in resolv.h thusly:
+
+/*
+ * Revision information.  This is the release date in YYYYMMDD format.
+ * It can change every day so the right thing to do with it is use it
+ * in preprocessor commands such as "#if (__RES > 19931104)".  Do not
+ * compare for equality; rather, use it to determine whether your resolver
+ * is new enough to contain a certain feature.
+ */
+
+Indeed, it needs to be at least 19991006.
+
+The portion of the patch that implements a fallback is ported from
+Alpine Linux:
 http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
- gweb/gresolv.c | 34 +++++++++++++---------------------
- 1 file changed, 13 insertions(+), 21 deletions(-)
+ gweb/gresolv.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
 
 diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 954e7cf..2a9bc51 100644
+index 8101d71..9f1477c 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
-@@ -878,8 +879,6 @@ GResolv *g_resolv_new(int index)
+@@ -879,7 +879,9 @@ GResolv *g_resolv_new(int index)
  	resolv->index = index;
  	resolv->nameserver_list = NULL;
  
--	res_ninit(&resolv->res);
--
++#if (__RES >= 19991006)
+ 	res_ninit(&resolv->res);
++#endif
+ 
  	return resolv;
  }
- 
-@@ -919,8 +918,6 @@ void g_resolv_unref(GResolv *resolv)
+@@ -920,7 +922,9 @@ void g_resolv_unref(GResolv *resolv)
  
  	flush_nameservers(resolv);
  
--	res_nclose(&resolv->res);
--
++#if (__RES >= 19991006)
+ 	res_nclose(&resolv->res);
++#endif
+ 
  	g_free(resolv);
  }
- 
-@@ -1023,24 +1020,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
+@@ -1024,6 +1028,7 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
  	debug(resolv, "hostname %s", hostname);
  
  	if (!resolv->nameserver_list) {
--		int i;
--
--		for (i = 0; i < resolv->res.nscount; i++) {
--			char buf[100];
--			int family = resolv->res.nsaddr_list[i].sin_family;
--			void *sa_addr = &resolv->res.nsaddr_list[i].sin_addr;
--
--			if (family != AF_INET &&
--					resolv->res._u._ext.nsaddrs[i]) {
--				family = AF_INET6;
--				sa_addr = &resolv->res._u._ext.nsaddrs[i]->sin6_addr;
-+		FILE *f = fopen("/etc/resolv.conf", "r");
-+		if (f) {
-+			char line[256], *s;
-+			int i;
-+			while (fgets(line, sizeof(line), f)) {
-+				if (strncmp(line, "nameserver", 10) || !isspace(line[10]))
-+					continue;
-+				for (s = &line[11]; isspace(s[0]); s++);
-+				for (i = 0; s[i] && !isspace(s[i]); i++);
-+				s[i] = 0;
-+				g_resolv_add_nameserver(resolv, s, 53, 0);
- 			}
--
--			if (family != AF_INET && family != AF_INET6)
--				continue;
--
--			if (inet_ntop(family, sa_addr, buf, sizeof(buf)))
--				g_resolv_add_nameserver(resolv, buf, 53, 0);
-+			fclose(f);
++#if (__RES >= 19991006)
+ 		int i;
+ 
+ 		for (i = 0; i < resolv->res.nscount; i++) {
+@@ -1043,6 +1048,22 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
+ 			if (inet_ntop(family, sa_addr, buf, sizeof(buf)))
+ 				g_resolv_add_nameserver(resolv, buf, 53, 0);
  		}
++#else
++                FILE *f = fopen("/etc/resolv.conf", "r");
++                if (f) {
++                        char line[256], *s;
++                        int i;
++                        while (fgets(line, sizeof(line), f)) {
++                                if (strncmp(line, "nameserver", 10) || !isspace(line[10]))
++                                        continue;
++                                for (s = &line[11]; isspace(s[0]); s++);
++                                for (i = 0; s[i] && !isspace(s[i]); i++);
++                                s[i] = 0;
++                                g_resolv_add_nameserver(resolv, s, 53, 0);
++                        }
++                        fclose(f);
++                }
++#endif
  
  		if (!resolv->nameserver_list)
+ 			g_resolv_add_nameserver(resolv, "127.0.0.1", 53, 0);
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 91ab9895ac8..5c60b9cb83a 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -7,9 +7,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://no-version-scripts.patch \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
+           file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
-SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
 SRC_URI[sha256sum] = "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa"
 
-- 
2.39.2


