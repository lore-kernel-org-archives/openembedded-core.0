Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30BA260111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:30:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5U6UH9G008042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 23:30:17 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 29 Jun 2017 23:30:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jun 2017 14:30:09 +0800
Message-ID: <470621e87056ac0367cecf89d0dba2f0eb88dde8.1498803976.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498803976.git.jackie.huang@windriver.com>
References: <cover.1498803976.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] dropbear: add default config file to disable root login
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
X-List-Received-Date: Fri, 30 Jun 2017 06:30:17 -0000
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
index b6b436c584..359a898116 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbearkey.service \
            file://dropbear@.service \
            file://dropbear.socket \
+           file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
@@ -61,6 +62,8 @@ do_install() {
 		${D}${sbindir} \
 		${D}${localstatedir}
 
+	install -m 0755 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
+
 	install -m 0755 dropbearmulti ${D}${sbindir}/
 	ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
 
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear.default b/meta/recipes-core/dropbear/dropbear/dropbear.default
new file mode 100644
index 0000000000..522453a86c
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear.default
@@ -0,0 +1,2 @@
+# Disallow root logins by default
+DROPBEAR_EXTRA_ARGS="-w"
-- 
2.11.0


