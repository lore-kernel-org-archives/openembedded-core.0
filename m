Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67F0C43217
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:40:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.6288.1652434846878843779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iE3yRjpj;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652434848; x=1683970848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VYQyYejM5juxuY+tLnKxG4yQwZ529kKImW1FZ8x6YYk=;
  b=iE3yRjpjkknEC7q7jbC3YvqKVcoUoSP5nrEFBUn9FEUUfZPYdib5ZtqX
   sCHU335mx8K85KhcILXXcLAaxjFVWwMwCJL2ux760hiU4zC0BXrJ0r49S
   JGBQ5VepPT2aMrrE4wehfv7LNIJOsjerF30hW+AZ0Bh3Tyju7pM9bakdm
   7PFZSltbdri/KNkRfdcIRBnFMMojy2fTV2kpXmlsdO0/w4PSDspATzTqi
   FLwKnkWbtYACg4vPiAmBdQf+OywGqCFplZ++H3vM2xbPicdBxY46LIM8u
   HzdyUnMwG20Tl7LCZZOyf1EtE1G0nrPNR78Favfun/tFPLT0siLNmjD9f
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270399133"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="270399133"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600";
   d="scan'208";a="595144130"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:40:45 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: davide.gardenal@huawei.com,
	Davide Gardenal <davidegarde2000@gmail.com>,
	Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] [PATCH v3 3/3] base-passwd: Disable shell for default
 users
Date: Fri, 13 May 2022 17:40:16 +0800
Message-Id: <20220513094016.3345337-4-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220513094016.3345337-1-jiaqing.zhao@linux.intel.com>
References: <20220513094016.3345337-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165551

From: Davide Gardenal <davidegarde2000@gmail.com>

Change the shell of all global static users other than root (which
retains /bin/sh) and sync (as /bin/sync is rather harmless) to
/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3bc4d7a0a39a96f6e8d340e1b2654d47475f07)
Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
new file mode 100644
index 0000000000..bfaa786018
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


