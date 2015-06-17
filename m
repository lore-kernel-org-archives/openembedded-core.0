Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DE8B272491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:48:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97193257"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:52:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H8kV2A021965
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 16:46:31 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 16:48:16 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 16:48:01 +0800
Message-ID: <1434530881-2119-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] busybox: enable httpd su install
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
X-List-Received-Date: Wed, 17 Jun 2015 08:48:06 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-core/busybox/busybox.inc       |  1 +
 meta/recipes-core/busybox/busybox/defconfig | 53 +++++++++++++++--------------
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0769d92..3886457 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -39,6 +39,7 @@ INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
+SYSTEMD_AUTO_ENABLE_${PN}-syslog = "disable"
 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index c200ee0..667928b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -227,8 +227,8 @@ CONFIG_FALSE=y
 # CONFIG_FSYNC is not set
 CONFIG_HEAD=y
 # CONFIG_FEATURE_FANCY_HEAD is not set
-# CONFIG_INSTALL is not set
-# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
+CONFIG_INSTALL=y
+CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
 CONFIG_LN=y
 CONFIG_LOGNAME=y
 CONFIG_LS=y
@@ -431,15 +431,15 @@ CONFIG_XARGS=y
 CONFIG_HALT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 CONFIG_TELINIT_PATH=""
-# CONFIG_INIT is not set
-# CONFIG_FEATURE_USE_INITTAB is not set
-# CONFIG_FEATURE_KILL_REMOVED is not set
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_FEATURE_KILL_REMOVED=y
 CONFIG_FEATURE_KILL_DELAY=0
-# CONFIG_FEATURE_INIT_SCTTY is not set
+CONFIG_FEATURE_INIT_SCTTY=y
 # CONFIG_FEATURE_INIT_SYSLOG is not set
-# CONFIG_FEATURE_EXTRA_QUIET is not set
-# CONFIG_FEATURE_INIT_COREDUMPS is not set
-# CONFIG_FEATURE_INITRD is not set
+CONFIG_FEATURE_EXTRA_QUIET=y
+CONFIG_FEATURE_INIT_COREDUMPS=y
+CONFIG_FEATURE_INITRD=y
 CONFIG_INIT_TERMINAL_TYPE=""
 CONFIG_MESG=y
 # CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP is not set
@@ -477,7 +477,7 @@ CONFIG_LAST_SYSTEM_ID=999
 # CONFIG_CRYPTPW is not set
 # CONFIG_CHPASSWD is not set
 CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
-# CONFIG_SU is not set
+CONFIG_SU=y
 # CONFIG_FEATURE_SU_SYSLOG is not set
 # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
 # CONFIG_SULOGIN is not set
@@ -752,19 +752,20 @@ CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_FTPPUT is not set
 # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
 CONFIG_HOSTNAME=y
-# CONFIG_HTTPD is not set
-# CONFIG_FEATURE_HTTPD_RANGES is not set
-# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
-# CONFIG_FEATURE_HTTPD_SETUID is not set
-# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
-# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
-# CONFIG_FEATURE_HTTPD_CGI is not set
-# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
-# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
-# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
-# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
-# CONFIG_FEATURE_HTTPD_PROXY is not set
-# CONFIG_FEATURE_HTTPD_GZIP is not set
+CONFIG_HTTPD=y
+CONFIG_FEATURE_HTTPD_RANGES=y
+CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
+CONFIG_FEATURE_HTTPD_SETUID=y
+CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
+CONFIG_FEATURE_HTTPD_AUTH_MD5=y
+CONFIG_FEATURE_HTTPD_CGI=y
+CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
+CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
+CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
+CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
+CONFIG_FEATURE_HTTPD_PROXY=y
+CONFIG_FEATURE_HTTPD_GZIP=y
+
 CONFIG_IFCONFIG=y
 CONFIG_FEATURE_IFCONFIG_STATUS=y
 # CONFIG_FEATURE_IFCONFIG_SLIP is not set
@@ -802,9 +803,9 @@ CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_IPROUTE is not set
 # CONFIG_IPTUNNEL is not set
 # CONFIG_IPRULE is not set
-# CONFIG_IPCALC is not set
-# CONFIG_FEATURE_IPCALC_FANCY is not set
-# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+CONFIG_IPCALC=y
+CONFIG_FEATURE_IPCALC_FANCY=y
+CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
 CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
-- 
1.8.4.2


