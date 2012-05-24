Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2h-00056b-Gm
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034680"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:18 -0700
Message-Id: <de1983730f1ece43d8a8bb712a8baa460291f6bc.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 15/28] libtool: fixed parallel build related race
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
X-List-Received-Date: Thu, 24 May 2012 04:52:56 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

While building libtool, the libtool script itself will be regenerated
because OE modifies a dependency[1]. With -jX, this operation (-->
removal, creation of non-x file, 'chmod a+x') can happen at a time when
the script is going to be executed.  This can cause errors like:

| arm-linux-gnueabi-libtool: compile:  ccache arm-linux-gnueabi-gcc ...
| ...
| /bin/sh ./config.status libtool
| ...
| arm-linux-gnueabi-libtool: compile:  ccache arm-linux-gnueabi-gcc ...
| /bin/sh: ./arm-linux-gnueabi-libtool: Permission denied
| make[2]: *** [libltdl/libltdl_libltdl_la-lt__alloc.lo] Error 126

I am not sure whether the custom do_compile_prepend() is still needed.
For now only the issue above will be fixed by executing ./config.status
yet again.

[1] see 648290d5bf4d6ff50d3643bb7ad902dfc23aa702

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 084062a..c1ef7c4 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
@@ -27,6 +27,7 @@ do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
 	rm -f ${S}/libltdl/config/ltmain.sh
 	make libltdl/config/ltmain.sh
+	./config.status
 }
 
 inherit autotools
-- 
1.7.7.6



