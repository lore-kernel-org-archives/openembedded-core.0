Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0F58160F28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 06:30:07 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8C6U05T025117; 
	Thu, 12 Sep 2013 01:30:08 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 11:31:19 +0500
Message-Id: <1378967479-8725-2-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1378967479-8725-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1378967479-8725-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 2/2] apmd: Add systemd support
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
X-List-Received-Date: Thu, 12 Sep 2013 06:30:08 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

-Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service |    7 +++++++
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb           |   13 +++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
new file mode 100644
index 0000000..62d6af1
--- /dev/null
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
@@ -0,0 +1,7 @@
+[Unit]
+Description=Advanced Power Management daemon
+After=remote-fs.target
+
+[Service]
+EnvironmentFile-= @SYSCONFDIR@/default/apmd
+ExecStart=@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
index d025387..8c4b75e 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
@@ -17,7 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
            file://init \
            file://default \
            file://apmd_proxy \
-           file://apmd_proxy.conf"
+           file://apmd_proxy.conf \
+           file://apmd.service"
 
 SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
 SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5c75a2dbb52332d"
@@ -27,11 +28,14 @@ SRC_URI[patch.sha256sum] = "7905ff96be93d725544d0040e425c42f9c05580db3c272f11cff
 
 S = "${WORKDIR}/apmd-3.2.2.orig"
 
-inherit update-rc.d
+inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "apmd"
 INITSCRIPT_PARAMS = "defaults"
 
+SYSTEMD_SERVICE_${PN} = "apmd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 do_compile() {
 	# apmd doesn't use whole autotools. Just libtool for installation
 	oe_runmake "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool" apm apmd
@@ -63,6 +67,11 @@ do_install() {
 
 	cat ${WORKDIR}/init | sed -e 's,/usr/sbin,${sbindir},g; s,/etc,${sysconfdir},g;' > ${D}${sysconfdir}/init.d/apmd
 	chmod 755 ${D}${sysconfdir}/init.d/apmd
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/apmd.service ${D}${systemd_unitdir}/system/
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apmd.service
 }
 
 PACKAGES =+ "libapm libapm-dev libapm-staticdev apm"
-- 
1.7.9.5


