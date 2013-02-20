Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U842C-0002OR-Jb
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 08:24:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K77vZH000599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:07:57 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 19 Feb 2013 23:07:56 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 15:07:52 +0800
Message-ID: <1361344072-31152-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1361344072-31152-1-git-send-email-rongqing.li@windriver.com>
References: <1361344072-31152-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH 1/1] gcc: make compiler to search build directory before standard system include directories
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
X-List-Received-Date: Wed, 20 Feb 2013 07:24:10 -0000
Content-Type: text/plain

If libunwind is compiled firstly, unwind.h from libunwind
is installed into sysroot, compiling gcc will fail since
it use wrong unwind.h, it should always use unwind.h under
build directory.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |    2 +-
 meta/recipes-devtools/gcc/gcc_4.7.bb  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 8735e48..d353bad 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r18"
+PR = "r19"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc_4.7.bb b/meta/recipes-devtools/gcc/gcc_4.7.bb
index 9954375..ff924e8 100644
--- a/meta/recipes-devtools/gcc/gcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.7.bb
@@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/"
-- 
1.7.10.4



