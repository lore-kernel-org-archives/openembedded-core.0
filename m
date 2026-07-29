Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58C3C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 14:37:53 +0000 (UTC)
Received: from s.wrqvtvvn.outbound-mail.sendgrid.net (s.wrqvtvvn.outbound-mail.sendgrid.net [149.72.120.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12993.1785335867013810771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mitsi.com header.s=s1 header.b=zm70Unp5;
 spf=pass (domain: em9347.mitsi.com, ip: 149.72.120.130, mailfrom: bounces+25523119-290e-openembedded-core=lists.openembedded.org@em9347.mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mitsi.com;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; t=1785335865;
	bh=Lnr3H7tUWO5H4kJajDsZM+5hVNmUI82iHFhXucYJ/Fw=;
	b=zm70Unp5ZQQE8T6gzhx0BWKPSd4Mljohe2ui6G8FpS8gHPr3EHAwr44cqBHOHQPeYcfh
	/+3JyQF5+VhZWuw2xpK8NmRdcdiL8+LT2a4T567iEJsPfYTaMHlYqyb+pujp2PjXOH4rX1
	QclaR3M6O73yEUF+tL6B6kY77D+14rPMiRsc2dy80zgn5MZnyxa1dtPfOKNK40wvV7hAdd
	yqgpln3PbanCO6Pd3osHbWhXMRCILRfGDUZvjwqAb4xOwLuOm5Y2evxET7i5jgAkk7hln4
	vL1pGKzfpqfv2Ob06FG6QgbOXxr+E3pGNAAP2MM+gU6VjVNTwsp5ddhr5JECGlpA==
Received: by recvd-85bbc79758-mwwv9 with SMTP id recvd-85bbc79758-mwwv9-1-6A6A1039-F
	2026-07-29 14:37:45.600881732 +0000 UTC m=+71134.506320565
Received: from bigboss.tail527ee.ts.net (unknown)
	by geopod-ismtpd-7 (SG)
	with ESMTP
	id Pbr1pV2VRb68h0SamE36-Q
	Wed, 29 Jul 2026 14:37:45.386 +0000 (UTC)
From: Wes Malone <wes@mitsi.com>
Subject: [wrynose][PATCH] cpan_build: disable .packlist and html doc
Date: Wed, 29 Jul 2026 14:37:45 +0000 (UTC)
Message-ID: <20260729143729.3759497-1-wes@mitsi.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EskCQzOj5FqN40rUAwzKwx2k3ygvzQ66oCqX8Z=2F336ZiMAKGgsj8ktTQ8+?=
 =?us-ascii?Q?Y2VKraAa42ri7aCQrKz+T=2F7+gkNP+jgSogD=2F9U6?=
 =?us-ascii?Q?CVbKk8Ig+M+TG7Bk0yH4Sb1JMlkwf2hqI5KEGSt?=
 =?us-ascii?Q?OXEh+E7+HFxAJ5JCOGkRqCqk6rg5QR1raOHCX5Y?=
 =?us-ascii?Q?o34jplhAR0GnFT8joHRsoJJTaUb5LVHbncEIbv8?=
 =?us-ascii?Q?5Ow9Kd61maQ7naBlyxO9Ebwigvtgrz0RdW7Z7hr?= =?us-ascii?Q?pUjh?=
To: openembedded-core@lists.openembedded.org
Cc: Wes <wes@mitsi.com>
X-Entity-ID: u001.tyoXR3kPUn+53jQbs/iIUw==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242271

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
index b27a8c15e6..0f992dea6d 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -32,8 +32,6 @@ do_patch_module_build () {
 
 do_patch[postfuncs] += "do_patch_module_build"
 
-EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
-
 do_install:prepend () {
 	# We do not have a recipe for libpod-parser-perl which is for
 	# documentation (and is deprecated in favor of Pod::Simple)

