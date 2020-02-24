Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62E7B60626
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:34:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01OGYhkJ014639
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 08:34:43 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 24 Feb 2020 08:34:42 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <87zhd8x7sb.fsf@windriver.com>
Date: Mon, 24 Feb 2020 11:35:32 -0500
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [PATCH] perl: fix lib/warnings test on core-image-sato
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
X-List-Received-Date: Mon, 24 Feb 2020 16:34:42 -0000
Content-Type: text/plain

    Fixes [YOCTO #13296]

    The lib/warnings test fails on certain images such as
    core-image-sato. The upstream has already fixed this issue, thus
    submitting the relevent backport patch.

Signed-off-by: Matthew Zeng <matthew.zeng@windriver.com>

--
Mingde (Matthew) Zeng

---
 ...rl-134117-Close-DATA-in-loc_tools.pl.patch | 30 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |  2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/files/0001-PATCH-perl-134117-Close-DATA-in-loc_tools.pl.patch

diff --git a/meta/recipes-devtools/perl/files/0001-PATCH-perl-134117-Close-DATA-in-loc_tools.pl.patch b/meta/recipes-devtools/perl/files/0001-PATCH-perl-134117-Close-DATA-in-loc_tools.pl.patch
new file mode 100644
index 0000000000..2ca9f35f4a
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-PATCH-perl-134117-Close-DATA-in-loc_tools.pl.patch
@@ -0,0 +1,30 @@
+From a04a75f20f03aa08ce8118b3b0b3f93eb3e997c5 Mon Sep 17 00:00:00 2001
+From: Richard Leach <rich+perl@hyphen-dash-hyphen.info>
+Date: Sun, 19 May 2019 20:16:41 +0000
+Subject: [PATCH] PATCH: [perl #134117] Close DATA in loc_tools.pl
+
+This prevents unexpected text and fixes test lib/warnings.t
+
+Upstream Status: Backport [a04a75f20f03aa08ce8118b3b0b3f93eb3e997c5]
+
+Signed-off-By: Matthew Zeng <matthew.zeng@windriver.com>
+
+---
+ t/loc_tools.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/loc_tools.pl b/t/loc_tools.pl
+index c76e29388a..beebd98d88 100644
+--- a/t/loc_tools.pl
++++ b/t/loc_tools.pl
+@@ -421,7 +421,7 @@ sub find_locales ($;$) {
+         }
+
+         # The rest of the locales are in this file.
+-        push @Data, <DATA>;
++        push @Data, <DATA>; close DATA;
+
+         foreach my $line (@Data) {
+             my ($locale_name, $language_codes, $country_codes, $encodings) =
+--
+2.25.0
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 4869012b1a..9d747aa5b4 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
+           file://0001-PATCH-perl-134117-Close-DATA-in-loc_tools.pl.patch \
            file://determinism.patch  \
            file://racefix.patch \
            "
@@ -388,4 +389,3 @@ EOF
        chmod 0755 ${SYSROOT_DESTDIR}${bindir}/nativeperl
        cat ${SYSROOT_DESTDIR}${bindir}/nativeperl
 }
-
--
2.24.0

