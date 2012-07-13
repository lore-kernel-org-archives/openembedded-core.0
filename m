Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SpmzI-0002Ef-IB
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 23:01:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6DKo4gm027294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 13:50:04 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 13 Jul 2012 13:50:03 -0700
Message-ID: <500089F4.9010607@windriver.com>
Date: Fri, 13 Jul 2012 16:49:56 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.147.210]
Subject: [PATCH] dbus-glib: support unit tests compile and install
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
X-List-Received-Date: Fri, 13 Jul 2012 21:01:21 -0000
Content-Type: multipart/alternative;
	boundary="------------060807090506060607050706"

--------------060807090506060607050706
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

test-service-glib-include-glib-only.patch: fixes the compiling failure
that test-service-glib.c includes glib/gquark.h not glib.h directly.

test-install-makefile.patch: install unit tests for test purpose

dbus-glib.inc: default turn off unit test as libdbus-glib-1.so.2.2.2 will
have unit test code if DBUS_BUILD_TESTS enabled.

Add tests and tests-dbg package.

Signed-off-by: Yao Zhao<yao.zhao@windriver.com>
---
  .../dbus-glib-0.98/test-install-makefile.patch     |   42 ++++++++++++++++++++
  .../test-service-glib-include-glib-only.patch      |   13 ++++++
  meta/recipes-core/dbus/dbus-glib.inc               |   15 ++++++-
  3 files changed, 68 insertions(+), 2 deletions(-)
  create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
  create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch

diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
new file mode 100644
index 0000000..2a085ec
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
@@ -0,0 +1,42 @@
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 7ba11a8..e1e56fd 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -13,7 +13,8 @@ else
+ TEST_BINARIES=
+ endif
+
+-noinst_PROGRAMS= $(TEST_BINARIES)
++testdir =/opt/@PACKAGE@-tests
++test_PROGRAMS= $(TEST_BINARIES)
+
+ test_service_SOURCES=				\
+ 	test-service.c
+diff --git a/test/core/Makefile.am b/test/core/Makefile.am
+index ef6cb26..3bef634 100644
+--- a/test/core/Makefile.am
++++ b/test/core/Makefile.am
+@@ -46,7 +46,8 @@ endif
+
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = \
++testdir =/opt/@PACKAGE@-tests/core
++test_PROGRAMS = \
+ 	test-dbus-glib \
+ 	test-service-glib \
+ 	$(THREAD_APPS) \
+diff --git a/test/interfaces/Makefile.am b/test/interfaces/Makefile.am
+index 3cb2c39..8ea9c4e 100644
+--- a/test/interfaces/Makefile.am
++++ b/test/interfaces/Makefile.am
+@@ -39,7 +39,8 @@ if DBUS_BUILD_TESTS
+
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = test-service test-client
++testdir =/opt/@PACKAGE@-tests/interfaces
++test_PROGRAMS = test-service test-client
+
+ test_service_SOURCES = \
+ 	test-interfaces.c \
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
index da2845a..6e116d2 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -11,15 +11,20 @@ DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
  DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
  
  SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
-file://no-examples.patch"
+file://no-examples.patch  \
+file://test-service-glib-include-glib-only.patch  \
+file://test-install-makefile.patch  \
+"
  
  inherit autotools pkgconfig gettext
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tests] = "--enable-tests,,,"
  
  EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
                  --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
  EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
  
-PACKAGES += "${PN}-bash-completion"
+PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
  
  FILES_${PN} = "${libdir}/lib*${SOLIBS}"
  FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
@@ -27,4 +32,10 @@ FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-complet
  FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
  FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
  
+RDEPENDS_${PN}-tests += "dbus-x11"
+FILES_${PN}-tests = "/opt/${PN}-tests"
+FILES_${PN}-tests-dbg = "/opt/${PN}-tests/.debug/* \
+/opt/${PN}-tests/core/.debug/* \
+/opt/${PN}-tests/interfaces/.debug/*"
+
  BBCLASSEXTEND = "native"
-- 1.7.9.5


