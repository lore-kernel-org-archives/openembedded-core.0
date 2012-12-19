Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TlGLS-0001UJ-Pz
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 10:53:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ9d570000709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 01:39:05 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 19 Dec 2012 01:39:02 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:39:37 +0800
Message-ID: <263dec923f4318de7ca03864c646e82c29cdc73d.1355902677.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355902677.git.kai.kang@windriver.com>
References: <cover.1355902677.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/4] base-files: use dynamic root home directory
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
X-List-Received-Date: Wed, 19 Dec 2012 09:54:14 -0000
Content-Type: text/plain

Use var ROOT_HOME to configure root home directory dynamically.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-core/base-files/base-files/profile   |    2 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index e9408d1..8eeaac3 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -11,7 +11,7 @@ if [ ! -e /etc/localtime ]; then
 	export TZ
 fi
 
-if [ "$HOME" = "/home/root" ]; then
+if [ "$HOME" = "ROOTHOME" ]; then
    PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
 fi
 if [ "$PS1" ]; then
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ba355ee..39faad9 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -34,7 +34,7 @@ docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/lock ${localstatedir}/volatile/tmp"
 dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
 dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel /lib /mnt /proc /home/root /sbin \
+           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /sbin \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
@@ -94,6 +94,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
 	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
+	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
 	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
 	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
-- 
1.7.5.4



