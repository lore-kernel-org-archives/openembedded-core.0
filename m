Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QvOD9-0001ey-M1
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 08:42:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7M6bVfU009702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 23:37:31 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 21 Aug 2011 23:37:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2011 14:37:52 +0800
Message-ID: <01eb53c8ccfd5f31aeb85e50398a0e5637e3c118.1313993805.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313993805.git.wenzong.fan@windriver.com>
References: <cover.1313993805.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cronie: Updates to cronie
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
X-List-Received-Date: Mon, 22 Aug 2011 06:42:16 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

1) Add required pam plugins to RDEPENDS list;
2) Correct configure option that used for enable pam support;
3) Create empty crond config file cron.deny;
4) Don't set readonly variable UID in crond init script.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/cronie/cronie/crond.init |    2 --
 meta/recipes-extended/cronie/cronie_1.4.8.bb   |    8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie/crond.init b/meta/recipes-extended/cronie/cronie/crond.init
index 050c37e..08f34be 100755
--- a/meta/recipes-extended/cronie/cronie/crond.init
+++ b/meta/recipes-extended/cronie/cronie/crond.init
@@ -21,8 +21,6 @@ CONFIG=/etc/sysconfig/crond
 # Source function library.
 . /etc/init.d/functions
 
-UID=`id -u`
-
 case "$1" in
   start)
     if [ $UID -ne 0 ] ; then
diff --git a/meta/recipes-extended/cronie/cronie_1.4.8.bb b/meta/recipes-extended/cronie/cronie_1.4.8.bb
index 4cfdfad..064347e 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.8.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.8.bb
@@ -15,7 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 SECTION = "utils"
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r0"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
+PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
+
+PR = "r1"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -31,7 +34,7 @@ SRC_URI[sha256sum] = "a3b910876f255712f1a5c364b74f34b0ceac9f6f3bbc45e854c5722785
 inherit autotools update-rc.d
 
 EXTRA_OECONF += "\
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)}"
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
 
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
@@ -50,6 +53,7 @@ do_install_append () {
 	mkdir -p ${D}${sysconfdir}/cron.daily
 	mkdir -p ${D}${sysconfdir}/cron.weekly
 	mkdir -p ${D}${sysconfdir}/cron.monthly
+	touch ${D}${sysconfdir}/cron.deny
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
-- 
1.7.0.4



