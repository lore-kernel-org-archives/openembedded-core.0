Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD9365CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:54:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c82so3977903wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vs3gPjEUbHOny3xYBy/u5ws4kRFijhAynn6eoOxLdwI=;
	b=bFlc3SWO9J6YBipiG/8C3ypO79EHDTZWEV2AlPd45GyOy5PTS4q+S42Nzh4u5IeV34
	6eZq+vJpckoV4iftflZ8f3ynK+yJXddwaQaAoRr5ZAyGSzz6S/VNCm/+YXleau7pieGo
	bqUzFOR/NCRnCV1QqMGtQRCmRz6qK8SN40dMGUQdkVWvylLKSxv2KHvv1fnnyK/Q6Blq
	0Wq53eQ8oMIEJx2p4/E5H0xUrgXAfeK9u8zb+FpL+vNF47n4laGnapyx/ZvK3eJtXIZp
	FT5XvLmNrgXYwtLpO15CwmLMX7+Foquzkv6E4uQ/p64GtR8A7n3LRNqCpVEFJd0ZyQJr
	FHIQ==
X-Gm-Message-State: ALyK8tKJZmePGB4Z8ac9v/WdDu+ZF0GhHwLUbqfhhskl6NRC1FhzDw+szXDoytrgunt3kw==
X-Received: by 10.28.45.201 with SMTP id t192mr18794920wmt.77.1466765675840;
	Fri, 24 Jun 2016 03:54:35 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id b4sm4588563wjd.16.2016.06.24.03.54.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:54:35 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:54:29 +0100
Message-Id: <1466765671-22371-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765671-22371-1-git-send-email-git@andred.net>
References: <1466765671-22371-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/4] json-c: backport patch to fix uClibc link issues
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
X-List-Received-Date: Fri, 24 Jun 2016 10:54:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

We need to link against libm as we get linker errors otherwise:

<sysroot>/usr/lib/libjson-c.so.2: undefined reference to `__isnan'
<sysroot>/usr/lib/libjson-c.so.2: undefined reference to `__isinf'
collect2: error: ld returned 1 exit status

Backport the upstream patch.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 .../0001-Link-against-libm-when-needed.patch       | 53 ++++++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.12.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch b/meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch
new file mode 100644
index 0000000..bfe9d72
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch
@@ -0,0 +1,53 @@
+From 93582ad85ef48c18ac12f00a9a9e124989b1fcab Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 1 May 2015 12:52:18 +0200
+Subject: [PATCH] Link against libm when needed
+
+In certain C libraries (e.g uClibc), isnan() and related functions are
+implemented in libm, so json-c needs to link against it. This commit
+therefore adds an AC_TRY_LINK() test to check whether a program
+calling isnan() can be properly linked with no special flags. If not,
+we assume linking against libm is needed.
+
+The json-c.pc.in file is also adjusted so that in the case of static
+linking against json-c, -lm is also used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+Upstream-Status: Backport
+
+ configure.ac | 4 ++++
+ json-c.pc.in | 3 ++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c50f81b..30e7174 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,6 +50,10 @@ AC_CHECK_DECLS([isinf], [], [], [[#include <math.h>]])
+ AC_CHECK_DECLS([_isnan], [], [], [[#include <float.h>]])
+ AC_CHECK_DECLS([_finite], [], [], [[#include <float.h>]])
+ 
++if test "$ac_cv_have_decl_isnan" = "yes" ; then
++   AC_TRY_LINK([#include <math.h>], [float f = 0.0; return isnan(f)], [], [LIBS="$LIBS -lm"])
++fi
++
+ #check if .section.gnu.warning accepts long strings (for __warn_references)
+ AC_LANG_PUSH([C])
+ 
+diff --git a/json-c.pc.in b/json-c.pc.in
+index 037739d..05bfbc8 100644
+--- a/json-c.pc.in
++++ b/json-c.pc.in
+@@ -6,6 +6,7 @@ includedir=@includedir@
+ Name: json-c
+ Description: JSON implementation in C
+ Version: @VERSION@
+-Requires: 
++Requires:
++Libs.private: @LIBS@
+ Libs:  -L${libdir} -ljson-c
+ Cflags: -I${includedir}/json-c
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index 1a5c394..d8c76db 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://0001-json_tokener-requires-INF-and-NAN.patch \
+           file://0001-Link-against-libm-when-needed.patch \
           "
 
 SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
-- 
2.8.1


