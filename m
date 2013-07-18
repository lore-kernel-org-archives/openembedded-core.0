Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBA9F6AFFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:05:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6I75YOW016642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 00:05:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Jul 2013 00:05:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jul 2013 15:05:37 +0800
Message-ID: <7a265612fe08a636afc61a659ac5fadd22b0a7bd.1374116641.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374116641.git.Qi.Chen@windriver.com>
References: <cover.1374116641.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] busybox-syslog: respect /etc/syslog-startup.conf in systemd
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
X-List-Received-Date: Thu, 18 Jul 2013 07:05:33 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Now we've used busybox-syslog as a replacement for systemd's syslog
service. Currently, there are two problems.

1. The configuration file, /etc/syslog-startup.conf, is ignored.
   This is really confusing, as we are used to the behaviour of
   changing the configuration in /etc/syslog-startup.conf for the
   syslog service. This is actually a weekly test case.
2. The /etc/init.d/syslog is installed, but it has no real usage in
   systemd based systems.

This patch solves the above two problems by changing the busybox-syslog.
service file to let the /etc/init.d/syslog script start syslog service.
The /etc/init.d/syslog file is actually a wrapper in this situation.

[YOCTO #4860]
[YOCOT #4837]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc              |    2 +-
 .../busybox/files/busybox-syslog.service.in        |    3 +--
 meta/recipes-core/busybox/files/syslog             |    7 +++++++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index acd2bfb..1095be6 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -267,7 +267,7 @@ do_install () {
 
     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+        sed 's,@sysconfdir@,${sysconfdir},g' < ${WORKDIR}/busybox-syslog.service.in \
             > ${D}${systemd_unitdir}/system/busybox-syslog.service
         sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
             > ${D}${systemd_unitdir}/system/busybox-klogd.service
diff --git a/meta/recipes-core/busybox/files/busybox-syslog.service.in b/meta/recipes-core/busybox/files/busybox-syslog.service.in
index 2e04321..f849a61 100644
--- a/meta/recipes-core/busybox/files/busybox-syslog.service.in
+++ b/meta/recipes-core/busybox/files/busybox-syslog.service.in
@@ -3,8 +3,7 @@ Description=System Logging Service
 Wants=busybox-klogd.service
 
 [Service]
-EnvironmentFile=-/etc/default/busybox-syslog
-ExecStart=@base_sbindir@/syslogd -n $OPTIONS
+ExecStart=@sysconfdir@/init.d/syslog systemd
 Sockets=syslog.socket
 
 [Install]
diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 2944d3d..98eda80 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -68,6 +68,13 @@ case "$1" in
   	$0 stop
 	$0 start
 	;;
+  systemd)
+	# This action is only for systemd based images. It's kind of ugly here.
+	# But as we're using busybox-syslog as the syslog service in systemd images,
+	# and we want to respect the configurations in /etc/syslog-startup.conf,
+	# this is an easy way to achieve this goal without duplicating codes.
+	/sbin/syslogd -n $SYSLOG_ARGS
+	;;
   *)
 	echo "Usage: syslog { start | stop | restart }" >&2
 	exit 1
-- 
1.7.9.5


