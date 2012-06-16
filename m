Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfmtP-0007Yz-Pk
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 08:53:55 +0200
Received: by wibhm14 with SMTP id hm14so160825wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 23:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=f0BhBVPjog4ytPkD8E5r/EfGSOWoH1k9OZCbOp+5MWo=;
	b=p8yNLsrYKE09jiMgmDsg+1VREX2Z1plxsAk7AFX5z5UEo/SYW4NRCdTMLWUiQlq0C5
	HcTYkPYlCFM3NAPSP8xH0+z525/efW29M7Ja9yxWGqhgBKcXqLkGMRqXVBanN83SHys3
	ApYdjd7eJ9q6KuzT9r6SJ7XpFQ5sANOH8IVsmP02Axpr+4hKLSG+NnJdfUdDi5Ewdh44
	Y8QwDM8/KFnulBgoaNBHGPZXI8w3kutWF4D9v2QgYDmMf03r88tT934iTrgrhRZaBI8z
	bim4/HLteaAuEDbyAdOwdbDCcaz0ZZcwW8C0QfO1Tl/ntUYm1++lqYZ8EqKoxrG+rt3p
	xmsQ==
Received: by 10.216.228.224 with SMTP id f74mr4538809weq.217.1339828996532;
	Fri, 15 Jun 2012 23:43:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm14461143wiz.9.2012.06.15.23.43.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 23:43:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 08:43:35 +0200
Message-Id: <1339829015-22320-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120615203949.GY3140@jama.jama.net>
References: <20120615203949.GY3140@jama.jama.net>
Subject: [PATCH] openssl: add deprecated and unmaintained find.pl from perl-5.14 to fix perlpath.pl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jun 2012 06:53:55 -0000

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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../openssl/openssl-1.0.0i/find.pl                 |   54 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    7 ++-
 2 files changed, 60 insertions(+), 1 deletions(-)
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
1.7.8.6



