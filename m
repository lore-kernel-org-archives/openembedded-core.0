Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Trn0p-0005yE-7K
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 10:59:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r069iJiv013456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jan 2013 01:44:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 01:44:18 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jan 2013 17:44:28 +0800
Message-ID: <c8df96d897ecdf4fe04088aff1eba2fbfb0c004a.1357465230.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1357465230.git.Qi.Chen@windriver.com>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V6 6/6] core-image-sato: support read-only rootfs
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
X-List-Received-Date: Sun, 06 Jan 2013 09:59:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Support read-only rootfs by providing a specific conf file for volatile storage.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-sato/images/core-image-sato.bb        |    8 ++++++++
 .../images/files/volatiles-readonly-sato           |   14 ++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-sato/images/files/volatiles-readonly-sato

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index f52a1a5..4ca1746 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -6,6 +6,14 @@ IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbe
 
 LICENSE = "MIT"
 
+SRC_URI += "file://volatiles-readonly-sato"
+
 inherit core-image
 
 IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
+
+# install read-only rootfs specific conf file for sato image
+choose_volatile_conf () {
+	cp ${WORKDIR}/volatiles-readonly-sato \
+		${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
+}
diff --git a/meta/recipes-sato/images/files/volatiles-readonly-sato b/meta/recipes-sato/images/files/volatiles-readonly-sato
new file mode 100644
index 0000000..4a56b81
--- /dev/null
+++ b/meta/recipes-sato/images/files/volatiles-readonly-sato
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
-- 
1.7.9.5



