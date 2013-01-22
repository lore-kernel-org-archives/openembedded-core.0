Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxXhx-0002rL-4A
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 07:51:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M6aEwY002320
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 22:36:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 21 Jan 2013 22:36:14 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 14:36:16 +0800
Message-ID: <55f028c6a820eca153b31716bc7b8516a77ef06f.1358836314.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358836314.git.Qi.Chen@windriver.com>
References: <cover.1358836314.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V8 5/6] volatile-conf-minimal: add recipe
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
X-List-Received-Date: Tue, 22 Jan 2013 06:51:48 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This recipe provides a config file for core-image-minimal.
This config file is used for volatile storage handling in case of a
readonly rootfs.

Also, let core-image-minimal depend on this recipe.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/core-image-minimal.bb     |    3 +++
 .../files/volatiles-readonly-minimal               |    8 ++++++++
 .../volatile-conf-minimal_1.0.bb                   |   15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
 create mode 100644 meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 0d2613e..f6baeae 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -6,6 +6,9 @@ IMAGE_LINGUAS = " "
 
 LICENSE = "MIT"
 
+RDEPENDS += "volatile-conf-minimal"
+IMAGE_INSTALL += "volatile-conf-minimal"
+
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
diff --git a/meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal b/meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
new file mode 100644
index 0000000..b7146a2
--- /dev/null
+++ b/meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
@@ -0,0 +1,8 @@
+# This configuration file lists filesystem objects specific to minimal image
+# with read-only rootfs.
+# This configuration file will only be applied if the image is minimal and the
+# rootfs is read-only.
+# For the detailed format information, refer to /etc/default/volatiles/00_core.
+d root root 0755 /var/volatile/lib/ none
+d root root 0755 /var/volatile/lib/urandom/ none
+l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
diff --git a/meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb b/meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
new file mode 100644
index 0000000..c5744e1
--- /dev/null
+++ b/meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Provide config files for core-image-minimal"
+DESCRIPTION = "This package contains a config file for core-image-minimal. \
+It is used to handle volatile storage in case of a read-only rootfs."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://volatiles-readonly-minimal"
+
+PR = "r1"
+
+do_install () {
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/volatiles-readonly-minimal ${D}${sysconfdir}/default/volatiles/00_core_readonly
+}
-- 
1.7.9.5



