Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB61665D8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:39:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3N9dnlp008693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 02:39:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 02:39:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Apr 2014 17:40:50 +0800
Message-ID: <806504230ea599d6dda0a77743b080b8ed8eb915.1398245851.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398245851.git.Qi.Chen@windriver.com>
References: <cover.1398245851.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] cronie: add systemd support
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
X-List-Received-Date: Wed, 23 Apr 2014 09:39:51 -0000
Content-Type: text/plain

Add systemd support for cronie.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cronie/cronie/crond.service |   11 +++++++++++
 meta/recipes-extended/cronie/cronie_1.4.11.bb     |   12 +++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cronie/cronie/crond.service

diff --git a/meta/recipes-extended/cronie/cronie/crond.service b/meta/recipes-extended/cronie/cronie/crond.service
new file mode 100644
index 0000000..d435a6e
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/crond.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Periodic Command Scheduler
+
+[Service]
+EnvironmentFile=/etc/sysconfig/crond
+ExecStart=@SBINDIR@/crond -n $CRONDARGS
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
index d98d0d9..2a932e0 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://fix-out-of-tree-build.patch \
            file://crond.init \
            file://crontab \
+           file://crond.service \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://crond_pam_config.patch"
@@ -27,7 +28,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 SRC_URI[md5sum] = "2ba645cf54de17f138ef70312843862f"
 SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f9864d7be"
 
-inherit autotools update-rc.d useradd
+inherit autotools update-rc.d useradd systemd
 
 
 PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
@@ -42,12 +43,21 @@ INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system crontab"
 
+SYSTEMD_SERVICE_${PN} = "crond.service"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/sysconfig/
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0644 ${S}/crond.sysconfig ${D}${sysconfdir}/sysconfig/crond
 	install -m 0755 ${WORKDIR}/crond.init ${D}${sysconfdir}/init.d/crond
 
+	# install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/crond.service
+
 	# below are necessary for a complete cron environment
 	install -d ${D}${localstatedir}/spool/cron
 	install -m 0755 ${WORKDIR}/crontab ${D}${sysconfdir}/
-- 
1.7.9.5


