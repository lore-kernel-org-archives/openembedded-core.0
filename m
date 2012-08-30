Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6xUK-0002JM-Cv
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 07:40:20 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so2566884pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 22:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hnpCQLZgcNrPL52OeMx1FyFNwfqZdQZH86yxYn7eMnU=;
	b=Qsm57x8LHu8AjavehgSsACXsc8SwnFy08JZg7L7Wjdd+kS3TbRR+53Gt7fuqmI+PEo
	MxjJgIJL16PNgvjLd37srTi9WRiW8MxTb4o6IOznrveV5h38Bp3kOHx8rPfuCFlEdl2W
	Dm7uOlpqcFT4EMiELFXMRlKAbJJOz/DDiXsuVmfTr3ooE7qUrwGHOfn435OBHKr4ahY3
	lj10WeeYXD5MinoWM2Z5HteWqY0dHD7kyye1yXVqg5FyS0/mXWw7XPP6XRBTjRfkLGF4
	GnhTusw9l5a8FkljD31zoIzfXToFyHY0tc5BHEpIBip4GQ3IDYOUmfWqrJBrKokLJZJ8
	PgjA==
Received: by 10.68.213.195 with SMTP id nu3mr9460971pbc.81.1346304487340;
	Wed, 29 Aug 2012 22:28:07 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uy3sm861924pbc.29.2012.08.29.22.28.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 22:28:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 22:27:21 -0700
Message-Id: <cde6786f97fa8ccc5f793f33130c7b42b9a52d9f.1346304324.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <53bbfea3395479cc37ed842b29670758954a64c0.1346304324.git.raj.khem@gmail.com>
References: <53bbfea3395479cc37ed842b29670758954a64c0.1346304324.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346304324.git.raj.khem@gmail.com>
References: <cover.1346304324.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] eglibc: Bring in the fix for glibc bug #14459, #14195
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
X-List-Received-Date: Thu, 30 Aug 2012 05:40:20 -0000

Fixes strtod integer/buffer overflow bug as detailed below

http://sourceware.org/ml/libc-alpha/2012-08/msg00202.html

Remove rpc-bootstrap patch since its already applied upstream
2.16 branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 --------------------
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch b/meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
deleted file mode 100644
index 130a816..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-
-From libc-alpha-return-31199-listarch-libc-alpha=sources dot redhat dot com at sourceware dot org Tue Jul 03 19:54:27 2012
-Return-Path: <libc-alpha-return-31199-listarch-libc-alpha=sources dot redhat dot com at sourceware dot org>
-Delivered-To: listarch-libc-alpha at sources dot redhat dot com
-Received: (qmail 20151 invoked by alias); 3 Jul 2012 19:54:25 -0000
-Received: (qmail 20139 invoked by uid 22791); 3 Jul 2012 19:54:23 -0000
-X-SWARE-Spam-Status: No, hits=-4.8 required=5.0
-	tests=AWL,BAYES_00,KHOP_RCVD_UNTRUST,RCVD_IN_DNSWL_HI,RCVD_IN_HOSTKARMA_W,T_RP_MATCHES_RCVD
-X-Spam-Check-By: sourceware.org
-From: Mike Frysinger <vapier at gentoo dot org>
-To: libc-alpha at sourceware dot org
-Subject: [PATCH] sunrpc: fix rpc bootstrap builds
-Date: Tue,  3 Jul 2012 15:54:11 -0400
-Message-Id: <1341345251-31730-1-git-send-email-vapier@gentoo.org>
-Mailing-List: contact libc-alpha-help at sourceware dot org; run by ezmlm
-Precedence: bulk
-List-Id: <libc-alpha.sourceware.org>
-List-Subscribe: <mailto:libc-alpha-subscribe at sourceware dot org>
-List-Archive: <http://sourceware.org/ml/libc-alpha/>
-List-Post: <mailto:libc-alpha at sourceware dot org>
-List-Help: <mailto:libc-alpha-help at sourceware dot org>, <http://sourceware dot org/ml/#faqs>
-Sender: libc-alpha-owner at sourceware dot org
-Delivered-To: mailing list libc-alpha at sourceware dot org
-
-If you build & install glibc w/rpc disabled, you no longer have headers in
-/usr/include/rpc/ (this is expected).  But if you try to build glibc w/rpc
-enabled, this gets into a bad state due to the new rpc helpers that get
-cross-compiled:
-
-$ make
-...
-x86_64-pc-linux-gnu-gcc -m32   -D_RPC_THREAD_SAFE_ -D_GNU_SOURCE -DIS_IN_build \
-	-include $objdir/config.h rpc_clntout.c -o $objdir/sunrpc/cross-rpc_clntout.o \
-	-MMD -MP -MF $objdir/sunrpc/cross-rpc_clntout.o.dt -MT $objdir/sunrpc/cross-rpc_clntout.o -c
-rpc_clntout.c:34:23: fatal error: rpc/types.h: No such file or directory
-compilation terminated.
-make: *** [$objdir/sunrpc/cross-rpc_clntout.o] Error 1
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-
-2012-07-03  Mike Frysinger  <vapier@gentoo.org>
-
-	* sunrpc/rpc_clntout.c: Change <rpc/types.h> to "rpc/types.h".
----
- sunrpc/rpc_clntout.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libc/sunrpc/rpc_clntout.c
-===================================================================
---- libc.orig/sunrpc/rpc_clntout.c	2012-07-04 16:09:16.000000000 -0700
-+++ libc/sunrpc/rpc_clntout.c	2012-07-04 18:04:34.498085075 -0700
-@@ -31,7 +31,7 @@
-  */
- #include <stdio.h>
- #include <string.h>
--#include <rpc/types.h>
-+#include "rpc/types.h"
- #include "rpc_parse.h"
- #include "rpc_util.h"
- #include "proto.h"
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 69803f7..3b11892 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "19922"
+SRCREV = "20393"
 
 DEPENDS += "gperf-native"
 PR = "r6"
@@ -21,7 +21,6 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://initgroups_keys.patch \
            file://eglibc_fix_findidx_parameters.patch \
            file://ppc_slow_ieee754_sqrt.patch \
-           file://rpc-bootstrap.patch \
            file://e500-math_private.patch \
            file://fileops-without-wchar-io.patch \
            file://add_resource_h_to_wait_h.patch \
-- 
1.7.9.5



