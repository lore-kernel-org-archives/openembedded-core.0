Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id D843275C1B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:25:05 +0000 (UTC)
Received: by igcur8 with SMTP id ur8so98755578igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cmLoJogyJ2OIIT03HPFJKW30CY5ReXgdLArN2nvVATU=;
	b=Uuh2oz0dMFjHkt3sxpKh+zueDOpy7RZ+PzaOz34FYkIfa9e5P3FvKiZoDmnVKhb308
	p4NXHYQGJ8GktgPwm93EUk0Dr8TofDlLcEfNlMCJsIdmjeINPUb7fhvLXPq2wy/O5yq3
	BDdcKpL2MyjD2sE0kvqOmFRVV0/Nu53W2z97f8Q0tbxsG2UmqLEszmRkv0cKM3PjTraR
	GCTUtUCIZh6rWqoqVmq0Odd5qQgkGz3IFqVSV4xFizwrslhD/kUZ8OCAztMQN/qIi31O
	uZWYI6RLON3mzQnuENslA7iUC5gC31oXceDD2C8Aprrd/uK0rKOCD66OY43KD5wtmJdS
	rrBQ==
X-Received: by 10.50.112.73 with SMTP id io9mr36429960igb.18.1435775105768;
	Wed, 01 Jul 2015 11:25:05 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id p4sm2229179igg.20.2015.07.01.11.25.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:25:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:56 -0700
Message-Id: <1aa30560f589735e5d08d40b233a5a228ca5fcfd.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
References: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
In-Reply-To: <cover.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] libpciaccess: Upgrade to 0.13.4
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
X-List-Received-Date: Wed, 01 Jul 2015 18:25:09 -0000

