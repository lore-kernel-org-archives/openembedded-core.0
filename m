Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1SrDF6-0006C7-DC
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 21:15:32 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6HJ4Bfu029260
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 12:04:11 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 15:04:09 -0400
Message-Id: <1342551849-18372-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] dbus-glib: fix compile error when enable-tests
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
X-List-Received-Date: Tue, 17 Jul 2012 19:15:32 -0000

test-service-glib-include-glib-only.patch: fixes the compiling failure
that test-service-glib.c includes glib/gquark.h not glib.h directly.

[YOCTO #2762]

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 .../test-service-glib-include-glib-only.patch      |   13 +++++++++++++
 meta/recipes-core/dbus/dbus-glib.inc               |    4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch

diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
new file mode 100644
index 0000000..e0bc0c6
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
@@ -0,0 +1,13 @@
+diff --git a/test/core/test-service-glib.c b/test/core/test-service-glib.c
+index 3355890..7291f35 100644
+--- a/test/core/test-service-glib.c
++++ b/test/core/test-service-glib.c
+@@ -11,7 +11,7 @@
+ #include <string.h>
+ #include <glib/gi18n.h>
+ #include <glib-object.h>
+-#include <glib/gquark.h>
++#include <glib.h>
+ 
+ #include "my-object.h"
+ #include "my-object-subclass.h"
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index da2845a..f554ce8 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -11,7 +11,9 @@ DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
-           file://no-examples.patch"
+           file://no-examples.patch \
+           file://test-service-glib-include-glib-only.patch \
+"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.9.5



