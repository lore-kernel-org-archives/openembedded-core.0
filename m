Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F416A7892F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:02:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651882"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:44 +0200
Message-Id: <20180309185614.31113-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/36] openssl: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:00 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../openssl/openssl-1.0.2n/debian/c_rehash-compat.patch    | 10 +++++-----
 .../openssl/openssl-1.0.2n/debian/debian-targets.patch     | 14 +++++++-------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch
index 68e54d561e5..3820e3e306b 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch
@@ -5,10 +5,10 @@ Subject: [PATCH] also create old hash for compatibility
 
 Upstream-Status: Backport [debian]
 
-diff --git a/tools/c_rehash.in b/tools/c_rehash.in
-index b086ff9..b777d79 100644
---- a/tools/c_rehash.in
-+++ b/tools/c_rehash.in
+Index: openssl-1.0.2n/tools/c_rehash.in
+===================================================================
+--- openssl-1.0.2n.orig/tools/c_rehash.in
++++ openssl-1.0.2n/tools/c_rehash.in
 @@ -8,8 +8,6 @@ my $prefix;
  
  my $openssl = $ENV{OPENSSL} || "openssl";
@@ -48,7 +48,7 @@ index b086ff9..b777d79 100644
  		$fname =~ s/'/'\\''/g;
  		my ($hash, $fprint) = `"$openssl" x509 $x509hash -fingerprint -noout -in "$fname"`;
  		chomp $hash;
-@@ -176,11 +174,21 @@ sub link_hash_cert {
+@@ -177,10 +175,20 @@ sub link_hash_cert {
  		$hashlist{$hash} = $fprint;
  }
  
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch
index 39d4328184b..35d92bedb74 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch
@@ -1,12 +1,12 @@
 Upstream-Status: Backport [debian]
 
-Index: openssl-1.0.2/Configure
+Index: openssl-1.0.2n/Configure
 ===================================================================
---- openssl-1.0.2.orig/Configure
-+++ openssl-1.0.2/Configure
-@@ -107,6 +107,10 @@ my $gcc_devteam_warn = "-Wall -pedantic
- 
- my $clang_disabled_warnings = "-Wno-language-extension-token -Wno-extended-offsetof -Wno-padded -Wno-shorten-64-to-32 -Wno-format-nonliteral -Wno-missing-noreturn -Wno-unused-parameter -Wno-sign-conversion -Wno-unreachable-code -Wno-conversion -Wno-documentation -Wno-missing-variable-declarations -Wno-cast-align -Wno-incompatible-pointer-types-discards-qualifiers -Wno-missing-variable-declarations -Wno-missing-field-initializers -Wno-unused-macros -Wno-disabled-macro-expansion -Wno-conditional-uninitialized -Wno-switch-enum";
+--- openssl-1.0.2n.orig/Configure
++++ openssl-1.0.2n/Configure
+@@ -133,6 +133,10 @@ my $clang_devteam_warn = "-Wno-unused-pa
+ # Warn that "make depend" should be run?
+ my $warn_make_depend = 0;
  
 +# There are no separate CFLAGS/CPPFLAGS/LDFLAGS, set everything in CFLAGS
 +my $debian_cflags = `dpkg-buildflags --get CFLAGS` . `dpkg-buildflags --get CPPFLAGS` . `dpkg-buildflags --get LDFLAGS` . "-Wa,--noexecstack -Wall";
@@ -15,7 +15,7 @@ Index: openssl-1.0.2/Configure
  my $strict_warnings = 0;
  
  my $x86_gcc_des="DES_PTR DES_RISC1 DES_UNROLL";
-@@ -343,6 +347,55 @@ my %table=(
+@@ -369,6 +373,55 @@ my %table=(
  "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so",
  "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
  
-- 
2.16.1


