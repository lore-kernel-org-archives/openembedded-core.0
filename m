Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1057C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 16:26:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16933.1786724807258133721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ha0QsfLF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0C391A1644
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70AE26046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E101211C4EED1;
	Fri, 14 Aug 2026 18:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786724799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4d/uuanCTxlHCVemxCOFKKtUiZLm0W+++9ahqMG5xng=;
	b=Ha0QsfLFI9AYUJHfrw3vncSAA92508uiY7763+X4j0vNnbDc0EmKvvqNIlO2OWQgT7HVDV
	bvnp2USY5L/1fx2UbL2AoUBdT9Z9+rVQe8lIbVhoqT67zepgiEwqrCatpDKER4R+vDmw8x
	BqwXXx8rDSA3P5P4N6TxI0Om4ykfC3LqLostADIL0PbazsDGm1xJusR/rpKx9TdcqzMp94
	G166L4jqNJPskzrfZpS/84HpEbcE1/Zn1lt9djw+sDmv9SQEoSD+bGtKgULRx7/ATDls1Z
	ZeFgEudSg5Tt+7cU0E7y6FfbiRzQGhqdOO+FKC6gl0+atgPDoYiwr5Omr/RNMg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/4] devtool: standard: Fix file copy on finish --force
Date: Fri, 14 Aug 2026 18:26:33 +0200
Message-Id: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlBf2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dzEkozM1FLdlNSykvz8HF3LJIMkI3MzCwNLizQloK6CotS0zAq
 widGxtbUAyFwWMmEAAAA=
X-Change-ID: 20260813-mathieu-devtool-9b0b2768098f
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786724798; l=3925;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=p4zg2Di9Lykfuh5qmZA3QZbTcedymWqP6HfoPTs7JfI=;
 b=DB0vqQpk9XBPK6Rfy/qugQ5mvPjZKqOAB3YNz5zjq1IwWt14ujPtQhG6TksNq71bTF2JQT2T1
 tAEyH6aA8oDD/0SSjwAMKA3N+IpycKEYNTgzXso1fQK9HXtV67NRQ/v
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 16:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243459

Fix "devtool finish --force" command, by allowing to copy folders that
were not previously existing but also by preventing it from trying to
remove non-existent files. Devtool was particularly confused when using
the finish subcommand on a recipe that was just added.

Reproducer:

devtool add --version 2.10 https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
...
devtool build hello
...
devtool finish hello -f ../openembedded-core/meta/
...
Traceback (most recent call last):
  File "/home/mathieu/projects/swat/gits/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/home/mathieu/projects/swat/gits/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/mathieu/projects/swat/gits/openembedded-core/scripts/lib/devtool/standard.py", line 2214, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/mathieu/projects/swat/gits/openembedded-core/scripts/lib/devtool/standard.py", line 1903, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/mathieu/projects/swat/gits/openembedded-core/scripts/lib/devtool/standard.py", line 1675, in _update_recipe_patch
    upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
                          ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/mathieu/projects/swat/gits/openembedded-core/scripts/lib/devtool/standard.py", line 1469, in _export_local_files
    shutil.copy2(fullfile, os.path.join(destdir, f))
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/shutil.py", line 468, in copy2
    copyfile(src, dst, follow_symlinks=follow_symlinks)
    ~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/shutil.py", line 262, in copyfile
    with open(dst, 'wb') as fdst:
         ~~~~^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/tmp/devtool77jejua2/tmpyuo3c_ay/build-aux/compile'

Using --force is arguably a bad idea here, but as we do provide this
possibility, we should make sure the code does not crash.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (4):
      scripts: scriptutils: Use LicenseRef-Proprietary LICENSE while fetching
      devtool: standard: Fix file copy on finish --force
      devtool: standard: Remove unused variable
      oe-selftest: devtool: Add test for add/finish workflow

 meta/lib/oeqa/selftest/cases/devtool.py | 58 +++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py         |  9 +++--
 scripts/lib/scriptutils.py              |  2 +-
 3 files changed, 65 insertions(+), 4 deletions(-)
---
base-commit: dd003e147db548d9c86821a08450d6461d061cea
change-id: 20260813-mathieu-devtool-9b0b2768098f

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


