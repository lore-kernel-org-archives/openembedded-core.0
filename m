Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id E749E6B095
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 14:16:25 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq12so1135829pab.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ffYr/8VXFNf3UbtS1qO9vIJOoFBKT5avLl1uWKkgUFg=;
	b=hEIRQou7KtBCXdE8hrrVBAy69RyGR1u8NJuiyfexoKJutySaRREZ1SfVGlipFLNlmC
	hCAfjmh6LaqgJeSMUVhJc69SdWOw+1+aqR1Oq7v4YVebv6T63aUXMoCTEEvff40b6z98
	xuAfvGs+6Hv+NhfGvIloELwqm+eysVA5hjE10TCMrzPTc63lGgd9SKPYEzVRvy93tpgP
	JhMnZtm2rqysucbntA/GSQpJ3ciqrE+/HqsrKreHRJYV+LWCszFBiUYLZwetHpeAbMCd
	1xribOU+wq7LMLEy+W2gyz+qHF0QtmNx9ZX/YDpRV4pcsIlUS1dKdU/9vwFOrYACsRsg
	FV3A==
X-Received: by 10.66.155.67 with SMTP id vu3mr18725520pab.42.1374243386497;
	Fri, 19 Jul 2013 07:16:26 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kc8sm19880203pbc.18.2013.07.19.07.16.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Jul 2013 07:16:25 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 00:31:59 +1000
Message-Id: <1374244319-31123-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] wget: backport fixes for documentation build errors
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
X-List-Received-Date: Fri, 19 Jul 2013 14:16:26 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-extended/wget/wget-1.14/fix_doc.patch | 71 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.14.bb            |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget-1.14/fix_doc.patch

diff --git a/meta/recipes-extended/wget/wget-1.14/fix_doc.patch b/meta/recipes-extended/wget/wget-1.14/fix_doc.patch
new file mode 100644
index 0000000..91a5ff7
--- /dev/null
+++ b/meta/recipes-extended/wget/wget-1.14/fix_doc.patch
@@ -0,0 +1,71 @@
+Fix documentation build errors with Texinfo 5 and Perl 5.18
+
+wget.pod around line 2105: Expected text after =item, not a number
+wget.pod around line 2110: Expected text after =item, not a number
+wget.pod around line 2116: Expected text after =item, not a number
+wget.pod around line 2121: Expected text after =item, not a number
+wget.pod around line 2126: Expected text after =item, not a number
+wget.pod around line 2131: Expected text after =item, not a number
+wget.pod around line 2136: Expected text after =item, not a number
+wget.pod around line 2141: Expected text after =item, not a number
+wget.texi:879: @itemx must follow @item
+wget.texi:980: @itemx must follow @item
+wget.texi:3097: @itemx must follow @item
+wget.texi:3608: warning: @itemx should not begin @table
+
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+diff --git a/doc/texi2pod.pl b/doc/texi2pod.pl
+index 86c4b18..9db6de1 100755
+--- a/doc/texi2pod.pl
++++ b/doc/texi2pod.pl
+@@ -291,7 +291,7 @@ while(<$inf>) {
+ 	if (defined $1) {
+             my $thing = $1;
+             if ($ic =~ /\@asis/) {
+-                $_ = "\n=item $thing\n";
++                $_ = "\n=item C<$thing>\n";
+             } else {
+                 # Entity escapes prevent munging by the <> processing below.
+                 $_ = "\n=item $ic\&LT;$thing\&GT;\n";
+diff --git a/doc/wget.texi b/doc/wget.texi
+index 7efdc72..2b045fd 100644
+--- a/doc/wget.texi
++++ b/doc/wget.texi
+@@ -876,7 +876,7 @@ recommendation to block many unrelated users from a web site due to the
+ actions of one.
+ 
+ @cindex proxy
+-@itemx --no-proxy
++@item --no-proxy
+ Don't use proxies, even if the appropriate @code{*_proxy} environment
+ variable is defined.
+ 
+@@ -977,7 +977,7 @@ are outside the range of @sc{ascii} characters (that is, greater than
+ whose encoding does not match the one used locally.
+ 
+ @cindex IPv6
+-@itemx -4
++@item -4
+ @itemx --inet4-only
+ @itemx -6
+ @itemx --inet6-only
+@@ -3094,7 +3094,7 @@ display properly---the same as @samp{-p}.
+ Change setting of passive @sc{ftp}, equivalent to the
+ @samp{--passive-ftp} option.
+ 
+-@itemx password = @var{string}
++@item password = @var{string}
+ Specify password @var{string} for both @sc{ftp} and @sc{http} file retrieval. 
+ This command can be overridden using the @samp{ftp_password} and 
+ @samp{http_password} command for @sc{ftp} and @sc{http} respectively.
+@@ -3605,7 +3605,7 @@ In addition to the environment variables, proxy location and settings
+ may be specified from within Wget itself.
+ 
+ @table @samp
+-@itemx --no-proxy
++@item --no-proxy
+ @itemx proxy = on/off
+ This option and the corresponding command may be used to suppress the
+ use of proxy, even if the appropriate environment variables are set.
diff --git a/meta/recipes-extended/wget/wget_1.14.bb b/meta/recipes-extended/wget/wget_1.14.bb
index f26b884..b12c147 100644
--- a/meta/recipes-extended/wget/wget_1.14.bb
+++ b/meta/recipes-extended/wget/wget_1.14.bb
@@ -2,6 +2,7 @@ PR = "${INC_PR}.0"
 
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
+           file://fix_doc.patch \
           "
 SRC_URI[md5sum] = "12edc291dba8127f2e9696e69f36299e"
 SRC_URI[sha256sum] = "f3a6898e3a765bb94435b04a6668db9e5d19b3e90e0c69a503a2773ae936c269"
-- 
1.8.3.2


