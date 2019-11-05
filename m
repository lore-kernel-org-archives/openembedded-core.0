Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4FA6B8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 10:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA5A4bJ6017777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2019 02:04:37 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 02:04:36 -0800
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2019 18:04:20 +0800
Message-ID: <1572948260-142321-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sysstat: remove check for chkconfig
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
X-List-Received-Date: Tue, 05 Nov 2019 10:04:36 -0000
Content-Type: text/plain

For cross-platform, chkconfig can't work, so should remove check for it.
This can only be reproduced on some platform with chkconfig(e.g. CentOS
Linux release 7.2.1511), and need with --enable-install-cron and without
--enable-copy-only.

Fixed:
| 	if [ "n" == "n" ]; then \
| 		if [ -x "/usr/sbin/chkconfig" ]; then \
| 			cd /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/init.d && /usr/sbin/chkconfig --add sysstat; \
| 		else \
| 			[ -d /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc2.d ] || mkdir -p /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc2.d; \
| 			[ -d /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc3.d ] || mkdir -p /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc3.d; \
| 			[ -d /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc5.d ] || mkdir -p /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc5.d; \
| 			cd /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc2.d && ln -s -f ../init.d/sysstat S01sysstat; \
| 			cd /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc3.d && ln -s -f ../init.d/sysstat S01sysstat; \
| 			cd /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d/rc5.d && ln -s -f ../init.d/sysstat S01sysstat; \
| 		fi \
| 	fi \
| elif [ -d /path/to/tmp/work/corei7-64-wrs-linux/sysstat/11.1.5-r0/image/etc/rc.d ]; then \
| ...
| fi
| error reading information on service sysstat: No such file or directory
| Makefile:382: recipe for target 'install_all' failed

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...1-configure.in-remove-check-for-chkconfig.patch | 31 ++++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat_12.1.6.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
new file mode 100644
index 0000000..4067bb9
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -0,0 +1,31 @@
+From 1590cc614aaf0fb81cd804414d6c9d5a9227352c Mon Sep 17 00:00:00 2001
+From: Wenlin Kang <wenlin.kang@windriver.com>
+Date: Tue, 5 Nov 2019 16:16:44 +0800
+Subject: [PATCH] configure.in: remove check for chkconfig
+
+chkconfig can't work on cross-platform, so should remove check for it.
+
+Upstream-Status: Inappropriate [ embedded specific ]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ configure.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 48b9a31..cedeb43 100644
+--- a/configure.in
++++ b/configure.in
+@@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
+ AC_SUBST(VER_XML)
+ 
+ AC_PATH_PROG(PATH_CP, cp)
+-AC_PATH_PROG(PATH_CHKCONFIG, chkconfig)
++#AC_PATH_PROG(PATH_CHKCONFIG, chkconfig)
++AC_SUBST(PATH_CHKCONFIG)
+ 
+ # Check for systemd
+ AC_CHECK_PROG(PKG_CONFIG, pkg-config, pkg-config)
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
index 362888d..83bb45e 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
 	    file://0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch \
+	    file://0001-configure.in-remove-check-for-chkconfig.patch \
 "
 
 SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
-- 
1.9.1


