Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0A68076FC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:05 +0000 (UTC)
Received: by qgez77 with SMTP id z77so96997800qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=20ukKbxYg+99CaoOMmE+l9myDiOKyvmQ/f0oOfpHnWM=;
	b=qo3fQ2WI+Sp+VLvtrkH+LDI1u/TkRCy1BR2uRENOOIs32y6UOqTuGYG7oJ6FkbbM0s
	oinpkuQFLhXucQ2AE4v00RMusvB0bbmAN7ZgiATYkW/Pze5sxH1H8aNYaHsCquo8NhOx
	3GnUU/Q7ybVxrbdxyPmEh/521eaREhyJDIcHlUuYW71rlkYKlT9oBWqrb870XTJ6hxXH
	2ApHKaFf+p71gQ8ySdE5sXXPDANjLIfGu8izJPuawqTwOKphV51eZWWeL/hkl+SuMLX5
	Jj3RojR8ppvJoHa+o218F4MV5osvl81K0XCtwkM6ziF9J82EsZ3X1Sg4zuIh8kAALc3g
	9GjA==
X-Received: by 10.140.150.78 with SMTP id 75mr21765132qhw.11.1441753685719;
	Tue, 08 Sep 2015 16:08:05 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:46 +0000
Message-Id: <ec3709071d88864820961886fab573700032d34f.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 06/16] bdwgc: Include signal.h instead of hard asm/sigcontext.h
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:06 -0000

All cases are about glibc and for non-glibc systems it falls back to
last else choice which still is glibc's older version, ideally it
should have a case where libc != glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bdwgc/bdwgc/0001-fix-build-with-musl.patch     | 35 ++++++++++++++++++++++
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch

diff --git a/meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch b/meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch
new file mode 100644
index 0000000..ab907fc
--- /dev/null
+++ b/meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch
@@ -0,0 +1,35 @@
+From 829a89e7f5785239a9384e3afd46c900f9d76ada Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 19:55:32 +0000
+Subject: [PATCH] fix build with musl
+
+signal.h already includes bits/sigcontext.h
+Documentation seems to indicate that if you need the definitions in
+sigcontext.h, you are supposed to include signal.h and not sigcontext.h.
+
+a good fix should be to remove glibc
+specific understanding, in those ifdef's
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ os_dep.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os_dep.c b/os_dep.c
+index 08c501d..5cb7873 100644
+--- a/os_dep.c
++++ b/os_dep.c
+@@ -41,7 +41,7 @@
+ #   else /* __GLIBC__ < 2 */
+       /* libc5 doesn't have <sigcontext.h>: go directly with the kernel   */
+       /* one.  Check LINUX_VERSION_CODE to see which we should reference. */
+-#     include <asm/sigcontext.h>
++#     include <signal.h>
+ #   endif /* __GLIBC__ < 2 */
+ # endif
+ #endif /* LINUX && !POWERPC */
+-- 
+2.5.1
+
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 1ca8cf7..95e358f 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -21,7 +21,9 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
-SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz"
+SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
+           file://0001-fix-build-with-musl.patch \
+          "
 
 SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
 SRC_URI[sha256sum] = "63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2"
-- 
2.5.1


