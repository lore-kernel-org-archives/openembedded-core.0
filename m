Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12BK-0005aP-Bv
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:28:14 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D75FB30426
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:16:15 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:15:03 -0700
Message-Id: <15204a6cbcdbbb84e02da05b1fb15644fe7df332.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D75FB30426.0B125
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 22/32] libtool: fixed parallel build related race
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
X-List-Received-Date: Mon, 13 Aug 2012 21:28:14 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
1.7.9.5



