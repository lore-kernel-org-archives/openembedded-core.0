Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TJGic-0006AQ-EN
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 06:37:58 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBA0068US4D47V1@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 22:24:29 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CD4712018B; Tue,
	02 Oct 2012 23:24:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 02 Oct 2012 23:24:10 -0400
Message-id: <1349234650-21648-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.12
In-reply-to: <1349234650-21648-1-git-send-email-denis@denix.org>
References: <1349234650-21648-1-git-send-email-denis@denix.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH][denzil] openssl: add deprecated and unmaintained find.pl from perl-5.14 to fix perlpath.pl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 04:37:58 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
*
* is using perlpath.pl:
*
*   do_configure () {
*           cd util
*           perl perlpath.pl ${STAGING_BINDIR_NATIVE}
*   ...
*
* and perlpath.pl is using find.pl:
* openssl-1.0.0i/util/perlpath.pl:
*   #!/usr/local/bin/perl
*   #
*   # modify the '#!/usr/local/bin/perl'
*   # line in all scripts that rely on perl.
*   #
*
*   require "find.pl";
*   ...
*
* which was removed in perl-5.16.0 and marked as deprecated and
* unmaintained in 5.14 and older:
* /tmp/usr/lib/perl5/5.14.2/find.pl:
*   warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl
*   core distribution in the next major release. Please install it from the
*   CPAN distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]},
*   line @{[(caller)[2]]}.\n";
*
*   # This library is deprecated and unmaintained. It is included for
*   # compatibility with Perl 4 scripts which may use it, but it will be
*   # removed in a future version of Perl. Please use the File::Find module
*   # instead.

(from OE-Core rev c09bf5d177a7ecd2045ef7e13fff4528137a9775)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../openssl/openssl-1.0.0i/find.pl                 | 54 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |  7 ++-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl
new file mode 100644
index 0000000..8e1b42c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl
@@ -0,0 +1,54 @@
+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl core distribution in the next major release. Please install it from the CPAN distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{[(caller)[2]]}.\n";
+
+# This library is deprecated and unmaintained. It is included for
+# compatibility with Perl 4 scripts which may use it, but it will be
+# removed in a future version of Perl. Please use the File::Find module
+# instead.
+
+# Usage:
+#	require "find.pl";
+#
+#	&find('/foo','/bar');
+#
+#	sub wanted { ... }
+#		where wanted does whatever you want.  $dir contains the
+#		current directory name, and $_ the current filename within
+#		that directory.  $name contains "$dir/$_".  You are cd'ed
+#		to $dir when the function is called.  The function may
+#		set $prune to prune the tree.
+#
+# For example,
+#
+#   find / -name .nfs\* -mtime +7 -exec rm -f {} \; -o -fstype nfs -prune
+#
+# corresponds to this
+#
+#	sub wanted {
+#	    /^\.nfs.*$/ &&
+#	    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) &&
+#	    int(-M _) > 7 &&
+#	    unlink($_)
+#	    ||
+#	    ($nlink || (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_))) &&
+#	    $dev < 0 &&
+#	    ($prune = 1);
+#	}
+#
+# Set the variable $dont_use_nlink if you're using AFS, since AFS cheats.
+
+use File::Find ();
+
+*name		= *File::Find::name;
+*prune		= *File::Find::prune;
+*dir		= *File::Find::dir;
+*topdir		= *File::Find::topdir;
+*topdev		= *File::Find::topdev;
+*topino		= *File::Find::topino;
+*topmode	= *File::Find::topmode;
+*topnlink	= *File::Find::topnlink;
+
+sub find {
+    &File::Find::find(\&wanted, @_);
+}
+
+1;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
index ca15a38..c233ba1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -29,6 +29,7 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/no-symbolic.patch \
             file://debian/debian-targets.patch \
             file://openssl_fix_for_x32.patch \
+            file://find.pl \
            "
 
 SRC_URI[md5sum] = "b4df9c11af454fd68178c85a1d5f328f"
@@ -43,3 +44,7 @@ FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 
 PARALLEL_MAKEINST = ""
+
+do_configure_prepend() {
+  cp ${WORKDIR}/find.pl ${S}/util/find.pl
+}
-- 
1.7.12



