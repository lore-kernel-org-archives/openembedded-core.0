Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtcji-0004Cf-RR
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 11:48:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7H9hulY000371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 02:43:56 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 17 Aug 2011 02:43:55 -0700
Message-ID: <fc975472f3a265646a5ee7dcd3cc0cf69a566662.1313571206.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313571206.git.kai.kang@windriver.com>
References: <cover.1313571206.git.kai.kang@windriver.com>
Old-Date: Tue, 16 Aug 2011 16:32:27 +0800
Date: Wed, 17 Aug 2011 17:43:49 +0800
To: <openembedded-core@lists.openembedded.org>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Subject: [PATCH 1/1] at: make at usable for common user
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
X-List-Received-Date: Wed, 17 Aug 2011 09:48:35 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Fixes [Yocto #1297]

The pkg_postinst was added to fix Yocto #675. But it seems not needed
any more. Remove it then unprivilege user could use at.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/at/at_3.1.12.bb |   26 +++++---------------------
 1 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.12.bb b/meta/recipes-extended/at/at_3.1.12.bb
index c76b50e..baf15df 100644
--- a/meta/recipes-extended/at/at_3.1.12.bb
+++ b/meta/recipes-extended/at/at_3.1.12.bb
@@ -4,11 +4,14 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex libpam initscripts \
+DEPENDS = "flex initscripts \
 	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
+PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
+
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
@@ -56,23 +59,4 @@ do_install () {
 	done
 }
 
-pkg_postinst_${PN} () {
-	if [ "x$D" != "x" ] ; then
-		exit 1
-	fi
-
-	# below is necessary to allow at usable to normal users
-	# now at is has its own /var/spool/at instead of under /var/spool/cron
-	# this way is better to allow setgid on both sides
-	grep "^daemon" /etc/group || groupadd daemon
-	chown root:daemon /usr/bin/at
-	chmod 2755 /usr/bin/at
-
-	chown root:daemon -R /var/spool/at
-	chmod 770 -R /var/spool/at
-
-	chown root:daemon /etc/at.deny
-	chmod 640 /etc/at.deny
-}
-
 PARALLEL_MAKE = ""
-- 
1.7.5.1.300.gc565c



