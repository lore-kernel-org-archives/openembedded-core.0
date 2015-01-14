Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA43F7269B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lj7c003262
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:45 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:32 -0800
Message-ID: <b2b3391c3a7b49701d5dd7800235617fa415b189.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 21/27] connman: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

And bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc     |   14 +++++++-------
 meta/recipes-connectivity/connman/connman_1.26.bb |    2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ddabdb9..736b324 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -67,18 +67,18 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
-inherit autotools-brokensep pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d
 
 do_configure_append () {
-	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
+	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
 }
 
 # This allows *everyone* to access ConnMan over DBus, without any access
 # control.  Really the at_console flag should work, which would mean that
 # both this and the xuser patch can be dropped.
 do_compile_append() {
-	sed -i -e s:deny:allow:g src/connman-dbus.conf
-	sed -i -e s:deny:allow:g vpn/vpn-dbus.conf
+	sed -i -e s:deny:allow:g ${S}/src/connman-dbus.conf
+	sed -i -e s:deny:allow:g ${S}/vpn/vpn-dbus.conf
 }
 
 do_install_append() {
@@ -89,9 +89,9 @@ do_install_append() {
 	fi
 
 	install -d ${D}${bindir}
-	install -m 0755 ${S}/tools/*-test ${D}${bindir}
-	if [ -e ${S}/tools/wispr ]; then
-		install -m 0755 ${S}/tools/wispr ${D}${bindir}
+	install -m 0755 ${B}/tools/*-test ${D}${bindir}
+	if [ -e ${B}/tools/wispr ]; then
+		install -m 0755 ${B}/tools/wispr ${D}${bindir}
 	fi
 	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
diff --git a/meta/recipes-connectivity/connman/connman_1.26.bb b/meta/recipes-connectivity/connman/connman_1.26.bb
index b93f1cd..7c0c4f7 100644
--- a/meta/recipes-connectivity/connman/connman_1.26.bb
+++ b/meta/recipes-connectivity/connman/connman_1.26.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "ba05b110b7c81e5fa14e8b402ef37a9e"
 SRC_URI[sha256sum] = "7184e4b6d954449ee00a30e188924b3e37a20ad2fd9a0b76a2bdd82c863dcf8a"
 
 RRECOMMENDS_${PN} = "connman-conf"
+
+PR = "r1"
-- 
1.7.9.5


