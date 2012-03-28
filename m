Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SCpWn-0002kH-PL
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 11:50:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2S9fong014143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 02:41:51 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 28 Mar 2012 02:41:51 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 17:41:45 +0800
Message-ID: <a913503c671f8442d554a5f54cf93bcf8219a53d.1332927487.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332927487.git.kai.kang@windriver.com>
References: <cover.1332927487.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 1/1] ghostscript: fix parallel make issue
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
X-List-Received-Date: Wed, 28 Mar 2012 09:50:54 -0000
Content-Type: text/plain

[Yocto 1202]

Update ghostscript-9.02-parallel-make.patch to fix parallel make
failure.
Bump up PR.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript-9.02-parallel-make.patch           |   13 +++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |    2 +-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
index bb0c41c..94ad5f5 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
@@ -1,6 +1,8 @@
 When parallel make it will fail with multi copy, see
 http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
 
+Update for psi/int.mak to avoid parallel build error.
+
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
@@ -34,3 +36,14 @@ Index: ghostscript-9.04/base/lib.mak
  	$(GLCC) $(GLO_)gconfig.$(OBJ) $(C_) $(GLGEN)gconfig.c
  
  $(GLOBJ)gscdefs.$(OBJ) : $(GLSRC)gscdef.c\
+--- ghostscript-9.05/psi/int.mak.orig	2012-03-28 14:48:20.082048252 +0800
++++ ghostscript-9.05/psi/int.mak	2012-03-28 14:55:03.142053958 +0800
+@@ -272,7 +272,7 @@
+  $(gconf_h) $(gconfigd_h) $(gsmemory_h) $(gstypes_h)\
+  $(iminst_h) $(iref_h) $(ivmspace_h) $(opdef_h) $(iplugin_h)
+ 	$(RM_) $(PSGEN)iconfig.c
+-	$(CP_) $(gconfig_h) $(PSGEN)gconfig.h
++	-$(CP_) $(gconfig_h) $(PSGEN)gconfig.h
+ 	$(CP_) $(PSSRC)iconf.c $(PSGEN)iconfig.c
+ 	$(PSCC) $(PSO_)iconfig.$(OBJ) $(C_) $(PSGEN)iconfig.c
+ 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 67b1cf7..6fc9f57 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
-- 
1.7.5.4



