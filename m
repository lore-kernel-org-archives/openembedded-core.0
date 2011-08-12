Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QrltZ-0003qi-2y
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:11:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7C76WqA001615
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 00:06:32 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 12 Aug 2011 00:06:31 -0700
Message-ID: <e43470acc45e0b2d15a3fdc54a5db92f2486f616.1313117148.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1313117148.git.xiaofeng.yan@windriver.com>
References: <cover.1313117148.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 12 Aug 2011 10:32:38 +0800
Date: Fri, 12 Aug 2011 15:06:34 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libx11-diet: Fix bug 1050
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
X-List-Received-Date: Fri, 12 Aug 2011 07:11:05 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1050]
I got do_compile failure during building qemux86 image
| ../../../doltlibtool: line 17:
/distro/dcui/0704/pc1/build/tmp/work/i586-poky-linux/libx11-diet-1.3-r2/libX11-1.3/modules/im/ximcp/../../../libtool:
No such file or directory

This is due to not found libtool, but i586-poky-linux-libtool in libX11-1.3
So I link libtool to ${TARGET_PREFIX}libtool for solving this problem.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index c156ce6..dbc50f8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -18,6 +18,12 @@ EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-sp
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
+do_configure_append() {
+    if [ -f ${TARGET_PREFIX}libtool ]; then
+        ln -sf ${TARGET_PREFIX}libtool libtool
+    fi
+}
+
 do_compile() {
 	cd ${S}/src/util
 	mv makekeys.c.orig makekeys.c || true
-- 
1.7.0.4



