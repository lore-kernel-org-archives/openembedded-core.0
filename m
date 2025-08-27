Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9D6CA0FFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.6644.1756330231484951487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dVlgfUcx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b49db86cac4so241065a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330231; x=1756935031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZerscwBIRGWF3oFNtoL2m/ZMsKBCKTmECtaoMNqcF0=;
        b=dVlgfUcxT1y5hkQAvzC2I2drHZMYeIF1WVRFAOiDjcRpRNi3uZI6Le2c0EwMqTHKkP
         QQGHoR17x2/R6kXYbnelkWebluD+uqcX7lanZmtjhcQeNCwQYjbVV7kohDY4qMhcY+/J
         mcBEf9QLRnEj6+Dv4fpsg8Omx60biw7lnYn4Yw8sKxJpenxkKdHKhVE4GzHZreWEKdSq
         I9yCh0znolDKbYrDG557OsuMQRsuqSb0rJUjGx62r8lg9UvAD4YkHOAl1sW/Jggcu7HM
         dJ0C0uHh6lpimiU0EBndvHJ+dno2AEkvUVVWx8kCXLaDzd3ZOqkcyhIX93dIb04qafOd
         JGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330231; x=1756935031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZerscwBIRGWF3oFNtoL2m/ZMsKBCKTmECtaoMNqcF0=;
        b=geZJ/IYHeahCiXjxL2PvzArF5Fjap7zm1sZmVM1UHNYVxNxQdhvAGc2JDwnN3ib5Yy
         /7YZ7NXdeGFGY8ZS4MnxdKOAhMP5bNOGSNXgTdzxY7DEgHnxPLsSartyjVBbgy2uvtLz
         8066XcEnwPxsM8JxM2G8rjGq5jH2uak9mGs4UotAZJzoHg4S3x5xFrNo9Yvm+NktvAF7
         L4TGr1z5Fhi5OjPn/pbdOvyJtwzSUtVLtbtxM4l6sZyf7R49m5ReUu1g0R8SyDBxhtNf
         xs+fZtKF9n6g6wWyRxxTv8hgm9Ue0VXRHxdd3cPglfYidrcxjFF9ggnNTrvqlsz6KAFr
         9Cwg==
X-Gm-Message-State: AOJu0YzGVOz+lNHki95bNBn+R7aRi8Ss7DW+8G93YHSTBwV1FqdHXQqy
	RTHBYYf7it5tLWVM3Mqn0OplKBx/9is1WJamG8/n/nYsRvctkHBWJaf89yRXXj98fj6qGWmkIkV
	rpknb
X-Gm-Gg: ASbGncutOu5oV9w5498L0RaXTCaP0AQL5OIw2GG+ZhfbAnBhSECI9uYm3DM5NAwodcx
	5UiVbGQ0JTlassW2N5lcS8UmJ1r7uFiyIfbE/tQjICEKmlAjFiW2/BphEcWprB20cdxmkGE0Nn8
	ZghBMgwTpIZdTJoK+LI9zSgEKH7H6VlGNJdNax2JTK7skjynsDQIj8+pEFdIgluIxZQ+XkhNMCU
	ssZ/b1DE2QnK/k0qFtmA05QVJNYXpOmgIyZeyZJGa0LsnUqd1vV8/SmZl7h9a+z21tsEp1mKKyP
	66xSoFkQQKGZbvb6FAoV508/AH6XThYGqPS0qDbHd+dw3WnMNeVhOQm4RPzKYYFIlpUulKYJE4f
	8dbeUC7SWtEiQoBsJXAu1KkCw
X-Google-Smtp-Source: AGHT+IH+oQVW1zV6GC30LkCXE1VOnb2YjEc9ihIfzwl4mt0v1EDWSdN1oJf3N3UcNjDJEaJjRcpH2w==
X-Received: by 2002:a17:90b:350a:b0:327:75c9:bea9 with SMTP id 98e67ed59e1d1-32775c9bfeamr4639106a91.24.1756330230551;
        Wed, 27 Aug 2025 14:30:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/33] unifdef: Don't use C23 constexpr keyword
Date: Wed, 27 Aug 2025 14:29:28 -0700
Message-ID: <3085783dd5585a85a3853858215689c362429c64.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222529

From: Khem Raj <raj.khem@gmail.com>

Fixes build with GCC-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


