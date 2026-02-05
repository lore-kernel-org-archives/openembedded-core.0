Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556B0EC1E89
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 09:55:40 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17176.1770285337068780640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 01:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WTXKEPjt;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso2107592e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 01:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285335; x=1770890135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+Y3zKs6ql+//PnLa/l+lo2jkAJBsS2cAyFGxZm26H0=;
        b=WTXKEPjtczeaEimN+3ze736twoa0xUAGM4GNJEAnhZCIlNzUala5Yemgyd5IpTagWl
         i3SxZUAaVf6OnSUq807GZRznfl7GEIoCTIRl6b/wIlqLQZdyVIVSceGcWsT3VnNRFWoV
         ymZMXqwG8OmfyCsdDNChFLpDO98QQ2S1IGEEixqXwYSwwdb1zMUSnQk/zBrGkPGzUylt
         qgo1UmBwcXjpit3h/u6lin7IFh2/EKPB/7bGTzerTudpapKNcCDR/F7yPCqH/DbC1WFx
         4dfb91cphDGd39U61vFg7N/mvdunTavYShnmoaRMdnMJ4cBEHu/isvkSgtnPUdlgfW5z
         PqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285335; x=1770890135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+Y3zKs6ql+//PnLa/l+lo2jkAJBsS2cAyFGxZm26H0=;
        b=uU/TWx6bdDlayR+Sagmi1wxz75j/gYw/Zw49yeR3I9LtO3wW+87nkx/N1emGj4AtZw
         Shsa6j6uQ1gJOxo4hY/8iHYsiU9CWOfrVkCgzINoQU2Cv+HP8Vm/o8V0GKrpoq8cnM2e
         8QH1JlTF8VC11oWbadi9plySpsN+oKRkXtOMkUbSTNn5JK50FEt84U5aoqx4PWvmHwC0
         JdEuCOyVVsxxkHGMDS3IpocsrWMb5A5weOelVtbHWU8cfwvd6CDVA/RFFaI17MjVxA7y
         q2aXNfW00LVqExvlp/f3pOC9W+4V9w5qMbdk16vxb4Ih1R02qy2NbC6Hrd3eDsWw6IU0
         fTKg==
X-Gm-Message-State: AOJu0Yw5E/7fkkhdl06X+ca2OFTx39hBbURw1ckFMIeirqIjc0NOWmAp
	Tps8W+VtIL290/+sWS2aryZFmeMYRUPBrX0aquEaQCDqoxgYe52wIBp899/pTQ==
X-Gm-Gg: AZuq6aKj5souSveuZhuuKPkSFsklzjxH40efvz/aV2b4gQchxP9L40K3notKaQ3dt8L
	pSyxPfz1LDEqxTZcslvLbvws/pdXXXPE+jO1+eP+xZbkNwVNxearMFuDzlg/9I/bQEAq8FnuUlL
	8TOEgzC5V9aQYj0Anjg5X+kKsLNEaOWrGVYye9B5BoEOdrNTfjYs2bJPqvfWZjLqaLjrbF9Y5Yt
	wLJqTuH0rk2TfL+dUNjDmyajFCoboCsOIo26XK4AtN88j/8KXtj4zKqtoIpUMoFxBfrsoIlA15T
	XUWMUIVCLjP9QKXBTu3AgqKzKlBOBNrSuLyxsaVB1v2alygWSa4hTt9iPFchfkGKXSPkluhNWf9
	LOpcFi+aVEO+Yjl1rX4TsMGCMqeiEnOFB/5JFTZcPdvqHlZB9WUwDPjeYKV0ItXtBCG6zXIpkOr
	URrCYmAHCFdDvLk0deuPWPvpl2KJDvFwKfnEQ1XG9I7IvwhvsvMs8bB9+UTJNuv3sKZjlHUEbOf
	xWmdE8KyWbKbBc=
X-Received: by 2002:ac2:4f0c:0:b0:59d:f5a6:bea9 with SMTP id 2adb3069b0e04-59e3c7aebd6mr899749e87.1.1770285334175;
        Thu, 05 Feb 2026 01:55:34 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3882ece1sm1291120e87.93.2026.02.05.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:55:33 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] inetutils: fix CVE-2026-24061
Date: Thu,  5 Feb 2026 12:55:25 +0300
Message-ID: <20260205095525.1104867-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 09:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230570

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24061

The vulnerability is about:

The telnetd server invokes /usr/bin/login (normally running as root)
passing the value of the USER environment variable received from the
client as the last parameter.

If the client supply a carefully crafted USER environment value being
the string "-f root", and passes the telnet(1) -a or --login parameter
to send this USER environment to the server, the client will be
automatically logged in as root bypassing normal authentication
processes.

This happens because the telnetd server do not sanitize the USER
environment variable before passing it on to login(1), and login(1)
uses the -f parameter to by-pass normal authentication.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
 .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
 .../inetutils/inetutils_2.7.bb                |  2 +
 3 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
new file mode 100644
index 0000000000..1de4f82d1c
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
@@ -0,0 +1,38 @@
+From fd702c02497b2f398e739e3119bed0b23dd7aa7b Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 20 Jan 2026 01:10:36 -0800
+Subject: [PATCH] Fix injection bug with bogus user names
+
+Problem reported by Kyu Neushwaistein.
+* telnetd/utility.c (_var_short_name):
+Ignore user names that start with '-' or contain shell metacharacters.
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+CVE: CVE-2026-24061
+Upstream-Status: Backport [https://codeberg.org/inetutils/inetutils/commit/fd702c02497b2f398e739e3119bed0b23dd7aa7b]
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
new file mode 100644
index 0000000000..6e7496efb4
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
@@ -0,0 +1,82 @@
+From ccba9f748aa8d50a38d7748e2e60362edd6a32cc Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Tue, 20 Jan 2026 14:02:39 +0100
+Subject: [PATCH] telnetd: Sanitize all variable expansions
+
+* telnetd/utility.c (sanitize): New function.
+(_var_short_name): Use it for all variables.
+
+CVE: CVE-2026-24061
+Upstream-Status: Backport [https://codeberg.org/inetutils/inetutils/commit/ccba9f748aa8d50a38d7748e2e60362edd6a32cc]
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index 6cffade97f..a866ca5339 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
+           file://CVE-2026-24061-01.patch \
+           file://CVE-2026-24061-02.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.43.0


