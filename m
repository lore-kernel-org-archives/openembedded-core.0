Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DFFC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:12:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8189.1786878734107037843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ewEsXOvD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E44461A1699
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B88AE60352
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53AEC11C4F8E9;
	Sun, 16 Aug 2026 13:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786878727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GLIaykGrBaTHinamytFvc7mk/InzfWjzgww4DRdM76U=;
	b=ewEsXOvDU7MIot/Zooruq7EgE2rhDj4Q9WOMYkVCi6zrINGUM/9JspI5YYtCS7PeFiDSWK
	DYVJB9ehz2XZ/c4BtYI9rtJEFEGOdDOTbisMMH0ePdwJDL8LGm9FYxTxgN4RxsgDtQxZjA
	g9RRzJmQ3CgdWNSgZXydpRplcbP5x0eZKzEMHQ0fVBqiaFfEI7wJF7lNxrJi+NEQED9TJr
	KgweFapYAgk0mmI/mWmF/ZQCS7zJ6/zGkNjNiFmxAxQ9fcax99VYTNyeQxa+LREMYURlZY
	Wl7ZQQ3hPQ/kzdBk0acw0q91QfQJYoSTkDOj3Gh7ovxrG2PU2I5T1IuE4C2x5A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 0/4] devtool: standard: Fix file copy on finish --force
Date: Sun, 16 Aug 2026 13:12:00 +0200
Message-Id: <20260816-mathieu-devtool-v2-0-13c943abf48e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAACbgWoC/2WNQQ6CMBBFr0JmbU1bFIor72FYUBhkEmBMWxsN6
 d2tJK5cvpf89zfw6Ag9XIoNHEbyxGsGfSign7r1joKGzKClrqRRpVi6MBE+xYAxMM+isdLqujK
 yMSPk1cPhSK+9eGszT+QDu/d+ENXX/lqnv1ZUQorGnNGoTtXWllfLHGZajz0v0KaUPgiPf6mwA
 AAA
X-Change-ID: 20260813-mathieu-devtool-9b0b2768098f
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786878726; l=4172;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=tjCVy6WuUp9jgfbvMsrVOiIvX3++I36MNO76GiLIuDs=;
 b=GtTe/MqHzrDE9QXjmoGUkROaAgYA3i34vUeXP8Phal6MjtQ620kDbNHT6kKwtIIrqrs3a/6g6
 iX8LqroPpdaC2QibcaqgiTZDm4RC+w4KOIG0q0XH4mAdAEyDGXr1+wo
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243516

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
Changes in v2:
- Use RecipetoolTransient instead of Proprietary.
- Link to v1: https://lore.kernel.org/r/20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com

---
Mathieu Dubois-Briand (4):
      scripts: scriptutils: Use LicenseRef-RecipetoolTransient LICENSE while fetching
      devtool: standard: Fix file copy on finish --force
      devtool: standard: Remove unused variable
      oe-selftest: devtool: Add test for add/finish workflow

 meta/files/common-licenses/RecipetoolTransient |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py        | 58 ++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py                |  9 ++--
 scripts/lib/scriptutils.py                     |  2 +-
 4 files changed, 66 insertions(+), 4 deletions(-)
---
base-commit: 07a342aa80c7349dd014f743a695a5e006add8df
change-id: 20260813-mathieu-devtool-9b0b2768098f

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


