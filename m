Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Qa3CD-0005aP-Or
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 12:01:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5O9vSov015331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 02:57:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 24 Jun 2011 02:57:27 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 17:53:12 +0800
Message-ID: <874e7a3e34884c2de217a71726e40d0082e5626b.1308902512.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308902512.git.wenzong.fan@windriver.com>
References: <cover.1308902512.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] ccache: Set CCACHE on a per recipe basis
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
X-List-Received-Date: Fri, 24 Jun 2011 10:01:06 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Set 'CCACHE_DIR' in 'bitbake.conf' and create the dirs for every
package before task 'do_configure' started.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/base.bbclass |    1 +
 meta/conf/bitbake.conf    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..40fbb47 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -195,6 +195,7 @@ python base_eventhandler() {
 
 addtask configure after do_unpack do_patch
 do_configure[dirs] = "${S} ${B}"
+do_configure[dirs] =+ "${CCACHE_DIR} "
 do_configure[deptask] = "do_populate_sysroot"
 base_do_configure() {
 	:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6d8a674..d963d2e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -391,6 +391,7 @@ export PATH
 CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
+export CCACHE_DIR = "${TMPDIR}/ccache/${HOST_SYS}/${PN}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.0.4



