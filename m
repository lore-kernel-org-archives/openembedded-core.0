Return-Path: <stephen.arnold42@gmail.com>
Received: from gatekeeper.gentoogeek.org (gatekeeper.gentoogeek.org
	[66.159.242.209])
	by mail.openembedded.org (Postfix) with ESMTP id 000C1606CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 20:20:39 +0000 (UTC)
Received: from prime.arnolds.bogus (prime.arnolds.bogus [192.168.0.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by gatekeeper.gentoogeek.org (Postfix) with ESMTPS id B119F2125
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 12:20:39 -0800 (PST)
Received: from ptolemy.arnolds.bogus (ptolemy.arnolds.bogus
	[::ffff:192.168.0.11])
	by prime.arnolds.bogus with ESMTP; Sun, 12 Feb 2017 12:20:38 -0800
	id 0000000000241F7D.58A0C397.00000B41
From: Stephen Arnold <sarnold@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Feb 2017 12:20:35 -0800
Message-Id: <20170212202035.26659-1-sarnold@vctlabs.com>
X-Mailer: git-send-email 2.11.1
Subject: [meta-oe][PATCH v2] gcc-6.2: Add fix for missing no-PIE flags
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
X-List-Received-Date: Sun, 12 Feb 2017 20:20:46 -0000

From: Stephen Arnold <stephen.arnold42@gmail.com>

Fixes build on hardened PAX host with gcc-5 (linker error on relocs).
Completes no-PIE config by adding to ALL_* flags variables.
Borrowed from Gentoo gcc patches, tested on 2 hardened amd64 hosts.

Upstream-Status: Inappropriate [configuration]

Commited by: Gentoo Toolchain Project <toolchain@gentoo.org>
Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.2.inc                   |  1 +
 .../gcc/gcc-6.2/0054_all_nopie-all-flags.patch          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
index b118995e1d..1a50d3a0d4 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0054_all_nopie-all-flags.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch b/meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch
new file mode 100644
index 0000000000..0e103cb1ee
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch
@@ -0,0 +1,17 @@
+We need to pass NO_PIE_CFLAGS to ALL_* so gcc doesn't fail when
+we compile it with older gcc and pie.
+
+--- a/gcc/Makefile.in	2015-06-25 19:18:12.000000000 +0200
++++ b/gcc/Makefile.in	2016-04-22 00:12:54.029178860 +0200
+@@ -991,10 +991,10 @@ ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@)
+ ALL_CPPFLAGS = $(INCLUDES) $(CPPFLAGS)
+
+ # This is the variable to use when using $(COMPILER).
+-ALL_COMPILERFLAGS = $(ALL_CXXFLAGS)
++ALL_COMPILERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
+
+ # This is the variable to use when using $(LINKER).
+-ALL_LINKERFLAGS = $(ALL_CXXFLAGS)
++ALL_LINKERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
+
+ # Build and host support libraries.
-- 
2.11.1


