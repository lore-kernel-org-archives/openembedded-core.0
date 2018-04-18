Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 97CFF72ED7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 17:51:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3IHpL6J015476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 18 Apr 2018 18:51:22 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f8rEn-0005Pk-Lz; Wed, 18 Apr 2018 18:51:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2018 18:51:19 +0100
Message-Id: <1524073879-20772-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH] uninative: Set the dynamic linker to use at compile time
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
X-List-Received-Date: Wed, 18 Apr 2018 17:51:23 -0000

Its possible some dynamic runtime library in the dependency chain may
come from sstate and link to libraries which need the libc from
uninative. If we don't do this and binaries are run at do_install time
they would fail to find the symbols from the later libc. Examples:

cmake-native do_install:
bin/cmake: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not found (required by TOPDIR/tmp/work/x86_64-linux/cmake-native/3.10.3-r0/recipe-sysroot-native/usr/lib/libexpat.so.1)

dbus-native do_install:
tmp/work/x86_64-linux/dbus-native/1.12.2-r0/build/bus/.libs/lt-dbus-daemon: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not found (required by /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x32/build/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/lib/libexpat.so.1)

This issue is resolved when the interpreter is changed at sstate unpack
time but this isn't soon enough to avoid issues at compile/install time.

By specifing which dynamic linker/loader to use at compile time, this
race window is removed entirely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 23c5314..de2221a 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -129,8 +129,9 @@ def enable_uninative(d):
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
-        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined")
-        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined")
+        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
+        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
+        d.appendVarFlag("BUILD_LDFLAGS", "vardepsexclude", "UNINATIVE_LOADER")
         d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
 python uninative_changeinterp () {
-- 
2.7.4


