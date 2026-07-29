Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4E1C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 15:52:44 +0000 (UTC)
Received: from s.wrqvtvvn.outbound-mail.sendgrid.net (s.wrqvtvvn.outbound-mail.sendgrid.net [149.72.120.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14709.1785340359936047697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 08:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mitsi.com header.s=s1 header.b=YYIMqld0;
 spf=pass (domain: em9347.mitsi.com, ip: 149.72.120.130, mailfrom: bounces+25523119-290e-openembedded-core=lists.openembedded.org@em9347.mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mitsi.com;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; t=1785340358;
	bh=V94JKFCD3jSTX6B5/10CrvqVYXReZ/F+ZKw9GhbcKYA=;
	b=YYIMqld04wJRMxQsVmWiC85HMZCwP1iD0ovXypLSBaNZDWH/nM3l+Kk79LmbF7h22/sy
	0CpCb/4W0545XU3o/Y1iQzQrO6NEsYWhVcuK68MYSeO7ng6Kn/BaG68OAmKQTsIXX1hQ/h
	93T+YkNT0xlNTNwncK/4GkuMSgfRGiF9Rs5WB+T6ic9UWinElPcc3JlZVP/giCLEbeRdVq
	mtK/1JUJ054emZRxxsTy+92daSdZd+qXQIRNnUq6zZtiaawYAdk6idNYmb6q7Tr9vyBja6
	h+sRthAGGbCXLuOiU3hhoOCJFaAE+js//a2uRd0xDyWskzaawojIeDq5V0b927Rw==
Received: by recvd-68db557557-fj5nk with SMTP id recvd-68db557557-fj5nk-1-6A6A21C6-59
	2026-07-29 15:52:38.816013499 +0000 UTC m=+75610.888895333
Received: from bigboss.tail527ee.ts.net (unknown)
	by geopod-ismtpd-17 (SG)
	with ESMTP
	id 0PhVFnk3QFaHPhhqhKm2ew
	Wed, 29 Jul 2026 15:52:38.588 +0000 (UTC)
From: Wes Malone <wes@mitsi.com>
Subject: [PATCH] cpan_build: disable .packlist and html doc
Date: Wed, 29 Jul 2026 15:52:38 +0000 (UTC)
Message-ID: <20260729155130.3839096-1-wes@mitsi.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EskCQzOj5FqN40rUAwzKwx2k3ygvzQ66oCqX8Z=2F336ZiMAKGgsj8ktTQ8+?=
 =?us-ascii?Q?Y2VKraAk8K5zsXVwkTKzNru3fmdB4rTCOJxgsfd?=
 =?us-ascii?Q?GuChpLCGxLMNAXRReRjLApZEjvmS6b872wFoekB?=
 =?us-ascii?Q?NC3EtzA02a1T9nmHNy6xp+ZQ+rOh33pteNsjuoK?=
 =?us-ascii?Q?IVrpyRR41ddlW77AC9mswO+G2o2J6fzMP0sMZDi?=
 =?us-ascii?Q?9xt20fgBtu9mX4RDBUAl0YGA8h4DRAk=2FqlQyzcE?=
 =?us-ascii?Q?=2F56L?=
To: openembedded-core@lists.openembedded.org
Cc: Wes <wes@mitsi.com>
X-Entity-ID: u001.tyoXR3kPUn+53jQbs/iIUw==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from [45.33.107.173] by aws-us-west-2-korg-lkml-1.web.codeaurora.org with
 HTTPS for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 15:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242276

Currently, Makefile.PL-built Perl recipes (cpan.bbclass) exclude
.packlist files with NO_PACKLIST=1, but Build.PL recipes
(cpan_build.bbclass) do not. This now results in a QA error due to the
TMPDIR paths included in the .packlist file.

  ERROR: x do_package_qa: QA Issue: File [...]/.packlist in package x
         contains reference to TMPDIR [buildpaths]

A similar error is produced by generated html doc.

Here we add the corresponding Build.PL arg to disable packlists and html
doc.

Signed-off-by: Wes Malone <wes@mitsi.com>
---
 meta/classes-recipe/cpan_build.bbclass                    | 7 +++++++
 meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cpan_build.bbclass b/meta/classes-recipe/cpan_build.bbclass
index 026859b6c7..03289dc21c 100644
--- a/meta/classes-recipe/cpan_build.bbclass
+++ b/meta/classes-recipe/cpan_build.bbclass
@@ -25,6 +25,13 @@ cpan_build_do_configure () {
 	fi
 
 	perl Build.PL --installdirs vendor --destdir ${D} \
+                        --create_packlist=0 \
+                        --config installhtml1dir= \
+                        --config installhtml3dir= \
+                        --config installsitehtml1dir= \
+                        --config installsitehtml3dir= \
+                        --config installvendorhtml1dir= \
+                        --config installvendorhtml3dir= \
 			${EXTRA_CPAN_BUILD_FLAGS}
 
 	# Build.PLs can exit with success without generating a
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index 1c01a59f5d..3ec712cb8e 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -32,8 +32,6 @@ do_patch_module_build () {
 
 do_patch[postfuncs] += "do_patch_module_build"
 
-EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
-
 do_install:prepend () {
 	# We do not have a recipe for libpod-parser-perl which is for
 	# documentation (and is deprecated in favor of Pod::Simple)

