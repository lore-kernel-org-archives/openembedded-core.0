Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24E597826C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 08:40:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M8eput009979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:40:52 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 Aug 2017 01:40:50 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 16:29:42 +0800
Message-ID: <9aa708b6c5cf2874e53216dde589c07bf5407d1c.1503390555.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1503390555.git.kai.kang@windriver.com>
References: <cover.1503390555.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] watchdog: enable systemd support
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
X-List-Received-Date: Tue, 22 Aug 2017 08:40:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Inherit systemd.bbclass to enable systemd support for watchdog.

And fix indentation of do_install_append() as well according to:
https://www.openembedded.org/wiki/Styleguide#Format_Guidelines

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 9659f27..3d0b72e 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -21,8 +21,7 @@ SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
-inherit autotools
-inherit update-rc.d
+inherit autotools update-rc.d systemd
 
 DEPENDS_append_libc-musl = " libtirpc "
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
@@ -37,12 +36,18 @@ INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
 INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
+SYSTEMD_SERVICE_${PN} = "watchdog.service wd_keepalive.service"
+
 do_install_append() {
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${S}/debian/watchdog.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${S}/debian/wd_keepalive.service ${D}${systemd_system_unitdir}
+
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
-    install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
+	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
 
-    # watchdog.conf is provided by the watchdog-config recipe
-    rm ${D}${sysconfdir}/watchdog.conf
+	# watchdog.conf is provided by the watchdog-config recipe
+	rm ${D}${sysconfdir}/watchdog.conf
 }
 
 PACKAGES =+ "${PN}-keepalive"
-- 
2.10.1


