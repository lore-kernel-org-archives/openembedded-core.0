Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D08D06FA66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 01:59:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4R1xDJl020523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 May 2014 18:59:13 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 18:59:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 09:59:03 +0800
Message-ID: <63ab824a613874b93978ebf17afe2f6d69a58faf.1401155797.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401155797.git.hongxu.jia@windriver.com>
References: <cover.1401155797.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/3] socat: fix linux/errqueue.h not found
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
X-List-Received-Date: Tue, 27 May 2014 01:59:13 -0000
Content-Type: text/plain

The do_compile failed:
...
|tmp/work/core2-64-poky-linux/socat/1.7.2.4-r0/socat-1.7.2.4/xio-ip.c:
In function 'xiolog_ancillary_ip':
|tmp/work/core2-64-poky-linux/socat/1.7.2.4-r0/socat-1.7.2.4/xio-ip.c:520:12:
error: dereferencing pointer to incomplete type
|         err->ee_errno, '\0', err->ee_origin, '\0', err->ee_type, '\0',
|            ^
| ake: *** [xio-ip.o] Error 1
...

For 1.7.2.4, the header check of 'linux/errqueue.h ' was not correctly,
but the old version 1.7.2.3 worked, so we reference 1.7.2.3 to fix this
issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../socat/fix-linux-errqueue.h-not-found.patch     | 40 ++++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch

diff --git a/meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch b/meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch
new file mode 100644
index 0000000..3823eaf
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch
@@ -0,0 +1,40 @@
+configure.in: fix linux/errqueue.h not found
+
+The do_compile failed:
+...
+|tmp/work/core2-64-poky-linux/socat/1.7.2.4-r0/socat-1.7.2.4/xio-ip.c:
+In function 'xiolog_ancillary_ip':
+|tmp/work/core2-64-poky-linux/socat/1.7.2.4-r0/socat-1.7.2.4/xio-ip.c:520:12:
+error: dereferencing pointer to incomplete type
+|         err->ee_errno, '\0', err->ee_origin, '\0', err->ee_type, '\0',
+|            ^
+| ake: *** [xio-ip.o] Error 1
+...
+
+For 1.7.2.4, the header check of 'linux/errqueue.h ' was not correctly,
+but the old version 1.7.2.3 worked, so we reference 1.7.2.3 to fix this
+issue.
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 70922f9..bdfbe98 100644
+--- a/configure.in
++++ b/configure.in
+@@ -79,8 +79,7 @@ AC_HEADER_RESOLV()
+ 
+ AC_CHECK_HEADERS(termios.h linux/if_tun.h)
+ AC_CHECK_HEADERS(net/if_dl.h)
+-AC_CHECK_HEADERS(linux/types.h)
+-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
++AC_CHECK_HEADERS(linux/types.h linux/errqueue.h)
+ AC_CHECK_HEADERS(sys/utsname.h sys/select.h sys/file.h)
+ AC_CHECK_HEADERS(util.h bsd/libutil.h libutil.h sys/stropts.h regex.h)
+ AC_CHECK_HEADERS(linux/fs.h linux/ext2_fs.h)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index 6febe5e..777125f 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
            file://fix-xxx_SHIFT-autoheader.patch \
            file://fix-cross-compiling-failed.patch \
+           file://fix-linux-errqueue.h-not-found.patch \
 "
 
 
-- 
1.8.1.2


