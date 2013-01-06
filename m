Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Trn0n-0005y7-Qo
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 10:59:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r069iIUk002680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jan 2013 01:44:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 01:44:17 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jan 2013 17:44:27 +0800
Message-ID: <0e35cab1d0fb535e60519a11a2b95955845d4bfd.1357465230.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1357465230.git.Qi.Chen@windriver.com>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V6 5/6] core-image-minimal: support read-only rootfs
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
X-List-Received-Date: Sun, 06 Jan 2013 09:59:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Support read-only rootfs by providing a specific conf file for volatile storage.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/core-image-minimal.bb     |   10 ++++++++++
 .../images/files/volatiles-readonly-minimal        |    8 ++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-core/images/files/volatiles-readonly-minimal

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 0d2613e..2e8d2ff 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -6,9 +6,19 @@ IMAGE_LINGUAS = " "
 
 LICENSE = "MIT"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://volatiles-readonly-minimal"
+
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
 
 # remove not needed ipkg informations
 ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
+
+# install read-only rootfs specific conf file for minimal image
+choose_volatile_conf () {
+	cp ${WORKDIR}/volatiles-readonly-minimal \
+		${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
+}
diff --git a/meta/recipes-core/images/files/volatiles-readonly-minimal b/meta/recipes-core/images/files/volatiles-readonly-minimal
new file mode 100644
index 0000000..b7146a2
--- /dev/null
+++ b/meta/recipes-core/images/files/volatiles-readonly-minimal
@@ -0,0 +1,8 @@
+# This configuration file lists filesystem objects specific to minimal image
+# with read-only rootfs.
+# This configuration file will only be applied if the image is minimal and the
+# rootfs is read-only.
+# For the detailed format information, refer to /etc/default/volatiles/00_core.
+d root root 0755 /var/volatile/lib/ none
+d root root 0755 /var/volatile/lib/urandom/ none
+l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
-- 
1.7.9.5



