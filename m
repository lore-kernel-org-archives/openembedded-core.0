Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06F1E6CABC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 08:12:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9F8CBTW004190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 01:12:14 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 15 Oct 2013 01:12:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2013 16:12:14 +0800
Message-ID: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Tue, 15 Oct 2013 08:12:13 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Otherwise system will hang since nfs is not disconnected

and remove the judgement of initscript DISTRO_FEATURE when install init
script connman, because inherit systemd will remove init script

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc      |   12 ++++--
 .../connman/connman/connman-nfs                    |   42 ++++++++++++++++++++
 .../connman/connman/connman-nfs.service            |   14 +++++++
 meta/recipes-connectivity/connman/connman_1.17.bb  |    2 +
 4 files changed, 66 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/connman-nfs
 create mode 100644 meta/recipes-connectivity/connman/connman/connman-nfs.service

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 37ce3ec..51c2bfb 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -84,10 +84,14 @@ do_compile_append() {
 }
 
 do_install_append() {
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
-		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+	sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
+
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${bindir}/
+		install -m 0755 ${WORKDIR}/connman-nfs ${D}${bindir}/
+		install -T -m 0644 ${WORKDIR}/connman-nfs.service ${D}/lib/systemd/system/connman.service
 	fi
 
 	install -d ${D}${bindir}
diff --git a/meta/recipes-connectivity/connman/connman/connman-nfs b/meta/recipes-connectivity/connman/connman/connman-nfs
new file mode 100644
index 0000000..1058787
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/connman-nfs
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+nfsroot=0
+
+exec 9<&0 < /proc/mounts
+while read dev mtpt fstype rest; do
+	if test $mtpt = "/" ; then
+		case $fstype in
+		    nfs | nfs4)
+			nfsroot=1
+			break
+			;;
+		    *)
+			;;
+		esac
+	fi
+done
+
+EXTRA_PARAM=""
+if test $nfsroot -eq 1 ; then
+    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
+    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
+
+    if [ ! -z "$NET_ADDR" ]; then
+	if [ "$NET_ADDR" = dhcp ]; then
+	    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
+	    if [ ! -z "$ethn" ]; then
+		EXTRA_PARAM="-I $ethn"
+	    fi
+	else
+	    for i in $NET_DEVS; do
+		ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
+		if [ "$NET_ADDR" = "$ADDR" ]; then
+		    EXTRA_PARAM="-I $i"
+		    break
+		fi
+	    done
+	fi
+    fi
+fi
+
+/usr/sbin/connmand -n $EXTRA_PARAM
diff --git a/meta/recipes-connectivity/connman/connman/connman-nfs.service b/meta/recipes-connectivity/connman/connman/connman-nfs.service
new file mode 100644
index 0000000..9f9b690
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/connman-nfs.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Connection service
+After=syslog.target
+
+[Service]
+Type=dbus
+BusName=net.connman
+Restart=on-failure
+ExecStartPre=-/usr/lib64/connman/wired-setup
+ExecStart=/usr/bin/connman-nfs
+StandardOutput=null
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/connman/connman_1.17.bb b/meta/recipes-connectivity/connman/connman_1.17.bb
index 461157f..f3a4849 100644
--- a/meta/recipes-connectivity/connman/connman_1.17.bb
+++ b/meta/recipes-connectivity/connman/connman_1.17.bb
@@ -4,6 +4,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
+            file://connman-nfs \
+            file://connman-nfs.service \
             "
 
 SRC_URI[md5sum] = "dd4a13f789de1b69fcddf0cf613f2d5b"
-- 
1.7.10.4


