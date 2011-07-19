Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4U-00025y-0I
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:58 +0200
Received: by mail-iy0-f175.google.com with SMTP id 12so2181780iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5DkNggX2y15d9u2gBulEi9TlQgsbOMPNYtA3Ox0nNxA=;
	b=ZtpM1L47DvOy2cW7ZuST03XipwL+AhFHHawRT2XkNlSTKcX0pfE5SdnOWibQVlAVVZ
	c+dbV3CY7IxVGkHzPb0tvTVvahDvmluUo7zOm7ZqRMZd/lMFRA/m/ku5NFYSVpEdLZl6
	YZdx1bJiUapaZVpZUMOu7HX8WHshz2rmYq6wA=
Received: by 10.231.180.155 with SMTP id bu27mr3486493ibb.162.1311034675498;
	Mon, 18 Jul 2011 17:17:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:29 -0700
Message-Id: <8a99490236b8fc661995895921c5b93424723862.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 10/16] oprofile: Fix build when query_module is not there
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:58 -0000

on 2.6 kernels we do not have query_module so warn
about it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oprofile/oprofile-no-query-modules.patch       |   29 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile_0.9.6.bb     |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
new file mode 100644
index 0000000..c9d7cd6
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
@@ -0,0 +1,29 @@
+disable portions which use query_module on 2.6 kernel this is not available
+in OE we dont support 2.4 anyway
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: oprofile-0.9.6/daemon/liblegacy/opd_kernel.c
+===================================================================
+--- oprofile-0.9.6.orig/daemon/liblegacy/opd_kernel.c	2009-11-24 07:25:17.000000000 -0800
++++ oprofile-0.9.6/daemon/liblegacy/opd_kernel.c	2011-07-18 10:08:39.863798825 -0700
+@@ -270,6 +270,9 @@
+  */
+ static void opd_drop_module_sample(unsigned long eip)
+ {
++	verbprintf(vmodule, "query_module not available on linux-2.6: %s\n", strerror(EPERM));
++
++#if	0
+ 	char * module_names;
+ 	char * name;
+ 	size_t size = 1024;
+@@ -307,6 +310,7 @@
+ 
+ 	if (module_names)
+ 		free(module_names);
++#endif
+ }
+ 
+ 
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
index 603500d..0f154c8 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
@@ -19,10 +19,11 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*.so.* ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.so ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/oprofile/oprofile-${PV}.tar.gz \
            file://opstart.patch \
+           file://oprofile-no-query-modules.patch \
            file://acinclude.m4"
 
 SRC_URI[md5sum] = "4e407093ac06200185d5a5e6437d7242"
-- 
1.7.4.1



