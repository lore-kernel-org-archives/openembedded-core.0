Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D60C36AA78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:35:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5OEZeA3002999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:35:40 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 07:35:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:45:48 -0500
Message-ID: <1372085149-30510-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
References: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/3] make: Fix second part of bug Savannah 30612
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
X-List-Received-Date: Mon, 24 Jun 2013 14:35:39 -0000
Content-Type: text/plain

The Savannah bug 30612 describes two different issue.  The first,
previously fixed, errors parsing multiple objects in parenthesis.
The second, (this issue), extra white space contained in the
parenthesis.

The fix was backported from the current make git tree:
http://git.savannah.gnu.org/cgit/make.git/commit/?id=b06b8c64a29a5ba3a8daecd829fa2f98d42cb285

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../make-savannah-bug30612-fix_white_space.patch   | 58 ++++++++++++++++++++++
 meta/recipes-devtools/make/make_3.82.bb            |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch

diff --git a/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch b/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
new file mode 100644
index 0000000..0ef501f
--- /dev/null
+++ b/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
@@ -0,0 +1,58 @@
+Fix another error related to whitespace handling in archives.
+
+2011-06-12  Paul Smith  <psmith@gnu.org>
+
+* read.c (parse_file_seq): Move the check for empty members out of
+the loop so we can go to the next member properly.
+Another fix for Savannah bug #30612.
+
+Upstream-Status: Backport
+
+---
+ read.c                          | 10 +++++-----
+ tests/scripts/features/archives |  5 +++++
+ 5 files changed, 30 insertions(+), 5 deletions(-)
+
+diff --git a/read.c b/read.c
+index c87d4a7..b012094 100644
+--- a/read.c
++++ b/read.c
+@@ -3044,16 +3044,16 @@ parse_file_seq (char **stringp, unsigned int size, int stopchar,
+                       nlen -= (n + 1) - tp;
+                       tp = n + 1;
+ 
+-                      /* If we have just "lib(", part of something like
+-                         "lib( a b)", go to the next item.  */
+-                      if (! nlen)
+-                        continue;
+-
+                       /* We can stop looking now.  */
+                       break;
+                     }
+                 }
+               while (*e != '\0');
++
++              /* If we have just "lib(", part of something like "lib( a b)",
++                 go to the next item.  */
++              if (! nlen)
++                continue;
+             }
+         }
+ 
+diff --git a/tests/scripts/features/archives b/tests/scripts/features/archives
+index 00aa1af..3fe46a0 100644
+--- a/tests/scripts/features/archives
++++ b/tests/scripts/features/archives
+@@ -36,6 +36,11 @@ utouch(-50, 'a2.o');
+ run_make_test('all: libxx.a(a3.o *.o)', '',
+               "ar rv libxx.a a3.o\na - a3.o\nar rv libxx.a a2.o\nr - a2.o\n");
+ 
++# Check whitespace handling
++utouch(-40, 'a2.o');
++run_make_test('all: libxx.a(  a3.o    *.o     )', '',
++              "ar rv libxx.a a2.o\nr - a2.o\n");
++
+ rmfiles(qw(a1.o a2.o a3.o libxx.a));
+ 
+ # This tells the test driver that the perl test script executed properly.
+
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_3.82.bb
index b4292b5..8a2f287 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_3.82.bb
@@ -7,7 +7,8 @@ require make.inc
 
 SRC_URI += "file://expand_MAKEFLAGS.patch \
             file://intermediate-target-bugfix.patch \
-            file://make-savannah-bug30612-handling_of_archives.patch;striplevel=0"
+            file://make-savannah-bug30612-handling_of_archives.patch;striplevel=0 \
+            file://make-savannah-bug30612-fix_white_space.patch"
 
 SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
 SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"
-- 
1.8.3.1


