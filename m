Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881A4C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:48:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.18515.1651286914150547358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dI8qn84c;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.151, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651286914; x=1682822914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AhrFxMgbs+0yuchBoknxXaaNtyUGVGHK/2nDk8VNLb0=;
  b=dI8qn84cP8L6IujOl5+UIyV2YEs2copsdXBk4U7XEP+dMi5ifT6oKPvM
   2Vo21Z9wQTE1dQLrgxqpV9dLDzsKwfqTxzXRxJPAkAY2WjgkymBiTQmpv
   HuThOAG1v6Gp4hE51y9YjoyLqs8xlbE7f8ad7A47stLp8hyYkIi4hm9rr
   HsFAltO842N8IwzwC6avwbuY3GodZf38VSGx7Y8ucI0mvFe7EX/I7X41o
   dECkMpKvA9xfuBAyRI/6AFduBYPghzrm9IfbLxMvQgF1z0OZRFUB+xa9b
   nMiMfPe8Mb5WZul0fqgqWmI9Df7Xdzt4GEGYkqqC4vKxufus3wZ/yP8Ql
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="247377496"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="247377496"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="560687054"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:48:33 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH v3 1/3] base-passwd: Disable shell for default users
Date: Sat, 30 Apr 2022 10:48:10 +0800
Message-Id: <20220430024812.745583-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430024812.745583-1-jiaqing.zhao@linux.intel.com>
References: <20220430024812.745583-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 02:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165063

Change the shell of all global static users other than root (which
retains /bin/sh) and sync (as /bin/sync is rather harmless) to
/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
new file mode 100644
index 0000000000..dddc93ca35
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
@@ -0,0 +1,57 @@
+From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
+From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+Date: Mon, 18 Apr 2022 11:22:43 +0800
+Subject: [PATCH] Disable shell for default users
+
+Change the shell of all global static users other than root (which
+retains /bin/sh) and sync (as /bin/sync is rather harmless) to
+/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+---
+ passwd.master | 32 ++++++++++++++++----------------
+ 1 file changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/passwd.master b/passwd.master
+index e1c32ff..0cd5ffd 100644
+--- a/passwd.master
++++ b/passwd.master
+@@ -1,18 +1,18 @@
+ root::0:0:root:/root:/bin/sh
+-daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+-bin:*:2:2:bin:/bin:/bin/sh
+-sys:*:3:3:sys:/dev:/bin/sh
++daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
++bin:*:2:2:bin:/bin:/sbin/nologin
++sys:*:3:3:sys:/dev:/sbin/nologin
+ sync:*:4:65534:sync:/bin:/bin/sync
+-games:*:5:60:games:/usr/games:/bin/sh
+-man:*:6:12:man:/var/cache/man:/bin/sh
+-lp:*:7:7:lp:/var/spool/lpd:/bin/sh
+-mail:*:8:8:mail:/var/mail:/bin/sh
+-news:*:9:9:news:/var/spool/news:/bin/sh
+-uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
+-proxy:*:13:13:proxy:/bin:/bin/sh
+-www-data:*:33:33:www-data:/var/www:/bin/sh
+-backup:*:34:34:backup:/var/backups:/bin/sh
+-list:*:38:38:Mailing List Manager:/var/list:/bin/sh
+-irc:*:39:39:ircd:/var/run/ircd:/bin/sh
+-gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
+-nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
++games:*:5:60:games:/usr/games:/sbin/nologin
++man:*:6:12:man:/var/cache/man:/sbin/nologin
++lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
++mail:*:8:8:mail:/var/mail:/sbin/nologin
++news:*:9:9:news:/var/spool/news:/sbin/nologin
++uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
++proxy:*:13:13:proxy:/bin:/sbin/nologin
++www-data:*:33:33:www-data:/var/www:/sbin/nologin
++backup:*:34:34:backup:/var/backups:/sbin/nologin
++list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
++irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
++gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nologin
++nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
+-- 
+2.32.0
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 9a27ad3ab5..ef7792ae49 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://input.patch \
            file://disable-docs.patch \
            file://kvm.patch \
+           file://disable-shell.patch \
            "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
-- 
2.34.1


