Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9701BC54F56
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7382.1785054619349341971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t8rQpCWw;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so13019635e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054617; x=1785659417; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uU4ngZ8vQXBZJAg1zBzDox7LCG+wlQN+2Hnxi2OI80k=;
        b=t8rQpCWw5zbvsT8DYYA84Jx7x2zWdx3wXMibhv/n97UAa0dMzLvF3vDRri2G1EqeUr
         uYW4feDI8Q42QrY0ynsATNNf2lrjwQ4M1TcGa1rHb31fgr1emeFa2iyIX6FNMgFMDvpE
         iqGhXhk47k9ylfkhaV2w9mGUxPUeMXHsEFw6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054617; x=1785659417;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU4ngZ8vQXBZJAg1zBzDox7LCG+wlQN+2Hnxi2OI80k=;
        b=U+l+oIcdipYjJjusLZQJpA4wtTywChQx64CmrqSbM02fOZ5oljieTtWpHuivvu01wB
         KjyN5upOXVOAhVHxiLiiHUGM/ab9sW+VEnnlYgIxyNtbVO05BsUKbnyMk8LAPbjkqFFE
         iqMaEYwwHAlGxQZNDVifIY+P8fAufgw//SL24KKxLp6lDa2IZICYL5RQHYTIjyYpU+jc
         BKEFqa9jTlGJHVzYJvWiKqg4v3ZUmjSc/4uBCGRniijOTfNT61BmxdQAs5Mb2z7fJC3v
         1N/dpCD98Sf9GsmSvzxn9OlwMYew0bRCl1vQl+9dx7bpenRNfmV5h3vFmwRLxszj3/Lg
         +83A==
X-Gm-Message-State: AOJu0YxnUj5dMiYrUL+iwrBzCRvnLNjNhs8McTgwybe5juwaV+KuYNSF
	V+IGffUpOVfMgFLgmgEdlD1gPYHPMDGPPJW5y/ru5A23P3o4PW+F5qpAGJBHOV4MFyF1cAgGcI8
	LqnLAgG0=
X-Gm-Gg: AR+sD11D7SWP8iXqTJQFpTDw3HRcc1U6og7g70yigisQRDdXdwv5DHmFBq+7nZAi+cK
	TJdh2Ou3H5YGSNuQeHSIrP6X1aRQGNp76onoLNoVc4MRimQkZSYTQk7ecKaYM2OsYKctW+MoIU1
	T2tCQbsG5p+nyMiOvPC73/GwuqxfbOYuLEL/hJEISdJm1SPaMpVhqDRvVDA3zT8yKYW+U3ESyRL
	IB4JWeEnV2FIIcuIwbOBZDvqHXfcZ/mSc2YeYeNuSd1d3ufiyz+/zno9JfjTg8iLnyd+JSeqRqq
	eWxCY7uDyepdzzwgz15nP8Q3p1fkb+7UorkQhyfk0cuJY2HbCn/RmAC6SJrCYkmkIshQUnP5YKY
	IV5jn31GoeLq9W3jxrY4bGO3GCzccIVYeWZ9QLWO+WniIZkzp8ZqV4G6EJFEjZ/PbPWzcELQP82
	JwdXXWHeXLWAwfle5Qp99o/dnfjbvI9a3MU/SjBZ92zCQruQYBhaa8EFxtx/Wxxuy8MbIHeP8JR
	ToLIw==
X-Received: by 2002:a05:600c:1f8c:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-496bbcbb36emr17192885e9.18.1785054617490;
        Sun, 26 Jul 2026 01:30:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/31] cups: fix CVE-2026-27447
Date: Sun, 26 Jul 2026 10:29:37 +0200
Message-ID: <f2aac255fcc1c44ed30a191ba18c4ad46ea4c807.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241995

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream backport [1] for CVE-2026-27447 as mentioned in [2], where
the scheduler treated local user and group names as case-insensitive.

Also include the two upstream regression fixes that followed the CVE
fix:
- CVE-2026-27447-regression_p1.patch [3] fixes a cupsd crash when the
  referenced user does not exist on the server. This regression was
  reported in OpenPrinting/cups Issue [5].
- CVE-2026-27447-regression_p2.patch [4] fixes unauthenticated print
  policies for non-local accounts. This regression was reported in
  OpenPrinting/cups Issue [6].

[1] https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb
[2] https://security-tracker.debian.org/tracker/CVE-2026-27447
[3] https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562
[4] https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0
[5] https://github.com/OpenPrinting/cups/issues/1555
[6] https://github.com/OpenPrinting/cups/issues/1557

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |   3 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  33 ++++++
 .../cups/CVE-2026-27447-regression_p2.patch   |  46 ++++++++
 .../cups/cups/CVE-2026-27447.patch            | 108 ++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c7475d2b813..ec9392b73dd 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2025-58436.patch \
            file://CVE-2025-61915.patch \
            file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
