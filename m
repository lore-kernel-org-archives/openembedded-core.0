Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85F0C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:14:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2670.1750432479360482781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C60516F2;
	Fri, 20 Jun 2025 08:14:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 861A93F673;
	Fri, 20 Jun 2025 08:14:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Subject: [PATCH 06/12] recipetool: allow recipe create handlers to specify bitbake tasks to run
Date: Fri, 20 Jun 2025 16:14:23 +0100
Message-ID: <20250620151429.3210879-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 15:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219133

When creating a recipe there can be cases where there is a class that
does some of the recipe creation (such as cargo-update-recipe-crates).

To avoid duplication of code, look for run_task assignments in the
extravalues dictionary returned by the handler, and if it is set then
call that task after writing the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index b2101f39325..f0584d84701 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -765,6 +765,7 @@ def create_recipe(args):
     extrafiles =3D extravalues.pop('extrafiles', {})
     extra_pn =3D extravalues.pop('PN', None)
     extra_pv =3D extravalues.pop('PV', None)
+    run_task =3D extravalues.pop('run_task', None)
=20
     if extra_pv and not realpv:
         realpv =3D extra_pv
@@ -919,6 +920,10 @@ def create_recipe(args):
         log_info_cond('Recipe %s has been created; further editing may b=
e required to make it fully functional' % outfile, args.devtool)
         tinfoil.modified_files()
=20
+    if run_task:
+        logger.info("Running task %s" % run_task)
+        tinfoil.build_file_sync(outfile, run_task)
+
     if tempsrc:
         if args.keep_temp:
             logger.info('Preserving temporary directory %s' % tempsrc)
--=20
2.43.0


