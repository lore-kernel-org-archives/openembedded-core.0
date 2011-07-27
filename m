Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qm0Zz-0004i4-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:39:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6R9YkiB003715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2011 02:34:46 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 27 Jul 2011 02:34:46 -0700
Message-ID: <d5e06516ed6656364b8127740700d1403b72d567.1311758282.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311758282.git.kai.kang@windriver.com>
References: <cover.1311758282.git.kai.kang@windriver.com>
Old-Date: Wed, 27 Jul 2011 17:14:41 +0800
Date: Wed, 27 Jul 2011 17:34:45 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: Kang, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] ghostscript: fix parallel build issue
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
X-List-Received-Date: Wed, 27 Jul 2011 09:39:03 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

ghostscript fails some time on autobuilder, it seems a parallel build issue.
Add patch to fix it.

Fixes [Yocto #1202]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript-9.02-parallel-make.patch           |   17 +++++++++++++++++
 .../ghostscript/ghostscript_9.02.bb                |    3 ++-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
new file mode 100644
index 0000000..76d1676
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
@@ -0,0 +1,17 @@
+When parallel make it will fail with multi copy, see
+http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+--- ghostscript-9.02/base/unixhead.mak.orig	2011-07-27 17:06:17.749456100 +0800
++++ ghostscript-9.02/base/unixhead.mak	2011-07-27 17:06:37.449456100 +0800
+@@ -54,7 +54,7 @@
+ 
+ # Define generic commands.
+ 
+-CP_=cp
++CP_=cp -f
+ RM_=rm -f
+ RMN_=rm -f
+ 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
index 02038ea..28c6c9e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "${PN}-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
@@ -27,6 +27,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://soobjarch.h \
+           file://ghostscript-9.02-parallel-make.patch \
            "
 SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 
-- 
1.7.5.1.300.gc565c



