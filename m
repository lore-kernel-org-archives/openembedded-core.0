Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81062608BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 14:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OEMGoC027416 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:23:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UoNywZXxiQQk
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:23:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9OEMtJu027432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:22:56 +0100
Message-ID: <1414160610.30118.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 15:23:30 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] gnu-config/hicolor-icon-theme: Deal with "make clean" breakage
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
X-List-Received-Date: Fri, 24 Oct 2014 14:23:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These pieces of software can;t cope with a "make clean" so disable that
newly enabled functionality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index d67466a..910b612 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -17,6 +17,10 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV
 SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
 SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
 
+do_configure () {
+	:
+}
+
 do_compile() {
 	:
 }
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 00fa759..ee1621f 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -17,6 +17,10 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
 
 S = "${WORKDIR}/git"
 
+do_configure () {
+	:
+}
+
 do_compile() {
 	:
 }
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
index 9df81cb..9f372c5 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "a38b038915480d1ddd4e3c421562560a14d42ace0449a5acc07c50f57f
 
 FILES_${PN} += "${datadir}/icons"
 
+autotools_preconfigure () {
+	:
+}
+
 do_install_append () {
 	install -m 0644 ${WORKDIR}/index.theme ${D}/${datadir}/icons/hicolor
 }



