Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SWtco-00077O-03
	for Openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 20:16:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MI5qgq016658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 11:05:52 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (172.25.32.37) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 22 May 2012 11:05:52 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 13:06:35 -0500
Message-ID: <1337709995-13798-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] recipes-devtools/qemu/qemu.inc: Add jpeg as a dependency
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
X-List-Received-Date: Tue, 22 May 2012 18:16:02 -0000
Content-Type: text/plain

If you use a shared state cache and build a large file system,
followed by a small one, the qemu will be built with jpeg support.

Building ultra small file systems leaves out jpeg as a dependency
for the host tool, and when using a sstate cache you end up with
the following error using runqemu:

qemu: error while loading shared libraries: libjpeg.so.8: cannot open shared object file: No such file or directory

The work around is to execute:
   bitbake jpeg-native

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 93325c3..bd9e5bf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11"
+DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 jpeg"
 
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
-- 
1.7.1



