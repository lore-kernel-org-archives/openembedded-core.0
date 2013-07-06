Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 033156B090
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:16:07 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so2087981eek.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=dOYXALExRcVhpWUeh86wzMwZ7jWQu7h6IjOFNFIPIuM=;
	b=sDHpx3OVbXsQDyne/zkRdfgr08nA3KFPNW0+O+mB3guSMYPx3sM/9b0OplxKg4Xc3H
	/+uym5GieJVMkNT2m/eYSggRFhKitY7PrWNs2tm+tzDy5a5USM6wONtjvd6ClqGl+4p/
	zxOmCaJpQlic/931mIZWSJMk2BNgQRu+7rsXUecKHrwbWaRVpupBQnafzGlHCFpSsvcq
	4t9+RSjA3iPD1SWzN6+xoyZJRABZKNUWgawD6obhVYTD2Rm8SRgj74UDBkpZKbpX0UuJ
	HhS53wU42sx44L603nRdXK6nXwikWpZG5hfo65HrTYzkFSTkMlVGnRamKPV/Uv+fKC1m
	MpRg==
X-Received: by 10.14.216.73 with SMTP id f49mr18134808eep.119.1373152568753;
	Sat, 06 Jul 2013 16:16:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm27798828eed.9.2013.07.06.16.16.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:16:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2013 01:16:13 +0200
Message-Id: <1373152573-22879-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130706230840.GE3288@jama>
References: <20130706230840.GE3288@jama>
Subject: [RFC][PATCH] base.bbclass: add binutils to BASEDEPENDS
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
X-List-Received-Date: Sat, 06 Jul 2013 23:16:08 -0000

* when gcc-cross is reused from the sstate cache then
  gcc-cross's dependency on binutils-cross.do_populate_sysroot
  is ignored due to being in the safe dependency list in
  setscene_depvalid
* many packages still require binutils-cross.do_populate_sysroot
  to be executed before their do_configure (or do_compile)
* usually some other recipe runs do_package task (which also
  require binutils-cross.do_populate_sysroot, before do_configure
  is executed

* rebuilding one recipe with everything else reused from sstate-cache
  before:
  $ grep binutils-cross log
  NOTE: Running setscene task 251 of 412 (oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_package_write_ipk_setscene)
  NOTE: recipe binutils-cross-2.23.1-r3: task do_package_write_ipk_setscene: Started
  NOTE: recipe binutils-cross-2.23.1-r3: task do_package_write_ipk_setscene: Succeeded
  NOTE: Running setscene task 254 of 412 (oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_packagedata_setscene)
  NOTE: recipe binutils-cross-2.23.1-r3: task do_packagedata_setscene: Started
  NOTE: recipe binutils-cross-2.23.1-r3: task do_packagedata_setscene: Succeeded
  NOTE: Running noexec task 209 of 1157 (ID: 530, oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_package_write)

  after:
  $ grep binutils-cross log2
  NOTE: Running setscene task 216 of 412 (oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_package_write_ipk_setscene)
  NOTE: recipe binutils-cross-2.23.1-r3: task do_package_write_ipk_setscene: Started
  NOTE: recipe binutils-cross-2.23.1-r3: task do_package_write_ipk_setscene: Succeeded
  NOTE: Running setscene task 341 of 412 (oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_packagedata_setscene)
  NOTE: recipe binutils-cross-2.23.1-r3: task do_packagedata_setscene: Started
  NOTE: recipe binutils-cross-2.23.1-r3: task do_packagedata_setscene: Succeeded
  NOTE: Running setscene task 344 of 412 (oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_package_setscene)
  NOTE: recipe binutils-cross-2.23.1-r3: task do_package_setscene: Started
  NOTE: recipe binutils-cross-2.23.1-r3: task do_package_setscene: Succeeded
  NOTE: Running setscene task 389 of 412 (oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_populate_sysroot_setscene)
  NOTE: recipe binutils-cross-2.23.1-r3: task do_populate_sysroot_setscene: Started
  NOTE: recipe binutils-cross-2.23.1-r3: task do_populate_sysroot_setscene: Succeeded
  NOTE: Running noexec task 187 of 1157 (ID: 108, oe-core/meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb, do_package_write)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 27edea8..4383d2e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -72,7 +72,7 @@ def base_dep_prepend(d):
     # the application.
     if not d.getVar('INHIBIT_DEFAULT_DEPS'):
         if (d.getVar('HOST_SYS', True) != d.getVar('BUILD_SYS', True)):
-            deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
+            deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils virtual/libc "
     return deps
 
 BASEDEPENDS = "${@base_dep_prepend(d)}"
-- 
1.8.2.1


