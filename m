Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1166E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 02:22:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18621902"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2017 10:22:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 61EAA47C679F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 10:22:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 9 May 2017 10:22:14 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 10:22:25 +0800
Message-ID: <1494296545-13782-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 61EAA47C679F.AA2E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpciaccess: 0.13.4 -> 0.13.5
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
X-List-Received-Date: Tue, 09 May 2017 02:22:27 -0000
Content-Type: text/plain

1) Upgrade libpciaccess from 0.13.4 to 0.13.5.
3) Delete three patches, since they are integrated upstream.
   0001-Include-config.h-before-anything-else-in-.c.patch
   0002-Fix-quoting-issue.patch
   0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
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
index e92fc0d..0000000
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
index 16d69a8..0000000
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
index f513c8e..0000000
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
index ffa6a60..a3b682b 100644
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
2.7.4




