Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9H2-0002sX-Ta
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:24:47 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so4126101pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=yp/FeIl+YtBcm8+Lk7qJNOSgfI867aEse01QCVgsnR8=;
	b=ey3gHhcyVE7VeX8VQSAVi8KlrffLY5r1xUovoIwZbzvanJZpyBshMlIWsBV1hYFF+Q
	+c4zeDcPqkuxwnb9QicV2FvsDvXdzkHMMPcHPm+H6ub9t58p2HacV63Mc8Z+2FD2NV7x
	2C2Rd7n41Gix7pGMDj6mhdyzTrAYz2Eb7KtvzMGGX+ekZdDEm+t/Oy/z5F95sv+dWqOM
	krSGPd/H1zAVRSq/W25riE0Cg3leoSumTeIA/kc29R+VyWYvUojhu/NGMB5RAzJqvyjm
	tewE63bYOCuG7GxsYyRvx5YUuDx8iewJ1CSATvlY6MYCMCfsGd5TR8ogzbNcwVO982lB
	SItQ==
X-Received: by 10.68.225.73 with SMTP id ri9mr31537777pbc.70.1363032485374;
	Mon, 11 Mar 2013 13:08:05 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.07.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:32 -0700
Message-Id: <7e2b9e9b37bc857ec39d488f9d709f1f791e2f2f.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmVUDvtMaaW3HIEfihg1iRQdg+D/kp3eREoCLeDWXwV3DavPv7zreG2bJnkAP+BGWNoTVRy
Subject: [PATCH 2/9] busybox: add systemd enabling for syslog and klogd
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
X-List-Received-Date: Mon, 11 Mar 2013 20:24:49 -0000
X-List-Received-Date: Mon, 11 Mar 2013 20:24:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/busybox/busybox.inc                 |   17 ++++++++++++++++-
 meta/recipes-core/busybox/busybox_1.20.2.bb           |    2 ++
 .../busybox/files/busybox-klogd.service.in            |    8 ++++++++
 .../busybox/files/busybox-syslog.service.in           |   13 +++++++++++++
 4 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index fc6ca91..ddd2976 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -23,6 +23,7 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
+FILES_${PN}-syslog = "${systemd_unitdir}/system/syslog.service"
 
 INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
 
@@ -32,12 +33,16 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
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
@@ -213,6 +218,16 @@ do_install () {
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



