Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 155B278AB8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w26IBLT8012913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Mar 2018 10:11:21 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:47 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:10 -0500
Message-ID: <5455e4d17941d9ddcb5fce77195da9d5c8081f42.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-libc-headers: update to 4.15.7
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:24 -0000
Content-Type: text/plain

While we don't normally follow all the -stable updates for libc-headers, there
was one userspace header that was broken in the 4.15 cycle, and it has now
been fixed in -stable.

The offending header breaks the build for several packages, so we update to
pick up this change:

   Author: Hauke Mehrtens <hauke@hauke-m.de>
   Date:   Mon Feb 12 23:59:51 2018 +0100

       uapi/if_ether.h: move __UAPI_DEF_ETHHDR libc define

       commit da360299b6734135a5f66d7db458dcc7801c826a upstream.

       This fixes a compile problem of some user space applications by not
       including linux/libc-compat.h in uapi/if_ether.h.

       linux/libc-compat.h checks which "features" the header files, included
       from the libc, provide to make the Linux kernel uapi header files only
          provide no conflicting structures and enums. If a user application mixes
       kernel headers and libc headers it could happen that linux/libc-compat.h
       gets included too early where not all other libc headers are included
       yet. Then the linux/libc-compat.h would not prevent all the
       redefinitions and we run into compile problems.
       This patch removes the include of linux/libc-compat.h from
       uapi/if_ether.h to fix the recently introduced case, but not all as this
       is more or less impossible.

       It is no problem to do the check directly in the if_ether.h file and not
       in libc-compat.h as this does not need any fancy glibc header detection
       as glibc never provided struct ethhdr and should define
       __UAPI_DEF_ETHHDR by them self when they will provide this.

       The following test program did not compile correctly any more:

       #include <linux/if_ether.h>
       #include <netinet/in.h>
       #include <linux/in.h>

       int main(void)
       {
           return 0;
       }

       Fixes: 6926e041a892 ("uapi/if_ether.h: prevent redefinition of struct ethhdr")
       Reported-by: Guillaume Nault <g.nault@alphalink.fr>
       Cc: <stable@vger.kernel.org> # 4.15
       Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
       Signed-off-by: David S. Miller <davem@davemloft.net>
       Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

We also add a new muslc patch to adjust the ethhdr change in the uapi. As is
suggested in the kernel commit, we can protect musl directly in if_ether itself.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...move-muslc-ethhdr-protection-to-uapi-file.patch | 30 ++++++++++++++++++++++
 ...eaders_4.15.bb => linux-libc-headers_4.15.7.bb} |  6 +++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.15.bb => linux-libc-headers_4.15.7.bb} (62%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
new file mode 100644
index 000000000000..2e04701699c8
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
@@ -0,0 +1,30 @@
+From 897736166fd709906a5fdf16eb23f8fddff770b5 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Thu, 1 Mar 2018 18:31:01 -0500
+Subject: [PATCH] if_ether: move muslc ethhdr protection to uapi file
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ include/uapi/linux/if_ether.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
+index 153c9c2..7b69b73 100644
+--- a/include/uapi/linux/if_ether.h
++++ b/include/uapi/linux/if_ether.h
+@@ -149,6 +149,12 @@
+  *	This is an Ethernet frame header.
+  */
+ 
++#ifdef _NETINET_IF_ETHER_H /* musl */
++#define __UAPI_DEF_ETHHDR 0
++#else /* glibc uses __NETINET_IF_ETHER_H, and includes the kernel header. */
++#define __UAPI_DEF_ETHHDR 1
++#endif
++
+ /* allow libcs like musl to deactivate this, glibc does not implement this. */
+ #ifndef __UAPI_DEF_ETHHDR
+ #define __UAPI_DEF_ETHHDR		1
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb
similarity index 62%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb
index b511cd118105..a7db4c9c015a 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb
@@ -5,7 +5,9 @@ SRC_URI_append_libc-musl = "\
     file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
+    file://0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch \
    "
 
-SRC_URI[md5sum] = "0d701ac1e2a67d47ce7127432df2c32b"
-SRC_URI[sha256sum] = "5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769"
+
+SRC_URI[md5sum] = "8186ce63c489199b58b6a58ad2a24a94"
+SRC_URI[sha256sum] = "cd44df4b23a3e0edc14be63df95d768b9600b31c35be05fb89f93226907fc8c6"
-- 
2.5.0


