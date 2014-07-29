Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4489708F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 03:08:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T38NT0002189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 20:08:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 20:08:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 11:08:40 +0800
Message-ID: <14dcdfe47481d01d37be9761c65b21e81d335a5a.1406603221.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406603221.git.Qi.Chen@windriver.com>
References: <cover.1406603221.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com
Subject: [PATCH V2 1/3] volatile-binds: add recipe
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
X-List-Received-Date: Tue, 29 Jul 2014 03:08:25 -0000
Content-Type: text/plain

This recipe is designed to play a key role in a read-only rootfs
of systemd based systems. It generates service files from a template,
volatile-binds.service.in and the VOLATILE_BINDS variable.

By default, VOLATILE_BINDS takes the value of "/var/volatile/lib /var/lib\n",
which leads to the generation of volatile-var-lib.service file.
This file doesn't have any effect in a read-write system, as it
has "ConditionPathIsReadWrite = !/var/lib" in the [Unit] section.
In other words, this file only has effect in a read-only rootfs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/volatile-binds/files/COPYING.MIT |   17 +++++
 .../volatile-binds/files/mount-copybind            |   34 ++++++++++
 .../volatile-binds/files/volatile-binds.service.in |   19 ++++++
 meta/recipes-core/volatile-binds/volatile-binds.bb |   69 ++++++++++++++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/volatile-binds/files/COPYING.MIT
 create mode 100755 meta/recipes-core/volatile-binds/files/mount-copybind
 create mode 100644 meta/recipes-core/volatile-binds/files/volatile-binds.service.in
 create mode 100644 meta/recipes-core/volatile-binds/volatile-binds.bb

diff --git a/meta/recipes-core/volatile-binds/files/COPYING.MIT b/meta/recipes-core/volatile-binds/files/COPYING.MIT
new file mode 100644
index 0000000..7e7d574
--- /dev/null
+++ b/meta/recipes-core/volatile-binds/files/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all
+copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
+SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
+DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
+THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/recipes-core/volatile-binds/files/mount-copybind
new file mode 100755
index 0000000..2aeaf84
--- /dev/null
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -0,0 +1,34 @@
+#!/bin/sh
+#
+# Perform a bind mount, copying existing files as we do so to ensure the
+# overlaid path has the necessary content.
+
+if [ $# -lt 2 ]; then
+    echo >&2 "Usage: $0 spec mountpoint [OPTIONS]"
+    exit 1
+fi
+
+spec=$1
+mountpoint=$2
+
+if [ $# -gt 2 ]; then
+    options=$3
+else
+    options=
+fi
+
+[ -n "$options" ] && options=",$options"
+
+mkdir -p "${spec%/*}"
+if [ -d "$mountpoint" ]; then
+    if [ ! -d "$spec" ]; then
+        mkdir "$spec"
+        cp -pPR "$mountpoint"/. "$spec/"
+    fi
+elif [ -f "$mountpoint" ]; then
+    if [ ! -f "$spec" ]; then
+        cp -pP "$mountpoint" "$spec"
+    fi
+fi
+
+mount -o "bind$options" "$spec" "$mountpoint"
diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
new file mode 100644
index 0000000..32be5b4
--- /dev/null
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -0,0 +1,19 @@
+[Unit]
+Description=Bind mount volatile @where@
+DefaultDependencies=false
+Before=local-fs.target
+RequiresMountsFor=@whatparent@ @whereparent@
+ConditionPathIsReadWrite=@whatparent@
+ConditionPathExists=@where@
+ConditionPathIsReadWrite=!@where@
+
+[Service]
+Type=oneshot
+RemainAfterExit=Yes
+StandardOutput=syslog
+TimeoutSec=0
+ExecStart=/sbin/mount-copybind @what@ @where@
+ExecStop=/sbin/umount @where@
+
+[Install]
+WantedBy=local-fs.target
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
new file mode 100644
index 0000000..4080ff7
--- /dev/null
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -0,0 +1,69 @@
+SUMMARY = "Volatile bind mount setup and configuration for read-only-rootfs"
+DESCRIPTION = "${SUMMARY}"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://../COPYING.MIT;md5=5750f3aa4ea2b00c2bf21b2b2a7b714d"
+
+SRC_URI = "\
+    file://mount-copybind \
+    file://COPYING.MIT \
+    file://volatile-binds.service.in \
+"
+
+inherit allarch systemd distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+VOLATILE_BINDS ?= "\
+    /var/volatile/lib /var/lib\n\
+"
+VOLATILE_BINDS[type] = "list"
+VOLATILE_BINDS[separator] = "\n"
+
+def volatile_systemd_services(d):
+    services = []
+    for line in oe.data.typed_value("VOLATILE_BINDS", d):
+        if not line:
+            continue
+        what, where = line.split(None, 1)
+        services.append("%s.service" % what[1:].replace("/", "-"))
+    return " ".join(services)
+
+SYSTEMD_SERVICE_volatile-binds = "${@volatile_systemd_services(d)}"
+
+FILES_${PN} += "${systemd_unitdir}/system/*.service"
+
+do_compile () {
+    while read spec mountpoint; do
+        if [ -z "$spec" ]; then
+            continue
+        fi
+
+        servicefile="${spec#/}"
+        servicefile="$(echo "$servicefile" | tr / -).service"
+        sed -e "s#@what@#$spec#g; s#@where@#$mountpoint#g" \
+            -e "s#@whatparent@#${spec%/*}#g; s#@whereparent@#${mountpoint%/*}#g" \
+            volatile-binds.service.in >$servicefile
+    done <<END
+${@d.getVar('VOLATILE_BINDS', True).replace("\\n", "\n")}
+END
+
+    if [ -e var-volatile-lib.service ]; then
+        # As the seed is stored under /var/lib, ensure that this service runs
+        # after the volatile /var/lib is mounted.
+        sed -i -e "/^Before=/s/\$/ systemd-random-seed.service/" \
+               -e "/^WantedBy=/s/\$/ systemd-random-seed.service/" \
+               var-volatile-lib.service
+    fi
+}
+do_compile[dirs] = "${WORKDIR}"
+
+do_install () {
+    install -d ${D}${base_sbindir}
+    install -m 0755 mount-copybind ${D}${base_sbindir}/
+
+    install -d ${D}${systemd_unitdir}/system
+    for service in ${SYSTEMD_SERVICE_volatile-binds}; do
+        install -m 0644 $service ${D}${systemd_unitdir}/system/
+    done
+}
+do_install[dirs] = "${WORKDIR}"
-- 
1.7.9.5


