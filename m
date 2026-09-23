Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A59C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:23 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2815.1790154680930186169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EEsVSD/1;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5648485e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154679; x=1790759479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sNuG74WzTEl+YKyB0BBJ0j0ILPwsHE7qnTbG8ML1fZw=;
        b=EEsVSD/1xE0zYhvwwCKnaYv5HtlxFVPFmhzjy75KSI7vSfQPH07yiSuoLa03zLRuws
         ejEzkmldceeYxyY81DX5rBCKk4kwEyaUs4/XBTsXpb6PvD17qPzB8AztbLT86UjNvzcy
         r+PKFYgQvHVbcFmE3+QRrS71cJMcW1JWinc5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154679; x=1790759479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sNuG74WzTEl+YKyB0BBJ0j0ILPwsHE7qnTbG8ML1fZw=;
        b=naCBimMBTkTTWDuafQEPRxo9Xym5ahUmNYZWEfOQM+M9EmYRmEfb0yXDciTRjQdf1H
         EEBEgc3LAXNEBnWLq5IJI2v2u1y+GOycrBlG4kB0g2IK30b/YKPOMahZXSGI4N53PzXI
         IPLUcTGUN38WNG8zQQ/bxFLQZ7C7sKSnKGwD4kn2h5jVnZzBZDW5qOqwglKDr4Dk54qm
         VqdJCv/+YLbCYrF8N8/y0SCie0n9TCOIv2lMG6DpBce4Wpfm/gQntJwGD9aVBDxnWh76
         E8ezPlaGdvuLskqW20bLXndWufhDG0LWWaQKAmHfIwxiHQh09mcFIX8hR3ZjtQ9hUeH9
         UOAA==
X-Gm-Message-State: AFuF++kuQm62vovN88avhCF13iWyQ1SnBQJwnPSAhkPu1hGEheoquN07
	F1Uf0PJTSnBfebe48gG+/KAvPIL3lz8De9n0Z5Rcx94VkFdUDK5AdoOJSM597bfK4uzO2FxoBmC
	nLiF3oBw=
X-Gm-Gg: AYBFou2zYuQfLI4gHIe1Y9Tf17+Y8RTg4wdjH+U5dER9coy8EaEW8YIwQOY2TjuN027
	MzlcgsUu50we+KnI8VnJk5wyPKeYvnoMJqIKd8QsN+L9giCaKvU2Dq38GU421ak1fpNUH/NrR2z
	r6DfFQdcUfKsY5wyK8vOYtCb0xPJrt/f9DmFwyGpm5GeKmanEA5L6C58cVfQlWa3JVA0ndg/bwd
	46d7bpxAE/iIj9M0unzy+c5I6mFsVcbTwJ6Q/PChI5sSGZKwPYxHGAyhdYbIzCPbCBKvrdLrG/v
	Wdb6hJVMD6Vj9LhBtOhyZOB/xeddtbahPj2jf5hjOlIOfZTdKqe/jVW8wzGWX/VCZAbpg5lss7J
	8wdv4nqTB6OtY/yd8bS1oX/eSZluj/VhlNNvDyJF2jHmRyrNCBPgdqJ6589J7KFX10uKSwMZrYD
	tmeDJ8r1E51up0gipX+hD77rgNXoalOkSQCsf2LdtAETk3D6FNg+LYFcofps5b7GBLygm9t+jUX
	w1LYJuS59y6WbjcrXlnrvGrGTMSyLFLbMQ7kjkSu5dpw+ghi2c/K1uV9e4qqKhsoVRGnOaU
X-Received: by 2002:a05:600c:a307:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-49fe3f2f5d4mr2741905e9.0.1790154679163;
        Wed, 23 Sep 2026 02:11:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/48] testimage: avoid symlinking missing qemu boot log
Date: Wed, 23 Sep 2026 11:10:05 +0200
Message-ID: <6672769e251ab0dd42fc5f5cde99800ed5ba8289.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246465

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When qemu test runs only produce suffixed bootlog variants, the base
bootlog path may not exist. os.symlink() creates a dangling symlink
in the oeqa result log directory.

Avoid advertising a boot log in the collected test results when that
path does not exist. Guard the symlink creation and log a note instead.

This is a partial backport of master commit
7a6596925cb0eb8dd48a0362a51875cdd60152bc. Only the symlink guard is
picked here; the bootlog variant globbing from master is not applicable
to scarthgap.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/testimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 33b1c13f9dd..744de5d7de7 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -395,7 +395,10 @@ def testimage_main(d):
     # Copy additional logs to tmp/log/oeqa so it's easier to find them
     targetdir = os.path.join(get_json_result_dir(d), d.getVar("PN"))
     os.makedirs(targetdir, exist_ok=True)
-    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    if os.path.exists(bootlog):
+        os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    else:
+        bb.note("testimage: boot log not found at %s" % bootlog)
     os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
 
     if not results or not complete:

