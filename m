Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1STlAD-0006YZ-Qo
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 04:37:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4E2RZnK002141
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 19:27:35 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 13 May 2012 19:27:34 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 May 2012 21:28:22 -0500
Message-ID: <1336962502-7271-3-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bitbake.conf: A change to CCACHE_DIR should not change the sstate sum
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
X-List-Received-Date: Mon, 14 May 2012 02:37:34 -0000
Content-Type: text/plain

If the location of the CCACHE_DIR changes it should not impact the
sstate sum.  This allows a build generated with an external CCACHE_DIR
to have the same sstate sum as a build that uses the ccache dir
located in the temp build area.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9f4e4d4..9085779 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -413,6 +413,8 @@ CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+# The sstate cache dependencies should not depend on the value of CCACHE_DIR
+CCACHE_DIR[undep] = "1"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.1



