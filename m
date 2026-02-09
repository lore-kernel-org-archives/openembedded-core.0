Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2204E78D79
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43986.1770629365198095165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LeAkmyx+;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so39441635e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629363; x=1771234163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmrbNyQAAABIUZ6LQSf2oSmPyzUW0VF22dAs105bKIk=;
        b=LeAkmyx+TY6tkfdhg1dgyDH03T3NHkwwyfU3F5hgCg5lY3/tmuAn7/FSXXCsN0mcv7
         JqPil1V6Fv/sMugX0ikOr6bX2Ei9vQx9x5g2lqHJJoJajL7rgRfTOlrQCoEf4SmLWLld
         zhcYJoWkZG2gktYlJsPq9CmLyqnyvHHIYhMIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629363; x=1771234163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UmrbNyQAAABIUZ6LQSf2oSmPyzUW0VF22dAs105bKIk=;
        b=rTDAdfYGAdesJvSZjOJ1TGIHe5NuibZLwFKLoVZ7y3lYQp9NP0R2GrIeO2w/ub+LlH
         sXh4eFogGveO1IldhtPUlVMsqJs9apyumWGrCgzEsaz1gpfKNTK/R4iAaO6gOiFQGB2/
         pa20MhjAq76Nt4rM6Ii2xIxkiD62J7nZzVtDPVj3QtGblI6ZI4iaWz5Q7WA9VBQgcsZi
         ZsAenHzEPz5fcQbsgy4s64NkIQYQauY9imB3m9T6ht+xszxHJr4zul7dhDATtnOobB3u
         yeTDR1acJJHkMpiW3n4Zinx8Bq6UJPVR/J8qxhdp6Qbi38n6+LpVkVTAkxjFbaHIz8d5
         zrpw==
X-Gm-Message-State: AOJu0Yzet+hPOFCa6dMCA/uwWgjF2X/JSethF3ckqt13kvnQEq5ErOZi
	noxGgcBxKfWUpbqob48YaqdPBeq0SPjppUbjH09oeLBOgbVxs6YeMs7KWBDT6UMFn/x0uhY4Ic4
	yWY3ybNA=
X-Gm-Gg: AZuq6aLgn6APCJiBRA/04ABHb9oEee3VQIhMROPYGWspJE86E7RXqXmY/Ea/UyV8PIN
	SZTIwfFDqtxCdvRIcsc+o9BbEIuObWZEpuV6zPnj/NP4f/a0LxyA8FmVh4SEXGj9j6diJ7mu59+
	eda1XU2Mej73HGwYx2RQMG8Oe5+GiEADlfX7XBNl9YsULAK7kIiNNgNP55cCJx2Vp9zHfIZpdK/
	/1PNm9I5wSqOi1Nf/deouFS8RLY3+qHsjFhNZGpkbbx9UQV1yx/idgQ3uTRHx7Ef4/7dfsN28tm
	74jSZ9YQnV3UYfqtygKHTIQXVPUM0k1E15C+h4+SCPKANeILGokrBoBj4zO5pHoz9p4C1oUHVtw
	HYLCrc241xxc2H9c0daMJ0APHPTK29R81qqGv/q2uuw4+wyURpTW0ufZyy9UbaT9ck5aJlSY7t7
	W+Sv7AHfWV24/p9dySa1vmtlvzGOfP4pR01sK7DCNkD8Cehrbx6nglulzZvR0rzZkqu4J/R83B6
	NIz+ELVia0na1M=
X-Received: by 2002:a7b:ce17:0:b0:480:63c1:3ac7 with SMTP id 5b1f17b1804b1-483178e3012mr144760605e9.2.1770629363207;
        Mon, 09 Feb 2026 01:29:23 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/25] inetutils: Fix CVE-2026-24061
Date: Mon,  9 Feb 2026 10:28:49 +0100
Message-ID: <66c0a08c1e1df861aadf673c4148a138ed7b00ce.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230757

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=ccba9f748aa8d50a38d7748e2e60362edd6a32cc
& https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fd702c02497b2f398e739e3119bed0b23dd7aa7b

Ref: https://lists.gnu.org/archive/html/bug-inetutils/2026-01/msg00004.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/CVE-2026-24061-1.patch          | 41 +++++++++
 .../inetutils/CVE-2026-24061-2.patch          | 85 +++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-2.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch
