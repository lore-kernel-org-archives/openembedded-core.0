Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339E0D58098
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.17243.1732536118486984357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRFxzYXS;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a044dce2so8759925e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536117; x=1733140917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/l926pahlf0z3kiKQhdrRHU2zAAkcFKRpcznXUx7FY=;
        b=SRFxzYXS7wgvfqMpr/UnURCooG2TGway67UhOPJ6d35I0fR9pHSV92eNZNdxOpkg1g
         dphCEBqF01A8qEYq4roBPHjeqFZ5sTH8FItbTJ/6OfXdbND6SM+whPKuIpHnSe8/wC7f
         9mfWJ9IIwwa0T2RvNKkTgavaYwDfwV1Zl7eeI0qOWixyE4Haf7GZ/Kri+3msOf6hiVui
         LcRTxSO3LXs1gQUpiUJir38GryUjoKGoqbDWhDpIcAZNoj8jp0wRZdQZ2Xqvoi+l6Y1D
         IGrW+wnXGQn8BzPG4aP82d60oPgjGJmtVUkjolNrSMmNh6cDo6pE0xjv+CfKJGxVYZOC
         xh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536117; x=1733140917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/l926pahlf0z3kiKQhdrRHU2zAAkcFKRpcznXUx7FY=;
        b=eXRxrQpBbA97hOYvlp5Cx5RHmOBb9t08Vluh/ZRNH5D3Ra/bR+/4IpymZPTQvrtuBi
         eUHEtC3mwVLZew4p6/OaUNPf5Xqo6llevcbSdgxGYMG+ihnadGgIzZCkbLIr0T9cfpXV
         P/+hCo3PAwqv1p8xNJmeE16pDAuASpXsv142btENsEjt70624bobq0Ij3/H1iE9HPEbE
         aRz2AE2ez48vL23AF9F8IzuTm83Q7FEQUT5TJ7HIhjgPh1Kp0sHsJvWWnSkEf2l6sbq4
         LnXuriRDrdJAWHqQWHnNFXonnLZHrRw/Un21XI8+9OpqSjHjspZxdiPRf1vBiPrm8Baa
         WeSg==
X-Gm-Message-State: AOJu0Ywh4RdI047QDY7nuKgh+eTN/XEkz1C9pbSSmZX6UUb2IfyUesh+
	9SrKeUYzuc3dK614KtMSzg9JgrzXnLcZZKZNrxPHtqUkXYaf8wLobF9Z2Q==
X-Gm-Gg: ASbGncu1JheoDdJV9/hZXZ+o3RGBof+9t/xXSrYiQURvOhNmT4wgISaltCg11B4o1op
	z0i4zWEghOcO+dlqvZH8aXvW8M2GESIG7qEK6dKgIYm1jXgJ1ycthqo1WKIp1rLd2VnfgV9Jw+m
	7lhptnkURwv56Fuq4IksCgmiFr6n3RV+fGYy0oAWM8ZkY/jNkVDlYM2ZDIesAeqYlYimiQ0GjGh
	1NYDGBmVRbOSonHCL+OM0C3G8Jj83gv5gRsSGCF8WjX/sZrw29e3i38CU255zyJjYTv5ZsFEd0U
	plQoBGHx1qk=
X-Google-Smtp-Source: AGHT+IFjEKibSWcURzd+LThPmXGnMuaKl4wKerL8X2T2nf+d29njw7Aai/VPZND+l1tGmAIqAGrJCg==
X-Received: by 2002:a05:600c:1c90:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-434a1d3a466mr12190605e9.3.1732536116569;
        Mon, 25 Nov 2024 04:01:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/35] liburi-perl: move to meta-perl
Date: Mon, 25 Nov 2024 13:01:27 +0100
Message-Id: <20241125120127.2205232-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207783

From: Alexander Kanavin <alex@linutronix.de>

