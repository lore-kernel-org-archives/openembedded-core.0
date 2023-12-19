Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28A0C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:48:39 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.13927.1702993717733806786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I4L2NgKF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cdbc7bebecso220818a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702993716; x=1703598516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itVKUY4pYFFYm0bz5gox7EMeXOdrtPx4lWw1hkFSQJE=;
        b=I4L2NgKFSusN5+gpy91ke7RMHOn+BcjB7tPoNpsVSoOc0uZ0RCbwbCFVUj8d9Ta8D0
         ZCDEdu6uYbE/ed5QOS7CA53zCM6PH8/wbMoHtGe5Y9xIElNCl+t6/tgRDKU6MDCDEPYz
         mFR8PifmxFhi9uZvVwZCffHfW74fz+FJrS2VqBs+yrUG8pGsn8GEQe0A1Cj1XWMwF84M
         u4fpQEWADdFfozHxwuPcpNoMtCw+roy3WwyyFsq6pOUCB/RAOrS9IEE4PlF7sfiRzTse
         qxZxzRgIUZ76xwXT5TVQbrtasEZlsTO1RwomlpN5qAIYllZifwVeujbj/p9/1rxyJqpg
         edAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993716; x=1703598516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itVKUY4pYFFYm0bz5gox7EMeXOdrtPx4lWw1hkFSQJE=;
        b=Pd94aCoz5Z73nHQni05zTd4jvETgfOIhI4VGYrjPW/Za+cmNN3Z1fUX6n7cPqbOPuI
         duKm09kWrKr2R6vWr5TNl2HaQo2DVDL+OUjLyTSIewaCOf7sdaULaL76lYrr9Bxn2Gk9
         JynHpBjZmTUuCeAUSMHtHgMCnv4IzTlJLu3RRo+cSJgfN8ZuxIjh3JXP3OoApGHVIwM3
         oLiKiFuwAYwqZq82IkBkZ51O1D3DOh8biQxcBL72VHcoNVSemVnFqGBG1P6TTObC6yPh
         RCzrHwYNF+XgPiXOPf9EPvXEIdF/fPkOAn94b8jajqsSriYWuPrBsxqxx7+XtVdBxHdI
         kHPw==
X-Gm-Message-State: AOJu0YyHfBOhVcIOjB7M90G+EwLHispP2U4ZL3/NHnQmaFaeCHqzG+tY
	3Ah/WhVC3xT489MdFdgFHhzmVed9c3RcPbrifgH3Hw==
X-Google-Smtp-Source: AGHT+IGf/hM4W38twZJLf1j5G4AR4OMd1JMibSlEtogaZIYrcuZZDNc7QHMVaH+97gLqceokHDeOdQ==
X-Received: by 2002:a05:6a20:3ca3:b0:18b:ec94:deed with SMTP id b35-20020a056a203ca300b0018bec94deedmr9418881pzj.45.1702993716281;
        Tue, 19 Dec 2023 05:48:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h4-20020a655184000000b0059d6f5196fasm16815398pgq.78.2023.12.19.05.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:48:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] perl: fix CVE-2023-31484/47038/47100
Date: Tue, 19 Dec 2023 03:48:20 -1000
Message-Id: <74861848ba0d3ba920ef54f016240807ba42682a.1702993573.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702993573.git.steve@sakoman.com>
References: <cover.1702993573.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192734

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


