Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1T6QaW-0004A8-Ej
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 20:32:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7SIKIWW011980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 11:20:18 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 28 Aug 2012 11:20:17 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2012 14:20:28 -0400
Message-ID: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Tue, 28 Aug 2012 18:32:32 -0000
Content-Type: text/plain

The existence of a /etc/hostname file causes any hostname provided on
the kernel command line or via dhcp to be overwritten by the
initscripts 'init.d/hostname.sh'. This change allows you to set a
value of 'none' for 'hostname' which will skip the creation of the
/etc/hostname file by the base-files package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
V2: Koen Kooi didn't want to see the handling of the hostname variable
    changed so I removed those changes and just focused on the creation
    of the /etc/hostname file.

  Changes from V1:
  * patch renamed, was 
    "base-files: allow for more flexibility related to hostname",
  * removed the rename of hostname to MACHINE_HOSTNAME
  * removed the addition made to meta/conf/local.conf.sample

 meta/recipes-core/base-files/base-files_3.0.14.bb |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6bab040..dfcca78 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -107,10 +107,12 @@ do_install () {
 }
 
 do_install_basefilesissue () {
-	if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
-		echo ${MACHINE} > ${D}${sysconfdir}/hostname
-	else
-		echo ${hostname} > ${D}${sysconfdir}/hostname
+	if [ "${hostname}" != "none" ]; then
+		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
+			echo ${MACHINE} > ${D}${sysconfdir}/hostname
+		else
+			echo ${hostname} > ${D}${sysconfdir}/hostname
+		fi
 	fi
 
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
-- 
1.7.9.5



