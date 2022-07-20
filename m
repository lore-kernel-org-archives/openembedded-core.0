Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C5CC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 11:30:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.52840.1658316650776571645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 04:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AheoQMnX;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id z13so6129811wro.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmgFkR8tebBja/pbZ1JgE7vLfo9+UxeU249ZzPC/abk=;
        b=AheoQMnXKv2XlMsLuU1KS2dOm/mksm3OdC+VzsBIs6U7OtvG0SMZ1KSGlQpAiiRlSG
         bKZ2151B6i3P5jGn3cLcoidUxK5qlHK9ikW+dz+XnoVlXUZIcn0pKaW13V34GqtynH86
         HTzllSexWb5kuCymY0cHgv0d7aGppBN7CtaKfQYPi59Vicq4WNCmYkfcaK4HixhTcyy4
         nhyIR6NKWpcJbYiW6m6OrntqrObRuwYMbozUyCUKrDQcl5yLxKbcSUEwVEmL1fwA54OK
         kEiaLVedfwDG+Z8wVjPgmcS/fuqVTEIsxzb9Oysp2SAFlGfsEqUWSPm28urkchESVRTA
         RM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmgFkR8tebBja/pbZ1JgE7vLfo9+UxeU249ZzPC/abk=;
        b=L2wDdJ0tlHgmNuRr4Py29xxeMfljVW7HTJWh/4tlZdHiC9t1BAxJ1dQG0QNELTDufz
         9fW9VB4n5g8XxHu966oDvQi4z2+iiBML+bzT2No0WAUnWOVjt9d70m6vOJpKCLc0SI+x
         nrd+EMa4klJz76oX/p/Q3eXwWZYJiYHMQRxe/4UzZ3yfgyKaL+pVSytRJLN8ZkTe+uVo
         TPhKKgUoq6g455KvNEat0OvtFXnZNrK+ldODzNwhtNWqFGax5qQbd96BqQlj7krU1i6S
         cBk09dZNMNG0dfMLmDzYmlleWJB3KCRgVZXAlzNX+vVyDNVPTYGbTd0ItmapguZ3i07g
         rUKw==
X-Gm-Message-State: AJIora9wtkxgzXg9OUFT1/4qIEtJE53RjFt0SYDAOqYj7oKa0znEa/OG
	Z7a5sc0L2l/eVgRn1VUSinKa0v3eYmo=
X-Google-Smtp-Source: 
 AGRyM1uELPXpXWOLAiYYIerfmdUAfJLMKJTwE7pBF8kymp3wVpuijI4cdGf9idPfy6RmFPJGpPH3hA==
X-Received: by 2002:a5d:668d:0:b0:21e:4934:2c06 with SMTP id
 l13-20020a5d668d000000b0021e49342c06mr2013641wru.431.1658316648738;
        Wed, 20 Jul 2022 04:30:48 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 h24-20020adfa4d8000000b0021d83eed0e9sm15565274wrb.30.2022.07.20.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 04:30:48 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] kernel.bbclass: Add shared_workdir_prepare task
Date: Wed, 20 Jul 2022 12:30:43 +0100
Message-Id: <20220720113043.196185-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 11:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168359

The task do_compile_kernelmodules runs after the shared_workdir and
is installing some files in STAGING_KERNEL_BUILDDIR, this can races
in other recipes that depends on "virtual/kernel:do_shared_workdir"
as the STAGING_KERNEL_BUILDDIR is not fully populated when the
shared_workdir task ends.

To address this issue a new task is added in place of the previows one
so the shared_workdir will run after the do_compile_kernelmodules and
the new shared_workdir_prepare will replce of the old shared_workdir.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/kernel.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5d2f17c3be..5558769c92 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -504,7 +504,8 @@ do_kernel_version_sanity_check() {
 	exit 0
 }
 
-addtask shared_workdir after do_compile before do_compile_kernelmodules
+addtask shared_workdir_prepare after do_compile before do_compile_kernelmodules
+addtask shared_workdir after do_compile_kernelmodules
 addtask shared_workdir_setscene
 
 do_shared_workdir_setscene () {
@@ -520,10 +521,16 @@ emit_depmod_pkgdata() {
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
 
-do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
 do_shared_workdir () {
 	cd ${B}
 
+	kerneldir=${STAGING_KERNEL_BUILDDIR}
+}
+
+do_shared_workdir_prepare[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
+do_shared_workdir_prepare () {
+	cd ${B}
+
 	kerneldir=${STAGING_KERNEL_BUILDDIR}
 	install -d $kerneldir
 
-- 
2.37.1


