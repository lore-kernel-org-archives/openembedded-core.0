Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 162D260559
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 02:53:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s472rg04024323
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 19:53:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 6 May 2014 19:53:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 May 2014 10:53:52 +0800
Message-ID: <4520dfb98e41d7f6da81fd929993c4cf6979f698.1399431138.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399431138.git.Qi.Chen@windriver.com>
References: <cover.1399431138.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] sudo: upgrade from 1.8.9p5 to 1.8.10p2
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
X-List-Received-Date: Wed, 07 May 2014 02:53:42 -0000
Content-Type: text/plain

Upgrade sudo from 1.8.9p5 to the newest stable release 1.8.10p2.

The license checksums are modified as required, because the doc/LICENSE
file now declares that compat/inet_pton.c bears a certain license.

As /var/run/sudo is the default directory for sudo's time stamp
files, this patch adds a configuration file to manage this directory.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/files/volatiles.99_sudo |    1 +
 meta/recipes-extended/sudo/sudo.inc                |    6 +++---
 .../sudo/{sudo_1.8.9p5.bb => sudo_1.8.10p2.bb}     |   13 ++++++++++---
 3 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/volatiles.99_sudo
 rename meta/recipes-extended/sudo/{sudo_1.8.9p5.bb => sudo_1.8.10p2.bb} (57%)

diff --git a/meta/recipes-extended/sudo/files/volatiles.99_sudo b/meta/recipes-extended/sudo/files/volatiles.99_sudo
new file mode 100644
index 0000000..ecb576e
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/volatiles.99_sudo
@@ -0,0 +1 @@
+d root root 0755 /var/run/sudo none
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 0aa5193..6de984a 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,13 +4,14 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=923752f88decdea9d69f92fe42c2af80 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=69e337d679950e304953813158595256 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 \
                     file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
                     file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea \
-                    file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681"
+                    file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
+                    file://compat/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
 
 inherit autotools
 
@@ -38,4 +39,3 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
-
diff --git a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb b/meta/recipes-extended/sudo/sudo_1.8.10p2.bb
similarity index 57%
rename from meta/recipes-extended/sudo/sudo_1.8.9p5.bb
rename to meta/recipes-extended/sudo/sudo_1.8.10p2.bb
index 7851473..aa8c445 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.10p2.bb
@@ -1,12 +1,13 @@
 require sudo.inc
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://volatiles.99_sudo"
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "d3f1f1cfca6b2b06b048e1abb7d0227e"
-SRC_URI[sha256sum] = "bc9d5c96de5f8b4d2b014f87a37870aef60d2891c869202454069150a21a5c21"
+SRC_URI[md5sum] = "5e5eab1036a7cc2c088ab0d9b6b6a42e"
+SRC_URI[sha256sum] = "ba6cb8db6dccdb92a96e8ae63ca65c410f8b61270b603ab9af4b1154fef379f1"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
@@ -20,4 +21,10 @@ do_install_append () {
 
 	chmod 4111 ${D}${bindir}/sudo
 	chmod 0440 ${D}${sysconfdir}/sudoers
+
+	# Explicitly remove the ${localstatedir}/run directory as we can
+	# manage it by a configuration file under ${sysconfdir}/default/volatiles/
+	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
+	install -d ${D}/${sysconfdir}/default/volatiles
+	install -m 644 ${WORKDIR}/volatiles.99_sudo ${D}/${sysconfdir}/default/volatiles/99_sudo
 }
-- 
1.7.9.5


