Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04726780CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:15:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6CAFXiO012687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:15:33 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 03:15:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 03:15:26 -0700
Message-ID: <f5e4af684d39a5c3f567986c142fb03b7f617f7f.1499854502.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1499854502.git.liezhi.yang@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] automake: 1.15 -> 1.15.1
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
X-List-Received-Date: Wed, 12 Jul 2017 10:15:33 -0000
Content-Type: text/plain

* Remove backported patch:
  - 0001-automake-port-to-Perl-5.22-and-later.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...0001-automake-port-to-Perl-5.22-and-later.patch | 32 ----------------------
 .../{automake_1.15.bb => automake_1.15.1.bb}       |  5 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
 rename meta/recipes-devtools/automake/{automake_1.15.bb => automake_1.15.1.bb} (84%)

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch b/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
deleted file mode 100644
index 0e6895f..0000000
--- a/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 13f00eb4493c217269b76614759e452d8302955e Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 31 Mar 2016 16:35:29 -0700
-Subject: [PATCH] automake: port to Perl 5.22 and later
-
-Without this change, Perl 5.22 complains "Unescaped left brace in
-regex is deprecated" and this is planned to become a hard error in
-Perl 5.26.  See:
-http://search.cpan.org/dist/perl-5.22.0/pod/perldelta.pod#A_literal_%22{%22_should_now_be_escaped_in_a_pattern
-* bin/automake.in (substitute_ac_subst_variables): Escape left brace.
-
-Upstream-Status: Backport [13f00eb4493c217269b76614759e452d8302955e]
----
- bin/automake.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/automake.in b/bin/automake.in
-index a3a0aa318..2c8f31e14 100644
---- a/bin/automake.in
-+++ b/bin/automake.in
-@@ -3878,7 +3878,7 @@ sub substitute_ac_subst_variables_worker
- sub substitute_ac_subst_variables
- {
-   my ($text) = @_;
--  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
-+  $text =~ s/\$[{]([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
-   return $text;
- }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.1.bb
similarity index 84%
rename from meta/recipes-devtools/automake/automake_1.15.bb
rename to meta/recipes-devtools/automake/automake_1.15.1.bb
index 902dd63..4812341 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.1.bb
@@ -24,11 +24,10 @@ SRC_URI += "file://python-libdir.patch \
             file://performance.patch \
             file://new_rt_path_for_test-driver.patch \
             file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
-            file://0001-automake-port-to-Perl-5.22-and-later.patch \
             "
 
-SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
-SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"
+SRC_URI[md5sum] = "95df3f2d6eb8f81e70b8cb63a93c8853"
+SRC_URI[sha256sum] = "988e32527abe052307d21c8ca000aa238b914df363a617e38f4fb89f5abf6260"
 
 PERL = "${USRBINPATH}/perl"
 PERL_class-native = "${USRBINPATH}/env perl"
-- 
2.10.2


