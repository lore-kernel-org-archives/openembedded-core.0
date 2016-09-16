Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D50A731F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 14:30:22 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l132so2856590wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 07:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bMeNYB5UfU6BV8WqrYaKMWZLq1HOksLPVa8mo/uxCrs=;
	b=f236xCZLYM7cYGL2AdU/PkJqlFVMk8czFmlyEr6DQP/UiLi4WRbbNrkgAIbWVkO1Zo
	REAa/UJlCqKsLWb40Cia4tsvCJ7WeK6IXR7Q+T8CfXunZ/+TY7+hgLelb0VlcYis5w4l
	DvwCFrfJq5IDQ9cX2u5oj35B5IeFSJb8Kys+ABRJADXNYgt5aiwkRTXSt9tYq2LFRFLI
	rQolqyrRMBv7Dnb3pKvPgXTi20M7nKFCSHpJSAbo9IyDIkrFci1Sst93k9GZMD3nPYXS
	31Xak7rJEQnNzN+1PZk9/wqh6FWcA9M+gghjVNdEPVOCYNXmTpuEQO1DLG4RlfpQOG9B
	pqoA==
X-Gm-Message-State: AE9vXwOSgkftJFOtTjL11OllOcmQmTOA0sk53v5IMLm3jucd4obF6fkqhAv8LfhP+H6KjQ==
X-Received: by 10.194.88.137 with SMTP id bg9mr12834983wjb.155.1474036222937; 
	Fri, 16 Sep 2016 07:30:22 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b188sm7604853wmg.24.2016.09.16.07.30.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 07:30:22 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 15:30:21 +0100
Message-Id: <20160916143021.5764-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] gawk-3.1.5: fix non-glibc & gcc >= v4 builds
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
X-List-Received-Date: Fri, 16 Sep 2016 14:30:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

See commit message of patch added

Upstream-Status: Inappropriate [required for gawk 3.1.5 (GPLv2) recipe only]

Change-Id: Ib1df62b9414f8174e651357b5cd3633115b37630
---
 ...0001-gawk-fix-non-glibc-gcc-4-compilation.patch | 64 ++++++++++++++++++++++
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |  7 ++-
 2 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/gawk/gawk-3.1.5/0001-gawk-fix-non-glibc-gcc-4-compilation.patch

diff --git a/meta/recipes-extended/gawk/gawk-3.1.5/0001-gawk-fix-non-glibc-gcc-4-compilation.patch b/meta/recipes-extended/gawk/gawk-3.1.5/0001-gawk-fix-non-glibc-gcc-4-compilation.patch
new file mode 100644
index 0000000..fbe4d22
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk-3.1.5/0001-gawk-fix-non-glibc-gcc-4-compilation.patch
@@ -0,0 +1,64 @@
+From 53496e2e306b16ac59801553f775bcca164e6a39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Wed, 14 Sep 2016 16:20:37 +0100
+Subject: [PATCH] fix gcc >= 4 compilation
+
+| ../gawk-3.1.5/hard-locale.h: In function 'hard_locale':
+| ../gawk-3.1.5/hard-locale.h:43:20: error: invalid storage class for function 'xmalloc'
+|        static ptr_t xmalloc PARAMS ((size_t n));
+|                     ^~~~~~~
+
+| ../gawk-3.1.5/hard-locale.h:45:22: warning: implicit declaration of function 'xmalloc' [-Wimplicit-function-declaration]
+|        char *locale = xmalloc (strlen (p) + 1);
+|                       ^~~~~~~
+| ../gawk-3.1.5/hard-locale.h:45:22: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
+| ../gawk-3.1.5/dfa.c: At top level:
+| ../gawk-3.1.5/dfa.c:125:14: error: conflicting types for 'xmalloc'
+|  static ptr_t xmalloc PARAMS ((size_t n));
+|               ^~~~~~~
+| In file included from ../gawk-3.1.5/dfa.c:112:0:
+| ../gawk-3.1.5/hard-locale.h:45:22: note: previous implicit declaration of 'xmalloc' was here
+|        char *locale = xmalloc (strlen (p) + 1);
+|                       ^~~~~~~
+---
+Upstream-Status: Inappropriate [required for gawk 3.1.5 (GPLv2) recipe only
+ dfa.c         | 2 +-
+ hard-locale.h | 2 --
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/dfa.c b/dfa.c
+index 71e3736..97f6045 100644
+--- a/dfa.c
++++ b/dfa.c
+@@ -109,6 +109,7 @@ extern void free();
+ 
+ #include "regex.h"
+ #include "dfa.h"
++static ptr_t xmalloc PARAMS ((size_t n));
+ #include "hard-locale.h"
+ 
+ /* HPUX, define those as macros in sys/param.h */
+@@ -122,7 +123,6 @@ extern void free();
+ static void dfamust PARAMS ((struct dfa *dfa));
+ 
+ static ptr_t xcalloc PARAMS ((size_t n, size_t s));
+-static ptr_t xmalloc PARAMS ((size_t n));
+ static ptr_t xrealloc PARAMS ((ptr_t p, size_t n));
+ #ifdef DEBUG
+ static void prtok PARAMS ((token t));
+diff --git a/hard-locale.h b/hard-locale.h
+index 0f4986b..9ee57e0 100644
+--- a/hard-locale.h
++++ b/hard-locale.h
+@@ -40,8 +40,6 @@ hard_locale (int category)
+       if (strcmp (p, "C") == 0 || strcmp (p, "POSIX") == 0)
+ 	hard = 0;
+ # else
+-      static ptr_t xmalloc PARAMS ((size_t n));
+-
+       char *locale = xmalloc (strlen (p) + 1);
+       strcpy (locale, p);
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 7c92bde..63fd32f 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -15,8 +15,11 @@ RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
 PR = "r2"
 
-SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-	file://gawk-3.1.5_fix_for_automake-1.12.patch"
+SRC_URI = "\
+    ${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+    file://gawk-3.1.5_fix_for_automake-1.12.patch \
+    file://0001-gawk-fix-non-glibc-gcc-4-compilation.patch \
+"
 
 SRC_URI[md5sum] = "4760325489479cac17fe0114b8f62f30"
 SRC_URI[sha256sum] = "463dcb9d0ca398b1d4f5a332f6cd9cec56441265fca616f2ea1b44d459e9f0f8"
-- 
2.9.3