+           file://CVE-2026-27447.patch \
+           file://CVE-2026-27447-regression_p1.patch \
+           file://CVE-2026-27447-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
new file mode 100644
index 00000000000..d581ee36fdf
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
@@ -0,0 +1,33 @@
+From 6d97ee39fedf12a7a5429a74f4156ef9bb67f562 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 22 Apr 2026 12:40:14 +0200
+Subject: [PATCH] Fix cupsd crash if user does not exist on server
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562]
+
+Backport Changes:
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 6d97ee39fedf12a7a5429a74f4156ef9bb67f562)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/auth.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 1678a29..4798e86 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1810,7 +1810,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name;
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+-      if (!_cups_strcasecmp(name, "@OWNER") && owner &&
++      if (!_cups_strcasecmp(name, "@OWNER") && owner && pw &&
+           !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+-- 
+2.43.7
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
new file mode 100644
index 00000000000..e46db92c760
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
@@ -0,0 +1,46 @@
+From 849fba7d7a1144e48d45c5e6ba2504765912ece0 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 24 Apr 2026 14:06:06 -0400
+Subject: [PATCH] Fix unauthenticated print policies (Issue #1557)
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0]
+
+Backport Changes:
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 849fba7d7a1144e48d45c5e6ba2504765912ece0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/auth.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 4798e86..1dd520d 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1810,8 +1810,9 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name;
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+-      if (!_cups_strcasecmp(name, "@OWNER") && owner && pw &&
+-          !strcmp(pw->pw_name, ownername))
++      if (!_cups_strcasecmp(name, "@OWNER") && owner &&
++          ((pw && !strcmp(pw->pw_name, ownername)) ||
++           (!pw && type == CUPSD_AUTH_NONE && !_cups_strcasecmp(username, ownername))))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1825,6 +1826,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+       }
+       else if (pw && !strcmp(pw->pw_name, name))
+         return (HTTP_OK);
++      else if (!pw && type == CUPSD_AUTH_NONE && !_cups_strcasecmp(username, name))
++	return (HTTP_STATUS_OK);
+     }
+ 
+     for (name = (char *)cupsArrayFirst(best->names);
+-- 
+2.43.7
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 00000000000..1614faa7f17
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,108 @@
+From 37b8a4387864eded1a15a45db8950a23e5c610d2 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:04:21 -0400
+Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and group
+ names as case-insensitive.
+
+CVE: CVE-2026-27447
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb]
+
+Backport Changes:
+- Rebase scheduler/auth.c context to the CUPS 2.4.11 source carried by this
+  recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit a0c62c1e69604ff061089b750073199fab5a1beb)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/auth.c | 31 +++++++++++++++----------------
+ 1 file changed, 15 insertions(+), 16 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index d0430b4..1678a29 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1,7 +1,7 @@
+ /*
+  * Authorization routines for the CUPS scheduler.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -1159,7 +1159,7 @@ cupsdCheckGroup(
+   group = getgrnam(groupname);
+   endgrent();
+ 
+-  if (group != NULL)
++  if (user && group)
+   {
+    /*
+     * Group exists, check it...
+@@ -1173,7 +1173,7 @@ cupsdCheckGroup(
+       * User appears in the group membership...
+       */
+ 
+-      if (!_cups_strcasecmp(username, group->gr_mem[i]))
++      if (!strcmp(user->pw_name, group->gr_mem[i]))
+ 	return (1);
+     }
+ 
+@@ -1184,25 +1184,24 @@ cupsdCheckGroup(
+     * belongs to...
+     */
+ 
+-    if (user)
+-    {
+-      int	ngroups;		/* Number of groups */
++    int		ngroups;		/* Number of groups */
+ #  ifdef __APPLE__
+-      int	groups[2048];		/* Groups that user belongs to */
++    int		groups[2048];		/* Groups that user belongs to */
+ #  else
+-      gid_t	groups[2048];		/* Groups that user belongs to */
++    gid_t	groups[2048];		/* Groups that user belongs to */
+ #  endif /* __APPLE__ */
+ 
+-      ngroups = (int)(sizeof(groups) / sizeof(groups[0]));
++    ngroups = (int)(sizeof(groups) / sizeof(groups[0]));
+ #  ifdef __APPLE__
+-      getgrouplist(username, (int)user->pw_gid, groups, &ngroups);
++    getgrouplist(user->pw_name, (int)user->pw_gid, groups, &ngroups);
+ #  else
+-      getgrouplist(username, user->pw_gid, groups, &ngroups);
++    getgrouplist(user->pw_name, user->pw_gid, groups, &ngroups);
+ #endif /* __APPLE__ */
+ 
+-      for (i = 0; i < ngroups; i ++)
+-        if ((int)groupid == (int)groups[i])
+-	  return (1);
++    for (i = 0; i < ngroups; i ++)
++    {
++      if ((int)groupid == (int)groups[i])
++	return (1);
+     }
+ #endif /* HAVE_GETGROUPLIST */
+   }
+@@ -1812,7 +1811,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+       if (!_cups_strcasecmp(name, "@OWNER") && owner &&
+-          !_cups_strcasecmp(username, ownername))
++          !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1824,7 +1823,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+         if (cupsdCheckGroup(username, pw, name + 1))
+           return (HTTP_OK);
+       }
+-      else if (!_cups_strcasecmp(username, name))
++      else if (pw && !strcmp(pw->pw_name, name))
+         return (HTTP_OK);
+     }
+ 
+-- 
+2.43.7

