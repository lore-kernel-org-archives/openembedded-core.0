Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mx-0001n9-R4
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DuK7027489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:56 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:15 -0500
Message-ID: <71d0f4fd9263063f69332b5943800973c38d7524.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 09/12] rpm-native: Fix 'uuid_rc_t' undeclared error when compiling
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
X-List-Received-Date: Sun, 30 Sep 2012 00:26:52 -0000
Content-Type: text/plain

When attempting to build with uuid and all tests compiling will error because
uuid.h doesn't exist in the rpm tarball. Fix this by changing the include to
use the one in ossp which solves the issue.

The recipe already depends on ossp so ossp/uuid.h will be there when rpm-native
is built.

Signed-off-by: Morgan Little <morgan.little@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-uuid-include.patch                 |   35 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch b/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
new file mode 100644
index 0000000..0e45ed7
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
@@ -0,0 +1,35 @@
+A patch to fix a problem when compiling with uuid.
+
+When attempting to build with uuid and all tests compiling will error because
+uuid.h doesn't exist in the rpm tarball. Fix this by changing the include to
+use the one in ossp which solves the issue. 
+
+The recipe already depends on ossp so ossp/uuid.h will be there when rpm-native
+is built.
+
+Signed-off-by: Morgan Little <morgan.little@windriver.com>
+
+
+--- a/lua/local/luuid.c.orig
++++ b/lua/local/luuid.c
+@@ -21,7 +21,7 @@
+ 
+ #ifdef LUA_USE_UUID
+ 
+-#include "uuid.h"
++#include <ossp/uuid.h>
+ 
+ /*  Lua method: <uuid> = uuid.generate(<version>[, <uuid-namespace>, <data>])  */
+ static int luuid_generate(lua_State *L)
+
+--- a/rpmio/rpmuuid.c.orig
++++ b/rpmio/rpmuuid.c
+@@ -16,7 +16,7 @@
+ #include "rpmlog.h"
+ #include "rpmuuid.h"
+ #ifdef WITH_UUID
+-#include "uuid.h"
++#include <ossp/uuid.h>
+ #endif
+ #include "debug.h"
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 5435445..2a4c8d8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r48"
+PR = "r49"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -76,6 +76,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpmatch.patch \
 	   file://fstack-protector-configure-check.patch \
 	   file://dbconvert.patch \
+	   file://rpm-uuid-include.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



