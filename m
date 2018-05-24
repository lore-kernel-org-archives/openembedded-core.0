Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0327E74775
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 02:19:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4O2IsPm022759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 19:19:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 23 May 2018 19:18:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2018 10:18:47 +0800
Message-ID: <1527128327-337273-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] liberation-fonts/cantarell-fonts: fix postinst failed warning
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
X-List-Received-Date: Thu, 24 May 2018 02:19:25 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

font is not arch related, but these receipes inherit fontcache,
fontcache called update_font_cache, update_font_cache use qemuwrapper,
qemuwrapper is arch related, so these receipes cannot inherit allarch,
or update_font_cache will core dumped as below:

WARNING: The postinstall intercept hook 'update_font_cache' failed,
NOTE: Exit code 132. Output:
qemu: uncaught target signal 4 (Illegal instruction) - core dumped
qemuwrapper: line 5: 267705 Illegal instruction     (core dumped) qemu-x86_64 -r 3.2.0 -cpu core2duo "$@"

in update_font_cache, it runs:
qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only

qemuwrapper sets LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} for fc-cache,
if inherit allarch, ${base_libdir} is "/lib", ${libdir} is "/usr/lib",
but in this case, fc-cache need /lib64 and /usr/lib64 to run,
So fc-cache doesn't work, and caused the warning.
so remove allarch from these two recipes who both inherit allarch and fontcahe to fix this problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 2 +-
 meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index c71ab11..b5bc203 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-inherit autotools allarch fontcache pkgconfig
+inherit autotools fontcache pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fontforge] = "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
index 412da48..14919c8 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
@@ -10,7 +10,7 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b"
 PE = "1"
 
-inherit allarch fontcache
+inherit fontcache
 
 FONT_PACKAGES = "${PN}"
 
-- 
2.7.4


