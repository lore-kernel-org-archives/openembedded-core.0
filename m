Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13BCF6A4B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:49:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4VFnAKp020058
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2013 08:49:10 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 31 May 2013 08:49:10 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 May 2013 10:55:46 -0500
Message-ID: <1370015746-22465-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH v2] gcc: add build directory to include directories
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
X-List-Received-Date: Fri, 31 May 2013 15:49:11 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Add build directory to include directories by -I${B}/include which will
be searched before standard system include directories.

Both libunwind and gcc supply unwind.h, once gcc use libunwind's unwind.h,
the compiling will fail.

This patch is generally not applicable to the upstream as they do not
use libunwind.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc_4.7.bb | 2 +-
 meta/recipes-devtools/gcc/gcc_4.8.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc_4.7.bb b/meta/recipes-devtools/gcc/gcc_4.7.bb
index 9954375..f68c67a 100644
--- a/meta/recipes-devtools/gcc/gcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.7.bb
@@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb b/meta/recipes-devtools/gcc/gcc_4.8.bb
index 9954375..f68c67a 100644
--- a/meta/recipes-devtools/gcc/gcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
@@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
-- 
1.8.3.rc1.25.g423ecb0


