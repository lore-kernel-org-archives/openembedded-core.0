Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qyau7-0001IS-Uf
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 04:51:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7V2kvuP013084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 19:46:57 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 30 Aug 2011 19:46:57 -0700
Message-ID: <44d5fd558b4079edf813e96ff0bf6ce06930c0dd.1314758474.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1314758474.git.xiaofeng.yan@windriver.com>
References: <cover.1314758474.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 31 Aug 2011 10:35:25 +0800
Date: Wed, 31 Aug 2011 10:48:11 +0800
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
X-List-Received-Date: Wed, 31 Aug 2011 02:51:54 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

dropbear will check "/etc/pam.d/sshd" which comes from package "openssh" \
When enabling pam supporting. But if we only install dropbear \
package without package "openssh", then "dropbear" will not \
find a configuration file.
The changes are as follow for fixing this bug:

- Change the path to find configuration file (/etc/pam.d/sshd --> /etc/pam.d/dropbear)
- Add a configuration file "/etc/pam.d/dropbear"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 5af9ebd..1582f2e 100644
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
 
@@ -68,6 +70,14 @@ do_install() {
 				  -e 's,/usr/bin,${bindir},g' \
 				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
 	chmod 755 ${D}${sysconfdir}/init.d/dropbear
+	for i in ${DISTRO_FEATURES};
+	do
+		if [ ${i} = "pam" ];  then
+			install -d ${D}${sysconfdir}/pam.d
+			install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
+		fi
+	done
+
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.0.4



