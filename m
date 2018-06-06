Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4442786AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 02:46:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w562kXC4009489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 19:46:49 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 19:46:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2018 10:54:42 +0800
Message-ID: <91ccae9686e4afb8e76d524209fc6064bff7404c.1528252931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 07/11] dropbear: add default config file to disable root login
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
X-List-Received-Date: Wed, 06 Jun 2018 02:46:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

root login is disabled by default for openssh and we can
enable it through IMAGE_FEATURES 'debug-tweaks' or
'allow-empty-password', so change to the same default
behavior for dropbear.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc              | 3 +++
 meta/recipes-core/dropbear/dropbear/dropbear.default | 2 ++
 2 files changed, 5 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 16ac644..9596363 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -20,6 +20,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbearkey.service \
            file://dropbear@.service \
            file://dropbear.socket \
+           file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
@@ -63,6 +64,8 @@ do_install() {
 		${D}${sbindir} \
 		${D}${localstatedir}
 
+	install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
+
 	install -m 0755 dropbearmulti ${D}${sbindir}/
 	ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
 
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear.default b/meta/recipes-core/dropbear/dropbear/dropbear.default
new file mode 100644
index 0000000..522453a
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear.default
@@ -0,0 +1,2 @@
+# Disallow root logins by default
+DROPBEAR_EXTRA_ARGS="-w"
-- 
2.7.4


