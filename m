Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD7506AC3E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 08:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2S8oenY005926 for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 08:50:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EYHSl8LsoED1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 08:50:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2S8oRhk005915
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 08:50:39 GMT
Message-ID: <1427532627.14020.217.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 28 Mar 2015 08:50:27 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] dpkg-native: Avoid 'file changed' errors from tar
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
X-List-Received-Date: Sat, 28 Mar 2015 08:50:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See the patch header for details. Hardlink count duing do_package_write_deb
can change causing dpkg-deb failures. We don't care about this error
case so avoid it by checking the tar exit code.

[YOCTO #7529]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index bbbd881..5db1fde 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,6 +4,8 @@ SECTION = "base"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
 
+SRC_URI_append_class-native = " file://tar-error-code.patch"
+
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
diff --git a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch b/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
new file mode 100644
index 0000000..f49e0e9
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
@@ -0,0 +1,54 @@
+When running do_package_write_deb, we have trees of symlinked files
+such as the dbg source files in ${PN}-dbg. If something makes another
+copy of one of those files (or deletes one), the number of links a file
+has changes and tar can notice this, e.g.:
+
+| DEBUG: Executing python function do_package_deb
+| dpkg-deb: building package `sed-ptest' in `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
+| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
+| dpkg-deb: error: subprocess tar -cf returned error exit status 1
+
+Tar returns an error of 1 when files 'change' and other errors codes
+in other error cases. We tweak dpkg-deb here so that it ignores an exit
+code of 1 from tar. The files don't really change (and we have locking in
+place to avoid that kind of issue).
+
+Upsteam-Status: Inappropriate
+RP 2015/3/27
+
+Index: dpkg-1.17.21/dpkg-deb/build.c
+===================================================================
+--- dpkg-1.17.21.orig/dpkg-deb/build.c
++++ dpkg-1.17.21/dpkg-deb/build.c
+@@ -398,7 +398,7 @@ do_build(const char *const *argv)
+   bool subdir;
+   char *tfbuf;
+   int arfd;
+-  int p1[2], p2[2], gzfd;
++  int p1[2], p2[2], gzfd, rc;
+   pid_t c1, c2;
+ 
+   /* Decode our arguments. */
+@@ -493,7 +493,9 @@ do_build(const char *const *argv)
+   }
+   close(p1[0]);
+   subproc_reap(c2, "gzip -9c", 0);
+-  subproc_reap(c1, "tar -cf", 0);
++  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
++  if (rc && rc != 1)
++    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
+ 
+   if (lseek(gzfd, 0, SEEK_SET))
+     ohshite(_("failed to rewind temporary file (%s)"), _("control member"));
+@@ -581,7 +583,10 @@ do_build(const char *const *argv)
+   /* All done, clean up wait for tar and gzip to finish their job. */
+   close(p1[1]);
+   subproc_reap(c2, _("<compress> from tar -cf"), 0);
+-  subproc_reap(c1, "tar -cf", 0);
++  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
++  if (rc && rc != 1)
++    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
++
+   /* Okay, we have data.tar as well now, add it to the ar wrapper. */
+   if (deb_format.major == 2) {
+     char datamember[16 + 1];



