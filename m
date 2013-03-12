Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UFEfz-0000fT-RB
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 03:11:05 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2C1s98L022529
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 18:54:09 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 18:54:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2013 09:54:06 +0800
Message-ID: <4d838b684be078170098b27a4f2e7e85968ff5b5.1363052725.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363052725.git.hongxu.jia@windriver.com>
References: <cover.1363052725.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu-native:fix do_compile failed on SLED 11.2
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
X-List-Received-Date: Tue, 12 Mar 2013 02:11:08 -0000
Content-Type: text/plain

1, When build qemu-native on SLED 11.2, there is an error:
...
| In file included from /usr/include/bits/sigcontext.h:28,
|    from /usr/include/signal.h:339,
|    from /buildarea2/tmp/work/i686-linux/qemu-native/1.4.0-r0/
qemu-1.4.0/include/qemu-common.h:42,
|    from fsdev/virtfs-proxy-helper.c:23:
| /usr/include/asm/sigcontext.h:28: error: expected specifier-
qualifier-list before '__u64'
| /usr/include/asm/sigcontext.h:191: error: expected specifier-
qualifier-list before '__u64'
...

2, The virtfs-proxy-helper.c includes <sys/capability.h> and
qemu-common.h in sequence. The header include map is:
(`-->' presents `include')
...
"virtfs-proxy-helper.c" --> <sys/capability.h>
...
"virtfs-proxy-helper.c" --> "qemu-common.h" --> <signal.h> -->
<bits/sigcontext.h> --> <asm/sigcontext.h> --> <linux/types.h> -->
<asm/types.h> --> <asm-generic/types.h> --> <asm-generic/int-ll64.h>
...

3, The bug is found on SLED 11.2 x86. In libcap header file
/usr/include/sys/capability.h, it does evil stuff like this:
...
  25 /*
  26  * Make sure we can be included from userland by preventing
  27  * capability.h from including other kernel headers
  28  */
  29 #define _LINUX_TYPES_H
  30 #define _LINUX_FS_H
  31 #define __LINUX_COMPILER_H
  32 #define __user
  33
  34 typedef unsigned int __u32;
  35 typedef __u32 __le32;
...
This completely prevents including /usr/include/linux/types.h.
The above `<asm/sigcontext.h> --> <linux/types.h>' is prevented,
and '__u64' is defined in <asm-generic/int-ll64.h>.

4, Modify virtfs-proxy-helper.c to include <sys/capability.h>
last to workaround the issue.

http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
http://patchwork.linuxtv.org/patch/12748/

[YOCTO #4001]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fix-libcap-header-issue-on-some-distro.patch   |   84 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |    4 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/fix-libcap-header-issue-on-some-distro.patch

diff --git a/meta/recipes-devtools/qemu/files/fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/files/fix-libcap-header-issue-on-some-distro.patch
new file mode 100644
index 0000000..13a6ea2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/fix-libcap-header-issue-on-some-distro.patch
@@ -0,0 +1,84 @@
+fix libcap header issue on some distro
+
+1, When build qemu-native on SLED 11.2, there is an error:
+...
+| In file included from /usr/include/bits/sigcontext.h:28,
+|  from /usr/include/signal.h:339,
+|  from /buildarea2/tmp/work/i686-linux/qemu-native/1.4.0-r0/
+qemu-1.4.0/include/qemu-common.h:42,
+|  from fsdev/virtfs-proxy-helper.c:23:
+|  /usr/include/asm/sigcontext.h:28: error: expected specifier-
+qualifier-list before '__u64'
+|  /usr/include/asm/sigcontext.h:191: error: expected specifier-
+qualifier-list before '__u64'
+...
+
+2, The virtfs-proxy-helper.c includes <sys/capability.h> and
+qemu-common.h in sequence. The header include map is:
+(`-->' presents `include')
+...
+"virtfs-proxy-helper.c" --> <sys/capability.h>
+...
+"virtfs-proxy-helper.c" --> "qemu-common.h" --> <signal.h> -->
+<bits/sigcontext.h> --> <asm/sigcontext.h> --> <linux/types.h> -->
+<asm/types.h> --> <asm-generic/types.h> --> <asm-generic/int-ll64.h>
+...
+
+3, The bug is found on SLED 11.2 x86. In libcap header file
+/usr/include/sys/capability.h, it does evil stuff like this:
+...
+  25 /*
+  26  * Make sure we can be included from userland by preventing
+  27  * capability.h from including other kernel headers
+  28  */
+  29 #define _LINUX_TYPES_H
+  30 #define _LINUX_FS_H
+  31 #define __LINUX_COMPILER_H
+  32 #define __user
+  33
+  34 typedef unsigned int __u32;
+  35 typedef __u32 __le32;
+...
+This completely prevents including /usr/include/linux/types.h.
+The above `<asm/sigcontext.h> --> <linux/types.h>' is prevented,
+and '__u64' is defined in <asm-generic/int-ll64.h>.
+
+4, Modify virtfs-proxy-helper.c to include <sys/capability.h>
+last to workaround the issue.
+
+http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
+http://patchwork.linuxtv.org/patch/12748/
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fsdev/virtfs-proxy-helper.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
+--- a/fsdev/virtfs-proxy-helper.c
++++ b/fsdev/virtfs-proxy-helper.c
+@@ -12,7 +12,6 @@
+ #include <sys/resource.h>
+ #include <getopt.h>
+ #include <syslog.h>
+-#include <sys/capability.h>
+ #include <sys/fsuid.h>
+ #include <sys/vfs.h>
+ #include <sys/ioctl.h>
+@@ -26,7 +25,11 @@
+ #include "virtio-9p-marshal.h"
+ #include "hw/9pfs/virtio-9p-proxy.h"
+ #include "fsdev/virtio-9p-marshal.h"
+-
++/*
++ * Include this one last due to some versions of it being buggy:
++ * http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
++ */
++#include <sys/capability.h>
+ #define PROGNAME "virtfs-proxy-helper"
+ 
+ #ifndef XFS_SUPER_MAGIC
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5616a06..f9b22f3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,10 @@ SRC_URI_append_class-nativesdk = "\
     file://relocatable_sdk.patch \
     "
 
+SRC_URI_append_class-native = "\
+    file://fix-libcap-header-issue-on-some-distro.patch \
+    "
+
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
-- 
1.7.10.4



