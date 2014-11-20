Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 634C365E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 03:06:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAK36pBN016642
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 19:06:51 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 19 Nov 2014 19:06:50 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Nov 2014 11:06:47 +0800
Message-ID: <1416452807-22721-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] lsof: the compiler version fault
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
X-List-Received-Date: Thu, 20 Nov 2014 03:06:51 -0000
Content-Type: text/plain

When using cross compiler to build the package "lsof" on a host,
the value of LSOF_CCV in version.h genegrated by the Makefile
is the version of the compiler on the host while it should be
the version of cross compiler.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 .../lsof/files/compiler-version-fault.patch                 | 13 +++++++++++++
 meta/recipes-extended/lsof/lsof_4.87.bb                     |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lsof/files/compiler-version-fault.patch

diff --git a/meta/recipes-extended/lsof/files/compiler-version-fault.patch b/meta/recipes-extended/lsof/files/compiler-version-fault.patch
new file mode 100644
index 0000000..bf22f4b
--- /dev/null
+++ b/meta/recipes-extended/lsof/files/compiler-version-fault.patch
@@ -0,0 +1,13 @@
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
index 03fee16..9de3f33 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -5,7 +5,9 @@ SECTION = "devel"
 LICENSE = "BSD"
 PR = "r0"
 
-SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
+SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
+	file://compiler-version-fault.patch \
+	"
 
 SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
 SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
-- 
1.8.5.2.233.g932f7e4


