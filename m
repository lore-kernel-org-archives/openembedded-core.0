Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DD1C7EE32
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:48:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14126.1751032135251455371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90C3D1A00
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70A8E3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/9] recipetool: allow recipe create handlers to specify bitbake tasks to run
Date: Fri, 27 Jun 2025 14:48:44 +0100
Message-ID: <20250627134850.152269-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134850.152269-1-ross.burton@arm.com>
References: <20250627134850.152269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219415

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
index b65e59de6a0..5d7fcbbb988 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -764,6 +764,7 @@ def create_recipe(args):
     extrafiles =3D extravalues.pop('extrafiles', {})
     extra_pn =3D extravalues.pop('PN', None)
     extra_pv =3D extravalues.pop('PV', None)
+    run_tasks =3D extravalues.pop('run_tasks', "").split()
=20
     if extra_pv and not realpv:
         realpv =3D extra_pv
@@ -918,6 +919,10 @@ def create_recipe(args):
         log_info_cond('Recipe %s has been created; further editing may b=
e required to make it fully functional' % outfile, args.devtool)
         tinfoil.modified_files()
=20
+    for task in run_tasks:
+        logger.info("Running task %s" % task)
+        tinfoil.build_file_sync(outfile, task)
+
     if tempsrc:
         if args.keep_temp:
             logger.info('Preserving temporary directory %s' % tempsrc)
--=20
2.43.0


