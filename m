Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C88D61015
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 13:01:47 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14009.1769691702898255981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 05:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T2+d5lGs;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso530933a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 05:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1769691702; x=1770296502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uSOKBCd2f1ZZ22wjYfF6PZU97Pw3sfzIyNixmyqrds=;
        b=T2+d5lGsEeTB6olHajVJU9/9T8FZKkMcjsjS4YqsstdTK50tacemZ7dPrRLrHbE0cB
         LM/tomrCqkiL5Y9pVNDJj19Ebs+vi7ycDeDbrFf6+jSz/xOqYrAEQL9WbYr30SwzDp/L
         Q2WLsPUpThzD9Ur+heCenRM8IaywOPrT5fyU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769691702; x=1770296502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uSOKBCd2f1ZZ22wjYfF6PZU97Pw3sfzIyNixmyqrds=;
        b=ihziVxEnGiUsObP8xC79/Dmf6CItcFuSFGkDHbrIoHmB3GdWi3dV36G/lqce8LAQQn
         Qd+8NbCHcj5VlPAB6624r40lGCZHVi7eIoqTOCCzsSUfW9qLeBhbw1ZwS0QbZKNmlhkQ
         2SD2wsaauonzelF62qXR3CsswOjikzjHF3GIPWRTj/W4LEumk7Kxm2I5fxKs9DoMXxPY
         sa2fgOWC/SXcwi54w4uNGUmwQ4CfEeH/IvOtQmdcwdZISxdjMCeKJwcD1i64Kx82yRNh
         sjxmhGEXoJooY/h7mQKo0f3OI+K2mjsJpgGTkcmjAtibJzDUS3I5U2JjoZtkRwe6W0J/
         A9iQ==
X-Gm-Message-State: AOJu0Yxo23bZDq8i7xFZLr2BTdruNijYSimMqeHrcTG12EzcP5LfiU0L
	Vh7Wqxtx+u+6ghV4E9AhBGDK1rUFBALiSFEw06Ba9d0so1bvRxQwaUs2fVeKU2LZb4OSgXMaF4F
	BfGqdFi8=
X-Gm-Gg: AZuq6aIFhL8J2Lh4ulEKF3vLJzsdh1Jrb+hICByhYAnfhDibpEJq4jtPZcrBaI4EWYM
	4hStVdN/4zKhHcAZTA35QER5FzmMPtBlz3Nbmz88wG2JvUEKTLbmJC1rn3YFpAH76ycK8wktRZ0
	ro4aL4sTJ8Q0WMkbDdZRS/Mt77tg9pSh9JfEgDkndweNnNp9zd4qAYSfN4Mt0WM7dPHzYesnGLv
	yvKMCxNOcOFTY+A+hlNJbFesMmSD/3vjyfaQnsfZsq5ICkdspOqHxSGzn3Z06RFG7bHzbCDoYE4
	17EX6vWmqLNgcFM9Bn19oIwUmWv+az39OAzOxzYbJa3ymHv1d7QHjHxFNLI5bD1wz5fH3EM6YB1
	n0iUxFC3zN+fok29t+kSLdDIMtRJhZ8NOv6u/QKXodm452K8EJU6MdMRWuGFwdUg1+wkRK93FAz
	FRKmheYsugN3s=
X-Received: by 2002:a17:90b:1fcc:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-353feccedcbmr7709032a91.13.1769691700276;
        Thu, 29 Jan 2026 05:01:40 -0800 (PST)
Received: from MVIN00352.. ([2406:7400:54:f9ef:21d1:3d3e:fb87:fab9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cae91sm5445800a91.4.2026.01.29.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:01:39 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] inetutils: Fix CVE-2026-24061
Date: Thu, 29 Jan 2026 18:31:29 +0530
Message-ID: <20260129130130.2285124-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 13:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230136

Upstream-Status: Backport from
https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=ccba9f748aa8d50a38d7748e2e60362edd6a32cc
& https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fd702c02497b2f398e739e3119bed0b23dd7aa7b

Ref: https://lists.gnu.org/archive/html/bug-inetutils/2026-01/msg00004.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../inetutils/CVE-2026-24061-1.patch          | 41 +++++++++
 .../inetutils/CVE-2026-24061-2.patch          | 85 +++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-2.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch
new file mode 100644
index 0000000000..f19cb5d18b
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
index 0000000000..2a57294190
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
index 0f1a0736bd..486878022f 100644
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
-- 
2.43.0


