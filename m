Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 047FA60F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 08:56:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8H8uIsE021575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 01:56:18 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Sep 2013 01:56:17 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 16:56:14 +0800
Message-ID: <1379408174-6732-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.3.3
MIME-Version: 1.0
Subject: [oe][meta-oe][PATCH] vsftpd: change default secure_chroot_dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Sep 2013 08:56:18 -0000
Content-Type: text/plain

Change default value of secure_chroot_dir to /var/run/vsftpd/empty, add
volatiles entry for it, to ensure it won't fail to start with error:
"500 OOPS: vsftpd: not found: directory given in 'secure_chroot_dir':/var/share/empty"

This shows up in both standalone mode or started by xined.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../vsftpd/files/change-secure_chroot_dir.patch    | 55 ++++++++++++++++++++++
 .../vsftpd/files/volatiles.99_vsftpd               |  1 +
 .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |  6 ++-
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd

diff --git a/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
new file mode 100644
index 0000000..5f2860e
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
@@ -0,0 +1,55 @@
+vsftpd: change default value of secure_chroot_dir
+
+Upstream-Status: Pending
+
+Change secure_chroot_dir pointing to a volatile directory.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ INSTALL       |    6 +++---
+ tunables.c    |    2 +-
+ vsftpd.conf.5 |    2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff -urpN a/INSTALL b/INSTALL
+--- a/INSTALL	2013-09-13 10:23:57.504972397 +0800
++++ b/INSTALL	2013-09-13 10:25:25.664971779 +0800
+@@ -27,11 +27,11 @@ user in case it does not already exist. 
+ [root@localhost root]# useradd nobody
+ useradd: user nobody exists
+ 
+-2b) vsftpd needs the (empty) directory /usr/share/empty in the default
++2b) vsftpd needs the (empty) directory /var/run/vsftpd/empty in the default
+ configuration. Add this directory in case it does not already exist. e.g.:
+ 
+-[root@localhost root]# mkdir /usr/share/empty/
+-mkdir: cannot create directory `/usr/share/empty': File exists
++[root@localhost root]# mkdir /var/run/vsftpd/empty/
++mkdir: cannot create directory `/var/run/vsftpd/empty': File exists
+ 
+ 2c) For anonymous FTP, you will need the user "ftp" to exist, and have a
+ valid home directory (which is NOT owned or writable by the user "ftp").
+diff -urpN a/tunables.c b/tunables.c
+--- a/tunables.c	2013-09-13 10:26:29.554972817 +0800
++++ b/tunables.c	2013-09-13 10:27:18.104972210 +0800
+@@ -254,7 +254,7 @@ tunables_load_defaults()
+   /* -rw------- */
+   tunable_chown_upload_mode = 0600;
+ 
+-  install_str_setting("/usr/share/empty", &tunable_secure_chroot_dir);
++  install_str_setting("/var/run/vsftpd/empty", &tunable_secure_chroot_dir);
+   install_str_setting("ftp", &tunable_ftp_username);
+   install_str_setting("root", &tunable_chown_username);
+   install_str_setting("/var/log/xferlog", &tunable_xferlog_file);
+diff -urpN a/vsftpd.conf.5 b/vsftpd.conf.5
+--- a/vsftpd.conf.5	2013-09-13 10:09:33.774972462 +0800
++++ b/vsftpd.conf.5	2013-09-13 10:10:41.914971989 +0800
+@@ -969,7 +969,7 @@ This option should be the name of a dire
+ directory should not be writable by the ftp user. This directory is used
+ as a secure chroot() jail at times vsftpd does not require filesystem access.
+ 
+-Default: /usr/share/empty
++Default: /var/run/vsftpd/empty
+ .TP
+ .B ssl_ciphers
+ This option can be used to select which SSL ciphers vsftpd will allow for
diff --git a/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
new file mode 100644
index 0000000..8a602ba
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
@@ -0,0 +1 @@
+d root root 0755 /var/run/vsftpd/empty none
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
index 2c3e009..49d5d2a 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://vsftpd.conf \
            file://vsftpd.user_list \
            file://vsftpd.ftpusers \
+           file://change-secure_chroot_dir.patch \
+           file://volatiles.99_vsftpd \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
@@ -40,7 +42,7 @@ LDFLAGS_append =" -lcrypt -lcap"
 do_configure() {
     # Fix hardcoded /usr, /etc, /var mess.
     cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g \
-    |sed s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
+    |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
     mv tunables.c.new tunables.c
 }
 
@@ -57,6 +59,8 @@ do_install() {
     install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
     install -d ${D}${sysconfdir}/init.d/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
+    install -d ${D}/${sysconfdir}/default/volatiles
+    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
 
     install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
     install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
-- 
1.8.3.3


