Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 669597320F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 15:47:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 17 Jun 2016 08:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,484,1459839600"; d="scan'208";a="1004383742"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2016 08:47:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 2DDD46A4006;
	Fri, 17 Jun 2016 08:47:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 18:47:23 +0300
Message-Id: <1466178443-553-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466176636-18307-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1466176636-18307-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2] pseudo: remove rpath from libpseudo.so
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
X-List-Received-Date: Fri, 17 Jun 2016 15:47:33 -0000

Setting rpath causes clash of host and sdk libc and makes
pseudo to crash with relocation error: libpthread.so.0:
    symbol __libc_vfork, version GLIBC_PRIVATE not defined
    in file libc.so.6 with link time reference

Removing rpath fixes this as it makes pseudo to use only host
pthread and libc.

[YOCTO #9761]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 0de7b36..16c57c9 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -129,6 +129,7 @@ do_install_append_class-nativesdk () {
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
+	chrpath -d ${D}${prefix}/lib/pseudo/lib*/libpseudo.so
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


