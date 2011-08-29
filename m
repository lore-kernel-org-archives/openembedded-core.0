Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QxzS6-0005Xl-0y
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 12:52:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7TAlX1F007515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 03:47:33 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 29 Aug 2011 03:47:32 -0700
Message-ID: <87a9dca42042f94b9de19efa514b2938cc11e486.1314604566.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1314604566.git.xiaofeng.yan@windriver.com>
References: <cover.1314604566.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 29 Aug 2011 15:41:34 +0800
Date: Mon, 29 Aug 2011 18:48:37 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dropbear: Change the path to find configuration file and add a configuration file for dropbear
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2011 10:52:27 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

dropbear will check "/etc/pam.d/sshd" which comes from package "openssh" \
When enabling pam supporting. But if we only install dropbear \
package without package "openssh", then "dropbear" will not \
find a configuration file. The changes are as follow for fixing this bug:

- Change the path to find configuration file (/etc/pam.d/sshd --> /etc/pam.d/dropbear)
- Add a configuration file "/etc/pam.d/dropbear"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |    6 +++++-
 meta/recipes-core/dropbear/dropbear/dropbear       |    4 ++++
 .../dropbear/dropbear-configuration-file.patch     |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 5af9ebd..577b288 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -19,7 +19,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 	         file://init \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
-PAM_SRC_URI = "file://dropbear-enable-pam.patch"
+PAM_SRC_URI = "file://dropbear-enable-pam.patch \
+               file://dropbear-configuration-file.patch \
+               file://dropbear"
 
 inherit autotools update-rc.d
 
@@ -51,6 +53,7 @@ do_install() {
 		   ${D}${sysconfdir}/init.d \
 		   ${D}${sysconfdir}/default \
 		   ${D}${sysconfdir}/dropbear \
+		   ${D}${sysconfdir}/pam.d \
                    ${D}${bindir} \
 		   ${D}${sbindir} \
 		   ${D}${localstatedir}
@@ -68,6 +71,7 @@ do_install() {
 				  -e 's,/usr/bin,${bindir},g' \
 				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
 	chmod 755 ${D}${sysconfdir}/init.d/dropbear
+	install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear b/meta/recipes-core/dropbear/dropbear/dropbear
new file mode 100644
index 0000000..47e787f
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear
@@ -0,0 +1,4 @@
+#%PAM-1.0
+
+auth     include  common-auth
+account  include  common-account
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
new file mode 100644
index 0000000..5e94553
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
@@ -0,0 +1,18 @@
+dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam configuration file \
+to "/etc/pam.d/dropbear for dropbear when enabling pam supporting" 
+
+Upstream-Status: Inappropriate [configuration] 
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/svr-authpam.c	2008-11-11 22:09:03.000000000 +0800
++++ b/svr-authpam.c.new	2011-08-29 09:53:24.000000000 +0800
+@@ -199,7 +199,7 @@
+ 	userData.passwd = password;
+ 
+ 	/* Init pam */
+-	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
++	if ((rc = pam_start("dropbear", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
+ 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s\n", 
+ 				rc, pam_strerror(pamHandlep, rc));
+ 		goto cleanup;
-- 
1.7.0.4



