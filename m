Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70AE97E98B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 03:28:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8C3SRN2017649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 20:28:27 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 11 Sep 2019 20:28:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2019 11:28:24 +0800
Message-ID: <1568258904-6897-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [PATCH] nfs-utils: fix nfs mount error on 32bit nfs server
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
X-List-Received-Date: Thu, 12 Sep 2019 03:28:29 -0000
Content-Type: text/plain

There is a client side error "Stale file handle" when mounting from a
nfs server running on 32bit arch.

Steps to reproduce:
1. $ MACHINE=qemux86 bitbake core-image-sato
2. $ runqemu qemux86 kvm nographic qemuparams="-m 1024"
3. $ echo "/nfs_root *(insecure,rw,async,no_root_squash,no_subtree_check)" \
     >> /etc/exports
   $ /etc/init.d/nfsserver restart

  root@qemux86:~# mount -t nfs 127.0.0.1:/nfs_root /mnt
  mount: mounting 127.0.0.1:/nfs_root on /mnt failed: Stale file handle

Backport a patch to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...include-order-between-config.h-and-stat.h.patch | 156 +++++++++++++++++++++
 .../nfs-utils/nfs-utils_2.4.1.bb                   |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch
new file mode 100644
index 0000000..7b0f935
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch
@@ -0,0 +1,156 @@
+From 2fbc62e2a13fc22b6ae4910e295a2c10fb790486 Mon Sep 17 00:00:00 2001
+From: Zoltan Karcagi <zkr7432@gmail.com>
+Date: Mon, 12 Aug 2019 13:27:16 -0400
+Subject: [PATCH] Fix include order between config.h and stat.h
+
+At least on Arch linux ARM, the definition of struct stat in stat.h depends
+on __USE_FILE_OFFSET64. This symbol comes from config.h when defined,
+therefore config.h must always be included before stat.h. Fix all
+occurrences where the order is wrong by moving config.h to the top.
+
+This fixes the client side error "Stale file handle" when mounting from
+a server running Arch Linux ARM.
+
+Signed-off-by: Zoltan Karcagi <zkr7432@gmail.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream-Status: Backport
+[http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=2fbc62e2a13fc22b6ae4910e295a2c10fb790486]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ support/misc/nfsd_path.c         | 5 ++++-
+ support/misc/xstat.c             | 5 ++++-
+ support/nfs/conffile.c           | 8 +++++++-
+ utils/blkmapd/device-discovery.c | 8 ++++----
+ utils/idmapd/idmapd.c            | 8 ++++----
+ 5 files changed, 23 insertions(+), 11 deletions(-)
+
+diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
+index 84e4802..f078a66 100644
+--- a/support/misc/nfsd_path.c
++++ b/support/misc/nfsd_path.c
+@@ -1,3 +1,7 @@
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
+ #include <errno.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -5,7 +9,6 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ 
+-#include "config.h"
+ #include "conffile.h"
+ #include "xmalloc.h"
+ #include "xlog.h"
+diff --git a/support/misc/xstat.c b/support/misc/xstat.c
+index fa04788..4c997ee 100644
+--- a/support/misc/xstat.c
++++ b/support/misc/xstat.c
+@@ -1,3 +1,7 @@
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
+ #include <errno.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
+@@ -5,7 +9,6 @@
+ #include <sys/sysmacros.h>
+ #include <unistd.h>
+ 
+-#include "config.h"
+ #include "xstat.h"
+ 
+ #ifdef HAVE_FSTATAT
+diff --git a/support/nfs/conffile.c b/support/nfs/conffile.c
+index b6400be..6ba8a35 100644
+--- a/support/nfs/conffile.c
++++ b/support/nfs/conffile.c
+@@ -500,7 +500,7 @@ conf_readfile(const char *path)
+ 
+ 	if ((stat (path, &sb) == 0) || (errno != ENOENT)) {
+ 		char *new_conf_addr = NULL;
+-		size_t sz = sb.st_size;
++		off_t sz;
+ 		int fd = open (path, O_RDONLY, 0);
+ 
+ 		if (fd == -1) {
+@@ -517,6 +517,11 @@ conf_readfile(const char *path)
+ 
+ 		/* only after we have the lock, check the file size ready to read it */
+ 		sz = lseek(fd, 0, SEEK_END);
++		if (sz < 0) {
++			xlog_warn("conf_readfile: unable to determine file size: %s",
++				  strerror(errno));
++			goto fail;
++		}
+ 		lseek(fd, 0, SEEK_SET);
+ 
+ 		new_conf_addr = malloc(sz+1);
+@@ -2162,6 +2167,7 @@ conf_write(const char *filename, const char *section, const char *arg,
+ 	ret = 0;
+ 
+ cleanup:
++	flush_outqueue(&inqueue, NULL);
+ 	flush_outqueue(&outqueue, NULL);
+ 
+ 	if (buff)
+diff --git a/utils/blkmapd/device-discovery.c b/utils/blkmapd/device-discovery.c
+index e811703..f5f9b10 100644
+--- a/utils/blkmapd/device-discovery.c
++++ b/utils/blkmapd/device-discovery.c
+@@ -26,6 +26,10 @@
+  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif /* HAVE_CONFIG_H */
++
+ #include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -51,10 +55,6 @@
+ #include <errno.h>
+ #include <libdevmapper.h>
+ 
+-#ifdef HAVE_CONFIG_H
+-#include "config.h"
+-#endif /* HAVE_CONFIG_H */
+-
+ #include "device-discovery.h"
+ #include "xcommon.h"
+ #include "nfslib.h"
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
+index 62e37b8..267acea 100644
+--- a/utils/idmapd/idmapd.c
++++ b/utils/idmapd/idmapd.c
+@@ -34,6 +34,10 @@
+  *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif /* HAVE_CONFIG_H */
++
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/inotify.h>
+@@ -62,10 +66,6 @@
+ #include <libgen.h>
+ #include <nfsidmap.h>
+ 
+-#ifdef HAVE_CONFIG_H
+-#include "config.h"
+-#endif /* HAVE_CONFIG_H */
+-
+ #include "xlog.h"
+ #include "conffile.h"
+ #include "queue.h"
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
index 8b673c8..7e80354 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://clang-format-string.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
+           file://0001-Fix-include-order-between-config.h-and-stat.h.patch \
 "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
-- 
2.7.4


