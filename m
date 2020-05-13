Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2703.1589363374904351883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 02:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04D9nCOu003744
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 02:49:23 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 13 May 2020 02:49:22 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/6] bitbake.conf: rename VOLATILE_LOG_DIR to VOLATILE_DIR
Date: Wed, 13 May 2020 17:48:42 +0800
Message-ID: <20200513094847.14326-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513094847.14326-1-changqing.li@windriver.com>
References: <20200513094847.14326-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

To support persistent /var/tmp, rename VOLATILE_LOG_DIR
to VOLATILE_DIR

Don't use VOLATILE_LOG_DIR/VOLATILE_TMP_DIR
to control it separately since it will make things complicated,
we need to make kinds of fs-perms*.txt for kinds of combination
of the two variables.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdade79abe..8fd688c793 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,9 +86,11 @@ USRBINPATH_class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
-# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
-# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
-VOLATILE_LOG_DIR ?= "yes"
+# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to
+# /var/volatile/log, /var/tmp links to /var/volatile/tmp
+# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log and /var/tmp
+# is on persistent storage.
+VOLATILE_DIR ?= "yes"
 
 ##################################################################
 # Architecture-dependent build variables.
@@ -350,7 +352,7 @@ FILESEXTRAPATHS ?= "__default:"
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
 #  oldincludedir
-FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
+FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_DIR')) else 'files/fs-perms-persistent.txt'}"
 
 ##################################################################
 # General work and output directories for the build system.
-- 
2.17.1

