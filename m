Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 050C26110F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 19:46:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01IJkZ1w009162
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 11:46:36 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 18 Feb 2020 11:46:35 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 14:46:49 -0500
Message-ID: <87pnebadau.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [PATCH v2] glib-2.0: add dependencies to fix ptest failures
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
X-List-Received-Date: Tue, 18 Feb 2020 19:46:35 -0000
Content-Type: text/plain

There are a number of ptest failures due to executables not found in
the image. Since these executables are in FILES_${PN}-dev, depending
all of -dev which is an overkill. We take them out of -dev and put in
-utils, then depend on the latter instead.

When starting a glib ptest but decided to Ctrl-c interrupt midway,
./run-ptest cannot be restarted unless running `userdel glib2-test`
manually. Therefore adding a check prior to ptest will ensure the
ptest can be restarted.

Signed-off-by: Matthew Zeng <matthew.zeng@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest |  3 +++
 meta/recipes-core/glib-2.0/glib.inc           | 12 ++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index fc50082c8e..7a231b514b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,6 +1,9 @@
 #! /bin/sh

 set -eux
+if id -u glib2-test; then
+   userdel glib2-test
+fi
 useradd glib2-test
 su glib2-test -c 'gnome-desktop-testing-runner glib'
 userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f4aff297e5..23c347dbf7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -58,13 +58,15 @@ FILES_${PN} = "${libdir}/lib*${SOLIBS} \
                ${libdir}/gio \
                ${libexecdir}/*gio-querymodules \
                ${datadir}/glib-2.0/schemas"
+
+FILES_${PN}-utils += "${bindir}/glib-genmarshal \
+                      ${bindir}/glib-gettextize \
+                      ${bindir}/glib-mkenums \
+                      ${bindir}/glib-compile-resources"
+
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la \
-                    ${bindir}/glib-genmarshal \
-                    ${bindir}/glib-gettextize \
-                    ${bindir}/glib-mkenums \
-                    ${bindir}/glib-compile-resources \
                     ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
                     ${datadir}/glib-2.0/schemas/gschema.dtd \
                     ${datadir}/glib-2.0/valgrind/glib.supp \
@@ -138,6 +140,8 @@ CODEGEN_PYTHON_RDEPENDS_mingw32 = ""

 RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"

+RDEPENDS_${PN}-ptest += "${PN}-utils"
+
 RDEPENDS_${PN}-ptest += "\
             coreutils \
             libgcc \
--
2.24.0

