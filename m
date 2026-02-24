Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3A2F357A3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21272.1771943102543802912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jRh32x7Y;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48375f10628so36298015e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943101; x=1772547901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDnOobl23b82oGIE9jMVW6CWPSc/cnk2AVzEFkIKDYM=;
        b=jRh32x7YwEugrwLzllvs9idZALoRvnVTqL0VPjTpa5xlZGCimADv+Gn1D0qHpoo7Hv
         7UpfDcDq79n77ZcWWnV7tMLDkU23H9OODXwqt5pWdwoilSZQUGyJ2uCLb14MAdq2w2RZ
         H5jE6BTflmIBbJmF3yRor0w8W5YnMJjb9jwCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943101; x=1772547901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EDnOobl23b82oGIE9jMVW6CWPSc/cnk2AVzEFkIKDYM=;
        b=P9UtGbtq/vdB0wLoVYS30T6SveomXaHaEiX08OyNEKhiLUO06rKRCDw/q4ZuCPvr0W
         m3B9MnPjPDYqcVfkJ4W6B5qGSjBta7s6UEv70rvUVk6PXyfxkfWHoXfwioLu4itWOFrN
         r5Z0QNfMYr3j3EkahSTlDsQOqD19pJrKSwj+v59Dq6Gt8YvRCu8uzzBnNmBt2TLEHDPJ
         nk1jU/2TWsCBSgV3s+bkn52ZB75FlxU9gKKnZE6zhn3q05fsHuhPDLRyABSx7RAzWkFe
         WVYMUe1klOhbDm3s3KcZRGdI+SYQuA/9Qvhx8faBlOEsBF9TpYeYOTjWyLq7OSkQQLxv
         P0Dw==
X-Gm-Message-State: AOJu0YzPr+cN6M7WdgjDfo+IwtLb6/IjtT+UxePnCWKXvpIfsYgnm80E
	uG4trE9vkxoKhMnG4/IAxP5ia9E/JtaJ+ZNNhVnp4xAH5WbbSCLo1hcDWNwe61488IxgP1c3rbb
	TSB7G
X-Gm-Gg: AZuq6aLCMeHnAQa+Q3nUc55WwR8rRDamkdzC/tlLzmZEZy2BBaCYiWCCJWtS5UaDtCC
	dBhTFZFTu9em174Tr83T8Juz3G6Wr9lPn9iNfBMdh4uDCbU7ugbqI3VpbSidY219v1z4spsYGkW
	QGwB4pZqoJmgiri8Si406WS+St5M06s8zQ7cuOgv19z/ey9AeY4fTOG5dB/MwfD6RwPotULPUTb
	OTiFkccSLuY4/G8Qpix8Fxdj8quKwIf6x3PaTwkx9eKCcquwLTF395UKkqHZTexIaI6Cm4IWzm4
	qM2/zMrbukhP25vQf6HlEFPN0iiVyspoA86amB9mYX/4Kw0ak1HKgKqTyWJp5GFAAq6RT/gsoIg
	jCSrz68SE04fraSh4ANkR1bjv0CUgbrONZ4QHWLMNXEpGqrHmN9dXJlUnCN3J424Nb0At/UNfwD
	kDGOyh+/nFvxA2G1oJII1elIicZGQpT3xhmTgBFZ3ARctPXGIqJTZ9y7SG/iqUY2vVOgTIGP6aa
	2w3m0xp5w9RzUyQrLd6ewFQmjptBcrxjw==
X-Received: by 2002:a05:600c:3b0a:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-483a95be7c9mr245387585e9.13.1771943100585;
        Tue, 24 Feb 2026 06:25:00 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/38] inetutils: patch CVE-2026-24061
Date: Tue, 24 Feb 2026 15:24:02 +0100
Message-ID: <bd39bd3b6d49c8ddc9de403d60d6dc3a162ab27e.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231775

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24061

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
 .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
 .../inetutils/inetutils_2.2.bb                |  2 +
 3 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
new file mode 100644
index 00000000000..0af666cb1a9
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
+@@ -1737,7 +1737,14 @@ _var_short_name (struct line_expander *exp)
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
index 00000000000..5a012eb2958
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
+@@ -1688,6 +1688,17 @@ static void _expand_cond (struct line_expander *exp);
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
+@@ -1714,13 +1725,13 @@ _var_short_name (struct line_expander *exp)
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
+@@ -1728,23 +1739,16 @@ _var_short_name (struct line_expander *exp)
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 6f9173dbc11..9f4e1a82e1b 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -24,6 +24,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2022-39028.patch \
            file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
            file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
+           file://CVE-2026-24061-01.patch \
+           file://CVE-2026-24061-02.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo

