Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E865AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:52:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.21217.1702558352873466242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TcYXv7oE;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702558352; x=1734094352;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z48dm52meZyK12EQ3qEkkTGIvN90aiVUdlTlYH3O65s=;
  b=TcYXv7oEyDQe9SRTxBDd7FAaSYad/m6Nzhx1S+3DZxTvlozZprBL5qXf
   MeVARujYKIYcWPDCmSBtFtF2LKmxo+9SG596MgfAsItB0DdDymqRqlJOO
   s7e9dwdGc4Wi0yDhTzHFSNebdfjXZ2n0/Z9xo5oV6QK4pRq2y8sdKPOpi
   MRqheQB4qDwFWi/12I/WcbTEwSEudrMTJlyWQQY12iBxO859lRM6PALql
   fIJqzxZfJuZ90cdDIVS8xwxyavUeTNFZRHSC3XvAI5T61EcCKEKGl56KE
   xNdWo1iJTd5h0DqnhZBmnz4jilPDzmtrOkkF5TYcBnUpBiJLhvts33/Ln
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459436034"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="459436034"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 04:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="15845128"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2023 04:52:30 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] perl: fix CVE-2023-31484/47038/47100
Date: Thu, 14 Dec 2023 20:32:51 +0800
Message-Id: <20231214123252.2119332-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192365

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu
http://archive.ubuntu.com/ubuntu/pool/main/p/perl/perl_5.30.0-9ubuntu0.5.debian.tar.xz

fix:
CVE-2023-31484
CVE-2023-47038
CVE-2023-47100

as per https://ubuntu.com/security/CVE-2023-47100 ,
CVE-2023-47100 is duplicate of CVE-2023-47038.

perl import entire CPAN in single commit,
hence backport fix from their upstream cpan instead.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../perl/files/CVE-2023-31484.patch           |  27 ++++
 .../perl/files/CVE-2023-47038.patch           | 121 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   2 +
 3 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-47038.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..0fea7bf8a8
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,27 @@
+CVE: CVE-2023-31484
+Upstream-Status: Backport [  import from Ubuntu  perl_5.30.0-9ubuntu0.5
+upstream  https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 9c98370287f4e709924aee7c58ef21c85289a7f0 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
+ identity
+
+---
+ lib/CPAN/HTTP/Client.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+index 4fc792c26..a616fee20 100644
+--- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
++++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+@@ -32,6 +32,7 @@ sub mirror {
+ 
+     my $want_proxy = $self->_want_proxy($uri);
+     my $http = HTTP::Tiny->new(
++        verify_SSL => 1,
+         $want_proxy ? (proxy => $self->{proxy}) : ()
+     );
+ 
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-47038.patch b/meta/recipes-devtools/perl/files/CVE-2023-47038.patch
new file mode 100644
index 0000000000..59252c560c
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-47038.patch
@@ -0,0 +1,121 @@
+as per https://ubuntu.com/security/CVE-2023-47100 , CVE-2023-47100 is duplicate of CVE-2023-47038
+CVE: CVE-2023-47038 CVE-2023-47100
+Upstream-Status: Backport [ import from ubuntu perl_5.30.0-9ubuntu0.5 
+upstream https://github.com/Perl/perl5/commit/12c313ce49b36160a7ca2e9b07ad5bd92ee4a010 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+Backport of:
+
+From 12c313ce49b36160a7ca2e9b07ad5bd92ee4a010 Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Sat, 9 Sep 2023 11:59:09 -0600
+Subject: [PATCH 1/2] Fix read/write past buffer end: perl-security#140
+
+A package name may be specified in a \p{...} regular expression
+construct.  If unspecified, "utf8::" is assumed, which is the package
+all official Unicode properties are in.  By specifying a different
+package, one can create a user-defined property with the same
+unqualified name as a Unicode one.  Such a property is defined by a sub
+whose name begins with "Is" or "In", and if the sub wishes to refer to
+an official Unicode property, it must explicitly specify the "utf8::".
+S_parse_uniprop_string() is used to parse the interior of both \p{} and
+the user-defined sub lines.
+
+In S_parse_uniprop_string(), it parses the input "name" parameter,
+creating a modified copy, "lookup_name", malloc'ed with the same size as
+"name".  The modifications are essentially to create a canonicalized
+version of the input, with such things as extraneous white-space
+stripped off.  I found it convenient to strip off the package specifier
+"utf8::".  To to so, the code simply pretends "lookup_name" begins just
+after the "utf8::", and adjusts various other values to compensate.
+However, it missed the adjustment of one required one.
+
+This is only a problem when the property name begins with "perl" and
+isn't "perlspace" nor "perlword".  All such ones are undocumented
+internal properties.
+
+What happens in this case is that the input is reparsed with slightly
+different rules in effect as to what is legal versus illegal.  The
+problem is that "lookup_name" no longer is pointing to its initial
+value, but "name" is.  Thus the space allocated for filling "lookup_name"
+is now shorter than "name", and as this shortened "lookup_name" is
+filled by copying suitable portions of "name", the write can be to
+unallocated space.
+
+The solution is to skip the "utf8::" when reparsing "name".  Then both
+"lookup_name" and "name" are effectively shortened by the same amount,
+and there is no going off the end.
+
+This commit also does white-space adjustment so that things align
+vertically for readability.
+
+This can be easily backported to earlier Perl releases.
+---
+ regcomp.c           | 17 +++++++++++------
+ t/re/pat_advanced.t |  8 ++++++++
+ 2 files changed, 19 insertions(+), 6 deletions(-)
+
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -22606,7 +22606,7 @@ Perl_parse_uniprop_string(pTHX_
+      * compile perl to know about them) */
+     bool is_nv_type = FALSE;
+ 
+-    unsigned int i, j = 0;
++    unsigned int i = 0, i_zero = 0, j = 0;
+     int equals_pos = -1;    /* Where the '=' is found, or negative if none */
+     int slash_pos  = -1;    /* Where the '/' is found, or negative if none */
+     int table_index = 0;    /* The entry number for this property in the table
+@@ -22717,9 +22717,13 @@ Perl_parse_uniprop_string(pTHX_
+      * all of them are considered to be for that package.  For the purposes of
+      * parsing the rest of the property, strip it off */
+     if (non_pkg_begin == STRLENs("utf8::") && memBEGINPs(name, name_len, "utf8::")) {
+-        lookup_name +=  STRLENs("utf8::");
+-        j -=  STRLENs("utf8::");
+-        equals_pos -=  STRLENs("utf8::");
++        lookup_name += STRLENs("utf8::");
++        j           -= STRLENs("utf8::");
++        equals_pos  -= STRLENs("utf8::");
++        i_zero       = STRLENs("utf8::");   /* When resetting 'i' to reparse
++                                               from the beginning, it has to be
++                                               set past what we're stripping
++                                               off */
+     }
+ 
+     /* Here, we are either done with the whole property name, if it was simple;
+@@ -22997,7 +23001,8 @@ Perl_parse_uniprop_string(pTHX_
+ 
+             /* We set the inputs back to 0 and the code below will reparse,
+              * using strict */
+-            i = j = 0;
++            i = i_zero;
++            j = 0;
+         }
+     }
+ 
+@@ -23018,7 +23023,7 @@ Perl_parse_uniprop_string(pTHX_
+          * separates two digits */
+         if (cur == '_') {
+             if (    stricter
+-                && (     i == 0 || (int) i == equals_pos || i == name_len- 1
++                && (   i == i_zero || (int) i == equals_pos || i == name_len- 1
+                     || ! isDIGIT_A(name[i-1]) || ! isDIGIT_A(name[i+1])))
+             {
+                 lookup_name[j++] = '_';
+--- a/t/re/pat_advanced.t
++++ b/t/re/pat_advanced.t
+@@ -2524,6 +2524,14 @@ EOF
+                       "", {}, "*COMMIT caused positioning beyond EOS");
+     }
+ 
++    {   # perl-security#140, read/write past buffer end
++        fresh_perl_like('qr/\p{utf8::perl x}/',
++                        qr/Illegal user-defined property name "utf8::perl x" in regex/,
++                        {}, "perl-security#140");
++        fresh_perl_is('qr/\p{utf8::_perl_surrogate}/', "",
++                        {}, "perl-security#140");
++    }
++
+ 
+     # !!! NOTE that tests that aren't at all likely to crash perl should go
+     # a ways above, above these last ones.  There's a comment there that, like
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 9bb94e7caa..4b5a4a5619 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -29,6 +29,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2020-10878_1.patch \
            file://CVE-2020-10878_2.patch \
            file://CVE-2020-12723.patch \
+           file://CVE-2023-31484.patch \
+           file://CVE-2023-47038.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.37.3


