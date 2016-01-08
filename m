Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 45625770A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:58 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p186so118758610qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=23z1uyB3MAS7KlBlPErpOUAsLhJfpN2wS/HlRH9G1bk=;
	b=TBvi7VBotATE+RimUBsu71Oi/xYs0c8bVMak6Nopl2SDU/sEvNjNW2Mip2Ow1b1+RP
	YG6wJYcRiStETFjUckNPQJ0hiQ3RuFx5E0gDJYhSkfupHHOlovlJea2kJ+B7/1t3w8Qh
	6fmRTBwX9+YjZSz8nxgqGYZs26C53Soy3Mk4iHNM2QYJ2hKoK1K1SefIiSr7hfzsG8fK
	aG6IFnLt2N4H8mkQFvSPJZrOO6cBfNkiwaYFoUs2dsMkqpJt6eqfgbvWuJEQmQxpoEOe
	7zM7cVaJLLgSOwtmcDBPmNKxYAQZqM5oiQRKR6bXHG1F+8ny1kJTxG2+D6E/C7lNaB2V
	ty1g==
X-Received: by 10.55.81.87 with SMTP id f84mr41919229qkb.10.1452248399817;
	Fri, 08 Jan 2016 02:19:59 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:16 +0000
Message-Id: <92a428fafe8f645b81028603cf723afb8b6f3efa.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 48/53] chkconfig: Avoid using caddr_t
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../chkconfig/chkconfig/replace_caddr_t.patch      | 33 ++++++++++++++++++++++
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch

diff --git a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
new file mode 100644
index 0000000..96d1938
--- /dev/null
+++ b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
@@ -0,0 +1,33 @@
+caddr_t is a legacy BSD type which was rejected by the POSIX standard.
+Use void * instead.
+
+sys/unitstd.h is not needed and moreover its not available on all C library
+implementations e.g. musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: chkconfig-1.3.58/alternatives.c
+===================================================================
+--- chkconfig-1.3.58.orig/alternatives.c
++++ chkconfig-1.3.58/alternatives.c
+@@ -22,7 +22,6 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/stat.h>
+-#include <sys/unistd.h>
+ #include <unistd.h>
+ 
+ #define	FLAGS_TEST	(1 << 0)
+Index: chkconfig-1.3.58/leveldb.c
+===================================================================
+--- chkconfig-1.3.58.orig/leveldb.c
++++ chkconfig-1.3.58/leveldb.c
+@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name
+     fstat(fd, &sb);
+ 
+     bufstart = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
+-    if (bufstart == ((caddr_t) -1)) {
++    if (bufstart == ((void*) -1)) {
+ 	close(fd);
+ 	return -1;
+     }
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 488847a..e839026 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -16,7 +16,9 @@ PROVIDES += "virtual/update-alternatives"
 
 PR = "r7"
 
-SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
+           file://replace_caddr_t.patch \
+          "
 
 SRC_URI[md5sum] = "c2039ca67f2749fe0c06ef7c6f8ee246"
 SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f18271211de68"
-- 
2.7.0


