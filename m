Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 49726713A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8379VB5023248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:09:08 +0800
Message-ID: <c6be44fd4424f17badd9e652124fa700a35dfa2c.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409728004.git.Qi.Chen@windriver.com>
References: <cover.1409728004.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/25] acpid: upgrade to 2.0.22 and add systemd support
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:30 -0000
Content-Type: text/plain

For acpid needs to upgrade to work correctly with the new kernel.
The new version now uses autotools.

Also add systemd unit file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/acpid/acpid.inc                   | 24 ++++++++++------------
 meta/recipes-bsp/acpid/acpid/acpid.service         | 10 +++++++++
 .../acpid/acpid/set_socket_noblock.patch           | 10 ---------
 .../acpid/{acpid_1.0.10.bb => acpid_2.0.22.bb}     |  5 ++---
 4 files changed, 23 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/acpid.service
 delete mode 100644 meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
 rename meta/recipes-bsp/acpid/{acpid_1.0.10.bb => acpid_2.0.22.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index fad7afd..9b4c3a5 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -4,30 +4,28 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=33140&atid=407341"
 SECTION = "base"
 LICENSE = "GPLv2+"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/acpid/acpid-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
            file://init \
-           file://set_socket_noblock.patch "
+           file://acpid.service \
+          "
 
-inherit update-rc.d
+inherit autotools update-rc.d systemd
 
 INITSCRIPT_NAME = "acpid"
 INITSCRIPT_PARAMS = "defaults"
 
-# Makefile ignores our CFLAGS, so override it.
-#
-EXTRA_OEMAKE = "CFLAGS='-W -Wall -Werror -Wundef -Wshadow ${CFLAGS} $(DEFS)'"
+SYSTEMD_PACKAGES = "acpid"
+SYSTEMD_SERVICE_acpid = "acpid.service"
 
-do_compile () {
-	oe_runmake 'CC=${CC} -D_GNU_SOURCE' 'CROSS=${HOST_PREFIX}'
-}
-
-do_install () {
-	install -d ${D}${bindir} 
-	oe_runmake 'INSTPREFIX=${D}' install
+do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	sed -e 's,/usr/sbin,${sbindir},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/acpid
 	chmod 755 ${D}${sysconfdir}/init.d/acpid
 
 	install -d ${D}${sysconfdir}/acpi
 	install -d ${D}${sysconfdir}/acpi/events
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/acpid.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/acpid.service
 }
diff --git a/meta/recipes-bsp/acpid/acpid/acpid.service b/meta/recipes-bsp/acpid/acpid/acpid.service
new file mode 100644
index 0000000..f70e740
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid/acpid.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=ACPI Event Daemon
+After=syslog.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/acpid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch b/meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
deleted file mode 100644
index 54d6435..0000000
--- a/meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/acpid.c
-+++ b/acpid.c
-@@ -307,6 +307,7 @@ main(int argc, char **argv)
- 				non_root_clients++;
- 			}
- 			fcntl(cli_fd, F_SETFD, FD_CLOEXEC);
-+			fcntl(cli_fd, F_SETFL, O_NONBLOCK);
- 			snprintf(buf, sizeof(buf)-1, "%d[%d:%d]",
- 				creds.pid, creds.uid, creds.gid);
- 			acpid_add_client(cli_fd, buf);
diff --git a/meta/recipes-bsp/acpid/acpid_1.0.10.bb b/meta/recipes-bsp/acpid/acpid_2.0.22.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_1.0.10.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.22.bb
index df55bad..603fc2b 100644
--- a/meta/recipes-bsp/acpid/acpid_1.0.10.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.22.bb
@@ -3,6 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-
-SRC_URI[md5sum] = "61156ef32015c56dc0f2e3317f4ae09e"
-SRC_URI[sha256sum] = "22703ce0dd7305aca01bc9ac741659c32b1593f1d6fde492df7f01067a534760"
+SRC_URI[md5sum] = "c8ba756030d1b21fc973ec3d640f27f1"
+SRC_URI[sha256sum] = "3d11454f4283c8f771d8dbd5eb6b5f2bbd9d94d9f77d68bab89e35d98b67ab31"
-- 
1.9.1


