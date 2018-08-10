Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21FE0748F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:48:33 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7AEmXEi018043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 07:48:33 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Fri, 10 Aug 2018 07:48:32 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 07:48:30 -0700
Message-Id: <20180810144830.3436-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lttng-tools: add systemd support
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
X-List-Received-Date: Fri, 10 Aug 2018 14:48:33 -0000

Add systemd service file of lttng-tools from Fedora

ftp://fr2.rpmfind.net/linux/fedora/linux/development/rawhide
/Everything/source/tree/Packages/l/lttng-tools-2.10.5-1.fc29.src.rpm

And disable the service by default.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service |  9 +++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb               | 12 +++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service

diff --git a/meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service b/meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service
new file mode 100644
index 00000000000..aaf81305923
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=LTTng 2.x central tracing registry session daemon
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/lttng-sessiond -d
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
index e4969c30807..0314b536376 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
@@ -31,12 +31,16 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
            file://run-ptest \
            file://0001-Allow-multiple-attempts-to-connect-to-relayd.patch \
+           file://lttng-sessiond.service \
            "
 
 SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
 SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
 
-inherit autotools ptest pkgconfig useradd python3-dir manpages
+inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
+
+SYSTEMD_SERVICE_${PN} = "lttng-sessiond.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
@@ -52,6 +56,12 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 INSANE_SKIP_${PN} = "libexec dev-so"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
+do_install_append () {
+    # install systemd unit file
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/lttng-sessiond.service ${D}${systemd_unitdir}/system
+}
+
 do_install_ptest () {
     for f in Makefile tests/Makefile tests/utils/utils.sh ; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
-- 
2.11.0


