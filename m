Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAB5D49208
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:51:34 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11033.1765540285260854425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAIe09Do;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78c66bdf675so10484147b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 03:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540284; x=1766145084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+NUXEtKNipXRtX2ozs7P+cwQw8aF5Uw70XP6Pq07Q8=;
        b=lAIe09DoBvL7XEUuP0uX6lv8cwvtRE/FQ1cFXl529DGlY3h/owh8R3iOMBaKHtjKgn
         OOHEaAXmTtPQOKThmVumEGYWZluV6Nu7k6RbUS54neVyOzKbVLKmw2d4qWI6hP3Hh4x+
         sSYWxUTF2rix5TekwIKbfx1B1xK1u2rhUI6TE7Hj2cCKGpEx1zFt01yETD8qol64nQfI
         rk8gYrAxuHXo9KU/LjdouDcXe+Wg8ng36QZDETJb6MmHRcmuiy9J6pPON9FhrycRkdJ2
         URMF45taU9ZB3RgI9kEiTqwnhMTVsIvawkHG0YU20BBpisxraoaPA6GsqAUFdpsbsyBo
         IGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540284; x=1766145084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+NUXEtKNipXRtX2ozs7P+cwQw8aF5Uw70XP6Pq07Q8=;
        b=XiFg7qSxTrJaigOrdiaXjMjXkl4iNNGiPbEEX59GzMoS/5/ef9M5z8uJyR0mmQIa2Y
         KMVPWpo6S4CCBrfGX/IqUQcxNfn382L3PRDi+kGVl2cxSKMmuoDkqZOii7sya+JapRLk
         eifHIqX8/ydvvY9iMojv5rPQYrvdKdC55KCiRy+Tp4+Mp6rQry2VGGCDQ0Gp4PKV/Cw1
         XUvWAxVc6eETgqfwnxLDqI8PtLYn13jOYyefwJAep5fxXGIFIjAOX1zk9xsYHGbzMx19
         jDXF9amMCbKrEUL2Ja0v+0kRC7y+lEhZhVg4ieXCXRImClscR2xsdd8+494Y71edmxrQ
         74dA==
X-Gm-Message-State: AOJu0YxZHh5jRwGwv8Sk3UXOjOqmlCu073t5SCs95wJv0OYjSD8jAZRD
	fXyWi7t8f1KE+BTvSEC8ytKyxsuX5mjlS9lCpO48sxphOP+RGz6VWjCkfXXeEkRP
X-Gm-Gg: AY/fxX7HmMBdQCdw+axZG4cADSmTz+ZTqWAVZtallwxsG1w2bBfunq2/ooi6lsl+WsZ
	jHDOGHXcjEtU1UBD97rLoCunFVriB8g28Gh6wVSxj2GayRtQhsE+fUQe6f03+9Il8K0YxfTVaWU
	ZcxPzAWPOB4scF6+iQ2dVHiM5SRQ3eNy0Nhs/gOIah1PcIq1OU59Ntd1AY/JIn4y+nCrUyk/8qA
	GctHV1NGUFVQa1BY3QJSrTF6yZyNuzIY7AGR1NeeLpc8Gav6AY5gsMTnMPeE095DBtVKDCqPAQr
	ex5buzAJyeIcL7YQeLje7+V1h5q0eQp97gY+0Feds0YgJ7eX2Orn2g8tJiRYrUNwIJ7O23QQO3A
	pMeOKS02RvWr+KR5CPExsL/+wd98lAfvrtPLCwy73t91uadIDpsqMWdezxvJKE62GKwvVC7l5Gf
	bHV8zZfrwAgc2fyNx9tqVu+m2ScBAI4late1gc8bUjWcB96OPX8XOeAOdHtHGZfP5Cf+A+8j5sE
	bJgPvKWJ3OgiF7C5+6xARGn7yY6yvfoTlMKDEW79nmTSE04sqKAb6IgA70elTkteg==
