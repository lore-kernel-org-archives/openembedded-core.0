Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UAEGE-0003Z5-Ap
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 07:43:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q6REAT005667
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2013 22:27:14 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 25 Feb 2013 22:27:13 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 14:26:58 +0800
Message-ID: <3508345b45d6d94ce2d53d974af640ec270debad.1361859756.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361859756.git.wenzong.fan@windriver.com>
References: <cover.1361859756.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, scott.a.garman@intel.com
Subject: [PATCH 1/1][denzil] alsa-tools: remove warning message
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 06:43:43 -0000
X-List-Received-Date: Tue, 26 Feb 2013 06:43:43 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Remove the warning message about files/directories were installed but
not shipped in any package:

    WARNING:   /usr/local/share
    WARNING:   /usr/local/bin
    WARNING:   /usr/local/include
    WARNING:   /usr/local/lib
    WARNING:   /usr/local/sbin
    WARNING:   /usr/local/share/sounds
    WARNING:   /usr/local/share/aclocal
    WARNING:   /usr/local/share/man
    WARNING:   /usr/local/share/ld10k1
    WARNING:   /usr/local/share/sounds/opl3
    WARNING:   /usr/local/share/sounds/opl3/std.sb
    WARNING:   /usr/local/share/sounds/opl3/drums.sb
    WARNING:   /usr/local/share/sounds/opl3/std.o3
    WARNING:   /usr/local/share/sounds/opl3/drums.o3
    WARNING:   /usr/local/share/aclocal/ld10k1.m4
    WARNING:   /usr/local/share/man/man1
    WARNING:   /usr/local/share/man/man1/cspctl.1
    WARNING:   /usr/local/share/ld10k1/effects
    WARNING:   /usr/local/share/ld10k1/effects/vol_2.emu10k1
    ...

1. pass prefix and libdir to GITCOMPILE_ARGS
2. ship unpackaged files to relevant packages

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 4c3e9dc..b9169e7 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r4"
+PR = "r5"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
@@ -20,4 +20,11 @@ SRC_URI[sha256sum] = "17d43de93ab2db98886d89a53e45341daa46a4ef6edd405db87f4b5a5d
 
 inherit autotools
 
-EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
+EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix} --libdir=${libdir}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
+
+FILES_${PN} += "${datadir}/ld10k1 \
+    ${libdir}/liblo10k1.la \
+    ${libdir}/liblo10k1.so.*"
+
+FILES_${PN}-dbg += "${libdir}/.debug/*"
+FILES_${PN}-dev += "${libdir}/liblo10k1.so"
-- 
1.7.10.4



