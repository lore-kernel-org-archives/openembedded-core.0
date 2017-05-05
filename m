Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 47C5777E18
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 17:35:54 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wKJvs429Fz1qql9;
	Fri,  5 May 2017 19:35:53 +0200 (CEST)
X-Auth-Info: nu0kpkyw//D9v6sAich+/RvB8WP+Tjwpod4jDyGk0Xo=
Received: from kurokawa.lan (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3wKJvs11xFzvdWQ;
	Fri,  5 May 2017 19:35:52 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 19:35:48 +0200
Message-Id: <20170505173548.7420-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] automake: Backport perl 5.22 fix
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
X-List-Received-Date: Fri, 05 May 2017 17:35:55 -0000

Backport 13f00eb4493c "automake: port to Perl 5.22 and later"
from automake upstream to fix build with perl 5.22 .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
NOTE: IMO this should be pulled to YP release 2.2 and 2.3 as well
---
 ...0001-automake-port-to-Perl-5.22-and-later.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch b/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
new file mode 100644
index 0000000000..0e6895fb4b
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
@@ -0,0 +1,32 @@
+From 13f00eb4493c217269b76614759e452d8302955e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 31 Mar 2016 16:35:29 -0700
+Subject: [PATCH] automake: port to Perl 5.22 and later
+
+Without this change, Perl 5.22 complains "Unescaped left brace in
+regex is deprecated" and this is planned to become a hard error in
+Perl 5.26.  See:
+http://search.cpan.org/dist/perl-5.22.0/pod/perldelta.pod#A_literal_%22{%22_should_now_be_escaped_in_a_pattern
+* bin/automake.in (substitute_ac_subst_variables): Escape left brace.
+
+Upstream-Status: Backport [13f00eb4493c217269b76614759e452d8302955e]
+---
+ bin/automake.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/automake.in b/bin/automake.in
+index a3a0aa318..2c8f31e14 100644
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -3878,7 +3878,7 @@ sub substitute_ac_subst_variables_worker
+ sub substitute_ac_subst_variables
+ {
+   my ($text) = @_;
+-  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
++  $text =~ s/\$[{]([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
+   return $text;
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index a6904c8a91..902dd63db1 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://python-libdir.patch \
             file://performance.patch \
             file://new_rt_path_for_test-driver.patch \
             file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
+            file://0001-automake-port-to-Perl-5.22-and-later.patch \
             "
 
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
-- 
2.11.0


