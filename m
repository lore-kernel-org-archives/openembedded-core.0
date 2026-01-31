Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD4BE6BF22
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 19:54:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16255.1769889239026698983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 11:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EmQtSnBT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260131195356324332686f00020756-6vjt4i@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260131195356324332686f00020756
        for <openembedded-core@lists.openembedded.org>;
        Sat, 31 Jan 2026 20:53:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=crfe9VM5586jbklN0lnNmCgbLp5llVIsS1CzuUbCtiI=;
 b=EmQtSnBT+UlyR67LvH6n4quh9b5a7URUUIHGqcARprbaW9VKhE1ERbrBqZW6t9osYfoEDb
 q/tK42jsMdYhVmoFVAh36spJKpWg46AUOqJYd4PavSKQvt/z4WjO47toZWngMJxsFvGtl1ja
 B/VFBi/NcZmgON4f3OE73c1MtNvLmLEPN4ikD4+ycmQsjzTA2s8XO53Fa5YTtHWOeSCPLazs
 t82mARG9b9Eoy6DC3/9JFFCBAKhawnZZVPEqeTYQdJYtqZLawbJzggz7dgiHITzkwLTUPNxX
 FgoFDZ32Mr2sIOa0F2N8SbfFmcZJHej3jU+2uK8g+qHrrPt2IHFaVymA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] inetutils: patch CVE-2026-24061
Date: Sat, 31 Jan 2026 20:53:52 +0100
Message-Id: <20260131195352.176238-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 19:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230249

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24061

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../inetutils/CVE-2026-24061-01.patch         | 38 +++++++++
 .../inetutils/CVE-2026-24061-02.patch         | 82 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  2 +
 3 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
new file mode 100644
index 0000000000..9c05df22c7
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
index 0000000000..62df504e60
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
index 9dcd494694..967ecdd442 100644
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

