Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TKEA9-0000fm-Ca
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:06:21 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id F3A052FD12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 15:53:07 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:48 -0700
Message-Id: <c15fae372cf75403facc28cf76f973b1279425dd.1349466569.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: F3A052FD12.91DB9
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 6/6] openssl: add deprecated and unmaintained find.pl from perl-5.14 to fix perlpath.pl
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
X-List-Received-Date: Fri, 05 Oct 2012 20:06:21 -0000

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
 .../openssl/openssl-1.0.0i/find.pl                 |   54 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    7 ++-
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
1.7.9.5



