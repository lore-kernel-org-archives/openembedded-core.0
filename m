Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF19C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 11:40:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.87971.1677498014752478098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 03:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NL+8KcAr;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id az36so4044140wmb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677498013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoVcypwLU6cCSZk7uHjICLItVTBThz+L8sHndGinn5E=;
        b=NL+8KcArIHOcJRG6BuEjEGnOfix16p6PGjnDiErWTjE3SaC6DDySb/R8mKpgTnX/R+
         WAkoiW0AxQNtRzMtAnnQ4sW8cL3qmcyPJVe5qDGq+d3WnqKs8Gxir8aaTrhVcSZ2EjdY
         3zV2IRS2KE9Ub6NzeKl3m7xWPdQxkglFwGGNoyiMM9asU7Q8rV1YtdJETmZUVZlITSJV
         YQbo17hhFat82NwUuUZWzaZRQ//8Irrk/Ui/lp4Aw10mA3kiLq3eI4kbME00MTMFLFJz
         Q2T0rDd5cBOkn8qz34on6VMMELqXjtvzxM7ZeBV67m3f04mxyAbx1BH//mWUrFPz4zhR
         D8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677498013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoVcypwLU6cCSZk7uHjICLItVTBThz+L8sHndGinn5E=;
        b=4xp38jYm1R7/W/2639KwN0taPN6aNE0SWfzztAl4t+ug83gXXaWlLoTbARjinpY9ha
         ZierB4LdIAWUE67pygePv8etqBaFaoeYmEextNvyu3NscfrKWXcvQ492SWc/ldTVwRGM
         ARZQYjELZxfaG7Q02IblJjhrMkIGdqKEpZFBELhY36JdDHDWl909AImFAZIwPhocoYdp
         TA/xs4Mz45EMb7sE9rwZ4tyMSw1A4TJCw0k8e9Ejc6aKv7sUWFeLZinxHBxMMuZDLVqU
         9SNg+fAf1c87BCRoYAivmx4ljslE6gOdoUppRk3xUl+W39DOjEqNEyDXx/CPUlPuLZkY
         bV0A==
X-Gm-Message-State: AO0yUKVxebQNOhtvhwWpubs4WIFB1U0p8cN79vEDHHD8WIsQxDxmj0mE
	1CbhrcmPkdheOA3fy9DG9070qENEjho=
X-Google-Smtp-Source: AK7set/3rMdgiK2wzVaWxd+SU2/6Ok1NFYK+W9RbK0WnH0EF3+muQIG3/OeuO1Zm+bH+6ypMCF1d0Q==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id i48-20020a05600c4b3000b003e2147fac1amr16737602wmp.21.1677498013083;
        Mon, 27 Feb 2023 03:40:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b003eb3933ef10sm7227851wmo.46.2023.02.27.03.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:40:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] selftest: do not check for dri.pc in the headless test
Date: Mon, 27 Feb 2023 12:40:07 +0100
Message-Id: <20230227114008.1175030-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 11:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177790

runqemu (which the test also runs) already performs this check,
and does it better, as it additionally unsets a number of environment
variables that can confuse and misdirect host's pkg-config.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7d99c158e5..13e8760a16 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -267,10 +267,6 @@ class TestImage(OESelftestTestCase):
                 self.fail("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
         except FileNotFoundError:
             self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
-        try:
-            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
-        except subprocess.CalledProcessError as e:
-            self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'IMAGE_CLASSES += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
-- 
2.30.2


