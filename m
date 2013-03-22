Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6EO-0007fI-KY
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:20 +0100
Received: by mail-wi0-f172.google.com with SMTP id hr17so964631wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=S4Iwq3afIrHvJ1p66RCk3RVNEsTFi0yE6OxjkRqD8Mc=;
	b=I4sy5UExfqi8djsvP3BKtTPPe4HAgfgO31/vKrdRyD3AqzuLYeNdf2tH8Qm14rEMPT
	bC4TwTS+1LaSZRsGuM7vHIYRa/TGrLybREGHFJ1FXmcyYuoeBg11FKFJGUvDUHpfWBpm
	9THVffKkIC3PIqnefnB0SoxlPWRZNklv6ICD4UU11nk0WtQhhRsgvzl74JUtDdYK/qFa
	ZzvI6yncsWwcb5a8knR3PzmieWX89YrWBrdCWtgB8ny0WSr4y9SmMRdtjQb2oFOBIlib
	i/10dFo5L/UUVxWEaW3XxeAJk9SnSjqJlqB65GcSwtITM3m8wtbJ85mF2Ods25QSutnt
	mPug==
X-Received: by 10.194.237.129 with SMTP id vc1mr4778467wjc.20.1363974086637;
	Fri, 22 Mar 2013 10:41:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:21 +0000
Message-Id: <9ef1ee1552757f3cf5cb979a9df7cf45f38b2f7a.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQk3HXmPRD6Qs6nAtfKOhacDpcYUkOVlCmGu0bpsE48sehWMPy1+C0wH+CVhgaDtcTNUlAlh
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/22] busybox: enable systemd integration for syslogd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 17:58:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/busybox/busybox.inc                |   18 ++++++++++++++++--
 meta/recipes-core/busybox/busybox_1.20.2.bb          |    2 ++
 .../busybox/files/busybox-klogd.service.in           |    8 ++++++++
 .../busybox/files/busybox-syslog.service.in          |   13 +++++++++++++
 4 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index fc6ca91..e936e59 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf*"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${systemd_unitdir}/system/syslog.service"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
@@ -32,12 +32,16 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
+
+SYSTEMD_PACKAGES = "${PN}-syslog"
+SYSTEMD_SERVICE_${PN}-syslog = "${PN}-syslog.service"
+
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
-inherit cml1 update-rc.d
+inherit cml1 systemd update-rc.d
 
 # internal helper
 def busybox_cfg(feature, features, tokens, cnf, rem):
@@ -213,6 +217,16 @@ do_install () {
                fi
 	fi
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+            > ${D}${systemd_unitdir}/system/busybox-syslog.service
+        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+            > ${D}${systemd_unitdir}/system/busybox-klogd.service
+
+        ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
+    fi
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 783261e..a02cd38 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://fix-for-spurious-testsuite-failure.patch \
            file://busybox-1.20.2-kernel_ver.patch \
            file://stat-usr-bin.patch \
+           file://busybox-syslog.service.in \
+           file://busybox-klogd.service.in \
            file://testsuite-du-du-k-works-fix-false-positive.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
diff --git a/meta/recipes-core/busybox/files/busybox-klogd.service.in b/meta/recipes-core/busybox/files/busybox-klogd.service.in
new file mode 100644
index 0000000..d7c7755
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-klogd.service.in
@@ -0,0 +1,8 @@
+[Unit]
+Description=Kernel Logging Service
+
+[Service]
+ExecStart=@base_sbindir@/klogd -n
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-core/busybox/files/busybox-syslog.service.in b/meta/recipes-core/busybox/files/busybox-syslog.service.in
new file mode 100644
index 0000000..2e04321
--- /dev/null
+++ b/meta/recipes-core/busybox/files/busybox-syslog.service.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=System Logging Service
+Wants=busybox-klogd.service
+
+[Service]
+EnvironmentFile=-/etc/default/busybox-syslog
+ExecStart=@base_sbindir@/syslogd -n $OPTIONS
+Sockets=syslog.socket
+
+[Install]
+WantedBy=multi-user.target
+Also=busybox-klogd.service
+Alias=syslog.service
-- 
1.7.10.4



