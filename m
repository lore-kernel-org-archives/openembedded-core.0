Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9618B72A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 01:28:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t461SGoL025938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 May 2015 18:28:16 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 18:28:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 May 2015 09:28:14 +0800
Message-ID: <1430875694-25906-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][v2] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Wed, 06 May 2015 01:28:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Remove -D_FORTIFY_SOURCE=2 from AM_CFLAGS when DEBUG_BUILD is 1

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index bdb4fed..50e0285 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -13,6 +13,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branc
 
 S = "${WORKDIR}/git"
 
+FORTIFY="${@base_conditional( "DEBUG_BUILD", "1", "", "-D_FORTIFY_SOURCE=2", d )}"
+EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64 ${FORTIFY}"'
+
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 mmc ${D}${bindir}
-- 
2.1.0


