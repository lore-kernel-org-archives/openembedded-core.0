Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 217027BE88
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 09:05:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0894mv9029706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 01:05:09 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 8 Jan 2019 01:04:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jan 2019 17:12:52 +0800
Message-ID: <11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1546938633.git.Qi.Chen@windriver.com>
References: <cover.1546938633.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Tue, 08 Jan 2019 09:05:18 -0000
Content-Type: text/plain

Move /etc/hosts to base-files, and also add entry to it according
to hostname setting. This fixes the problem of commands like
`hostname -f' failing due to lack of such entry.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/{netbase/netbase => base-files/base-files}/hosts | 0
 meta/recipes-core/base-files/base-files_3.0.14.bb                  | 5 ++++-
 meta/recipes-core/netbase/netbase_5.5.bb                           | 6 +-----
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-core/{netbase/netbase => base-files/base-files}/hosts (100%)

diff --git a/meta/recipes-core/netbase/netbase/hosts b/meta/recipes-core/base-files/base-files/hosts
similarity index 100%
rename from meta/recipes-core/netbase/netbase/hosts
rename to meta/recipes-core/base-files/base-files/hosts
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6e75652..6e30c14 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "file://rotation \
            file://nsswitch.conf \
            file://motd \
+           file://hosts \
            file://host.conf \
            file://profile \
            file://shells \
@@ -113,6 +114,7 @@ do_install () {
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
+	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
 	${BASEFILESISSUEINSTALL}
 
 	rotation=`cat ${WORKDIR}/rotation`
@@ -140,6 +142,7 @@ DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
 	if [ "${hostname}" ]; then
 		echo ${hostname} > ${D}${sysconfdir}/hostname
+		echo "127.0.1.1 ${hostname}" >> ${D}${sysconfdir}/hosts
 	fi
 
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
@@ -177,5 +180,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname') != '')]} ${sysconfdir}/shells"
+CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname ${sysconfdir}/hosts'][(d.getVar('hostname') != '')]} ${sysconfdir}/shells"
 CONFFILES_${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
diff --git a/meta/recipes-core/netbase/netbase_5.5.bb b/meta/recipes-core/netbase/netbase_5.5.bb
index 2061f86..eb53add 100644
--- a/meta/recipes-core/netbase/netbase_5.5.bb
+++ b/meta/recipes-core/netbase/netbase_5.5.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab
 PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz \
-           file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch \
-           file://hosts"
+           file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch"
 
 SRC_URI[md5sum] = "15f2d9b3783802f7f48f6734b6540ac4"
 SRC_URI[sha256sum] = "309bddc69a43b98e5a450992b70cdfc0e3d1afb9107bc631d04b0714be98f88b"
@@ -16,10 +15,7 @@ SRC_URI[sha256sum] = "309bddc69a43b98e5a450992b70cdfc0e3d1afb9107bc631d04b0714be
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
 	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
 	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
 	install -m 0644 etc-services ${D}${sysconfdir}/services
 }
-
-CONFFILES_${PN} = "${sysconfdir}/hosts"
-- 
1.9.1


