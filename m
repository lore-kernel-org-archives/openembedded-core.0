Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD7B6059E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CDAAE183AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UKaTwPwK0Hhi
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 32C4618378
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 194B61A08C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EAB91A088
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 032461B68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:40 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w1KDGb2Z003351
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:16:37 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w1KDGbYE003350
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Feb 2018 14:16:37 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 14:16:34 +0100
Message-Id: <20180220131634.3307-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] meson.bbclass: Add support for nativesdk
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
X-List-Received-Date: Tue, 20 Feb 2018 13:16:40 -0000

We need to use the meson.cross file when building for nativesdk.
Additionally, we need to trick meson's sanity tests, just as it is
done for target builds.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I have not tested this extensively, but it at least seems to build
things correctly.

 meta/classes/meson.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index cd3497a802..31d32a56f6 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -39,6 +39,7 @@ EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
+MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
 CCOMPILER ?= "gcc"
 CXXCOMPILER ?= "g++"
@@ -105,6 +106,18 @@ meson_do_configure_prepend_class-target() {
     export AR="${BUILD_AR}"
 }
 
+meson_do_configure_prepend_class-nativesdk() {
+    # Set these so that meson uses the native tools for its build sanity tests,
+    # which require executables to be runnable. The cross file will still
+    # override these for the nativesdk build. Note that we do *not* set CFLAGS,
+    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
+    # nativesdk build, causing errors.
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+    export LD="${BUILD_LD}"
+    export AR="${BUILD_AR}"
+}
+
 meson_do_configure_prepend_class-native() {
     export PKG_CONFIG="pkg-config-native"
 }
-- 
2.12.0


