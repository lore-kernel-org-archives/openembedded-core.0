Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUO-0006yL-92
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:57:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970280"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:57 -0700
Message-Id: <b9f8f4801c81b09282bd2fe1ad6082dcc3331e07.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/19] bitbake meta-toolchain with gcc 4.5.1 failed
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
X-List-Received-Date: Mon, 22 Aug 2011 21:57:00 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixes bug [YOCTO #1386]

1) Add the following lines to conf/local.conf:

SDKGCCVERSION="4.5.1"
GCCVERSION="4.5.1"

2) bitbake meta-toolchain

The we will notice the error that sed can't find the directory:

${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}-${PR}

we had changed the name of S from gcc-${PV} to gcc-${PV}-${PR}, but didn't
update meta/recipes-devtools/gcc/gcc-common.inc, so fix S in gcc-common.inc
would make it work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 52431fa..f83f4da 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -40,7 +40,7 @@ ${GNU_MIRROR}/gcc/	http://gcc.get-software.com/releases/ \n \
 gcclibdir = "${libdir}/gcc"
 BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
-S = "${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}-${PR}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # SS means Shared Stamps directory
-- 
1.7.6



