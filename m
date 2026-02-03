Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02547E6E7EC
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13496.1770113978512983091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Wgdq0MKE;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc544b09so5015751f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113977; x=1770718777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=043g8tVyPluDOMQRX2rLEAAAMB3QM5vHiwDR8dAWvGw=;
        b=Wgdq0MKEh9zmlFkyKAkpNsu1qIiWb7YiQKJODEPJvceodbGcy4+4Vi6vgSL0MW/Re+
         yaluRKUT/ccFm5GjXBM6GtODkDChW28/rwP84yCWtqv9vAt5qV6MmJCIS5DmiwzMgKdl
         WxuAiyEKP11FAxCnO2qEMp0Ft9U6+IhDjQ5nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113977; x=1770718777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=043g8tVyPluDOMQRX2rLEAAAMB3QM5vHiwDR8dAWvGw=;
        b=PJn/80pdtoJF1NtC/h+ESya4RsPNjPpyuK7aDgAbYXDUbHjzsr9AbmSmehcLnQTbhv
         J97zQaB3mKXob90lgEREkt/cjY5YEuIRHTDgX3yLhKotM9OBub/F39N9o4E66nt4RFjT
         zgRza7kDMZnVfB3eakN/WTjafk0h7tdfIWG7Y6phCZqVNmbuI9GkTVwrauP5ciGCUeMc
         gQaxDRySLvO527SWii176fg72c++vK7SHq/JtDy8xZPCfCEvKTUU6cpr+bJAKRgRLsZo
         Be9UC2FH2/1CkPPEWZo2k6sb7dqv8LNV41UoZVIKVKtj0oLWopFbZifrxv+0CGVesMbv
         glkg==
X-Gm-Message-State: AOJu0Yx7vYEk+DbQevVVN45KYZn+RfWP9Vh9SUbkTTrR2vBaR6iF0lQS
	idHSpzrrtCvzIaLkR3G/b0V/bTlHPZCIvRVB4McEiIBY+rbWbSI/ahWaAcGYw3J+NJ4CJ2c8tkL
	7VWEXJgk=
X-Gm-Gg: AZuq6aLkVi0iLD2x7l7R9n3rnkoODYu4W0/JLCu9IsKp3P1z6b55qXljrs6PmtkzHg0
	KvwcRv+FrKWR4xaftQN9dJMKJUOv1h8kzasA4a32fFxe6apDImS+IFIKnbty6eCJoqGPBNCmkZh
	waaziGBcjvP/VHzPv80BgJQO8lRizEMbPJI6/zCc1WwSt1yI6r0zFoSN8lmkyknTDzEVmEC2nUM
	z6iK6NcbuUUsWeDrxxkLzRlt9OSzfNwMPuWvAUSKz4cvO7EPojponfKn7TILIkG15IVliTkUnRh
	uAMWcQ2Hei0eU+NBn3Ae2xAePuBAxkaJoph2LspKKCrt3gMDTQgTBfFFOvfTEwm8vdzLAvrWbDq
	UbBFmKoeGe1at0ohOi63a+O6LhZXrqw7mSUFLkXDXWhAoy39wy6+FoFo64uRdMmZLq6LCjhcy+g
	z9wYrlnRZ4p/nqq4pFP5WjfFDgx5ET4utL2e40FmbGdoqGKYug3YW/Lh3r0DVptd5WgTHlyfF1I
	5HhGW+bRK25ros=
X-Received: by 2002:a05:6000:604:b0:42f:ba58:6599 with SMTP id ffacd0b85a97d-435f3aa7b4amr21999287f8f.35.1770113976570;
        Tue, 03 Feb 2026 02:19:36 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 22/22] inetutils: patch CVE-2026-24061
Date: Tue,  3 Feb 2026 11:16:51 +0100
Message-ID: <fa3bb54d2423728b6421367c1218003a0765dd22.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230450

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24061

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
 .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  2 +
 3 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
new file mode 100644
index 00000000000..9c05df22c7c
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
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
index 00000000000..62df504e60d
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
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 9dcd4946943..967ecdd4426 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
+           file://CVE-2026-24061-01.patch \
+           file://CVE-2026-24061-02.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