X-Google-Smtp-Source: AGHT+IFn9pqBAAkLHvUUuwQAbfFgXnnpeG10se49j+ShTvsTjOmI+OsbcbGUlChDh8TGdGb1nGDICQ==
X-Received: by 2002:a05:690c:4b0e:b0:78c:67b5:e7bd with SMTP id 00721157ae682-78e66c4b75amr14573657b3.53.1765540283834;
        Fri, 12 Dec 2025 03:51:23 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e6a45f374sm3871497b3.50.2025.12.12.03.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:51:23 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] Change CPAN_MIRROR to the address where it resolves.
Date: Fri, 12 Dec 2025 06:51:11 -0500
Message-ID: <20251212115111.9187-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 11:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227586

  "https://search.cpan.org/CPAN"  -->  "https://cpan.metacpan.org"

  Update other locations that reference search.cpan.org as appropriate.

    https://log.perl.org/2018/05/goodbye-search-dot-cpan-dot-org.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/conf/bitbake.conf                                  | 2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb          | 2 +-
 meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb   | 2 +-
 meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb | 4 ++--
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb     | 2 +-
 meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb | 4 ++--
 meta/recipes-extended/perl/libxml-sax-perl_1.02.bb      | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 729f92fcdb..88f4d0df69 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -693,7 +693,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 ##################################################################
 
 APACHE_MIRROR = "https://archive.apache.org/dist"
-CPAN_MIRROR = "https://search.cpan.org/CPAN"
+CPAN_MIRROR = "https://cpan.metacpan.org"
 DEBIAN_MIRROR = "http://deb.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 21c02c19ff..728b606ed2 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libxml-perl is a collection of smaller Perl modules, scripts, and
 documents for working with XML in Perl.  libxml-perl software \
 works in combination with XML::Parser, PerlSAX, XML::DOM, \
 XML::Grove and others."
-HOMEPAGE = "http://search.cpan.org/dist/libxml-perl/"
+HOMEPAGE = "https://metacpan.org/dist/libxml-perl/"
 SUMMARY = "Collection of Perl modules for working with XML"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index a4f08433e7..f5fd2d3f0e 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -4,7 +4,7 @@ on top of an underlying XML parsing module to maintain XML files \
 (especially configuration files). It is a blunt rewrite of XML::Simple \
 (by Grant McLean) to use the XML::LibXML parser for XML structures, \
 where the original uses plain Perl or SAX parsers."
-HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
+HOMEPAGE = "https://metacpan.org/release/MARKOV/XML-LibXML-Simple-0.93/view/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf206df8c9fe775f1d4c484386491eac"
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index 7e167d6e67..c1d83139d7 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
 SECTION = "libs"
-HOMEPAGE = "http://search.cpan.org/dist/Convert-ASN1/"
+HOMEPAGE = "https://metacpan.org/dist/Convert-ASN1/"
 DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 7f9f40d996..590b5bd0b8 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/TimeDate-${PV}"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index 8d97e95e83..a4b4116973 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Base class SAX Drivers and Filters"
-HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Base/"
+HOMEPAGE = "https://metacpan.org/dist/XML-SAX-Base/"
 DESCRIPTION = "This module has a very simple task - to be a base class for \
 PerlSAX drivers and filters. It's default behaviour is to pass \
 the input directly to the output unchanged. It can be useful to \
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "perl-module-extutils-makemaker"
 
 LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c88466446"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-Base-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GR/GRANTM/XML-SAX-Base-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index 67bdac981d..5f982a4c4c 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Perl module for using and building Perl SAX2 XML processors"
-HOMEPAGE = "http://search.cpan.org/dist/XML-SAX/"
+HOMEPAGE = "https://metacpan.org/dist/XML-SAX"
 DESCRIPTION = "XML::SAX consists of several framework classes for using and \
 building Perl SAX2 XML parsers, filters, and drivers.  It is designed \ 
 around the need to be able to "plug in" different SAX parsers to an \
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "libxml-namespacesupport-perl libxml-sax-base-perl perl-module
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a"
 
-- 
2.43.0


