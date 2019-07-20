Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay1-3.pub.mailoutpod1-cph3.one.com
	(mailrelay1-3.pub.mailoutpod1-cph3.one.com [46.30.212.10])
	by mail.openembedded.org (Postfix) with ESMTP id 24E857D718
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=references:in-reply-to:message-id:date:subject:cc:to:from:from;
	bh=oBoMraYGZ3KozAqei8KjF4dM0ti4xalMWm9oNP2wGlk=;
	b=D6RcQu7cuzBQKe5+hWQZCf3ALt1IWYHM6ENxH2lUtnJ3VAFbU+TmQ5xWrFWS+QLFjf7oq+13j6G9P
	LqtjLCoZqdKWk2Uju/uI6TiLsn00OB8uVqGlnkUgGS5eY6sSr6Ctzb7RlFX/FktkGL7eR5PbgXEF5g
	6PTsJenvdGz77AqU=
X-HalOne-Cookie: 42c5bc87867de1022454d6f0ab6772e4024d6923
X-HalOne-ID: c2daa0bc-ab08-11e9-aee2-d0431ea8a283
Received: from localhost.localdomain (unknown [185.156.158.10])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id c2daa0bc-ab08-11e9-aee2-d0431ea8a283;
	Sat, 20 Jul 2019 16:09:33 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2019 18:09:29 +0200
Message-Id: <20190720160929.31232-2-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720160929.31232-1-ayoub.zaki@embexus.com>
References: <20190720160929.31232-1-ayoub.zaki@embexus.com>
Subject: [meta-oe][PATCH 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 16:09:33 -0000

Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
by implementing basic whitelisting and blacklisting capabilities based on device attributes.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
---
 .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb

diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
new file mode 100644
index 000000000..a77694cc3
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
@@ -0,0 +1,37 @@
+DESCRIPTION="USBGuard framework helps to protect against BadUSB."
+HOMEPAGE="https://github.com/dkopecek/usbguard"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+
+SRC_URI="https://github.com/USBGuard/usbguard/archive/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
+SRC_URI[sha256sum] = "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
+
+inherit autotools pkgconfig systemd bash-completion
+
+S= "${WORKDIR}/${PN}-${PN}-${PV}"
+
+DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
+	dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium protobuf pegtl"
+
+EXTRA_OECONF += "--with-bundled-catch"
+
+PACKAGECONFIG ??= "libsodium \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
+
+PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
+PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
+PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
+PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
+
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
+SYSTEMD_PACKAGES += "${PN}"
+
+
+do_install_append(){
+	
+	sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \ 
+						${D}${sysconfdir}/usbguard/usbguard-daemon.conf
+}
-- 
2.17.1


