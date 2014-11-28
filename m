Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A52A9723C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 07:59:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAS7xvdw024815
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 23:59:57 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 27 Nov 2014 23:59:57 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Nov 2014 02:59:54 -0500
Message-ID: <bf7354c2277076830e182756a23ea0c27ea7172d.1417161490.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1417161489.git.wenzong.fan@windriver.com>
References: <cover.1417161489.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils-native: don't install groups
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
X-List-Received-Date: Fri, 28 Nov 2014 08:00:00 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This binary is provided by shadow-native nowadays. Fixes:

  ERROR: The recipe coreutils-native is trying to install files \
    into a shared area when those files already exist. \
    Those files and their manifest location are: \
      .../tmp/sysroots/x86_64-linux/usr/bin/groups \
    Matched in manifest-x86_64-shadow-native.populate_sysroot

To reproduce the errors:

  $ bitbake shadow-native && bitbake coreutils-native

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.22.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index 6239600..f85baca 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -74,6 +74,11 @@ do_install_append() {
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
 }
 
+do_install_append_class-native(){
+	# remove groups to fix conflict with shadow-native
+	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.9.5


