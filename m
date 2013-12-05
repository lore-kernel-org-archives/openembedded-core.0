Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8354B6E213
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:58:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB5MwMl2014007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 14:58:22 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 14:58:22 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:57:45 -0600
Message-ID: <43696512e4415667ad9c0fdcb246361440013d37.1386283669.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386283669.git.mark.hatle@windriver.com>
References: <cover.1386283669.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 6/7][dora] bind: add init.d/bind status command
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
X-List-Received-Date: Thu, 05 Dec 2013 22:58:23 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

-- Sent for YP compliance --

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bind-add-init-bind-status-command.patch        | 45 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch
new file mode 100644
index 0000000..8ed3c56
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch
@@ -0,0 +1,45 @@
+--- a/init.d
++++ b/init.d
+@@ -2,6 +2,8 @@
+ 
+ PATH=/sbin:/bin:/usr/sbin:/usr/bin
+ 
++. /etc/init.d/functions
++
+ # for a chrooted server: "-u bind -t /var/lib/named"
+ # Don't modify this line, change or create /etc/default/bind9.
+ OPTIONS=""
+@@ -104,6 +106,12 @@ umount_chroot_conf() {
+     fi
+ }
+ 
++rhstatus() {
++  [ -x /usr/sbin/rndc ] && /usr/sbin/rndc status;
++  status /usr/sbin/named;
++  return $?
++}
++
+ case "$1" in
+     start)
+ 	echo -n "Starting domain name service: named"
+@@ -172,6 +180,11 @@ case "$1" in
+ 	echo "."	
+     ;;
+ 
++    status)
++	rhstatus;
++	exit $?
++    ;;
++
+     reload)
+ 	/usr/sbin/rndc reload
+     ;;
+@@ -183,7 +196,7 @@ case "$1" in
+     ;;
+     
+     *)
+-	echo "Usage: /etc/init.d/bind {start|stop|reload|restart|force-reload}" >&2
++	echo "Usage: /etc/init.d/bind {start|stop|reload|restart|status|force-reload}" >&2
+ 	exit 1
+     ;;
+ esac
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 66a092c..45695e4 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl libcap"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
@@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://setup-chroot-hooks.patch \
            file://init.d-fix-indentation.patch \
            file://init.d-add-support-for-read-only-rootfs.patch \
+           file://bind-add-init-bind-status-command.patch \
 	   "
 
 SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
-- 
1.8.1.2.545.g2f19ada


