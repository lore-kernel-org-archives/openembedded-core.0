Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SC3tz-00045l-Jp
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:59:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2Q6ocsk016115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 23:50:38 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 25 Mar 2012 23:50:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 14:49:38 +0800
Message-ID: <4665123dfd2c3d3011c628f4fec1b5a2118bf579.1332744516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332744516.git.liezhi.yang@windriver.com>
References: <cover.1332744516.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu: add fedora pkg names when build failed
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
X-List-Received-Date: Mon, 26 Mar 2012 06:59:40 -0000
Content-Type: text/plain

When qemu build failed, we can see such messages:

You need libGL.so and libGLU.so to exist in your library path and the
development headers for SDL installed to build qemu-native.

Ubuntu package names are: libgl1-mesa-dev, libglu1-mesa-dev and
libsdl1.2-dev

These pkgs have different names on Fedora distributions, and Fedora is
one the
main linux distributions, so add Fedora package names.

The following Fedora versions have these pkgs:
	Fedora 9 64bit
	Fedora 13 32bit
	Fedora 13 64bit
	Fedora 16 64bit

[YOCTO #2174]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    3 ++-
 scripts/runqemu                     |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 307a205..8dee060 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,7 +33,8 @@ do_configure_prepend_virtclass-native() {
 
     if [ "$libsdl" != 'yes' -o "$libgl" != 'yes' ]; then
        echo "You need libGL.so and libGLU.so to exist in your library path and the development headers for SDL installed to build qemu-native.
-       Ubuntu package names are: libgl1-mesa-dev, libglu1-mesa-dev and libsdl1.2-dev"
+       Ubuntu package names are: libgl1-mesa-dev, libglu1-mesa-dev and libsdl1.2-dev.
+       Fedora package names are: mesa-libGL mesa-libGLU SDL-devel."
        exit 1;
     fi
 }
diff --git a/scripts/runqemu b/scripts/runqemu
index ac5facf..c349de0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -406,7 +406,8 @@ test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && li
 
 if [ "$libgl" != 'yes' ]; then
     echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
-    Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev."
+    Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
+    Fedora package names are: mesa-libGL mesa-libGLU."
     exit 1;
 fi
 
-- 
1.7.1



