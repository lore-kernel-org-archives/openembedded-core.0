Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1T64jP-0001t6-G5
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 21:12:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7RFOJ2u016178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 08:24:19 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 27 Aug 2012 08:24:19 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2012 11:24:29 -0400
Message-ID: <1346081069-4741-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] base-files: allow for more flexibility related to hostname
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
X-List-Received-Date: Mon, 27 Aug 2012 19:12:15 -0000
Content-Type: text/plain

Current logic used to create the /etc/hostname file is fairly
restrictive and doesn't allow for easy customization since the
variable 'hostname' is local to the base-files recipe. Changing
'hostname' to a globally recognized variable which can be overwritten
overcomes these restrictions. Additionally it is not always desirable
to establish a /etc/hostname file, such as when we want to define the
hostname via dhcp or using the kernel command line, so we provide a
mechanism to skip its creation.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/conf/local.conf.sample                       |   11 +++++++++++
 meta/recipes-core/base-files/base-files_3.0.14.bb |   15 +++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 5679c03..50696e4 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -43,6 +43,17 @@
 MACHINE ??= "qemux86"
 
 #
+# Hostname
+#
+# The openembedded default is to write a '${sysconfdir}/hostname' file which
+# will have ${MACHINE} as the hostname. If you want to use a different hostname
+# set it here. You may also set this to 'none' which will forgo the creation of
+# the '${sysconfdir}/hostname' file allowing, for example, the hostname to be
+# provided by your dhcp configuration or via the kernel command line.
+#
+#MACHINE_HOSTNAME ?= "none"
+
+#
 # Where to place downloads
 #
 # During a first build the system will download many different source code tarballs
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6bab040..571eded 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -60,10 +60,7 @@ conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
              ${sysconfdir}/default"
 
-#
-# set standard hostname, might be a candidate for a DISTRO variable? :M:
-#
-hostname = "openembedded"
+MACHINE_HOSTNAME ?= "openembedded"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
@@ -107,10 +104,12 @@ do_install () {
 }
 
 do_install_basefilesissue () {
-	if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
-		echo ${MACHINE} > ${D}${sysconfdir}/hostname
-	else
-		echo ${hostname} > ${D}${sysconfdir}/hostname
+	if [ "${MACHINE_HOSTNAME}" != "none" ]; then
+		if [ -n "${MACHINE}" -a "${MACHINE_HOSTNAME}" = "openembedded" ]; then
+			echo ${MACHINE} > ${D}${sysconfdir}/hostname
+		else
+			echo ${MACHINE_HOSTNAME} > ${D}${sysconfdir}/hostname
+		fi
 	fi
 
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
-- 
1.7.9.5