liburi-perl was added in 2010 to support lsb testing, never had
any other consumers in core, and since 2019 lsb testing is gone as well:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=bac4bc9aa6a1f2fcf2ce9644925615185cc8e847

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../distro/include/ptest-packagelists.inc     |   1 -
 .../0001-Skip-TODO-test-cases-that-fail.patch | 109 ------------------
 .../recipes-devtools/perl/liburi-perl_5.31.bb |  56 ---------
 4 files changed, 167 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
 delete mode 100644 meta/recipes-devtools/perl/liburi-perl_5.31.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d61b88f7de6..fa2bca8358e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -409,7 +409,6 @@ RECIPE_MAINTAINER:pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
 RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2a4acb02b0d..e2a90c1c2ef 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -38,7 +38,6 @@ PTESTS_FAST = "\
     libtest-warnings-perl \
     libtimedate-perl \
     libtry-tiny-perl \
-    liburi-perl \
     libusb1 \
     libxml-namespacesupport-perl \
     libxml-parser-perl \
diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
deleted file mode 100644
index c15c3be93a6..00000000000
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From c424e6118d3bd836939ce39c70ee9e6bbd984028 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Thu, 17 Nov 2022 16:33:20 -0800
-Subject: [PATCH] Skip TODO test cases that fail
-
-TODO cases report as "not ok" with ptest-runner
-
-Upstream-Status: Inappropriate [ptest-runner specific]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- t/escape-char.t | 20 ++++++++++----------
- t/iri.t         | 18 +++++++++---------
- t/mailto.t      | 12 ++++++------
- 3 files changed, 25 insertions(+), 25 deletions(-)
-
-diff --git a/t/escape-char.t b/t/escape-char.t
-index c6ce79c..5e62ad5 100644
---- a/t/escape-char.t
-+++ b/t/escape-char.t
-@@ -6,16 +6,16 @@ use warnings;
- use Test::More;
- use URI ();
- 
--TODO: {
--    my $str = "http://foo/\xE9";
--    utf8::upgrade($str);
--    my $uri = URI->new($str);
--
--    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
--
--    # http://foo/%C3%A9
--    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
--}
-+#TODO: {
-+#    my $str = "http://foo/\xE9";
-+#    utf8::upgrade($str);
-+#    my $uri = URI->new($str);
-+#
-+#    local $TODO = 'URI::Escape::escape_char misunderstands utf8';
-+#
-+#    # http://foo/%C3%A9
-+#    is("$uri", 'http://foo/%E9', 'correctly created a URI from a utf8-upgraded string');
-+#}
- 
- {
-     my $str = "http://foo/\xE9";
-diff --git a/t/iri.t b/t/iri.t
-index cf983d6..884b36e 100644
---- a/t/iri.t
-+++ b/t/iri.t
-@@ -6,7 +6,7 @@ use Test::More;
- use Config qw( %Config );
- 
- if (defined $Config{useperlio}) {
--    plan tests=>30;
-+    plan tests=>28;
- } else {
-     plan skip_all=>"this perl doesn't support PerlIO layers";
- }
-@@ -67,17 +67,17 @@ is $u->as_iri, "http://➡.ws/";
- # draft-duerst-iri-bis.txt examples (section 3.7.1):
- is(URI->new("http://www.example.org/D%C3%BCrst")->as_iri, "http://www.example.org/D\xFCrst");
- is(URI->new("http://www.example.org/D%FCrst")->as_iri, "http://www.example.org/D%FCrst");
--TODO: {
--    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
--is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
--}
-+#TODO: {
-+#    local $TODO = "some chars (like U+202E, RIGHT-TO-LEFT OVERRIDE) need to stay escaped";
-+#is(URI->new("http://xn--99zt52a.example.org/%e2%80%ae")->as_iri, "http://\x{7D0D}\x{8C46}.example.org/%e2%80%ae");
-+#}
- 
- # try some URLs that can't be IDNA encoded (fallback to encoded UTF8 bytes)
- $u = URI->new("http://" . ("ü" x 128));
- is $u, "http://" . ("%C3%BC" x 128);
- is $u->host, ("\xC3\xBC" x 128);
--TODO: {
--    local $TODO = "should ihost decode UTF8 bytes?";
--    is $u->ihost, ("ü" x 128);
--}
-+#TODO: {
-+#    local $TODO = "should ihost decode UTF8 bytes?";
-+#    is $u->ihost, ("ü" x 128);
-+#}
- is $u->as_iri, "http://" . ("ü" x 128);
-diff --git a/t/mailto.t b/t/mailto.t
-index 79e9a13..c68cfb2 100644
---- a/t/mailto.t
-+++ b/t/mailto.t
-@@ -48,12 +48,12 @@ $u = URI->new('mailto:user+detail@example.com');
- is $u->to, 'user+detail@example.com', 'subaddress with `+` parsed correctly';
- is $u, 'mailto:user+detail@example.com', '... and stringification works';
- 
--TODO: {
--    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
--    $u = URI->new('mailto:"foo bar+baz"@example.com');
--    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
--    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
--}
-+#TODO: {
-+#    local $TODO = "We can't handle quoted local parts without properly parsing the email addresses";
-+#    $u = URI->new('mailto:"foo bar+baz"@example.com');
-+#    is $u->to, '"foo bar+baz"@example.com', 'address with quoted local part containing spaces is parsed correctly';
-+#    is $u, 'mailto:%22foo%20bar+baz%22@example.com', '... and stringification works';
-+#}
- 
- # RFC 5321 (4.1.3) - Address Literals
- 
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.31.bb b/meta/recipes-devtools/perl/liburi-perl_5.31.bb
deleted file mode 100644
index e23942b81e8..00000000000
--- a/meta/recipes-devtools/perl/liburi-perl_5.31.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "Perl module to manipulate and access URI strings"
-DESCRIPTION = "This package contains the URI.pm module with friends. \
-The module implements the URI class. URI objects can be used to access \
-and manipulate the various components that make up these strings."
-HOMEPAGE = "https://metacpan.org/dist/URI"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9944b87af51186f848ae558344aded9f"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
-           file://0001-Skip-TODO-test-cases-that-fail.patch \
-           "
-
-SRC_URI[sha256sum] = "b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564"
-
-S = "${WORKDIR}/URI-${PV}"
-
-EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
-
-inherit cpan ptest-perl
-
-do_compile() {
-	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-	cpan_do_compile
-}
-
-do_install:prepend() {
-	# these tests require "-T" (taint) command line option
-	rm -rf ${B}/t/cwd.t
-	rm -rf ${B}/t/file.t
-}
-
-RDEPENDS:${PN} += "\
-    perl-module-integer \
-    perl-module-mime-base64 \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    libtest-fatal-perl \
-    libtest-needs-perl \
-    libtest-warnings-perl \
-    perl-module-encode \
-    perl-module-encode-encoding \
-    perl-module-extutils-makemaker \
-    perl-module-extutils-mm-unix \
-    perl-module-file-spec-functions \
-    perl-module-net-domain \
-    perl-module-perlio \
-    perl-module-perlio-encoding \
-    perl-module-test \
-    perl-module-test-more \
-    perl-module-utf8 \
-"
-
-BBCLASSEXTEND = "native"
-- 
2.39.5


