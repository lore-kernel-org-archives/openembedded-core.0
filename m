Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A7CC4450F
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139220.1783291379239159972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AqGCw7Cz;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so25925205e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291377; x=1783896177; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrBjexWjWmu9IwIKjTRRM+cKTXs5fHh7ZV+uNPrm6Y4=;
        b=AqGCw7CzyHAtN90LwiET4NuHqeNhaROQbpdu84S9Y41ivA60ogonJjtq7aAwkqshUh
         57YzMKwkdSPND7uwwwLrbgZaJdp2VTsaRwTRUwXuX9yDpCAN6Hhu865Q2rxKgv0tko+G
         6liMzJm+n5rY4rh8fNxPska6HZ4IzNZAz5RAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291377; x=1783896177;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrBjexWjWmu9IwIKjTRRM+cKTXs5fHh7ZV+uNPrm6Y4=;
        b=ApVRdquNrnzvfBRgmV3D/A9Yv9unmBdhN/0U5/s+u/VVDSmXLGvu9ImsZFITq/Rghv
         U6lx3ykPEUHnUnH/hVpSLMTTZW9FD+v9bcypwYzTDeaO/GDhCUjjZxMPs6gr0e6I9FqH
         GIME5Se/270HUX4UqUSXJfBy+6/nxW2BB33ca2c87iKViaE5glhyX8YcmFVcbdA7MEG2
         N4ajEHmVT4+e6v6XZA0Te+hounwUHCdRF9dHtpSv0bPmnUJ8zy2WCov/+/juTQPi12hP
         FYmA/ngI67YR97iuBI4av/uxKdfdKk3YLWfGWhETlB+c8NzZTmiREWi1QakD7+K5bXUk
         +oyQ==
X-Gm-Message-State: AOJu0YyAQmqK0O2hQoeQjcApe4btU0USsUDTNfG21tF5or0LJrcd/jWM
	JGPM+z0cZgo0/6h9IMDLglRtPhgz6YgCXK2UT19JM6T9rHTfRwYSSeKvTkLJ9bDoEKwA8zLIiQw
	Lc4lWtEY=
X-Gm-Gg: AfdE7cn/uChcUaiyhde1Zwe0zQN96KF7nNOipGWAJp7JqZKnjh6nyRv8Vs691z8lNC7
	Qs/Ojxs4NtLYhvr/Iv3jVj98Bn4gQJ+3afUG/oxr9xdSYqJRC4ttcjzK55v9xpvuoqk/6xMXQfw
	pQsjq4DvdPuVB7i5iA94fzvzd/5qoO070CecZEA6kjg2xPtguT/VwpWKJ9PPLoqvhZxJ2iCTOVC
	OsTZhtTMhLA6dvjU+jJ9ENtyE9uUi3KJpFM3Auw2eQ4z6+uUFBno1oIAeFMSJx+Jq2WKFAVMJ0u
	IConBsPYF7BaI35oQQu2GLHleojQUQtQQGWeKd9r237v0pm90383A60w9juDumlUAVLF2R6/1cW
	uK+I2XjSmPN/DDK19rFSePCpsd3Z8zPyMvrb6t1wPBgVg6XWcYTmT1cjsQuDlryHSjNgrNb0VLo
	QRaYa6Fym40CIaXZ8M7HF1EtOTuZaIRnI1YUjP
X-Received: by 2002:a5d:64eb:0:b0:46d:d693:88cc with SMTP id ffacd0b85a97d-47aacbabea3mr7214018f8f.47.1783291377340;
        Sun, 05 Jul 2026 15:42:57 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/55] cups: fix CVE-2026-27447
Date: Mon,  6 Jul 2026 00:41:15 +0200
Message-ID: <43ac6d2b8dc7fa376abd8e70a665ca348fde4166.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240179

From: Anil Dongare <adongare@cisco.com>

Pick the upstream fix [1] for CVE-2026-27447 as referenced by Debian [2].

Also include the two upstream regression fixes that followed the CVE fix:

- CVE-2026-27447-regression_p1.patch [3] fixes a cupsd crash when the referenced
  user does not exist on the server. This regression was reported in
  OpenPrinting/cups Issue [5].
- CVE-2026-27447-regression_p2.patch [4] fixes unauthenticated print policies for
  non-local accounts. This regression was reported in OpenPrinting/cups Issue [6].

[1] https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb
[2] https://security-tracker.debian.org/tracker/CVE-2026-27447
[3] https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562
[4] https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0
[5] https://github.com/OpenPrinting/cups/issues/1555
[6] https://github.com/OpenPrinting/cups/issues/1557

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |   3 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  46 +++++++
 .../cups/CVE-2026-27447-regression_p2.patch   |  58 +++++++++
 .../cups/cups/CVE-2026-27447.patch            | 120 ++++++++++++++++++
 4 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 194b9c2638f..49b828506a1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -21,6 +21,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
            file://CVE-2026-39316.patch \
