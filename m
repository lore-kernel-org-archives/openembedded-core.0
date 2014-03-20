Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C52D36F902
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:13:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2K2Dkq2009581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 19:13:47 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 19:13:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 10:19:04 +0800
Message-ID: <648df6ceaecb6127ff5e49893d2808ac274b1a50.1395281861.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395281861.git.liezhi.yang@windriver.com>
References: <cover.1395281861.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] wget: upgrade from 1.14 to 1.15
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
X-List-Received-Date: Thu, 20 Mar 2014 02:13:46 -0000
Content-Type: text/plain

* Removed:
  - fix_doc.patch (backport)
* Add the HOMEPAGE.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget-1.14/fix_doc.patch | 71 ----------------------
 meta/recipes-extended/wget/wget.inc                |  1 +
 .../wget/{wget-1.14 => wget}/fix_makefile.patch    |  0
 meta/recipes-extended/wget/wget_1.14.bb            | 10 ---
 meta/recipes-extended/wget/wget_1.15.bb            |  7 +++
 5 files changed, 8 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget-1.14/fix_doc.patch
 rename meta/recipes-extended/wget/{wget-1.14 => wget}/fix_makefile.patch (100%)
 delete mode 100644 meta/recipes-extended/wget/wget_1.14.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.15.bb

diff --git a/meta/recipes-extended/wget/wget-1.14/fix_doc.patch b/meta/recipes-extended/wget/wget-1.14/fix_doc.patch
deleted file mode 100644
index 91a5ff7..0000000
--- a/meta/recipes-extended/wget/wget-1.14/fix_doc.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Fix documentation build errors with Texinfo 5 and Perl 5.18
-
-wget.pod around line 2105: Expected text after =item, not a number
-wget.pod around line 2110: Expected text after =item, not a number
-wget.pod around line 2116: Expected text after =item, not a number
-wget.pod around line 2121: Expected text after =item, not a number
-wget.pod around line 2126: Expected text after =item, not a number
-wget.pod around line 2131: Expected text after =item, not a number
-wget.pod around line 2136: Expected text after =item, not a number
-wget.pod around line 2141: Expected text after =item, not a number
-wget.texi:879: @itemx must follow @item
-wget.texi:980: @itemx must follow @item
-wget.texi:3097: @itemx must follow @item
-wget.texi:3608: warning: @itemx should not begin @table
-
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-diff --git a/doc/texi2pod.pl b/doc/texi2pod.pl
-index 86c4b18..9db6de1 100755
---- a/doc/texi2pod.pl
-+++ b/doc/texi2pod.pl
-@@ -291,7 +291,7 @@ while(<$inf>) {
- 	if (defined $1) {
-             my $thing = $1;
-             if ($ic =~ /\@asis/) {
--                $_ = "\n=item $thing\n";
-+                $_ = "\n=item C<$thing>\n";
-             } else {
-                 # Entity escapes prevent munging by the <> processing below.
-                 $_ = "\n=item $ic\&LT;$thing\&GT;\n";
-diff --git a/doc/wget.texi b/doc/wget.texi
-index 7efdc72..2b045fd 100644
---- a/doc/wget.texi
-+++ b/doc/wget.texi
-@@ -876,7 +876,7 @@ recommendation to block many unrelated users from a web site due to the
- actions of one.
- 
- @cindex proxy
--@itemx --no-proxy
-+@item --no-proxy
- Don't use proxies, even if the appropriate @code{*_proxy} environment
- variable is defined.
- 
-@@ -977,7 +977,7 @@ are outside the range of @sc{ascii} characters (that is, greater than
- whose encoding does not match the one used locally.
- 
- @cindex IPv6
--@itemx -4
-+@item -4
- @itemx --inet4-only
- @itemx -6
- @itemx --inet6-only
-@@ -3094,7 +3094,7 @@ display properly---the same as @samp{-p}.
- Change setting of passive @sc{ftp}, equivalent to the
- @samp{--passive-ftp} option.
- 
--@itemx password = @var{string}
-+@item password = @var{string}
- Specify password @var{string} for both @sc{ftp} and @sc{http} file retrieval. 
- This command can be overridden using the @samp{ftp_password} and 
- @samp{http_password} command for @sc{ftp} and @sc{http} respectively.
-@@ -3605,7 +3605,7 @@ In addition to the environment variables, proxy location and settings
- may be specified from within Wget itself.
- 
- @table @samp
--@itemx --no-proxy
-+@item --no-proxy
- @itemx proxy = on/off
- This option and the corresponding command may be used to suppress the
- use of proxy, even if the appropriate environment variables are set.
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 22d8e54..4eeef70 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Console URL download utility supporting HTTP, FTP, etc"
+HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-extended/wget/wget-1.14/fix_makefile.patch b/meta/recipes-extended/wget/wget/fix_makefile.patch
similarity index 100%
rename from meta/recipes-extended/wget/wget-1.14/fix_makefile.patch
rename to meta/recipes-extended/wget/wget/fix_makefile.patch
diff --git a/meta/recipes-extended/wget/wget_1.14.bb b/meta/recipes-extended/wget/wget_1.14.bb
deleted file mode 100644
index b12c147..0000000
--- a/meta/recipes-extended/wget/wget_1.14.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-PR = "${INC_PR}.0"
-
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://fix_makefile.patch \
-           file://fix_doc.patch \
-          "
-SRC_URI[md5sum] = "12edc291dba8127f2e9696e69f36299e"
-SRC_URI[sha256sum] = "f3a6898e3a765bb94435b04a6668db9e5d19b3e90e0c69a503a2773ae936c269"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.15.bb b/meta/recipes-extended/wget/wget_1.15.bb
new file mode 100644
index 0000000..c2fcca7
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.15.bb
@@ -0,0 +1,7 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://fix_makefile.patch \
+          "
+SRC_URI[md5sum] = "506df41295afc6486662cc47470b4618"
+SRC_URI[sha256sum] = "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"
+
+require wget.inc
-- 
1.8.3.1


