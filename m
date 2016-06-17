Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E25A66FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 15:17:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2016 08:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,484,1459839600"; d="scan'208";a="720994584"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2016 08:17:28 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id E750F6A4006;
	Fri, 17 Jun 2016 08:17:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 18:17:16 +0300
Message-Id: <1466176636-18307-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pseudo: remove rpath from libpseudo.so
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
X-List-Received-Date: Fri, 17 Jun 2016 15:17:30 -0000

Setting rpath causes clash of host and sdk libc and makes
pseudo to crash with relocation error: libpthread.so.0:
    symbol __libc_vfork, version GLIBC_PRIVATE not defined
    in file libc.so.6 with link time reference

Removing rpath fixes this as it makes pseudo to use only host
pthread and libc.

[YOCTO #9761]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 0de7b36..59a44f1 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -128,6 +128,9 @@ do_install_append_class-nativesdk () {
 	if $make32; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
+		chrpath -d ${D}${prefix}/lib/pseudo/lib/libpseudo.so
+	else
+		chrpath -d ${D}${prefix}/lib/pseudo/lib64/libpseudo.so
 	fi
 }
 
-- 
2.1.4


