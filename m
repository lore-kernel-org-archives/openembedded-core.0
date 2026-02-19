Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0745E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 12:05:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12307.1771502727175227135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 04:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXGOVbd5;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359249bbacso1254606f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 04:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771502725; x=1772107525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCg705YbiLwp/ZQVUtRf50LOMnTBhEr7DcZEmIZLyxY=;
        b=MXGOVbd55DMnCg9ZC03ifAOyXkeXZKeCVF77cryjCP+N7HyUaeWODdmae+dY1gnkiJ
         MZc7WNVP3O7IFvP97k63QZxC8vmOgZ8hHuL/yexk5mOQzm4MqZPVEcbrm5BySXhNDdIf
         y9j22DoBN79/15U06KiJIwcAZhsexjFoDjx9oEy09RQrvW+GNhPQKjnkOSPEblwexGoQ
         xgfVc281Ntc6q+Tp70l3LeXbeBWZGNWtnfkGSPR1+e42XmNT+gSNdZXgSw4xUX3QiEqp
         w3OhDMfGC0yca6AxvyMI8f+O7as0IExbeJTw6zrLQ9JocLz+o7BlGEnD2H7qVc8rSZRG
         kjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771502725; x=1772107525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCg705YbiLwp/ZQVUtRf50LOMnTBhEr7DcZEmIZLyxY=;
        b=QUjiGg3Eedkeu1OiCWVE8EqNoAZ4Nqa9G1WzN78zUrFx6alfXpr76UfAUiJxketc91
         K0anPHVFlS76gNnWhH2fQ6wq1sd3S7Qm3pn2SyDl5hFduRzY/EBGHiGn3ZAzE6v6gmTb
         bIpOk8BekeDnqvdOEd2CyMxtrFr5kKkpk2pFGykk3RrftxdQzuGYvth6tiwqdpaiDP2D
         nZO5t820LyjMrCtBnJ11mQiztyjH9/9jT7/qlMuroi3wnk7F9HDCK54Lf4V7D4kTjpmq
         1necWR4F7hHzQEnv5nwTlJub0p0vaRRRUJFarkqBtP8Z5LbMn8SNf6FI9QvGhjpXbA+v
         g37Q==
X-Gm-Message-State: AOJu0Yz6f3uW/S3GdxCDlH60Ul9A0g9SGuR2VjTRmRN6FXx6BlQcHred
	iOVI+lJ1wlj0bjSc5zUs/2JHDRW4XGaIMsPCbX/Dzb1luPBz5DzqWAvwj2innA==
X-Gm-Gg: AZuq6aKDZ/0DAx8kMEFanAITuP1nw8kBuG891LZ5FQrXV2I9D2IyFUjyC2lD+n52sF9
	a+vcjv0Vi8dMpaIKgSTdh/kdGahGk2jI+pZjcU1dJdZkLJayNdfjAGdXq+RI4IuYKdVK6Dj2nTb
	0hTCQ/XSrRMDm8RBUOR40wUnqI0nSnWDSrtA7VxxJTIJNhv8hp0Nx0UGjjPDRR3krbBb2/lKAuB
	c7fW3SQ1+PvMoKieT05x7kt9jAyWqFeURuQC2MKScpql3qgUTxSh+ez0/VUymU+j4XF+mDt92Y5
	+z3YpI2pZtUFYXdq7bs0kt7lLpGOb2jmNfUmBpMcS5VaFgxcXIEbLdCBDxP0fkvAfq8k4Ih68Aq
	9TIWaGal3buQlobrio3GYXwo81DvwamKGU0MLOiKm4hUq2rT3UXU/UBQO2rUVCQ9ukd94A5BmxM
	dfD2NAmQ87jNxMjMs/hgB+6dLbC7NiLEinRFBE6kkOB7DB4Tk2TCkYlu4ldqI=
X-Received: by 2002:a05:6000:3104:b0:437:71cc:a237 with SMTP id ffacd0b85a97d-4396272073amr2794137f8f.29.1771502725236;
        Thu, 19 Feb 2026 04:05:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad009bsm47426611f8f.39.2026.02.19.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 04:05:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] devtool: upgrade: do not add dummy git notes
Date: Thu, 19 Feb 2026 13:05:20 +0100
Message-ID: <20260219120521.218506-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 12:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231423

From: Alexander Kanavin <alex@linutronix.de>

This has been causing a significant performance regression,
to the point where AUH wasn't able to complete upgrades with
particularly large number of git commits between releases [1].

After discussing with Peter [2], running 'oe-selftest -r devtool' with this change (100% pass),
and also doing an AUH run with it, and reviewing the output I think this is fine to remove:
the case is either very niche or non-existent, and if it appears again, we
should come up with a better fix.

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/38/builds/54/steps/15/logs/stdio
[2] https://lists.openembedded.org/g/openembedded-core/message/231281

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index dda0a58098..8930fde5d6 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -275,16 +275,6 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             branches_to_rebase = [branch] + stdout.split()
             target_branch = revs[os.path.relpath(path, srctree)]
 
-            # There is a bug (or feature?) in git rebase where if a commit with
-            # a note is fully rebased away by being part of an old commit, the
-            # note is still attached to the old commit. Avoid this by making
-            # sure all old devtool related commits have a note attached to them
-            # (this assumes git config notes.rewriteMode is set to ignore).
-            (stdout, _) = _run('git rev-list devtool-base..%s' % target_branch, cwd=path)
-            for rev in stdout.splitlines():
-                if not oe.patch.GitApplyTree.getNotes(path, rev):
-                    oe.patch.GitApplyTree.addNote(path, rev, "dummy")
-
             for b in branches_to_rebase:
                 logger.info("Rebasing {} onto {}".format(b, target_branch))
                 _run('git checkout %s' % b, cwd=path)
@@ -297,11 +287,6 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
                     else:
                         logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
-            # Remove any dummy notes added above.
-            (stdout, _) = _run('git rev-list devtool-base..%s' % target_branch, cwd=path)
-            for rev in stdout.splitlines():
-                oe.patch.GitApplyTree.removeNote(path, rev, "dummy")
-
             _run('git checkout %s' % branch, cwd=path)
 
     if tmpsrctree:
-- 
2.47.3


