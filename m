Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZL-0005pS-Mq
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:07 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3329310dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vO3q+/xNgBFKHsK/+RMYoQNeyGMUBStTar6FhQw7WAE=;
	b=WW56SXUBOflHfKSDEp7W7KDZ5JVCLg7MezSLb/DypKHQQFmwnHdPbSlPVsq4Lx3MkL
	rCCq8ZefMMBqrL+EONZrnKDP8pL+m5wcr8ylP/NvDTuqlZwXbUSrh+YSy+IG+unxWJF4
	UicBqWkcotOOhdtwRTKAslkP2jzzDpbHe4GjzjaC442vznfBlrpdbnQSC0WLKpCfeQCE
	UVROI8Hwaetxq+a5ExtqAYoPZ3q+67WitPo9h1Ld4a40QHjquZ5xRRIAR3xdmudZhdA1
	5alLMc6MT4kORflqHIvlecvT17khdCQNbE7KlgFYa3xeaPoSy2Wak0tDRiAtDBHvS+JV
	ofSA==
Received: by 10.68.191.72 with SMTP id gw8mr10966690pbc.143.1340919434524;
	Thu, 28 Jun 2012 14:37:14 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:48 -0700
Message-Id: <9340f86ae58f6d23dc3fb23b34da0d25faedf432.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 02/11] libgcc: Remove unpackage unwind.h
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
X-List-Received-Date: Thu, 28 Jun 2012 21:48:07 -0000

Fixes build warnings like below

WARNING: For recipe libgcc, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc_4.7.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 891c03e..55aa03c 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -58,6 +58,10 @@ do_install () {
 
 	mv ${D}${libdir}/gcc/* ${D}${libdir}
 	rm -rf ${D}${libdir}/gcc/
+	# unwind.h is installed here which is shipped in gcc-cross
+	# as well as target gcc and they are identical so we dont
+	# ship one with libgcc here
+	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
 }
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
-- 
1.7.9.5



