Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 38F69607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 11:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6DB5Dcf025140 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 12:05:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id klbMlGHI14Vg
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 12:05:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6DB4wF8025131
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 12:05:09 +0100
Message-ID: <1436785492.3310.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 12:04:52 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: dpkg: Fix for Fedora22
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
X-List-Received-Date: Mon, 13 Jul 2015 11:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Yes, they managed to break tar. Again.

The addition of:
http://git.savannah.gnu.org/cgit/tar.git/commit/?id=163e96a0e619a900eab6de827c7c5749ecc9d3f2
("Bugfix: entries read from the -T file did not get proper matching_flag.")
means that the no-recursion option gets lost. This leads to many files getting included
multiple times, along with files which shouldn't be there.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7988

Moving the --no-reursion option to earlier in the command avoids the bug.

The bug was not present in tar 1.28 however it has been backported in at least
Fedora 22.

[YOCTO #7988]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/dpkg/dpkg/tarfix.patch b/meta/recipes-devtools/dpkg/dpkg/tarfix.patch
new file mode 100644
index 0000000..c343742
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/tarfix.patch
@@ -0,0 +1,32 @@
+Yes, they managed to break tar. Again.
+
+The addition of:
+http://git.savannah.gnu.org/cgit/tar.git/commit/?id=163e96a0e619a900eab6de827c7c5749ecc9d3f2
+("Bugfix: entries read from the -T file did not get proper matching_flag.")
+means that the no-recursion option gets lost. This leads to many files getting included
+multiple times, along with files which shouldn't be there.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=7988
+
+Moving the --no-reursion option to earlier in the command avoids the bug.
+
+The bug was not present in tar 1.28 however it has been backported in at least 
+Fedora 22.
+
+RP
+2015/7/13
+
+
+Index: dpkg-1.17.25/dpkg-deb/build.c
+===================================================================
+--- dpkg-1.17.25.orig/dpkg-deb/build.c
++++ dpkg-1.17.25/dpkg-deb/build.c
+@@ -560,7 +560,7 @@ do_build(const char *const *argv)
+     if (chdir(dir))
+       ohshite(_("failed to chdir to `%.255s'"), dir);
+     execlp(TAR, "tar", "-cf", "-", "--format=gnu", "--null", "--no-unquote",
+-                       "-T", "-", "--no-recursion", NULL);
++                       "--no-recursion", "-T", "-", NULL);
+     ohshite(_("unable to execute %s (%s)"), "tar -cf", TAR);
+   }
+   close(p1[0]);
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
index 74b1dd0..1969eff 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://noman.patch \
             file://glibc2.5-sync_file_range.patch \
             file://no-vla-warning.patch \
             file://add_armeb_triplet_entry.patch \
+            file://tarfix.patch \
            "
 
 SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"



