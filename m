Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3B7065C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 13:29:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82DTEm7029721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 06:29:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 06:29:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 06:29:13 -0700
Message-ID: <6b56a0fcae556ff65b4c5010e1337db501599cd2.1409664473.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409664473.git.liezhi.yang@windriver.com>
References: <cover.1409664473.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu-native: only depends on libxext-native when x11
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
X-List-Received-Date: Tue, 02 Sep 2014 13:29:15 -0000
Content-Type: text/plain

Fixed when build without x11 in DISTRO_FEATURES:
ERROR: libxext-native was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f771740..c8b400a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -87,7 +87,7 @@ PACKAGECONFIG ??= "fdt sdl alsa"
 PACKAGECONFIG_class-native ??= "fdt alsa"
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl"
 NATIVEDEPS = ""
-NATIVEDEPS_class-native = "libxext-native"
+NATIVEDEPS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxext-native', '',d)}"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl ${NATIVEDEPS},"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
-- 
1.7.9.5


