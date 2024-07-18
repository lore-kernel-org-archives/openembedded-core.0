Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF9DC3DA7E
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15387.1721310357997938835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OhjJwWgc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc491f9b55so8628505ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310357; x=1721915157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqGhD81nSc8I5ugPU79Uco4x8L2ot4UCAJPoWseKCjA=;
        b=OhjJwWgcG7/JMEdvReQZTkjxhAC1kkhTG/j9+1aON2Qoxs3xEv8SFyJeV1Fr3CzHts
         j2rKQ2MTlP3/NIAKx7GSUUsGEfvZRFFquk4UlvFk5tnxxk0w/8NuTAZQ+i8ak3l9ErBn
         zLcczaVO650EE2FLeWXkoIVVH9uUl3nYovfbk82DMqniBe+vdf4HWnC0S9TY0VwxnBkW
         f2aL8+cACb3piY1tVEY239R+i6U1Qy30Dl3S26BEJv99wK3V2IQ4GpamKtlVI2uA3bQA
         SI0yzdd6hLHWecHCvvvescB8SUJNcRkCv5Gyg0MN+339AT7zXBwsSm8Wzq5D6xLse3ZS
         jxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310357; x=1721915157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqGhD81nSc8I5ugPU79Uco4x8L2ot4UCAJPoWseKCjA=;
        b=IgD6utGX+L4MQTR9YJY0o+OrQH/1jaD/H3nUCQ2HQnsSAg4Ba0IKLwQZ2HLJFu4W9a
         oAgJw8xX2/LVJkO9F0en95iLA5DJ03LA2FeQifZEoJn3g2DY8xcHyRAu2bHgQOxwCb/t
         PDT8borUTYYupXyDvHXRG9vRN49ZiJqPF+kZA41l079acIGDFEVGPGZHLW+QGm18KSFg
         ZjGUyCOHkUG6PZcnNK9ema2NeWXq6oTG2jt+XiNLmCFpbxR3p0PzaT9W91wbx+NTEGzM
         ReQIYpWIGGd2YwgXu6FBNMrbnJGCKkl29iPiKrGJXhtjrBGcs1L0GJAPRFG0Xe0Z2o1A
         EWiQ==
X-Gm-Message-State: AOJu0Yw4IMSIWZ6TSS/zPjbaEpMRdhtkXYxJWXZtkcj4o2cacYhJuIzu
	n0yaRlb6mo02MYUq/fxuofqBav3HULs/a6KOx/PHdLY2CdZB6QTf+PrYDAwyfau0emULvQmW7Ct
	T
X-Google-Smtp-Source: AGHT+IEqkHWrkWblavHOI9yO4aBMK7sxHZZRcFJu80+TGVVEN0iv9mBrraE+1G8dHLHkpfzUQ+jOgQ==
X-Received: by 2002:a17:903:2288:b0:1f7:13db:527b with SMTP id d9443c01a7336-1fc4e121c01mr49494375ad.7.1721310357223;
        Thu, 18 Jul 2024 06:45:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.45.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:45:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] less: fix CVE-2024-32487
Date: Thu, 18 Jul 2024 06:45:33 -0700
Message-Id: <bd1c48510a01cd368955e0b8707022e3427e00db.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202217

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../less/files/CVE-2024-32487.patch           | 74 +++++++++++++++++++
 meta/recipes-extended/less/less_643.bb        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/less/files/CVE-2024-32487.patch

diff --git a/meta/recipes-extended/less/files/CVE-2024-32487.patch b/meta/recipes-extended/less/files/CVE-2024-32487.patch
new file mode 100644
index 0000000000..2d33099cd3
--- /dev/null
+++ b/meta/recipes-extended/less/files/CVE-2024-32487.patch
@@ -0,0 +1,74 @@
+From 007521ac3c95bc76e3d59c6dbfe75d06c8075c33 Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Thu, 11 Apr 2024 17:49:48 -0700
+Subject: [PATCH] Fix bug when viewing a file whose name contains a newline.
+
+CVE: CVE-2024-32487
+
+Upstream-Status: Backport [https://github.com/gwsw/less/commit/007521ac3c95bc76e3d59c6dbfe75d06c8075c33]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ filename.c | 29 ++++++++++++++++++++++++-----
+ 1 file changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/filename.c b/filename.c
+index a8726dc..c4b35b1 100644
+--- a/filename.c
++++ b/filename.c
+@@ -133,6 +133,15 @@ static int metachar(char c)
+	return (strchr(metachars(), c) != NULL);
+ }
+
++/*
++ * Must use quotes rather than escape char for this metachar?
++ */
++static int must_quote(char c)
++{
++	/* {{ Maybe the set of must_quote chars should be configurable? }} */
++	return (c == '\n');
++}
++
+ /*
+  * Insert a backslash before each metacharacter in a string.
+  */
+@@ -164,6 +173,9 @@ public char * shell_quote(char *s)
+				 * doesn't support escape chars.  Use quotes.
+				 */
+				use_quotes = 1;
++			} else if (must_quote(*p))
++			{
++				len += 3; /* open quote + char + close quote */
+			} else
+			{
+				/*
+@@ -193,15 +205,22 @@ public char * shell_quote(char *s)
+	{
+		while (*s != '\0')
+		{
+-			if (metachar(*s))
++			if (!metachar(*s))
+			{
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
+				strcpy(p, esc);
+				p += esclen;
++				*p++ = *s++;
+			}
+-			*p++ = *s++;
+		}
+		*p = '\0';
+	}
+--
+2.40.0
diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_643.bb
index 67834bdd58..537283bde4 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_643.bb
@@ -27,6 +27,7 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2024-32487.patch \
            "
 
 SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
-- 
2.34.1