--------------060807090506060607050706
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <pre wrap="">test-service-glib-include-glib-only.patch: fixes the compiling failure
that test-service-glib.c includes glib/gquark.h not glib.h directly.

test-install-makefile.patch: install unit tests for test purpose

dbus-glib.inc: default turn off unit test as libdbus-glib-1.so.2.2.2 will
have unit test code if DBUS_BUILD_TESTS enabled.

Add tests and tests-dbg package.

Signed-off-by: Yao Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yao.zhao@windriver.com">&lt;yao.zhao@windriver.com&gt;</a>
---
 .../dbus-glib-0.98/test-install-makefile.patch     |   42 ++++++++++++++++++++
 .../test-service-glib-include-glib-only.patch      |   13 ++++++
 meta/recipes-core/dbus/dbus-glib.inc               |   15 ++++++-
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch

diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
new file mode 100644
index 0000000..2a085ec
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib-0.98/test-install-makefile.patch
@@ -0,0 +1,42 @@
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 7ba11a8..e1e56fd 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -13,7 +13,8 @@ else
+ TEST_BINARIES=
+ endif
+ 
+-noinst_PROGRAMS= $(TEST_BINARIES)
++testdir = <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>@PACKAGE@-tests
++test_PROGRAMS= $(TEST_BINARIES)
+ 
+ test_service_SOURCES=				\
+ 	test-service.c
+diff --git a/test/core/Makefile.am b/test/core/Makefile.am
+index ef6cb26..3bef634 100644
+--- a/test/core/Makefile.am
++++ b/test/core/Makefile.am
+@@ -46,7 +46,8 @@ endif
+ 
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = \
++testdir = <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>@PACKAGE@-tests/core
++test_PROGRAMS = \
+ 	test-dbus-glib \
+ 	test-service-glib \
+ 	$(THREAD_APPS) \
+diff --git a/test/interfaces/Makefile.am b/test/interfaces/Makefile.am
+index 3cb2c39..8ea9c4e 100644
+--- a/test/interfaces/Makefile.am
++++ b/test/interfaces/Makefile.am
+@@ -39,7 +39,8 @@ if DBUS_BUILD_TESTS
+ 
+ ## we use noinst_PROGRAMS not check_PROGRAMS for TESTS so that we
+ ## build even when not doing "make check"
+-noinst_PROGRAMS = test-service test-client
++testdir = <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>@PACKAGE@-tests/interfaces
++test_PROGRAMS = test-service test-client
+ 
+ test_service_SOURCES = \
+ 	test-interfaces.c \
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
+ #include &lt;string.h&gt;
+ #include &lt;glib/gi18n.h&gt;
+ #include &lt;glib-object.h&gt;
+-#include &lt;glib/gquark.h&gt;
++#include &lt;glib.h&gt;
+ 
+ #include "my-object.h"
+ #include "my-object-subclass.h"
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index da2845a..6e116d2 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -11,15 +11,20 @@ DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
 
 SRC_URI = "<a class="moz-txt-link-freetext" href="http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-$">http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-$</a>{PV}.tar.gz \
-           <a class="moz-txt-link-freetext" href="file://no-examples.patch">file://no-examples.patch</a>"
+           <a class="moz-txt-link-freetext" href="file://no-examples.patch">file://no-examples.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://test-service-glib-include-glib-only.patch">file://test-service-glib-include-glib-only.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://test-install-makefile.patch">file://test-install-makefile.patch</a> \
+"
 
 inherit autotools pkgconfig gettext
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
@@ -27,4 +32,10 @@ FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-complet
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
+RDEPENDS_${PN}-tests += "dbus-x11"
+FILES_${PN}-tests = "<i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>${PN}-tests"
+FILES_${PN}-tests-dbg = "<i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>${PN}-tests/.debug/* \
+                         <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>${PN}-tests/core/.debug/* \
+                         <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>opt<span class="moz-txt-tag">/</span></i>${PN}-tests/interfaces/.debug/*"
+
 BBCLASSEXTEND = "native"
<div class="moz-txt-sig">-- 
1.7.9.5

</div></pre>
  </body>
</html>

--------------060807090506060607050706--
