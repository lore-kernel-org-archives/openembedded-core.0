Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5A1C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:25:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14158.1647365148835259597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C55D01474
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:25:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 736F53F73D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:25:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: upgrade to 3.0.2
Date: Tue, 15 Mar 2022 17:25:45 +0000
Message-Id: <20220315172545.722902-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:25:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163309

From: Ross Burton <ross@burtonini.com>

  * Fixed a bug in the BN_mod_sqrt() function that can cause it to loop f=
orever
    for non-prime moduli ([CVE-2022-0778])

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/reproducibility.patch     | 22 -------------------
 .../{openssl_3.0.1.bb =3D> openssl_3.0.2.bb}    |  3 +--
 2 files changed, 1 insertion(+), 24 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibi=
lity.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.1.bb =3D> openssl_=
3.0.2.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducibility.pa=
tch b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
deleted file mode 100644
index 8accbc9df2..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Using localtime() means the output can depend on the timezone of the bui=
ld machine.
-Using gmtime() is safer. For complete reproducibility use SOURCE_DATE_EP=
OCH if set.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending [should be suitable]
-
-Index: openssl-3.0.1/apps/progs.pl
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssl-3.0.1.orig/apps/progs.pl
-+++ openssl-3.0.1/apps/progs.pl
-@@ -21,7 +21,10 @@ die "Unrecognised option, must be -C or
- my %commands     =3D ();
- my $cmdre        =3D qr/^\s*int\s+([a-z_][a-z0-9_]*)_main\(\s*int\s+arg=
c\s*,/;
- my $apps_openssl =3D shift @ARGV;
--my $YEAR         =3D [localtime()]->[5] + 1900;
-+my $YEAR         =3D [gmtime()]->[5] + 1900;
-+if (defined($ENV{SOURCE_DATE_EPOCH}) && $ENV{SOURCE_DATE_EPOCH} !~ /\D/=
) {
-+    $YEAR =3D [gmtime($ENV{SOURCE_DATE_EPOCH})]->[5] + 1900;
-+}
-=20
- # because the program apps/openssl has object files as sources, and
- # they then have the corresponding C files as source, we need to chain
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.2.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.2.bb
index 1128f6a737..ff2a22c6c3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
@@ -12,14 +12,13 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${=
PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://reproducibility.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "c311ad853353bce796edad01a862c50a8a587f62e7e2100e=
f465ab53ec9b06d1"
+SRC_URI[sha256sum] =3D "98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e=
7ec09d6411dfdb63"
=20
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--=20
2.25.1


