Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3883FF885C
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32615.1777064233890598995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zDT45DbD;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso57645255e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064232; x=1777669032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CI2XY35qwMCtf13re4Y8RREPb6RV+dFgiSoKthXP7E4=;
        b=zDT45DbDNNBFhVJZnwQO2geccDyv9ZkUkjmBjZOD3hQBg8EfOepFQux6tqut+dXYjc
         WdvI7BIGkN4HqOg493Iyvf25DXtaE/1j4CFII0B4mLG/eb1DbTWOtg7HLsV3fu8ZJguw
         myGGJB01pAtI8ciKiEFNNhzO9rkL0jmmtG3XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064232; x=1777669032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CI2XY35qwMCtf13re4Y8RREPb6RV+dFgiSoKthXP7E4=;
        b=GUZCfTxfhwiagsnDX/edBttyLo+dExGFZswo9/2GFPoETUfCievSPt3egS3I3AYkOK
         nqUmUN6kKr0HkRxYKzg4pdbXqrnl0kIucnqHmw2CSPRQX8qU98nR9uRSqNdimOj57v/2
         o1lwC98tzSczYemukfCVudFISKSkqHNhArEcozMjHxkejc+9ZPAelG7dBeMs6DgdzGnU
         bIE8SpOumPfsLQK8lGhNqe9U48FaCGaJQ+MSFR2jPaXvEWn+k+2viQ6/rvug8h889rlf
         mZHk644x4UMkLzZZfSvs5b2LRYO0IA/E854mo/N2nQUZ1q52M6l/aHLAHUUwedkMa1mw
         JIyw==
X-Gm-Message-State: AOJu0YwKLXXVsVk4uAkSQPjZV6hwDGFsnYovKZfX/oDuSTuarpe5RaSh
	ZNK3X1cKw5SerA/maHM8QrfscJxkU9fsVT8YQLkQ/1xDoCqc2O1HVyCozsySDDWJvqbADS+gECE
	A5KFPOIFBFmxU
X-Gm-Gg: AeBDiesi9QjWSZ5bcaLnlchou7VQ8Vy3jXlxX2r0FUfpB6y2jbQZ6owvNCxB3/KQLel
	cRKH/2gfBPsan22078XVnRfo6IzU7RLevdRIZAHY58QrhQ2qnrfvT61/YnMzM35c+VrS03C4RDg
	Gk39WDMKzd3lFSnyFaSmB5BTigs8TcFz7PHf2yjpzLDAhtJUrlxsx3vTNyMbalbTOiN6O/LhVJF
	4/o99P8Y1yQjpi3M6FsfEvoYRybvIU74wU5rXCdBw/GSef/cIjJQbCJJR1VSXHRrwa9Pp48dO14
	HgGw7cV++TtG1CIimgMYNfuuTQc4DeP4BuQVYUjyuvX6KTx/KsJvOlsJ+mxCWfSKm2hNG4OqFQq
	6lEcTgCEumSW/R2sEw6c8jmyoX7I57/BJLRe81n+/q34OYO20WmfgumkWjJS95gUbRndT/nP0Cs
	IFxj8HKE5pc3TKJW4CXxez7Vdu5igMhi/fVZ1+JPu3/Z6n8giYrCBohaoPESObxfVLtcWu1tb1r
	ivI3DW20UbmiVMRPgKVS1YA8yU6S1fE4Dxf4Q==
X-Received: by 2002:a05:600c:4e14:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-4891f080a7emr347107595e9.16.1777064231834;
        Fri, 24 Apr 2026 13:57:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 61/66] selftest/gdbserver: replace shutil.unpack_archive with tarfile extract
Date: Fri, 24 Apr 2026 22:56:00 +0200
Message-ID: <948028ca3466fb7071ee49000e847d6e886e349c.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235934

From: Alexander Kanavin <alex@linutronix.de>

This is a followup to
https://lists.openembedded.org/g/openembedded-core/message/233609
as the same issue happened in a different selftest.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7468e70c238b056acbe06ef722b62b02626db8f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 9da97ae7803..9351feaa632 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -7,6 +7,7 @@ import os
 import time
 import tempfile
 import shutil
+import tarfile
 import concurrent.futures
 
 from oeqa.selftest.case import OESelftestTestCase
@@ -40,7 +41,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
-            shutil.unpack_archive(filename, debugfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/kmod", path=debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
                 status, output = qemu.run_serial("kmod --help")

