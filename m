Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C999C41513
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.8390.1715256317926488154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=schmz3uh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f47787a0c3so738657b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256317; x=1715861117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0RYgiQTpWKJTZCiYyiJuEt2pRU9pokpsUQ6OEMMVQI=;
        b=schmz3uhlNIEe/B8WRPFWsVUplOd80f93fe9N0URBznlaaWbh78TAhU+pCNCr1zlOW
         I0j/WF1R2CBrYEGjSh9NUE5THpRlRHgWbhn/XUmJQ3AHW3CoAyhzHbmsa71OWlBeNS2S
         7mZ1NxwDq6kHjASLadOKda4WhMoImKNI5+BtLYhB8XL55qcfbLhzHEug935ww/i8tZDo
         ovS3v0qV+aIu8wSqwmouM9Z5l+Bual8n0k1K2oE1/hXT+umiuFJXp9+3p8zdivmTEsyC
         UwrVd/Tbbq3ugKZ8hzbWKiojBb/pzVkQUUd0obpJmZjKpuVTVach8nNF6BbH6divcQIi
         1maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256317; x=1715861117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0RYgiQTpWKJTZCiYyiJuEt2pRU9pokpsUQ6OEMMVQI=;
        b=WuaNkDkREXsAoJs7ZG0VS7HSKJ9GQ1sELBPyxb8NWM/zECRXbhITc+rPJTl61rbjdk
         WYpqh21jGI2HABkvc+LhTehRYY6NYttjV6rk4I0YtxhoxAJPq+BnY1DzYP8uF89Ebx6N
         t6d7WnXKuzzhKNG1a2eYBH7IQQI9Yc9OK25S0lmGncIpXSeVFG2HE/tYLit0+j7HZrw+
         7RuoaIHXpmDMUCrE42DINbi0mEeSAnYqIky1w0dIn536hNLHVIsdUTYMqYhu15T8AIjx
         uYSTm0gp3onMEgkOpjyaZOw9I3JaFugRJH5aJuKOvJEPJ0oVcQ86EXvU7jn/GRwt/+ew
         GzKw==
X-Gm-Message-State: AOJu0Yy/XYXT+FgM7vcfDt8QCTdb8qwEiSbZpiXlgSWpQ65sIiJHCfot
	ExgTsbcr+0HAQgM73va8OyoTN/jp7d03v70p5ivCGoXZSNfdzsxcDlL27Gdx214X44Se7A95vxO
	5
X-Google-Smtp-Source: AGHT+IGjVqQgFKamom0dU7S80eOl/1GcZBf4xbP9+YCL0PUGvs2P7hU+8PIi0YpZu/f/nOuEId+6+A==
X-Received: by 2002:a05:6a00:3b15:b0:6f3:854c:dee0 with SMTP id d2e1a72fcca58-6f49c2a29ccmr5639171b3a.21.1715256317069;
        Thu, 09 May 2024 05:05:17 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/23] less: backport Debian patch for CVE-2024-32487
Date: Thu,  9 May 2024 05:04:44 -0700
Message-Id: <1456b309963d3121e5ab2bc9de02b19663ee3a43.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199153

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-32487

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/less/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/gwsw/less/commit/007521ac3c95bc76e3d59c6dbfe75d06c8075c33]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../less/less/CVE-2024-32487.patch            | 69 +++++++++++++++++++
 meta/recipes-extended/less/less_600.bb        |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/less/less/CVE-2024-32487.patch

diff --git a/meta/recipes-extended/less/less/CVE-2024-32487.patch b/meta/recipes-extended/less/less/CVE-2024-32487.patch
new file mode 100644
index 0000000000..d5c8b9ce31
--- /dev/null
+++ b/meta/recipes-extended/less/less/CVE-2024-32487.patch
@@ -0,0 +1,69 @@
+From 007521ac3c95bc76e3d59c6dbfe75d06c8075c33 Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Thu, 11 Apr 2024 17:49:48 -0700
+Subject: [PATCH] Fix bug when viewing a file whose name contains a newline.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/less/tree/debian/patches/CVE-2024-32487.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/gwsw/less/commit/007521ac3c95bc76e3d59c6dbfe75d06c8075c33]
+CVE: CVE-2024-32487
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ filename.c | 31 +++++++++++++++++++++++++------
+ 1 file changed, 25 insertions(+), 6 deletions(-)
+
+--- a/filename.c
++++ b/filename.c
+@@ -136,6 +136,15 @@ metachar(c)
+ }
+ 
+ /*
++ * Must use quotes rather than escape char for this metachar?
++ */
++static int must_quote(char c)
++{
++	/* {{ Maybe the set of must_quote chars should be configurable? }} */
++	return (c == '\n');
++}
++
++/*
+  * Insert a backslash before each metacharacter in a string.
+  */
+ 	public char *
+@@ -168,6 +177,9 @@ shell_quote(s)
+ 				 * doesn't support escape chars.  Use quotes.
+ 				 */
+ 				use_quotes = 1;
++			} else if (must_quote(*p))
++			{
++				len += 3; /* open quote + char + close quote */
+ 			} else
+ 			{
+ 				/*
+@@ -197,15 +209,22 @@ shell_quote(s)
+ 	{
+ 		while (*s != '\0')
+ 		{
+-			if (metachar(*s))
++			if (!metachar(*s))
+ 			{
+-				/*
+-				 * Add the escape char.
+-				 */
++				*p++ = *s++;
++			} else if (must_quote(*s))
++			{
++				/* Surround the char with quotes. */
++				*p++ = openquote;
++				*p++ = *s++;
++				*p++ = closequote;
++			} else
++			{
++				/* Insert an escape char before the char. */
+ 				strcpy(p, esc);
+ 				p += esclen;
++				*p++ = *s++;
+ 			}
+-			*p++ = *s++;
+ 		}
+ 		*p = '\0';
+ 	}
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index f88127a9e3..01fed7c065 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -28,6 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://CVE-2022-46663.patch \
            file://CVE-2022-48624.patch \
+           file://CVE-2024-32487.patch \
 	  "
 
 SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
-- 
2.34.1


