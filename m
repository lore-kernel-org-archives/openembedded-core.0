Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RR03w-0005j2-M6
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:23:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHBGxuS025813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:16:59 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 03:16:59 -0800
Message-ID: <ad4d06cb79983b6a1a06b5cdd83e565af031b05f.1321528387.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321528387.git.xiaofeng.yan@windriver.com>
References: <cover.1321528387.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 17 Nov 2011 18:36:50 +0800
Date: Thu, 17 Nov 2011 19:16:17 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gtk+: Have gtk+ pick up ${NM} from the environment
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
X-List-Received-Date: Thu, 17 Nov 2011 11:23:25 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

hen gtk+ configures, it should pick up ${NM} from the environment \
if it is defined, instead of just looking for "nm".

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../gtk+/gtk+-2.24.6/configure-nm.patch            |   14 ++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    3 ++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
new file mode 100644
index 0000000..5aeef50
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [configuration]
+Signed-Off-By: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+# Pick up ${NM} from the environment
+--- a/configure.in
++++ b/configure.in
+@@ -190,7 +190,7 @@
+ AC_SYS_LARGEFILE
+ 
+ AM_PROG_AS
+-AC_PATH_PROG(NM, nm, nm)
++AC_CHECK_TOOLS(NM, [$NM nm], nm)
+ 
+ dnl Initialize maintainer mode
+ AM_MAINTAINER_MODE
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
index cd5c8cb..ade0a2d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
            file://run-iconcache.patch \
+           file://configure-nm.patch \
            file://hardcoded_libtool.patch \
            file://no-demos.patch \
            file://cellrenderer-cairo.patch;striplevel=0 \
@@ -26,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
 SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
-- 
1.7.0.4



