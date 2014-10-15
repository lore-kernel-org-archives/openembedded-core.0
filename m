Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4006ACB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 02:56:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9F2uLd7018064
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 19:56:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 14 Oct 2014 19:56:21 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Oct 2014 10:54:11 +0800
Message-ID: <b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413341569.git.Chong.Lu@windriver.com>
References: <cover.1413341569.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 15 Oct 2014 02:56:26 -0000
Content-Type: text/plain

The gconfd-2 will be called in org.gnome.GConf.service file and the path of
gconfd-2 is ${libexecdir}, this will get following error when multilib exported
in the sdk:
error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
gconf-3.2.6-r0.0.x86_64

Split org.gnome.GConf.service to ${PN}-service, the conflict was fixed.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 17fdafa..9107c90 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -48,13 +48,16 @@ do_install_append_class-native() {
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
 RDEPENDS_${PN}_class-native = ""
 
+PACKAGES =+ "${PN}-service"
+RDEPENDS_${PN} += "${PN}-service"
+
 FILES_${PN} += "${libdir}/GConf/* \
                 ${libdir}/gio/*/*.so \
                 ${datadir}/polkit* \
-                ${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/system-services/*.service \
                "
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
+FILES_${PN}-service += "${datadir}/dbus-1/services/*.service"
 
 BBCLASSEXTEND = "native"
-- 
1.9.1


