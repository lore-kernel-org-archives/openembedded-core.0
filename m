Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BD65671AD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:31 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649710"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:26 +0300
Message-Id: <20170510093529.6651-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/11] libpciaccess: update to 0.13.5
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
X-List-Received-Date: Wed, 10 May 2017 09:35:32 -0000

Drop backported patches

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...clude-config.h-before-anything-else-in-.c.patch | 187 ---------------------
 .../libpciaccess/0002-Fix-quoting-issue.patch      |  34 ----
 ...nux_sysfs.c-Include-limits.h-for-PATH_MAX.patch |  32 ----
 ...bpciaccess_0.13.4.bb => libpciaccess_0.13.5.bb} |   7 +-
 4 files changed, 2 insertions(+), 258 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.4.bb => libpciaccess_0.13.5.bb} (54%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
deleted file mode 100644
index e92fc0d95d4..00000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-From b14696a55796e739624bbda4f772427032efff2a Mon Sep 17 00:00:00 2001
-From: Julien Cristau <jcristau@debian.org>
-Date: Sun, 26 Apr 2015 15:20:57 +0200
-Subject: [PATCH 1/4] Include config.h before anything else in *.c
-
-Debian bug#749008 <https://bugs.debian.org/749008>
-
-Reported-by: Michael Tautschnig <mt@debian.org>
-Signed-off-by: Julien Cristau <jcristau@debian.org>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
-Upstream-Status: Backport
-
- src/common_capability.c  | 3 +++
- src/common_init.c        | 3 +++
- src/common_interface.c   | 3 +++
- src/common_io.c          | 3 +++
- src/common_iterator.c    | 3 +++
- src/common_map.c         | 3 +++
- src/common_vgaarb_stub.c | 3 +++
- src/linux_devmem.c       | 5 +++--
- src/openbsd_pci.c        | 3 +++
- src/solx_devfs.c         | 3 +++
- src/x86_pci.c            | 4 +++-
- 11 files changed, 33 insertions(+), 3 deletions(-)
-
-diff --git a/src/common_capability.c b/src/common_capability.c
-index 488743d..15d395d 100644
---- a/src/common_capability.c
-+++ b/src/common_capability.c
-@@ -31,6 +31,9 @@
-  *
-  * \author Ian Romanick <idr@us.ibm.com>
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <stdio.h>
-diff --git a/src/common_init.c b/src/common_init.c
-index b1c0c3e..f7b59bd 100644
---- a/src/common_init.c
-+++ b/src/common_init.c
-@@ -28,6 +28,9 @@
-  *
-  * \author Ian Romanick <idr@us.ibm.com>
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <errno.h>
-diff --git a/src/common_interface.c b/src/common_interface.c
-index 59778cf..cb95e90 100644
---- a/src/common_interface.c
-+++ b/src/common_interface.c
-@@ -28,6 +28,9 @@
-  *
-  * \author Ian Romanick <idr@us.ibm.com>
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/common_io.c b/src/common_io.c
-index f5c9e45..e9586ad 100644
---- a/src/common_io.c
-+++ b/src/common_io.c
-@@ -22,6 +22,9 @@
-  * Author:
-  *	Adam Jackson <ajax@redhat.com>
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/common_iterator.c b/src/common_iterator.c
-index ccf656d..2beb180 100644
---- a/src/common_iterator.c
-+++ b/src/common_iterator.c
-@@ -28,6 +28,9 @@
-  *
-  * \author Ian Romanick <idr@us.ibm.com>
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/common_map.c b/src/common_map.c
-index 8757151..f1854bb 100644
---- a/src/common_map.c
-+++ b/src/common_map.c
-@@ -21,6 +21,9 @@
-  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-  * DEALINGS IN THE SOFTWARE.
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <sys/types.h>
- #include <sys/mman.h>
-diff --git a/src/common_vgaarb_stub.c b/src/common_vgaarb_stub.c
-index 9394273..c1708f6 100644
---- a/src/common_vgaarb_stub.c
-+++ b/src/common_vgaarb_stub.c
-@@ -23,6 +23,9 @@
-  * OTHER DEALINGS IN THE SOFTWARE.
-  *
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdio.h>
- #include "pciaccess.h"
-diff --git a/src/linux_devmem.c b/src/linux_devmem.c
-index 10e3bde..0d0567c 100644
---- a/src/linux_devmem.c
-+++ b/src/linux_devmem.c
-@@ -32,8 +32,9 @@
-  *
-  * \author Ian Romanick <idr@us.ibm.com>
-  */
--
--#define _GNU_SOURCE
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/openbsd_pci.c b/src/openbsd_pci.c
-index 4d1b5cd..b8ce318 100644
---- a/src/openbsd_pci.c
-+++ b/src/openbsd_pci.c
-@@ -13,6 +13,9 @@
-  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <sys/param.h>
- #include <sys/ioctl.h>
-diff --git a/src/solx_devfs.c b/src/solx_devfs.c
-index f572393..cf96467 100644
---- a/src/solx_devfs.c
-+++ b/src/solx_devfs.c
-@@ -25,6 +25,9 @@
- /*
-  * Solaris devfs interfaces
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #include <stdlib.h>
- #include <strings.h>
-diff --git a/src/x86_pci.c b/src/x86_pci.c
-index 49c1cab..32daa04 100644
---- a/src/x86_pci.c
-+++ b/src/x86_pci.c
-@@ -18,8 +18,10 @@
-  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-  */
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
--#define _GNU_SOURCE
- #include <unistd.h>
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
deleted file mode 100644
index 16d69a82a4c..00000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 765e0a38cb8c40f8865af5cb356ffe6039ffb08f Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <wiz@NetBSD.org>
-Date: Sun, 22 Mar 2015 21:38:23 +0100
-Subject: [PATCH 2/4] Fix quoting issue.
-
-m4 has '[]' as quoting characters, so if we want '[]' to
-end up in the configure script, we need to quote them again.
-
-Reported by Greg Troxel <gdt@ir.bbn.com>.
-
-Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
-Upstream-Status: Backport
-
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e67e9e1..888330b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,7 +76,7 @@ case $host_os in
- 		;;
- 	*netbsd*)
- 		case $host in
--		*i[3-9]86*)
-+		*i[[3-9]]86*)
- 			PCIACCESS_LIBS="$PCIACCESS_LIBS -li386"
- 			;;
- 		*x86_64*|*amd64*)
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index f513c8e59c8..00000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6bd2f7f92eae713663f4e13f6e2cb23526607b8c Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Fri, 1 May 2015 16:36:50 +0200
-Subject: [PATCH 3/4] linux_sysfs.c: Include <limits.h> for PATH_MAX
-
-Fixes compilation with musl libc.
-
-Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
-Upstream-Status: Backport
-
- src/linux_sysfs.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
-index 50d94cf..3f95e53 100644
---- a/src/linux_sysfs.c
-+++ b/src/linux_sysfs.c
-@@ -45,6 +45,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <sys/mman.h>
- #include <dirent.h>
- #include <errno.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.4.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.5.bb
similarity index 54%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.13.4.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.13.5.bb
index ffa6a609f3e..a3b682b09b6 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.5.bb
@@ -6,14 +6,11 @@ PCI bus and devices in a platform-independent way."
 require xorg-lib-common.inc
 
 SRC_URI += "\
-            file://0001-Include-config.h-before-anything-else-in-.c.patch \
-            file://0002-Fix-quoting-issue.patch \
-            file://0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch \
             file://0004-Don-t-include-sys-io.h-on-arm.patch \
 "
 
-SRC_URI[md5sum] = "ace78aec799b1cf6dfaea55d3879ed9f"
-SRC_URI[sha256sum] = "07f864654561e4ac8629a0ef9c8f07fbc1f8592d1b6c418431593e9ba2cf2fcf"
+SRC_URI[md5sum] = "d810ab17e24c1418dedf7207fb2841d4"
+SRC_URI[sha256sum] = "752c54e9b3c311b4347cb50aea8566fa48eab274346ea8a06f7f15de3240b999"
 
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
-- 
2.11.0


