Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 967446D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL78R6c013051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:08:28 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:08:27 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:08:21 -0600
Message-ID: <1385017702-22903-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385017702-22903-1-git-send-email-mark.hatle@windriver.com>
References: <1385017702-22903-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][RFC PATCH 1/2] dpkg: Fix a build error for dpkg-native on CentOS 5.8.
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
X-List-Received-Date: Thu, 21 Nov 2013 07:08:29 -0000
Content-Type: text/plain

From: Lei Liu <lei.liu2@windriver.com>

Remove the -Wvla(*) flag from the set of compiler warning flags, since
gcc on ancient host systems such as CentOS 5.8 doesn't support it.

*-Wvla
  Warn if variable length array is used in the code.  -Wno-vla will prevent
  the -pedantic warning of the variable length array.

Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
Signed-off-by: Lei Liu <lei.liu2@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 .../dpkg/dpkg/no-vla-warning.patch                 | 24 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.1.bb          |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch b/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
new file mode 100644
index 0000000..9bec523
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
@@ -0,0 +1,24 @@
+Remove the -Wvla flag from the set of compiler warning flags, since gcc
+on ancient host systems such as CentOS 5.8 doesn't support it, and it
+causes a build error for dpkg-native.
+
+Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+Signed-off-by: Lei Liu <lei.liu2@windriver.com>
+---
+ m4/dpkg-compiler.m4 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/m4/dpkg-compiler.m4
++++ b/m4/dpkg-compiler.m4
+@@ -14,7 +14,7 @@ AC_DEFUN([DPKG_COMPILER_WARNINGS],
+ 
+ WFLAGS="-Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers \
+ 	 -Wmissing-declarations -Wmissing-format-attribute \
+ 	 -Wformat-security -Wpointer-arith \
+-	 -Wvla -Winit-self -Wwrite-strings -Wcast-align -Wshadow"
++	 -Winit-self -Wwrite-strings -Wcast-align -Wshadow"
+ WCFLAGS="-Wdeclaration-after-statement -Wnested-externs -Wbad-function-cast \
+ 	 -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition"
+ # Temporarily here until #542031 gets fixed in ncurses
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
index 525f759..4ff22cc 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://noman.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
+            file://no-vla-warning.patch \
            "
 
 SRC_URI[md5sum] = "ece3ae87a099158c17bde95c0036c575"
-- 
1.8.1.2.545.g2f19ada


