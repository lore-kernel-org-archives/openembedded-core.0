Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84576C4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.151043.1703864764870594647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3R0zStSk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d427518d52so35051385ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864764; x=1704469564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74R3OCCjFDzNPBm1IEAl2z8VqJqL7Cgp3ml4mxXL5bU=;
        b=3R0zStSkQ3NmRUEdmRFywrMszCNTpo/O1Bbci+qWwqUBhV77IO1S7Wh0vQWkFfKPw4
         AcSGasL5Et/Mvk2XeH7RBisjYHEn2LJcv05pYb+dYodf2304ck84hDkRhSXkulOwxBlb
         s/I188T9343R6EPmCPoPqyK0lGYvw+oIW/l/OBKByE0D8Mj7ZIZWMO1lI3SdvdCd6Bew
         VBP3np47jKLj7deK3ctSkGOR8IbthRtlocMtfkXlrKyDaPDlLu4fONLBGawzjAHiq9oU
         uxlUxFb5RpqaX7L9BezCI3kXt9sGbtgbc/lZwDk99itdYzlKehtB+Hzfg1BKdYq8FLpi
         VPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864764; x=1704469564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74R3OCCjFDzNPBm1IEAl2z8VqJqL7Cgp3ml4mxXL5bU=;
        b=XF/3+/x+ks7l3i/cFetFNkSX4jNkyp5l9x6xPL3+HgN/mdvCzFFhYpgnXH/Cewe9sT
         uLYpvMVbvm1MrIoMLXTR+up/k1D+SaFB1DKFxSiBuzS/TtgIxcONB9fUiUYckzuMWqhv
         iq1sRyHTSpMc9VXfpAmqdOJcTzX1r820z7/aNX7x5DMXu6MQ5TyysZy/g9fTmTHBzdtm
         v9VTqqiJ+RW3VtKSv9wiN2Int2sYpFhxLzVzIDsFuwCL2Hxj3ikhzJrqFOxInzpaYHRQ
         qpJ8K5+FLurIeYzKt6fs9lAGo6ob6gwnnhxPxiYXvoixlEpLHQ/rE/GfHQXWuVNs3J/E
         7Yqg==
X-Gm-Message-State: AOJu0YyQ4ePJKYF42le2klVPC3mBvkVlplZ+1yCCUIeG1nn2N20e0hf2
	nrGbf556wz87QBTYgTiu5GJ2aMVmVheEqhRQ3uwZWA2PpePsVw==
X-Google-Smtp-Source: AGHT+IGPoyMuU2zQL6sGzUcV+cSLcLXdtPP/j0v4G23KGPkOYoE5xKStwqSh1Wn16kjXMwLUmcj+Aw==
X-Received: by 2002:a17:902:7088:b0:1d0:6ffd:6119 with SMTP id z8-20020a170902708800b001d06ffd6119mr11977545plk.59.1703864763956;
        Fri, 29 Dec 2023 07:46:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 33/41] devtool: finish/update-recipe: restrict mode srcrev to recipes fetched from SCM
Date: Fri, 29 Dec 2023 05:44:47 -1000
Message-Id: <9254b08fbfba3734d5bc717a382d909595833db1.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193050

From: Julien Stephan <jstephan@baylibre.com>

When specifying --mode / -m srcrev with devtool finish/update-recipe on
recipes that are not fetched from a SCM repository we get the following
error:

  Traceback (most recent call last):
  [..]
    File "<...>/poky/meta/lib/oe/patch.py", line 49, in runcmd
    raise CmdError(cmd, exitstatus >> 8, "stdout: %s\nstderr: %s" % (stdout, stderr))
oe.patch.CmdError: Command Error: 'sh -c 'git format-patch --no-signature --no-numbered INVALID -o /tmp/oepatchbj7pfmzj -- .'' exited with 0  Output:
stdout:
stderr: fatal: bad revision 'INVALID'

Fix this by adding a check and abort with a proper error message.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b77f60e85d07921ae5e808daa1fd7d8c3dc40ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cd79c7802c..55fa38ccfb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1530,6 +1530,11 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     recipedir = os.path.basename(recipefile)
     logger.info('Updating SRCREV in recipe %s%s' % (recipedir, dry_run_suffix))
 
+    # Get original SRCREV
+    old_srcrev = rd.getVar('SRCREV') or ''
+    if old_srcrev == "INVALID":
+            raise DevtoolError('Update mode srcrev is only valid for recipe fetched from an SCM repository')
+
     # Get HEAD revision
     try:
         stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -1556,7 +1561,6 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
         if not no_remove:
             # Find list of existing patches in recipe file
             patches_dir = tempfile.mkdtemp(dir=tempdir)
-            old_srcrev = rd.getVar('SRCREV') or ''
             upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
                                                   patches_dir)
             logger.debug('Patches: update %s, new %s, delete %s' % (dict(upd_p), dict(new_p), dict(del_p)))
-- 
2.34.1


