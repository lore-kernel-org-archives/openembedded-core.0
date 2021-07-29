Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.9525.1627565710741384694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 06:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DFD981C0007;
	Thu, 29 Jul 2021 13:35:08 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] meta-skeleton: add recipe examples from documentation sources
Date: Thu, 29 Jul 2021 15:34:51 +0200
Message-Id: <20210729133451.164677-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds three examples previously located in the yocto-docs
repository (under documentation/ref-manual/examples).

The examples were not used for building the documentation
so it's better to keep them here where they can automatically be
tested.

Fixed the "hello-single" to add a version number to the .bb file.
After this, all examples build fine with the "master" branch of Poky.

Note that the "mtd-utils" example, and example of a recipe
for an Autotools page, was not copied over. It doesn't build any
more, and anyway, we already have an official recipe for a recent version
of "mtd-utils" in OE-core.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../hello-autotools/hello_2.10.bb               |  9 +++++++++
 .../hello-single/files/helloworld.c             |  8 ++++++++
 .../recipes-skeleton/hello-single/hello_1.0.bb  | 17 +++++++++++++++++
 .../recipes-skeleton/libxpm/libxpm_3.5.6.bb     | 14 ++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb
 create mode 100644 meta-skeleton/recipes-skeleton/hello-single/files/helloworld.c
 create mode 100644 meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
 create mode 100644 meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb

diff --git a/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb b/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb
new file mode 100644
index 0000000000..aa2beb9a9b
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "GNU Helloworld application"
+SECTION = "examples"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
+SRC_URI[sha256sum] = "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"
+
+inherit autotools-brokensep gettext
diff --git a/meta-skeleton/recipes-skeleton/hello-single/files/helloworld.c b/meta-skeleton/recipes-skeleton/hello-single/files/helloworld.c
new file mode 100644
index 0000000000..fc7169b7b8
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/hello-single/files/helloworld.c
@@ -0,0 +1,8 @@
+#include <stdio.h>
+
+int main(void)
+{
+	printf("Hello world!\n");
+
+	return 0;
+}
diff --git a/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb b/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
new file mode 100644
index 0000000000..90d3aefd86
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Simple helloworld application"
+SECTION = "examples"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://helloworld.c"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	${CC} ${LDFLAGS} helloworld.c -o helloworld
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 helloworld ${D}${bindir}
+}
diff --git a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
new file mode 100644
index 0000000000..c0c8986405
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
+
+DESCRIPTION = "X11 Pixmap library"
+LICENSE = "X-BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
+DEPENDS += "libxext"
+PR = "r2"
+PE = "1"
+
+XORG_PN = "libXpm"
+
+PACKAGES =+ "sxpm cxpm"
+FILES_cxpm = "${bindir}/cxpm"
+FILES_sxpm = "${bindir}/sxpm"
-- 
2.25.1

