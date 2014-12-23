Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BE75E72653
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 17:36:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2014 09:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,633,1413270000"; d="scan'208";a="642017607"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.60])
	([10.219.4.60])
	by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2014 09:36:26 -0800
Message-ID: <5499A838.3040809@linux.intel.com>
Date: Tue, 23 Dec 2014 11:36:56 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1416863791-24345-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1416863791-24345-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH] dpkg: Upgrade to 1.17.21
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
X-List-Received-Date: Tue, 23 Dec 2014 17:36:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Any update?

     alimon

On 24/11/14 15:16, Aníbal Limón wrote:
> Remove dpkg-1.17.4-CVE-2014-0471, dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127 and
> ignore_extra_fields patches that are already in upstream.
>
> Rebase no-vla-warning patch.
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   meta/recipes-devtools/dpkg/dpkg.inc                |  3 +-
>   .../dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch  | 68 ---------------
>   .../dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch      | 97 ----------------------
>   .../dpkg/dpkg/ignore_extra_fields.patch            | 21 -----
>   .../dpkg/dpkg/no-vla-warning.patch                 | 24 +++---
>   meta/recipes-devtools/dpkg/dpkg_1.17.21.bb         | 19 +++++
>   meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          | 21 -----
>   7 files changed, 32 insertions(+), 221 deletions(-)
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
>   create mode 100644 meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index 929906d..c3c51eb 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -2,8 +2,7 @@ SUMMARY = "Package maintenance system from Debian"
>   LICENSE = "GPLv2.0+"
>   SECTION = "base"
>   
> -SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
> -           file://ignore_extra_fields.patch"
> +SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
>   
>   DEPENDS = "zlib bzip2 perl ncurses"
>   DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
> diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
> deleted file mode 100644
> index e59c666..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -dpkg: Security Advisory - CVE-2014-3127
> -
> -commit a12eb58959d0a10584a428f4a3103a49204c410f upstream
> -
> -dpkg 1.15.9 on Debian squeeze introduces support for the "C-style
> -encoded filenames" feature without recognizing that the squeeze patch
> -program lacks this feature, which triggers an interaction error that
> -allows remote attackers to conduct directory traversal attacks and
> -modify files outside of the intended directories via a crafted source
> -package.
> -
> -NOTE: this can be considered a release engineering problem in the
> -effort to fix CVE-2014-0471.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> -=====================================================
> -diff -uarN dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm
> ---- dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm	2014-06-05 16:32:41.765446564 +0800
> -+++ dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm	2014-06-05 16:37:21.461446359 +0800
> -@@ -324,31 +324,6 @@
> -     return $line;
> - }
> -
> --my %ESCAPE = ((
> --    'a' => "\a",
> --    'b' => "\b",
> --    'f' => "\f",
> --    'n' => "\n",
> --    'r' => "\r",
> --    't' => "\t",
> --    'v' => "\cK",
> --    '\\' => '\\',
> --    '"' => '"',
> --), (
> --    map { sprintf('%03o', $_) => chr($_) } (0..255)
> --));
> --
> --sub _unescape {
> --    my ($diff, $str) = @_;
> --
> --    if (exists $ESCAPE{$str}) {
> --        return $ESCAPE{$str};
> --    } else {
> --        error(_g('diff %s patches file with unknown escape sequence \\%s'),
> --              $diff, $str);
> --    }
> --}
> --
> - # Fetch the header filename ignoring the optional timestamp
> - sub _fetch_filename {
> -     my ($diff, $header) = @_;
> -@@ -358,12 +333,7 @@
> -
> -     # Is it a C-style string?
> -     if ($header =~ m/^"/) {
> --        $header =~ m/^"((?:[^\\"]|\\.)*)"/;
> --        error(_g('diff %s patches file with unbalanced quote'), $diff)
> --            unless defined $1;
> --
> --        $header = $1;
> --        $header =~ s/\\([0-3][0-7]{2}|.)/_unescape($diff, $1)/eg;
> -+	error(_g('diff %s patches file with C-style encoded filename'), $diff);
> -     } else {
> -         # Tab is the official separator, it's always used when
> -         # filename contain spaces. Try it first, otherwise strip on space
> diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch
> deleted file mode 100644
> index 195d309..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -dpkg: Security Advisory - CVE-2014-0471
> -
> -commit a82651188476841d190c58693f95827d61959b51 upstream
> -
> -Directory traversal vulnerability in the unpacking functionality in
> -dpkg before 1.15.9, 1.16.x before 1.16.13, and 1.17.x before 1.17.8
> -allows remote attackers to write arbitrary files via a crafted source
> -package, related to "C-style filename quoting."
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> -===================================================
> -diff -uarN dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm
> ---- dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm	2014-06-05 15:24:07.422446284 +0800
> -+++ dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm	2014-06-05 15:41:37.746446314 +0800
> -@@ -324,14 +324,53 @@
> -     return $line;
> - }
> -
> --# Strip timestamp
> --sub _strip_ts {
> --    my $header = shift;
> --
> --    # Tab is the official separator, it's always used when
> --    # filename contain spaces. Try it first, otherwise strip on space
> --    # if there's no tab
> --    $header =~ s/\s.*// unless ($header =~ s/\t.*//);
> -+my %ESCAPE = ((
> -+    'a' => "\a",
> -+    'b' => "\b",
> -+    'f' => "\f",
> -+    'n' => "\n",
> -+    'r' => "\r",
> -+    't' => "\t",
> -+    'v' => "\cK",
> -+    '\\' => '\\',
> -+    '"' => '"',
> -+), (
> -+    map { sprintf('%03o', $_) => chr($_) } (0..255)
> -+));
> -+
> -+sub _unescape {
> -+    my ($diff, $str) = @_;
> -+
> -+    if (exists $ESCAPE{$str}) {
> -+        return $ESCAPE{$str};
> -+    } else {
> -+        error(_g('diff %s patches file with unknown escape sequence \\%s'),
> -+              $diff, $str);
> -+    }
> -+}
> -+
> -+# Fetch the header filename ignoring the optional timestamp
> -+sub _fetch_filename {
> -+    my ($diff, $header) = @_;
> -+
> -+    # Strip any leading spaces.
> -+    $header =~ s/^\s+//;
> -+
> -+    # Is it a C-style string?
> -+    if ($header =~ m/^"/) {
> -+        $header =~ m/^"((?:[^\\"]|\\.)*)"/;
> -+        error(_g('diff %s patches file with unbalanced quote'), $diff)
> -+            unless defined $1;
> -+
> -+        $header = $1;
> -+        $header =~ s/\\([0-3][0-7]{2}|.)/_unescape($diff, $1)/eg;
> -+    } else {
> -+        # Tab is the official separator, it's always used when
> -+        # filename contain spaces. Try it first, otherwise strip on space
> -+        # if there's no tab
> -+        $header =~ s/\s.*// unless $header =~ s/\t.*//;
> -+    }
> -+
> -     return $header;
> - }
> -
> -@@ -400,7 +439,7 @@
> - 	unless(s/^--- //) {
> - 	    error(_g("expected ^--- in line %d of diff `%s'"), $., $diff);
> - 	}
> --        $path{old} = $_ = _strip_ts($_);
> -+	$path{old} = $_ = _fetch_filename($diff, $_);
> - 	$fn{old} = $_ if $_ ne '/dev/null' and s{^[^/]*/+}{$destdir/};
> - 	if (/\.dpkg-orig$/) {
> - 	    error(_g("diff `%s' patches file with name ending .dpkg-orig"), $diff);
> -@@ -412,7 +451,7 @@
> - 	unless (s/^\+\+\+ //) {
> - 	    error(_g("line after --- isn't as expected in diff `%s' (line %d)"), $diff, $.);
> - 	}
> --        $path{new} = $_ = _strip_ts($_);
> -+	$path{new} = $_ = _fetch_filename($diff, $_);
> - 	$fn{new} = $_ if $_ ne '/dev/null' and s{^[^/]*/+}{$destdir/};
> -
> - 	unless (defined $fn{old} or defined $fn{new}) {
> diff --git a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> deleted file mode 100644
> index 4e3eb97..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Upstream-Status: Inappropriate [workaround]
> -
> -Index: dpkg-1.16.8/dpkg-deb/build.c
> -===================================================================
> ---- dpkg-1.16.8.orig/dpkg-deb/build.c
> -+++ dpkg-1.16.8/dpkg-deb/build.c
> -@@ -340,13 +340,13 @@ check_new_pkg(const char *dir)
> -   if (pkg->priority == pri_other)
> -     warning(_("'%s' contains user-defined Priority value '%s'"),
> -             controlfile, pkg->otherpriority);
> --  for (field = pkg->available.arbs; field; field = field->next) {
> -+  /*for (field = pkg->available.arbs; field; field = field->next) {
> -     if (known_arbitrary_field(field))
> -       continue;
> -
> -     warning(_("'%s' contains user-defined field '%s'"), controlfile,
> -             field->name);
> --  }
> -+  }*/
> -
> -   free(controlfile);
> diff --git a/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch b/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
> index 0e57dbc..f660b18 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
> @@ -11,22 +11,22 @@ Upstream-Status: Pending
>   
>   Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
>   Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>   ---
>    m4/dpkg-compiler.m4 |    1 -
>    1 file changed, 1 deletion(-)
>   
>   diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
> -index f1c760b..500b5ad 100644
> +index 53f67c6..6e66a43 100644
>   --- a/m4/dpkg-compiler.m4
>   +++ b/m4/dpkg-compiler.m4
> -@@ -72,7 +72,6 @@ if test "x$enable_compiler_warnings" = "xyes"; then
> -   DPKG_WARNING_ALL([-Wformat-security])
> -   DPKG_WARNING_ALL([-Wpointer-arith])
> -   DPKG_WARNING_ALL([-Wlogical-op])
> --  DPKG_WARNING_ALL([-Wvla])
> -   DPKG_WARNING_ALL([-Winit-self])
> -   DPKG_WARNING_ALL([-Wwrite-strings])
> -   DPKG_WARNING_ALL([-Wcast-align])
> ---
> -1.7.10.4
> -
> +@@ -49,7 +49,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
> +   DPKG_CHECK_COMPILER_FLAG([-Wformat-security])
> +   DPKG_CHECK_COMPILER_FLAG([-Wpointer-arith])
> +   DPKG_CHECK_COMPILER_FLAG([-Wlogical-op])
> +-  DPKG_CHECK_COMPILER_FLAG([-Wvla])
> +   DPKG_CHECK_COMPILER_FLAG([-Winit-self])
> +   DPKG_CHECK_COMPILER_FLAG([-Wwrite-strings])
> +   DPKG_CHECK_COMPILER_FLAG([-Wcast-align])
> +---
> +1.17.21
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
> new file mode 100644
> index 0000000..15c0277
> --- /dev/null
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
> @@ -0,0 +1,19 @@
> +require dpkg.inc
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI += "file://noman.patch \
> +            file://check_snprintf.patch \
> +            file://check_version.patch \
> +            file://preinst.patch \
> +            file://fix-timestamps.patch \
> +            file://remove-tar-no-timestamp.patch \
> +            file://fix-abs-redefine.patch \
> +            file://arch_pm.patch \
> +            file://dpkg-configure.service \
> +            file://glibc2.5-sync_file_range.patch \
> +            file://no-vla-warning.patch \
> +           "
> +
> +SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
> +SRC_URI[sha256sum] = "3ed776627181cb9c1c9ba33f94a6319084be2e9ec9c23dd61ce784c4f602cf05"
> +
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
> deleted file mode 100644
> index 83526f3..0000000
> --- a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -require dpkg.inc
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -
> -SRC_URI += "file://noman.patch \
> -            file://check_snprintf.patch \
> -            file://check_version.patch \
> -            file://preinst.patch \
> -            file://fix-timestamps.patch \
> -            file://remove-tar-no-timestamp.patch \
> -            file://fix-abs-redefine.patch \
> -            file://arch_pm.patch \
> -            file://dpkg-configure.service \
> -            file://glibc2.5-sync_file_range.patch \
> -            file://no-vla-warning.patch \
> -            file://dpkg-1.17.4-CVE-2014-0471.patch \
> -            file://dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch \
> -           "
> -
> -SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
> -SRC_URI[sha256sum] = "01cdc81c33e77c3d7c40df17e19171794542be7cf12e411381ffcaa8f87b1854"
> -