+           file://CVE-2026-27447.patch \
+           file://CVE-2026-27447-regression_p1.patch \
+           file://CVE-2026-27447-regression_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
new file mode 100644
index 00000000000..bbd44913d37
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
@@ -0,0 +1,46 @@
+From c4c0a46b266bd227fa3925ad08556a620da342ae Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 22 Apr 2026 12:40:14 +0200
+Subject: [PATCH] Fix cupsd crash if user does not exist on server
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6d97ee39fedf12a7a5429a74f4156ef9bb67f562]
+
+Backport Changes:
+- Rebase CHANGES.md context to the CUPS 2.4.16 changelog section.
+
+(cherry picked from commit 6d97ee39fedf12a7a5429a74f4156ef9bb67f562)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       | 1 +
+ scheduler/auth.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index d591ead..16e9527 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -7,6 +7,7 @@ Changes in CUPS v2.4.16 (2025-12-04)
+ 
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
++- Fixed cupsd crash if user does not exist (Issue #1555)
+ - `cupsUTF8ToCharset` didn't validate 2-byte UTF-8 sequences, potentially
+   reading past the end of the source string (Issue #1438)
+ - The web interface did not support domain usernames fully (Issue #1441)
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 3e7041e..d5f564e 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1835,7 +1835,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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
index 00000000000..69b7ea962cc
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
@@ -0,0 +1,58 @@
+From 6a712bd3b5236df3e1bd145e89ea1108fb860d8b Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 24 Apr 2026 14:06:06 -0400
+Subject: [PATCH] Fix unauthenticated print policies (Issue #1557)
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/849fba7d7a1144e48d45c5e6ba2504765912ece0]
+
+Backport Changes:
+- Rebase CHANGES.md context to the CUPS 2.4.16 changelog section.
+
+(cherry picked from commit 849fba7d7a1144e48d45c5e6ba2504765912ece0)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       | 1 +
+ scheduler/auth.c | 7 +++++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 16e9527..47b394b 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -8,6 +8,7 @@ Changes in CUPS v2.4.16 (2025-12-04)
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+ - Fixed cupsd crash if user does not exist (Issue #1555)
++- Fixed a regression in shared printing from non-local accounts (Issue #1557)
+ - `cupsUTF8ToCharset` didn't validate 2-byte UTF-8 sequences, potentially
+   reading past the end of the source string (Issue #1438)
+ - The web interface did not support domain usernames fully (Issue #1441)
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index d5f564e..7e211ff 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1835,8 +1835,9 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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
+@@ -1850,6 +1851,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 00000000000..b73377ce4d3
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,120 @@
+From f792687607462386ea3778fac5e0394da09c8a72 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:04:21 -0400
+Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and group
+ names as case-insensitive.
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/a0c62c1e69604ff061089b750073199fab5a1beb]
+
+Backport Changes:
+- Rebase CHANGES.md context to the CUPS 2.4.16 changelog section.
+
+(cherry picked from commit a0c62c1e69604ff061089b750073199fab5a1beb)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md       |  2 ++
+ scheduler/auth.c | 31 +++++++++++++++----------------
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 78a9a94..d591ead 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -5,6 +5,8 @@ CHANGES - OpenPrinting CUPS
+ Changes in CUPS v2.4.16 (2025-12-04)
+ ------------------------------------
+ 
++- CVE-2026-27447: The scheduler treated local user and group names as case-
++  insensitive.
+ - `cupsUTF8ToCharset` didn't validate 2-byte UTF-8 sequences, potentially
+   reading past the end of the source string (Issue #1438)
+ - The web interface did not support domain usernames fully (Issue #1441)
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 18ac443..3e7041e 100644
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
+@@ -1184,7 +1184,7 @@ cupsdCheckGroup(
+   group = getgrnam(groupname);
+   endgrent();
+ 
+-  if (group != NULL)
++  if (user && group)
+   {
+    /*
+     * Group exists, check it...
+@@ -1198,7 +1198,7 @@ cupsdCheckGroup(
+       * User appears in the group membership...
+       */
+ 
+-      if (!_cups_strcasecmp(username, group->gr_mem[i]))
++      if (!strcmp(user->pw_name, group->gr_mem[i]))
+ 	return (1);
+     }
+ 
+@@ -1209,25 +1209,24 @@ cupsdCheckGroup(
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
+@@ -1837,7 +1836,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
+ 	 name = (char *)cupsArrayNext(best->names))
+     {
+       if (!_cups_strcasecmp(name, "@OWNER") && owner &&
+-          !_cups_strcasecmp(username, ownername))
++          !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1849,7 +1848,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Connection */
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

