Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAFv5-0007BY-3C
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:30:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8DJ5Y015178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 00:13:19 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:13:19 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:14:29 +0800
Message-ID: <0e45eb2f773f3985d6cc47e78775a26271806b30.1361866257.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361866256.git.kai.kang@windriver.com>
References: <cover.1361866256.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 5/5] rpm: save output of postinstall scripts when image first boot
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
X-List-Received-Date: Tue, 26 Feb 2013 08:30:31 -0000
Content-Type: text/plain

When image feature "debug-tweaks" is enabled, save output of post
install script to log file which can be configured when image first
boot.

[YOCTO #3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 0b014b6..cdfb5ff 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -223,6 +223,7 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/wget \
 		/var/lib/rpm \
 		/var/cache/rpm \
+		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
 		"
 
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
@@ -374,6 +375,9 @@ do_configure() {
 #
 POSTINSTALL_INITPOSITION ?= "98"
 
+POSTLOG ?= "/var/log/postinstall.log"
+REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
+
 do_install_append() {
 	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
@@ -459,7 +463,7 @@ do_install_append() {
 for i in \`ls /etc/rpm-postinsts/\`; do
 	i=/etc/rpm-postinsts/$i
 	echo "Running postinst $i..."
-	if [ -f $i ] && $i; then
+	if [ -f $i ] && $i ${REDIRECT_CMD}; then
 		rm $i
 	else
 		echo "ERROR: postinst $i failed."
-- 
1.7.5.4



