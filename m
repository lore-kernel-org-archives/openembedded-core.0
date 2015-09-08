Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B1B7960053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:04 +0000 (UTC)
Received: by qgev79 with SMTP id v79so96461663qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=X5lCgCCyCHMuESylwsdgVZ2vfNqP6ZcZcNbncAlo2Rc=;
	b=smQs8S+tAKotEwggnn8uREfSAjEQ7msypwG85g44ZmFPcK04cPTAGSl/wPtqSuFP9z
	aw7MNvXFoVgWN3RLgrvGyAinfiADyRpYipt5fXfejVX2aseFEREVviPTbj0YQRSRVjzg
	mGo36bFm6Sv3tTRz6Wp6sTAo/KFYxmM63G5USDhfednLcjKK9kEbwN06xPLJDQcxxJhI
	CSB6s23LJVVEksDECcyTEKbzmV2de9nNlKDD06fkLmZhj3aoOc56fJMEn1JepjZ8t38x
	ESNxvcPJDUMbic367xvwWocg8WFOP2wVswhYQ90poUSeR9qxwINNXA2C1K78zQEa1XXt
	FLgQ==
X-Received: by 10.140.196.67 with SMTP id r64mr41725318qha.10.1441753685075;
	Tue, 08 Sep 2015 16:08:05 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:45 +0000
Message-Id: <49ad5c695085455129958274302c77263d96b22f.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 05/16] minicom: Fix build with musl
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:04 -0000

musl exposes the inherent assumption about certain header files from
glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-build-issus-surfaced-due-to-musl.patch | 47 ++++++++++++++++++++++
 meta/recipes-extended/minicom/minicom_2.7.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch

diff --git a/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch b/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
new file mode 100644
index 0000000..fec67fd
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
@@ -0,0 +1,47 @@
+From d62a5862e26ed3fc58d789efe9c40ca6c911d36b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 22:35:31 +0000
+Subject: [PATCH] Fix build issus surfaced due to musl
+
+src/getsdir.h:28:14: error: 'MAXNAMLEN' undeclared here (not in a function)
+   char fname[MAXNAMLEN + 1];  /* filename + terminating null */
+
+src/dial.c:352:22: error: 'KIOCSOUND' undeclared (first use in this function)
+|      ioctl(consolefd, KIOCSOUND, k);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/dial.c    | 2 +-
+ src/getsdir.c | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/dial.c b/src/dial.c
+index a90c1d2..bf02574 100644
+--- a/src/dial.c
++++ b/src/dial.c
+@@ -39,7 +39,7 @@
+ #include "intl.h"
+ 
+ #ifdef VC_MUSIC
+-#  if defined(__GLIBC__)
++#  if defined(__GLIBC__) || defined(__linux__)
+ #    include <sys/ioctl.h>
+ #    include <sys/kd.h>
+ #    include <sys/time.h>
+diff --git a/src/getsdir.c b/src/getsdir.c
+index 2195b27..b61a361 100644
+--- a/src/getsdir.c
++++ b/src/getsdir.c
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/param.h>
+ #include <errno.h>
+ 
+ #include "getsdir.h"
+-- 
+2.5.1
+
diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
index c002bc8..1575cfb 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
 SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
+           file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
           "
 
 SRC_URI[md5sum] = "7044ca3e291268c33294f171d426dc2d"
-- 
2.5.1