new file mode 100644
index 00000000000..f19cb5d18b8
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch
@@ -0,0 +1,41 @@
+From fd702c02497b2f398e739e3119bed0b23dd7aa7b Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 20 Jan 2026 01:10:36 -0800
+Subject: Fix injection bug with bogus user names
+
+Problem reported by Kyu Neushwaistein.
+* telnetd/utility.c (_var_short_name):
+Ignore user names that start with '-' or contain shell metacharacters.
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fd702c02497b2f398e739e3119bed0b23dd7aa7b]
+CVE: CVE-2026-24061
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ telnetd/utility.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index b486226e..c02cd0e6 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -1733,7 +1733,14 @@ _var_short_name (struct line_expander *exp)
+       return user_name ? xstrdup (user_name) : NULL;
+ 
+     case 'U':
+-      return getenv ("USER") ? xstrdup (getenv ("USER")) : xstrdup ("");
++      {
++	/* Ignore user names starting with '-' or containing shell
++	   metachars, as they can cause trouble.  */
++	char const *u = getenv ("USER");
++	return xstrdup ((u && *u != '-'
++			 && !u[strcspn (u, "\t\n !\"#$&'()*;<=>?[\\^`{|}~")])
++			? u : "");
++      }
+ 
+     default:
+       exp->state = EXP_STATE_ERROR;
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-2.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-2.patch
new file mode 100644
index 00000000000..2a572941904
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-2.patch
@@ -0,0 +1,85 @@
+From ccba9f748aa8d50a38d7748e2e60362edd6a32cc Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Tue, 20 Jan 2026 14:02:39 +0100
+Subject: telnetd: Sanitize all variable expansions
+
+* telnetd/utility.c (sanitize): New function.
+(_var_short_name): Use it for all variables.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=ccba9f748aa8d50a38d7748e2e60362edd6a32cc]
+CVE: CVE-2026-24061
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ telnetd/utility.c | 32 ++++++++++++++++++--------------
+ 1 file changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index c02cd0e6..b21ad961 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -1684,6 +1684,17 @@ static void _expand_cond (struct line_expander *exp);
+ static void _skip_block (struct line_expander *exp);
+ static void _expand_block (struct line_expander *exp);
+ 
++static char *
++sanitize (const char *u)
++{
++  /* Ignore values starting with '-' or containing shell metachars, as
++     they can cause trouble.  */
++  if (u && *u != '-' && !u[strcspn (u, "\t\n !\"#$&'()*;<=>?[\\^`{|}~")])
++    return u;
++  else
++    return "";
++}
++
+ /* Expand a variable referenced by its short one-symbol name.
+    Input: exp->cp points to the variable name.
+    FIXME: not implemented */
+@@ -1710,13 +1721,13 @@ _var_short_name (struct line_expander *exp)
+       return xstrdup (timebuf);
+ 
+     case 'h':
+-      return xstrdup (remote_hostname);
++      return xstrdup (sanitize (remote_hostname));
+ 
+     case 'l':
+-      return xstrdup (local_hostname);
++      return xstrdup (sanitize (local_hostname));
+ 
+     case 'L':
+-      return xstrdup (line);
++      return xstrdup (sanitize (line));
+ 
+     case 't':
+       q = strchr (line + 1, '/');
+@@ -1724,23 +1735,16 @@ _var_short_name (struct line_expander *exp)
+ 	q++;
+       else
+ 	q = line;
+-      return xstrdup (q);
++      return xstrdup (sanitize (q));
+ 
+     case 'T':
+-      return terminaltype ? xstrdup (terminaltype) : NULL;
++      return terminaltype ? xstrdup (sanitize (terminaltype)) : NULL;
+ 
+     case 'u':
+-      return user_name ? xstrdup (user_name) : NULL;
++      return user_name ? xstrdup (sanitize (user_name)) : NULL;
+ 
+     case 'U':
+-      {
+-	/* Ignore user names starting with '-' or containing shell
+-	   metachars, as they can cause trouble.  */
+-	char const *u = getenv ("USER");
+-	return xstrdup ((u && *u != '-'
+-			 && !u[strcspn (u, "\t\n !\"#$&'()*;<=>?[\\^`{|}~")])
+-			? u : "");
+-      }
++      return xstrdup (sanitize (getenv ("USER")));
+ 
+     default:
+       exp->state = EXP_STATE_ERROR;
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 0f1a0736bd4..486878022f0 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
+           file://CVE-2026-24061-1.patch \
+           file://CVE-2026-24061-2.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

