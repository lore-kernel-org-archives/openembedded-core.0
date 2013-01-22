Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxXhy-0002rO-Ow
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 07:51:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0M6aHhH017368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 22:36:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 21 Jan 2013 22:36:16 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 14:36:17 +0800
Message-ID: <fd866fadf1ea46f02e6ea60690ef311c33a30c9b.1358836314.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358836314.git.Qi.Chen@windriver.com>
References: <cover.1358836314.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V8 6/6] volatile-conf-sato: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 06:51:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This recipe provides a config file for core-image-sato.
The config file is used to handle volatile storage in case of a
read-only-rootfs image.

Also, let core-image-sato.bb depend on this recipe.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-sato/images/core-image-sato.bb        |    3 +++
 .../files/volatiles-readonly-sato                  |   14 ++++++++++++++
 .../volatile-conf-sato_1.0.bb                      |   15 +++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
 create mode 100644 meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index f52a1a5..8aaeaf8 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -6,6 +6,9 @@ IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbe
 
 LICENSE = "MIT"
 
+RDEPENDS += "volatile-conf-sato"
+IMAGE_INSTALL += "volatile-conf-sato"
+
 inherit core-image
 
 IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
diff --git a/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato b/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
new file mode 100644
index 0000000..4a56b81
--- /dev/null
+++ b/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
@@ -0,0 +1,14 @@
+# This configuration file lists filesystem objects specific to sato image
+# with read-only rootfs.
+# This configuration file will only be applied if the image is sato and the
+# rootfs is read-only.
+# For the detailed format information, refer to /etc/default/volatiles/00_core.
+d root root 0755 /var/volatile/lib/ none
+d root root 0755 /var/volatile/lib/urandom/ none
+d root root 0755 /var/volatile/lib/dropbear/ none
+d root root 0755 /var/volatile/lib/nfs/ none
+d root root 0755 /var/volatile/lib/dbus/ none
+l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
+l root root 0755 /var/lib/dropbear /var/volatile/lib/dropbear
+l root root 0755 /var/lib/nfs /var/volatile/lib/nfs
+l root root 0755 /var/lib/dbus /var/volatile/lib/dbus
diff --git a/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb b/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
new file mode 100644
index 0000000..acc8901
--- /dev/null
+++ b/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Provide config files for core-image-sato"
+DESCRIPTION = "This package contains a config file for core-image-sato. \
+It is used to handle volatile storage in case of a read-only rootfs."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://volatiles-readonly-sato"
+
+PR = "r1"
+
+do_install () {
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/volatiles-readonly-sato ${D}${sysconfdir}/default/volatiles/00_core_readonly
+}
-- 
1.7.9.5



