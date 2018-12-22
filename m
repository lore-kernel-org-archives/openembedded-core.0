Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0E2779E9B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 22:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8B34F18420
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:35 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kObSvQePBWM1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:35 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E879318408
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:34 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D52861A05F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:34 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA24C1A05E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:34 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:34 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BEBE33123
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:34 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wBMMDY32003821
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 23:13:34 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wBMMDYdh003820
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2018 23:13:34 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Dec 2018 23:13:22 +0100
Message-Id: <20181222221322.3768-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181222221322.3768-1-pkj@axis.com>
References: <20181222221322.3768-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [thud][PATCH 2/2] meson: Correct use of the _append operator
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
X-List-Received-Date: Sat, 22 Dec 2018 22:13:35 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The value to SRC_URI_append_class-native was not prefixed with a space.
This was not noticed as the SRC_URI before applying the _append contains
trailing spaces. However, if one, e.g., has a .bbappend and adds to the
SRC_URI using SRC_URI += "file://foo.patch", then there no longer is any
trailing space and the _append concatenates the two URIs together,
leading to a build failue.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

This is a backport from master.

 meta/recipes-devtools/meson/meson.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index b7fb3e698a..40b29d5802 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,9 +15,10 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
 SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
 
-SRC_URI_append_class-native = "file://0002-Make-CPU-family-warnings-fatal.patch \
-                               file://0001-Support-building-allarch-recipes-again.patch \
-                               "
+SRC_URI_append_class-native = " \
+    file://0002-Make-CPU-family-warnings-fatal.patch \
+    file://0001-Support-building-allarch-recipes-again.patch \
+"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
-- 
2.12.0


