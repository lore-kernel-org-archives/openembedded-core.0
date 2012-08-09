Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SzJ9r-0001Ji-ED
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 05:11:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q792xllC003775
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 19:59:47 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 8 Aug 2012 19:59:46 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Aug 2012 10:59:15 +0800
Message-ID: <ab9afe9c0eab7dc2d9832cd2afabe1eededc7cae.1344480978.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344480978.git.wenzong.fan@windriver.com>
References: <cover.1344480978.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] at 3.1.13: get 'at' depends on 'flex-native' explicitly
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
X-List-Received-Date: Thu, 09 Aug 2012 03:11:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

'at' needs flex to generate source file lex.yy.c, but it doesn't
depend on flex-native directly; This maybe cause a do_compile
failure if flex-native is not built or included in project.

Error message is:
    error: lex.yy.c: No such file or directory

Get 'at' depends on flex-native to fix this potential issue.

[YOCTO #2919]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index ce9396a..a391d6e 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -4,14 +4,14 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex initscripts \
+DEPENDS = "flex flex-native initscripts \
 	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
-- 
1.7.9.5



