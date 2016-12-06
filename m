Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1B06871A61
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:46:53 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 41E94B87EF8; Tue,  6 Dec 2016 17:46:51 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 17:46:51 +0100
Message-Id: <1481042811-26430-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LYr1fUAPThGvLmWT_Jf0A+fzA302xHWfw4+NkY0d0FGGA@mail.gmail.com>
References: <CAJTo0LYr1fUAPThGvLmWT_Jf0A+fzA302xHWfw4+NkY0d0FGGA@mail.gmail.com>
Subject: [PATCH v2] keyutils: new recipe (version 1.5.9)
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
X-List-Received-Date: Tue, 06 Dec 2016 16:46:54 -0000

Used by nfs-utils for nfsidmap, if available. Includes a backported patch for
musl and a description text from meta-ivi.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../0001-Include-limits.h-for-UINT_MAX.patch       | 30 ++++++++++++++++++
 meta/recipes-support/keyutils/keyutils_1.5.9.bb    | 37 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-support/keyutils/keyutils/0001-Include-limits.h-for-UINT_MAX.patch
 create mode 100644 meta/recipes-support/keyutils/keyutils_1.5.9.bb

diff --git a/meta/recipes-support/keyutils/keyutils/0001-Include-limits.h-for-UINT_MAX.patch b/meta/recipes-support/keyutils/keyutils/0001-Include-limits.h-for-UINT_MAX.patch
new file mode 100644
index 0000000..b17153c
--- /dev/null
+++ b/meta/recipes-support/keyutils/keyutils/0001-Include-limits.h-for-UINT_MAX.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport [git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git master]
+
+From ab818a7f5818177a3da09fce6aa064ef648da372 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 4 Apr 2015 00:13:21 +0200
+Subject: [PATCH] Include <limits.h> for UINT_MAX
+
+Fixes building with musl libc.
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: David Howells <dhowells@redhat.com>
+---
+ key.dns_resolver.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/key.dns_resolver.c b/key.dns_resolver.c
+index c2a9fe5..9c9d458 100644
+--- a/key.dns_resolver.c
++++ b/key.dns_resolver.c
+@@ -42,6 +42,7 @@
+ #include <netinet/in.h>
+ #include <arpa/nameser.h>
+ #include <arpa/inet.h>
++#include <limits.h>
+ #include <resolv.h>
+ #include <getopt.h>
+ #include <sys/types.h>
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/keyutils/keyutils_1.5.9.bb b/meta/recipes-support/keyutils/keyutils_1.5.9.bb
new file mode 100644
index 0000000..3c746d2
--- /dev/null
+++ b/meta/recipes-support/keyutils/keyutils_1.5.9.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Linux Key Management Utilities"
+DESCRIPTION = "Keyutils is a set of utilities for managing the key retention \
+facility in the kernel, which can be used by filesystems, block devices and \
+more to gain and retain the authorization and encryption keys required to \
+perform secure operations."
+HOMEPAGE = "https://people.redhat.com/~dhowells/keyutils/"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_lib${PN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
+                    file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
+
+SRC_URI = "https://people.redhat.com/~dhowells/keyutils/${BP}.tar.bz2 \
+           file://0001-Include-limits.h-for-UINT_MAX.patch"
+SRC_URI[md5sum] = "7f8ac985c45086b5fbcd12cecd23cf07"
+SRC_URI[sha256sum] = "4da2c5552c688b65ab14d4fd40fbdf720c8b396d8ece643e040cf6e707e083ae"
+
+EXTRA_OEMAKE = " \
+    DESTDIR=${D} \
+    ETCDIR=${sysconfdir} \
+    BINDIR=${bindir} \
+    SBINDIR=${sbindir} \
+    SHAREDIR=${datadir}/${BPN} \
+    MANDIR=${mandir} \
+    INCLUDEDIR=${includedir} \
+    LIBDIR=${base_libdir} \
+    USRLIBDIR=${libdir} \
+    BUILDFOR= \
+"
+
+do_install() {
+    oe_runmake install
+}
+
+PACKAGES =+ "lib${PN}"
+
+FILES_lib${PN} = "${base_libdir}/lib*${SOLIBS}"
-- 
2.7.4


