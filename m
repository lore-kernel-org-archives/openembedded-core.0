Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4Wu2-00017q-Au
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 14:52:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2012 05:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,300,1344236400"; d="scan'208";a="209459770"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2012 05:40:18 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 14:45:02 +0300
Message-Id: <1345722302-25467-4-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
References: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 3/3] dbus-glib: upgrade to 0.100
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
X-List-Received-Date: Thu, 23 Aug 2012 12:52:50 -0000

test-service-glib-include-glib-only.patch: removed
	- no more compiling errors
---
 .../no-examples.patch                              |    0
 .../test-install-makefile.patch                    |    0
 .../test-service-glib-include-glib-only.patch      |   20 --------------------
 meta/recipes-core/dbus/dbus-glib.inc               |    1 -
 .../dbus/{dbus-glib_0.98.bb => dbus-glib_0.100.bb} |    6 +++---
 5 files changed, 3 insertions(+), 24 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib-0.98 => dbus-glib-0.100}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.98 => dbus-glib-0.100}/test-install-makefile.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
 rename meta/recipes-core/dbus/{dbus-glib_0.98.bb => dbus-glib_0.100.bb} (13%)

diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/no-examples.patch b/meta/recipes-core/dbus/dbus-glib-0.100/no-examples.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.98/no-examples.patch
rename to meta/recipes-core/dbus/dbus-glib-0.100/no-examples.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.100/test-install-makefile.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
rename to meta/recipes-core/dbus/dbus-glib-0.100/test-install-makefile.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
deleted file mode 100644
index 27780e7..0000000
--- a/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix the compiling error that not include glib.h directly.
-
-upstream bugzilla link: https://bugs.freedesktop.org/show_bug.cgi?id=52210
-Upstream-Status: Submitted
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
-
-diff --git a/test/core/test-service-glib.c b/test/core/test-service-glib.c
-index 3355890..7291f35 100644
---- a/test/core/test-service-glib.c
-+++ b/test/core/test-service-glib.c
-@@ -11,7 +11,7 @@
- #include <string.h>
- #include <glib/gi18n.h>
- #include <glib-object.h>
--#include <glib/gquark.h>
-+#include <glib.h>
- 
- #include "my-object.h"
- #include "my-object-subclass.h"
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index a8e6d42..3469a4f 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -12,7 +12,6 @@ DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
-           file://test-service-glib-include-glib-only.patch \
            file://test-install-makefile.patch \
 "
 
diff --git a/meta/recipes-core/dbus/dbus-glib_0.98.bb b/meta/recipes-core/dbus/dbus-glib_0.100.bb
similarity index 13%
rename from meta/recipes-core/dbus/dbus-glib_0.98.bb
rename to meta/recipes-core/dbus/dbus-glib_0.100.bb
index e2c6a0c..f96d04e 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.98.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.100.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI[md5sum] = "3f7f117dc7c8d899d9acfdcbf9253fb8"
-SRC_URI[sha256sum] = "297c81d6bb8b1c312e9b0ccfe91eb28ec0672756abb64dfb7bbe2b5f1ae5d111"
+SRC_URI[md5sum] = "d33959a9c0c6a158f5ac6d640316e89e"
+SRC_URI[sha256sum] = "80ddf7584a659590103817798dd95d7e451d666f385e5e95a83abf85c46d4605"
-- 
1.7.9.5



