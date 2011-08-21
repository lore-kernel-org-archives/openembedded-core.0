Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Qv51a-00038V-QJ
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Aug 2011 12:13:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7LA8J2S025469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 03:08:19 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 21 Aug 2011 03:08:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Aug 2011 18:08:47 +0800
Message-ID: <35f26276db5a755a6c4ec04845b66091d3e81bcd.1313921149.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313921149.git.liezhi.yang@windriver.com>
References: <cover.1313921149.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bitbake meta-toolchain with gcc 4.5.1 failed
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
X-List-Received-Date: Sun, 21 Aug 2011 10:13:03 -0000
Content-Type: text/plain

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
1.7.1



