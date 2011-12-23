Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdtWZ-0008Ds-Rl
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 02:02:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBN0t6in004358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 16:55:08 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Dec 2011 16:55:06 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 19:01:35 -0600
Message-ID: <db6f91ce68cd13c8136e5cb8410fea06bfc0ad15.1324601996.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1324601996.git.mark.hatle@windriver.com>
References: <cover.1324601996.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/7] package.bbclass: Adjust RPM call to use dynamic location for magic files
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
X-List-Received-Date: Fri, 23 Dec 2011 01:02:16 -0000
Content-Type: text/plain

The magic file could be installed somewhere else if the system native prefix
settings are changed.  Adjust the packaging files to compensate for this.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass     |    2 +-
 meta/classes/package_rpm.bbclass |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 39c1d4b..9040eb4 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1113,7 +1113,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
 
 # Collect perfile run-time dependency metadata
 # Output:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 93a4c31..469526b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -941,7 +941,7 @@ python do_package_rpm () {
 		d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
 	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}', d)
 	pkgarch = bb.data.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}', d)
-	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
+	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc', d)
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
 
-- 
1.7.3.4



