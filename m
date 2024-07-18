Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C17C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 23:28:10 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.7353.1721345287440503767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 16:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46INS2Pl018611;
	Thu, 18 Jul 2024 18:28:04 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v2 4/4] selftest-hardlink: Add additional test cases
Date: Thu, 18 Jul 2024 18:28:02 -0500
Message-Id: <1721345282-10901-5-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202241

From: Mark Hatle <mark.hatle@amd.com>

Additional test cases for debug symlink generation both binaries
and static libraries.

This also has the side effect of testing for race conditions in the
hardlink debug generation and stripping.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../selftest-hardlink/selftest-hardlink.bb         | 13 ++++++++++++
 meta/lib/oeqa/selftest/cases/package.py            | 24 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index 5632bda..64fea8e 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -11,6 +11,9 @@ UNPACKDIR = "${S}"
 
 do_compile () {
 	${CC} hello.c -o hello1 ${CFLAGS} ${LDFLAGS}
+
+	${CC} hello.c -c -o hello.o ${CFLAGS}
+	${AR} rcs libhello.a hello.o
 }
 
 do_install () {
@@ -23,9 +26,19 @@ do_install () {
 	ln ${D}${bindir}/hello1 ${D}${libexecdir}/hello3
 	ln ${D}${bindir}/hello1 ${D}${libexecdir}/hello4
 
+	# We need so many hardlink copies to look for specific race conditions
+	install -d ${D}${libdir}
+	install -m 0644 libhello.a ${D}${libdir}
+	for num in `seq 1 100` ; do
+		ln ${D}${libdir}/libhello.a ${D}${libdir}/libhello-${num}.a
+	done
+
 	dd if=/dev/zero of=${D}${bindir}/sparsetest bs=1 count=0 seek=1M
 }
 
 RDEPENDS:${PN}-gdb += "gdb"
 PACKAGES =+ "${PN}-gdb"
 FILES:${PN}-gdb = "${bindir}/gdb.sh"
+
+PACKAGE_STRIP_STATIC = "1"
+PACKAGE_DEBUG_STATIC_SPLIT = "1"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 1aa6c03..71231f5 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -103,11 +103,35 @@ class PackageTests(OESelftestTestCase):
 
         dest = get_bb_var('PKGDEST', 'selftest-hardlink')
         bindir = get_bb_var('bindir', 'selftest-hardlink')
+        libdir = get_bb_var('libdir', 'selftest-hardlink')
+        libexecdir = get_bb_var('libexecdir', 'selftest-hardlink')
 
         def checkfiles():
             # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
             # so expect 8 in total.
             self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello1").st_nlink, 8)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink" + libexecdir + "/hello3").st_nlink, 8)
+
+            # Check dbg version
+            # 4 items, a copy in both package/packages-split so 8
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + bindir + "/.debug/hello1").st_nlink, 8)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + bindir + "/.debug/hello2").st_nlink, 8)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libexecdir + "/.debug/hello3").st_nlink, 8)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libexecdir + "/.debug/hello4").st_nlink, 8)
+
+            # Check the staticdev libraries
+            # 101 items, a copy in both package/packages-split so 202
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello-25.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello-50.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-staticdev" + libdir + "/libhello-75.a").st_nlink, 202)
+
+            # Check static dbg
+            # 101 items, a copy in both package/packages-split so 202
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello-25.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello-50.a").st_nlink, 202)
+            self.assertEqual(os.stat(dest + "/selftest-hardlink-dbg" + libdir + "/.debug-static/libhello-75.a").st_nlink, 202)
 
             # Test a sparse file remains sparse
             sparsestat = os.stat(dest + "/selftest-hardlink" + bindir + "/sparsetest")
-- 
1.8.3.1


