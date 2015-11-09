Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98BC0770A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:48:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA9AmbaP025953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 9 Nov 2015 02:48:37 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 9 Nov 2015 02:48:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 9 Nov 2015 18:48:29 +0800
Message-ID: <f43718d3d58e3a317844c0688e3f2bfd3ce3e7a2.1447065925.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447065925.git.hongxu.jia@windriver.com>
References: <cover.1447065925.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl: fix spaces in brackets while using CC version
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
X-List-Received-Date: Mon, 09 Nov 2015 10:48:40 -0000
Content-Type: text/plain

Here is the way to reproduce the issue:
...
root@localhost:~# perl -e "use Errno qw(ENOENT);"
"ENOENT" is not exported by the Errno module
Can't continue after import errors at -e line 1.
BEGIN failed--compilation aborted at -e line 1.
...

For some distros, there was extra spaces in the
brackets while using CC version:

For Windriver:
$CC --version
x86_64-wrs-linux-gcc (Wind River Linux 5.2.0-8.0-intel-x86-64) 5.2.0

For Ubuntu:
$ gcc --version
gcc (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4

So we replace the contects between brackets with semicolon
and then use space to split.

[YOCTO #8367]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/perl/perl-errno-generation-gcc5.patch       | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
index efbc55d..7379d8b 100644
--- a/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
+++ b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
@@ -5,14 +5,25 @@ is the same as the one being used to build the perl binary. Since most people ar
 systems with gcc 5, it is unlikely that it will work on any supported host. Switch out gccversion
 for the version extracted from $CC --version.
 
---- perl-5.22.0/ext/Errno/Errno_pm.PL	2015-10-19 18:01:20.622143786 -0400
-+++ perl-5.22.0-fixed/ext/Errno/Errno_pm.PL	2015-10-19 17:50:35.662137367 -0400
-@@ -224,9 +224,12 @@
+Jeremy Puhlman <jpuhlman@mvista.com>
+
+Fix spaces in brackets while running $CC --version
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ ext/Errno/Errno_pm.PL | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
+index 1fd29d0..7976ea2 100644
+--- a/ext/Errno/Errno_pm.PL
++++ b/ext/Errno/Errno_pm.PL
+@@ -224,9 +224,13 @@ sub write_errno_pm {
  
      {	# BeOS (support now removed) did not enter this block
      # invoke CPP and read the output
 +        my $compiler = $ENV{'CC'};
 +        my $compiler_out = `$compiler --version`;
++        $compiler_out =~ s/\(.*\)/;/;
 +        my @compiler_version = split / /,$compiler_out; 
  
  	my $inhibit_linemarkers = '';
@@ -21,3 +32,6 @@ for the version extracted from $CC --version.
  	    # GCC 5.0 interleaves expanded macros with line numbers breaking
  	    # each line into multiple lines. RT#123784
  	    $inhibit_linemarkers = ' -P';
+-- 
+1.9.1
+
-- 
1.9.1


