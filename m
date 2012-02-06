Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOz-0004YJ-Ug
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:50:14 +0100
Received: by pbbb4 with SMTP id b4so4117806pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y0/f92JFWokyTOtkRxhQmJwfkOZaOFgXJn362Dy4lkI=;
	b=i5YaG4pUbWB82T7UOf8IoDZa0sVDGNVwZodQHgZ0aIaJ45PSJDH7INfEeHGCud0t6e
	G9RJ8NsyQuD1h5rdHknvTYBN1+1wuVM7hGyvPmA+MftgM6Y/3zTwN9gURjV8hTPenDCp
	4J87VOGp7ob5i8m7R+w7LWsch4uRwXqF+jHtA=
Received: by 10.68.238.229 with SMTP id vn5mr45334010pbc.39.1328510532641;
	Sun, 05 Feb 2012 22:42:12 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.42.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:42:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:42 -0800
Message-Id: <a36e1e1a14c4f0642449350f31121c5b55dd9000.1328510189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 16/20] libdrm: Fix build failure unearthed by uclibc
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
X-List-Received-Date: Mon, 06 Feb 2012 06:50:14 -0000

uclibc wants to know value of __USE_GNU for certain
header prototypes to be enabled. So we move the config.h
header up in search list.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../drm/libdrm/GNU_SOURCE_definition.patch         |   30 ++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.30.bb         |    6 ++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch

diff --git a/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch b/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
new file mode 100644
index 0000000..8eb1d5e
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
@@ -0,0 +1,30 @@
+uclibc headers need to know if _GNU_SOURCE is defined or not and its defined
+in config.h so include it first to get the definition if its there fixed build
+problems on uclibc
+
+test_decode.c:107:2: error: implicit declaration of function 'open_memstream' [-Werror=implicit-function-declaration]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libdrm-2.4.30/intel/test_decode.c
+===================================================================
+--- libdrm-2.4.30.orig/intel/test_decode.c	2012-02-03 14:28:46.409355918 -0800
++++ libdrm-2.4.30/intel/test_decode.c	2012-02-03 14:29:02.357356689 -0800
+@@ -21,6 +21,8 @@
+  * IN THE SOFTWARE.
+  */
+ 
++#include "config.h"
++
+ #include <string.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+@@ -31,7 +33,6 @@
+ #include <sys/mman.h>
+ #include <err.h>
+ 
+-#include "config.h"
+ #include "intel_bufmgr.h"
+ #include "intel_chipset.h"
+ 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.30.bb b/meta/recipes-graphics/drm/libdrm_2.4.30.bb
index 4a6052d..5d99916 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.30.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.30.bb
@@ -2,9 +2,11 @@ require libdrm.inc
 
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI += "file://installtests.patch"
+SRC_URI += "file://installtests.patch \
+            file://GNU_SOURCE_definition.patch \
+           "
 
 SRC_URI[md5sum] = "9f57a68b2c0836b55ebcbc241f6ca175"
 SRC_URI[sha256sum] = "cacea9c157ec824ad278a06f4910659b2f3ae69686518ece8d6967843cddcd56"
-- 
1.7.5.4



