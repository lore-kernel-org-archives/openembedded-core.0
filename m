Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15BAF7833D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 35B501842D;
	Tue, 29 Aug 2017 23:21:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sRhoWRtoNAK2; Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E7C191843D;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D420A1E095;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C92F61E094;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BDA162198;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLf51030223;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLfRX030222;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:06 +0200
Message-Id: <20d7dea04163e4256c9e0aa895878b8bc466edc2.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 10/25] rpm: Simplify the creation of wrappers for the native tools
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:47 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Use a loop rather than calling create_wrapper for each individual
tool.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 73 ++++++++++--------------------------
 1 file changed, 19 insertions(+), 54 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 2310ee6b09..531669ae73 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -67,62 +67,27 @@ BBCLASSEXTEND = "native nativesdk"
 # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
 # libmagic also has sysroot path contamination, so override it
 do_install_append_class-native() {
-        create_wrapper ${D}/${bindir}/rpmbuild \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpmsign \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpmkeys \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpm \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpm2archive \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpm2cpio \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpmdb \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpmgraph \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-
-        create_wrapper ${D}/${bindir}/rpmspec \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
+        tools="\
+                ${bindir}/rpm \
+                ${bindir}/rpm2archive \
+                ${bindir}/rpm2cpio \
+                ${bindir}/rpmbuild \
+                ${bindir}/rpmdb \
+                ${bindir}/rpmgraph \
+                ${bindir}/rpmkeys \
+                ${bindir}/rpmsign \
+                ${bindir}/rpmspec \
+        "
+
+        for tool in $tools; do
+                create_wrapper ${D}$tool \
+                        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                        RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                        MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                        RPM_NO_CHROOT_FOR_SCRIPTS=1
+        done
 }
 
-
 # Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install_append_class-target() {
     rm -rf ${D}/var
-- 
2.12.0


