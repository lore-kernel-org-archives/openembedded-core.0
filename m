Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 624217089E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:20:26 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so5817865pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/2QAISKwrtPN4zNEbAzj5gDODA77mZ0WFEzNWiL9Uf4=;
	b=eIqpEmHasu+nVbOPP8y7NRR4TLtV3OVEkOz2Z/NhWqzuvVBCUNpTJzxAb8IvfKKXkO
	crC5Ndb2bbT5GQ/esJ5GQyapsptYthIuwwJm3x2+btAv8pmOJZA9t3/exx39NuyNb4dS
	IZ/JMmmfknsd1qw/X64Um8joHrkJJco5OGjzyah3kGJvUKz1O33Wv6i0RP8V1Ahwm6Kq
	aS+VNys0v3heRrtbKn5N2Lp4ZhCNQUoB8UICLi+bzYGNljKVgizYGnDlZIEK4GwuOTol
	beDQUL+UtSzLivKu70NhHbQjRe3zZpC5MxSCyTut2EvAZxZjf9/lAKJh8EjgSUTCUC+1
	IQZA==
X-Received: by 10.70.103.204 with SMTP id fy12mr5946551pdb.144.1406899227929; 
	Fri, 01 Aug 2014 06:20:27 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id p9sm2251486pdl.21.2014.08.01.06.20.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Aug 2014 06:20:27 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Aug 2014 18:46:41 +0530
Message-Id: <1406899001-3870-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] os-release: Adding a new recipe for operating system identification
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
X-List-Received-Date: Fri, 01 Aug 2014 13:20:31 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

The /etc/os-release will have the operating system identification data.
Tested on target with systemd enabled. Here is the sample file looks
in the file:

ID=poky-ivi-systemd
NAME=Yocto GENIVI Baseline (Poky/meta-ivi)
VERSION=6.0+snapshot-20140721 (daisy)
VERSION_ID=6.0+snapshot-20140721
PRETTY_NAME=Yocto GENIVI Baseline (Poky/meta-ivi) 6.0+snapshot-20140721 (daisy)

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-core/os-release/os-release.bb | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/os-release/os-release.bb

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
new file mode 100644
index 0000000..33e9581
--- /dev/null
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -0,0 +1,36 @@
+inherit allarch
+
+SUMMARY = "Operating system identification"
+DESCRIPTION = "The /etc/os-release file contains operating system identification data."
+LICENSE = "MIT"
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+
+# Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
+#                     HOME_URL SUPPORT_URL BUG_REPORT_URL
+OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+
+ID = "${DISTRO}"
+NAME = "${DISTRO_NAME}"
+VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
+VERSION_ID = "${DISTRO_VERSION}"
+PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
+BUILD_ID ?= "${DATETIME}"
+
+python do_compile () {
+    with open(d.expand('${B}/os-release'), 'w') as f:
+        for field in d.getVar('OS_RELEASE_FIELDS', True).split():
+            value = d.getVar(field, True)
+            if value:
+                f.write('{0}={1}\n'.format(field, value))
+}
+do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
+
+do_install () {
+    install -d ${D}${sysconfdir}
+    install -m 0644 os-release ${D}${sysconfdir}/
+}
-- 
1.8.4


