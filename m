Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SsA12-0003Fq-TS
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:00:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6K9nWDO021352
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:49:32 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 20 Jul 2012 02:49:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 17:49:16 +0800
Message-ID: <6c2d23b84d391462402e45eaaa814b273fa985a5.1342772908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1342772908.git.liezhi.yang@windriver.com>
References: <cover.1342772908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] package_rpm: DEPLOY_DIR_RPM must exist before make index
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
X-List-Received-Date: Fri, 20 Jul 2012 10:00:57 -0000
Content-Type: text/plain

There is a package-index.bb which will update the index, but the
DEPLOY_DIR_RPM may not exist, for example, when "bitbake package-index"
in a fresh build.

Only the package_rpm.bbclass needs this, the package_ipk.bbclass and
package_deb.bbclass doesn't need.

[YOCTO #2753]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d213e40..983be4c 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -22,7 +22,7 @@ RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
 # Update the Packages depsolver db in ${DEPLOY_DIR_RPM}
 #
 package_update_index_rpm () {
-	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
+	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" -o ! -e "${DEPLOY_DIR_RPM}" ]; then
 		return
 	fi
 
@@ -1171,6 +1171,6 @@ do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
 addtask package_write_rpm before do_package_write after do_package
 
-PACKAGEINDEXES += "package_update_index_rpm; createrepo ${DEPLOY_DIR_RPM};"
+PACKAGEINDEXES += "package_update_index_rpm; [ ! -e ${DEPLOY_DIR_RPM} ] || createrepo ${DEPLOY_DIR_RPM};"
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
-- 
1.7.1



