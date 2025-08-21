Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900C3CA0FED
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.2522.1755816207787898557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2S8rqpA;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61c1a0cd60aso362261a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816206; x=1756421006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=assz9PWPwt9TgjJ/3gPx6nO1o4oy9l1uFtETHcfmrmE=;
        b=Q2S8rqpAmub4a78ttwMG78C+R8Yllg1pNWgn2C4mzc1sKce4uAxGJbYVaC5/zwhKP2
         FE1ClBOp5r8aZbtCORtUeXRu3FH5ZYRAjP7A5UJo72+8QUC83Dr9pXPDLQtFJnNRw1se
         fy30J5KrA4a1LwE5xbnf/gAwc6YuJT6eQmURIKbCIqow2gxk66eWtIjKQtpEtRQpMaBx
         gSQsXDEovm8xFPsvTU8QZWHFw19aHbdoITzTLRnd1V8ADgAXWKV5rbbzUXPLdQlB+z8t
         oOBldm6lQ1nHEi6KOwOlwA9EoXevMnQyxgLsdmY6EwGF1D817FEjAp9ODhfLqIRU+bOU
         NvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816206; x=1756421006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=assz9PWPwt9TgjJ/3gPx6nO1o4oy9l1uFtETHcfmrmE=;
        b=hTVbtfRYd3fIzUeG0io+aK6MgQ3Z690D0M44Et1TMrrXIheh1m/vxsMg9kspLEqmU7
         7UXHBptl8KvZ6GEOtZsejAlB04aM6Ig7IhHWoNbvzD94aF24uQpzr3jsx/fHMyJtIqL6
         YpmunrYrIItaAyTwsZZ2I5u6WRSswivIqIGq/dTrvvcTtUGGLghAhFdzWU3L30UNJZ+9
         cFLzGt9iQ9nRRAGiZhkpl7Jl7Cao65d3vsox3PCZrXZnYqvce1WsdAj2vpw8sj3nLQo1
         ZDXf0r6zU2usGEaGpl53asZ1y7W5RutrA25JBpeB4P45nicZDk3asUiAuaTo8lTz62xN
         IWtg==
X-Gm-Message-State: AOJu0YxDeVkPwf5xmmWUaZaG/BXTepajnZjWXasJ/wLdLkpf0OSPCPTj
	9tNz/1ASNQuQatIn/etNMiWtKDRuO0fkJCAEvhxWbk9XDdgpSvJul0Pg5zoq9Q==
X-Gm-Gg: ASbGncuAj/Aqsz8pz09J7cfw29I53jXY3vjgPodfRqDgJ9dzNCKIiwcurblUC+KNiXh
	4/NaDAQ5zuzMuYXeN7Wy0CsH9IbbS7dldcI/dUYu1R+2Ic0SEDTspUjmguoEad3hfAZ1hRpSuNf
	Q8rujuhnCt5frO2fyv4yPRa3DzMUpcl3YrvCy73g3CnC0m0WxShyfEr7kG0VvfSB5BOyfrRXCxG
	qA3KiT2IUkzncKcPXkbwcgMax+vV2FmeuM+KrYxFjfNSWLdKx5AaFSFD8wCWGHRZrVPu8GxS0yt
	pI0hlATmUb4asmpB4ddycp27UI/ctLQeC9jeYaHfAkcprH01f/zh27ky26o6Mdh0dUe4cxiD1Tx
	pOxGwrqTckM1eazj7CcTgshrkNQFnYZ0mi2xWjsEHZpr6S236QfQN5AjD
X-Google-Smtp-Source: AGHT+IF2GneXEZeqnPuQkC9+4ljGmaFPfW8XAZx6tCDYPhpFJAQA9XUwO8j7c7FH0esHaCsXqcQK1w==
X-Received: by 2002:a17:907:86aa:b0:ae0:a483:7b29 with SMTP id a640c23a62f3a-afe29550672mr70364266b.49.1755816206069;
        Thu, 21 Aug 2025 15:43:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded309f3csm467487866b.32.2025.08.21.15.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:25 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 06/15] unifdef: Don't use C23 constexpr keyword
Date: Fri, 22 Aug 2025 00:43:00 +0200
Message-ID: <20250821224314.1690103-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222291

From: Khem Raj <raj.khem@gmail.com>

Fixes build with GCC-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...0001-Don-t-use-C23-constexpr-keyword.patch | 57 +++++++++++++++++++
 meta/recipes-devtools/unifdef/unifdef_2.12.bb |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch

diff --git a/meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch b/meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch
new file mode 100644
index 0000000000..9d02183930
--- /dev/null
+++ b/meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch
@@ -0,0 +1,57 @@
+From ca1ac9c8bde84dbdea972299b1a6e30e78c2d785 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 17 Nov 2024 01:26:27 +0000
+Subject: [PATCH] Don't use C23 constexpr keyword
+
+This fixes building with upcoming GCC 15 which defaults to -std=gnu23.
+
+Upstream-Status: Submitted [https://github.com/fanf2/unifdef/pull/19]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unifdef.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/unifdef.c b/unifdef.c
+index dc145a2..4bd3bda 100644
+--- a/unifdef.c
++++ b/unifdef.c
+@@ -202,7 +202,7 @@ static int              depth;			/* current #if nesting */
+ static int              delcount;		/* count of deleted lines */
+ static unsigned         blankcount;		/* count of blank lines */
+ static unsigned         blankmax;		/* maximum recent blankcount */
+-static bool             constexpr;		/* constant #if expression */
++static bool             is_constexpr;		/* constant #if expression */
+ static bool             zerosyms;		/* to format symdepth output */
+ static bool             firstsym;		/* ditto */
+ 
+@@ -1086,7 +1086,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			*valp = (value[sym] != NULL);
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else if (!endsym(*cp)) {
+ 		debug("eval%d symbol", prec(ops));
+ 		sym = findsym(&cp);
+@@ -1103,7 +1103,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 			cp = skipargs(cp);
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else {
+ 		debug("eval%d bad expr", prec(ops));
+ 		return (LT_ERROR);
+@@ -1170,10 +1170,10 @@ ifeval(const char **cpp)
+ 	long val = 0;
+ 
+ 	debug("eval %s", *cpp);
+-	constexpr = killconsts ? false : true;
++	is_constexpr = killconsts ? false : true;
+ 	ret = eval_table(eval_ops, &val, cpp);
+ 	debug("eval = %d", val);
+-	return (constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
++	return (is_constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
+ }
+ 
+ /*
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index 3e08b3a0a4..bf0f3e1b17 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
                     file://unifdef.c;endline=32;md5=6f4ee8085d6e6ab0f7cb4390e1a9c497 \
                     "
 
-SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz \
+           file://0001-Don-t-use-C23-constexpr-keyword.patch"
 SRC_URI[md5sum] = "ae8c0b3b4c43c1f6bc5f32412a820818"
 SRC_URI[sha256sum] = "43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400"
 

