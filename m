Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB8F60097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:23:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M3NhbM009811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 20:23:43 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 20:23:43 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 23:23:40 -0400
Message-ID: <00f8984de62bbf66c7487bc854c4e5c10ce416fc.1413947830.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413947830.git.wenzong.fan@windriver.com>
References: <cover.1413947830.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Wed, 22 Oct 2014 03:23:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

When using cross compiler to build the package "lsof" on a host,
the value of LSOF_CCV in version.h genegrated by the Makefile
is the version of the compiler on the host while it should be
the version of cross compiler.

On Ubuntu host before fixed:
  #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "

After fixed:
  #define	LSOF_CCV	"4.9.1 (GCC) "

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../lsof/files/compiler-version-fault.patch        |   25 ++++++++++++++++++++
 meta/recipes-extended/lsof/lsof_4.87.bb            |    4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lsof/files/compiler-version-fault.patch

diff --git a/meta/recipes-extended/lsof/files/compiler-version-fault.patch b/meta/recipes-extended/lsof/files/compiler-version-fault.patch
new file mode 100644
index 0000000..dd61376
--- /dev/null
+++ b/meta/recipes-extended/lsof/files/compiler-version-fault.patch
@@ -0,0 +1,25 @@
+lsof: fix LSOF_CCV in version.h
+
+When using cross compiler to build the package "lsof" on a host,
+the value of LSOF_CCV in version.h genegrated by the Makefile
+is the version of the compiler on the host while it should be
+the version of cross compiler.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jian Liu <jian.liu@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+================================
+diff -Nur lsof_4.87_src.orig/dialects/linux/Makefile lsof_4.87_src/dialects/linux/Makefile
+--- lsof_4.87_src.orig/dialects/linux/Makefile	2008-04-15 21:30:04.000000000 +0800
++++ lsof_4.87_src/dialects/linux/Makefile	2014-09-09 14:15:27.208165334 +0800
+@@ -77,7 +77,8 @@
+ 	@rm -f version.h
+ 	@echo '#define	LSOF_BLDCMT	"${LSOF_BLDCMT}"' > version.h;
+ 	@echo '#define	LSOF_CC		"${CC}"' >> version.h
+-	@echo '#define	LSOF_CCV	"${CCV}"' >> version.h
++	@LSOF_CCV=`${CC} -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'` &&\
++	echo "#define	LSOF_CCV	\"$${LSOF_CCV}\"" >> version.h
+ 	@echo '#define	LSOF_CCDATE	"'`date`'"' >> version.h
+ 	@echo '#define	LSOF_CCFLAGS	"'`echo ${CFLAGS} | sed 's/\\\\(/\\(/g' | sed 's/\\\\)/\\)/g' | sed 's/"/\\\\"/g'`'"' >> version.h
+ 	@echo '#define	LSOF_CINFO	"${CINFO}"' >> version.h
diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
index e7a1eb2..e4ad4b4 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -4,7 +4,9 @@ Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
 
-SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
+SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
+           file://compiler-version-fault.patch \
+          "
 
 SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
 SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
-- 
1.7.9.5