Drop upstreamed patch
backport portablility fixes from upstream
Add a fix to not use io function on ARM they dont work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-config.h-before-anything-else-in-.c.patch | 187 +++++++++++++++++++++
 .../libpciaccess/0002-Fix-quoting-issue.patch      |  34 ++++
 ...nux_sysfs.c-Include-limits.h-for-PATH_MAX.patch |  32 ++++
 .../0004-Don-t-include-sys-io.h-on-arm.patch       |  28 +++
 .../xorg-lib/libpciaccess/limits.patch             |  17 --
 ...bpciaccess_0.13.3.bb => libpciaccess_0.13.4.bb} |  13 +-
 6 files changed, 290 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.3.bb => libpciaccess_0.13.4.bb} (44%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
new file mode 100644
index 0000000..e92fc0d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
@@ -0,0 +1,187 @@
+From b14696a55796e739624bbda4f772427032efff2a Mon Sep 17 00:00:00 2001
+From: Julien Cristau <jcristau@debian.org>
+Date: Sun, 26 Apr 2015 15:20:57 +0200
+Subject: [PATCH 1/4] Include config.h before anything else in *.c
+
+Debian bug#749008 <https://bugs.debian.org/749008>
+
+Reported-by: Michael Tautschnig <mt@debian.org>
+Signed-off-by: Julien Cristau <jcristau@debian.org>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+Upstream-Status: Backport
+
+ src/common_capability.c  | 3 +++
+ src/common_init.c        | 3 +++
+ src/common_interface.c   | 3 +++
+ src/common_io.c          | 3 +++
+ src/common_iterator.c    | 3 +++
+ src/common_map.c         | 3 +++
+ src/common_vgaarb_stub.c | 3 +++
+ src/linux_devmem.c       | 5 +++--
+ src/openbsd_pci.c        | 3 +++
+ src/solx_devfs.c         | 3 +++
+ src/x86_pci.c            | 4 +++-
+ 11 files changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/src/common_capability.c b/src/common_capability.c
+index 488743d..15d395d 100644
+--- a/src/common_capability.c
++++ b/src/common_capability.c
+@@ -31,6 +31,9 @@
+  *
+  * \author Ian Romanick <idr@us.ibm.com>
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
+diff --git a/src/common_init.c b/src/common_init.c
+index b1c0c3e..f7b59bd 100644
+--- a/src/common_init.c
++++ b/src/common_init.c
+@@ -28,6 +28,9 @@
+  *
+  * \author Ian Romanick <idr@us.ibm.com>
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <errno.h>
+diff --git a/src/common_interface.c b/src/common_interface.c
+index 59778cf..cb95e90 100644
+--- a/src/common_interface.c
++++ b/src/common_interface.c
+@@ -28,6 +28,9 @@
+  *
+  * \author Ian Romanick <idr@us.ibm.com>
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/common_io.c b/src/common_io.c
+index f5c9e45..e9586ad 100644
+--- a/src/common_io.c
++++ b/src/common_io.c
+@@ -22,6 +22,9 @@
+  * Author:
+  *	Adam Jackson <ajax@redhat.com>
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/common_iterator.c b/src/common_iterator.c
+index ccf656d..2beb180 100644
+--- a/src/common_iterator.c
++++ b/src/common_iterator.c
+@@ -28,6 +28,9 @@
+  *
+  * \author Ian Romanick <idr@us.ibm.com>
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/common_map.c b/src/common_map.c
+index 8757151..f1854bb 100644
+--- a/src/common_map.c
++++ b/src/common_map.c
+@@ -21,6 +21,9 @@
+  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+  * DEALINGS IN THE SOFTWARE.
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <sys/types.h>
+ #include <sys/mman.h>
+diff --git a/src/common_vgaarb_stub.c b/src/common_vgaarb_stub.c
+index 9394273..c1708f6 100644
+--- a/src/common_vgaarb_stub.c
++++ b/src/common_vgaarb_stub.c
+@@ -23,6 +23,9 @@
+  * OTHER DEALINGS IN THE SOFTWARE.
+  *
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdio.h>
+ #include "pciaccess.h"
+diff --git a/src/linux_devmem.c b/src/linux_devmem.c
+index 10e3bde..0d0567c 100644
+--- a/src/linux_devmem.c
++++ b/src/linux_devmem.c
+@@ -32,8 +32,9 @@
+  *
+  * \author Ian Romanick <idr@us.ibm.com>
+  */
+-
+-#define _GNU_SOURCE
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/openbsd_pci.c b/src/openbsd_pci.c
+index 4d1b5cd..b8ce318 100644
+--- a/src/openbsd_pci.c
++++ b/src/openbsd_pci.c
+@@ -13,6 +13,9 @@
+  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <sys/param.h>
+ #include <sys/ioctl.h>
+diff --git a/src/solx_devfs.c b/src/solx_devfs.c
+index f572393..cf96467 100644
+--- a/src/solx_devfs.c
++++ b/src/solx_devfs.c
+@@ -25,6 +25,9 @@
+ /*
+  * Solaris devfs interfaces
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include <stdlib.h>
+ #include <strings.h>
+diff --git a/src/x86_pci.c b/src/x86_pci.c
+index 49c1cab..32daa04 100644
+--- a/src/x86_pci.c
++++ b/src/x86_pci.c
+@@ -18,8 +18,10 @@
+  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+  */
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+-#define _GNU_SOURCE
+ #include <unistd.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
new file mode 100644
index 0000000..16d69a8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
@@ -0,0 +1,34 @@
+From 765e0a38cb8c40f8865af5cb356ffe6039ffb08f Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@NetBSD.org>
+Date: Sun, 22 Mar 2015 21:38:23 +0100
+Subject: [PATCH 2/4] Fix quoting issue.
+
+m4 has '[]' as quoting characters, so if we want '[]' to
+end up in the configure script, we need to quote them again.
+
+Reported by Greg Troxel <gdt@ir.bbn.com>.
+
+Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+Upstream-Status: Backport
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e67e9e1..888330b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,7 +76,7 @@ case $host_os in
+ 		;;
+ 	*netbsd*)
+ 		case $host in
+-		*i[3-9]86*)
++		*i[[3-9]]86*)
+ 			PCIACCESS_LIBS="$PCIACCESS_LIBS -li386"
+ 			;;
+ 		*x86_64*|*amd64*)
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 0000000..f513c8e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,32 @@
+From 6bd2f7f92eae713663f4e13f6e2cb23526607b8c Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Fri, 1 May 2015 16:36:50 +0200
+Subject: [PATCH 3/4] linux_sysfs.c: Include <limits.h> for PATH_MAX
+
+Fixes compilation with musl libc.
+
+Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+Upstream-Status: Backport
+
+ src/linux_sysfs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
+index 50d94cf..3f95e53 100644
+--- a/src/linux_sysfs.c
++++ b/src/linux_sysfs.c
+@@ -45,6 +45,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <sys/mman.h>
+ #include <dirent.h>
+ #include <errno.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
new file mode 100644
index 0000000..f532858
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
@@ -0,0 +1,28 @@
+From b6df5202306bd71158b482f25ca2e6919645d4dd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 4 Jun 2015 20:55:06 -0700
+Subject: [PATCH 4/4] Don't include sys/io.h on arm
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/linux_sysfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
+index 3f95e53..1e3aad3 100644
+--- a/src/linux_sysfs.c
++++ b/src/linux_sysfs.c
+@@ -50,7 +50,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ 
+-#if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
++#if defined(__i386__) || defined(__x86_64__)
+ #include <sys/io.h>
+ #else
+ #define inb(x) -1
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
deleted file mode 100644
index 498020e..0000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Add missing include file to get definition of PATH_MAX
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: libpciaccess-0.13.3/src/linux_sysfs.c
-===================================================================
---- libpciaccess-0.13.3.orig/src/linux_sysfs.c
-+++ libpciaccess-0.13.3/src/linux_sysfs.c
-@@ -44,6 +44,7 @@
- #include <sys/mman.h>
- #include <dirent.h>
- #include <errno.h>
-+#include <limits.h>
- 
- #if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
- #include <sys/io.h>
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.4.bb
similarity index 44%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.13.4.bb
index 4a832e8..ffa6a60 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.4.bb
@@ -5,12 +5,17 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
-SRC_URI += "file://limits.patch"
+SRC_URI += "\
+            file://0001-Include-config.h-before-anything-else-in-.c.patch \
+            file://0002-Fix-quoting-issue.patch \
+            file://0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch \
+            file://0004-Don-t-include-sys-io.h-on-arm.patch \
+"
+
+SRC_URI[md5sum] = "ace78aec799b1cf6dfaea55d3879ed9f"
+SRC_URI[sha256sum] = "07f864654561e4ac8629a0ef9c8f07fbc1f8592d1b6c418431593e9ba2cf2fcf"
 
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
-SRC_URI[md5sum] = "1f65be5ffc55641c1846c2f41d180d00"
-SRC_URI[sha256sum] = "6cd76ccae4e06eee47d3ead84a118740e9406e2a9b7adc9b08e92c69ce89c2e3"
-
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.1.4


