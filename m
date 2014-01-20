Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD656CC49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 02:22:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0K2MwjY009060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 18:22:58 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 19 Jan 2014 18:22:58 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 10:23:00 +0800
Message-ID: <971858e2f6b7a5e04700ea0ec1581265bac8458c.1390184362.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390184362.git.Qi.Chen@windriver.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/5] dropbear: add systemd unit files
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
X-List-Received-Date: Mon, 20 Jan 2014 02:22:57 -0000
Content-Type: text/plain

This patch mainly comes from meta-systemd with a few modifications.
The purpose is to get rid of the LSB init scripts in systemd images.

[YOCTO #4420]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |   17 ++++++++++++++++-
 .../recipes-core/dropbear/dropbear/dropbear.socket |   10 ++++++++++
 .../dropbear/dropbear/dropbear@.service            |   11 +++++++++++
 .../dropbear/dropbear/dropbearkey.service          |    8 ++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.service

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index e85a9e6..d5fceec 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -19,17 +19,22 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0004-fix-2kb-keys.patch \
            file://0007-dropbear-fix-for-x32-abi.patch \
            file://init \
+           file://dropbearkey.service \
+           file://dropbear@.service \
+           file://dropbear.socket \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
                file://dropbear"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 INITSCRIPT_NAME = "dropbear"
 INITSCRIPT_PARAMS = "defaults 10"
 
+SYSTEMD_SERVICE_${PN} = "dropbear.socket"
+
 CFLAGS_prepend = " -I. "
 LD = "${CC}"
 
@@ -66,6 +71,16 @@ do_install() {
 		install -d ${D}${sysconfdir}/pam.d
 		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
 	fi
+
+	# deal with systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@BINDIR@,${bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/dropbear.socket ${D}${systemd_unitdir}/system/*.service
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear.socket b/meta/recipes-core/dropbear/dropbear/dropbear.socket
new file mode 100644
index 0000000..e5c61b7
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear.socket
@@ -0,0 +1,10 @@
+[Unit]
+Conflicts=dropbear.service
+
+[Socket]
+ListenStream=22
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
+Also=dropbearkey.service
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear@.service b/meta/recipes-core/dropbear/dropbear/dropbear@.service
new file mode 100644
index 0000000..6fe9942
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear@.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=SSH Per-Connection Server
+Wants=dropbearkey.service
+After=syslog.target dropbearkey.service
+
+[Service]
+EnvironmentFile=-/etc/default/dropbear
+ExecStart=-@SBINDIR@/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key $DROPBEAR_EXTRA_ARGS
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+StandardInput=socket
+KillMode=process
diff --git a/meta/recipes-core/dropbear/dropbear/dropbearkey.service b/meta/recipes-core/dropbear/dropbear/dropbearkey.service
new file mode 100644
index 0000000..ccc21d5
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbearkey.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=SSH Key Generation
+ConditionPathExists=|!/etc/dropbear/dropbear_rsa_host_key
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
+RemainAfterExit=yes
-- 
1.7.9.5


