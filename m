Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E95C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.30962.1668892581536394507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U2f585qc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id q9so8047319pfg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HiQy1GKfxtky/g/xoT1NAKewvG4qKjBYP7fAvx1pAM=;
        b=U2f585qcxqR/n7x9tav2ZE7Z4amssHiwwxDOfYIJhc4Wtu11pIa22+7JsuDsJ2mKRD
         TDZBK2i2bGBtNcUxT9SRHf21+ewn174Qym3ntHUnsM56G2nhjy5qI0wyP6ZHGtLm2bQ3
         HxK1BqL0glt2Kl5VBUi0ReIVxEUrF7qQCLrSwMv6av2dWRu8k12MGwMntfazKun/7Gkp
         r+G3Ei0/3v0XKtB+m7ajTg/GpqbrWn52wEtkJ7XQ+rywfl9jzoTBptnpwj11csu+1lrO
         G0j0LvYW3c45EdHhy1vHv32zmyvJBxWdKUHk4YfH7WA/EeNkDd4boYJsoBtEZeaX1Tlm
         r5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HiQy1GKfxtky/g/xoT1NAKewvG4qKjBYP7fAvx1pAM=;
        b=kbpHy+ZF80Z6Pnz+ewqTOc1jHkqzNJBszVL/TzEal8M6xapnp3djknVcnqlgcQG+AJ
         sVVse9mQBTNeTTktG0tDaVFnZCX6jE0I95jPOCHVj/u/KN0RlmNcK+akroocU4D4UfLj
         Tes/wJzu/FuAhWoR72cZNiZ/1xjLMRWUongfIZLZS+24G0uVXdZDCyjg3F+kZ8O3Q9ab
         5zizymwO15pEExLMEVa4pv1Ky/I5KdLcSPraK4QAe4lJZMMZDwezfbGJkcDlyFe5GN/J
         fkAcR0fZlenqibxHQSFGqLWWJqp0K3+3uG8/AwPx+zYmg9VLWNbK1maK1U5tMY5jhLfi
         0QzQ==
X-Gm-Message-State: ANoB5pljl5AvGDEcfbZyNM2NLLIFu/KTs5Pae/iHEtHl6ezx0yUEHo2C
	wMN+LmOdezZq/T31LfWlCmnpDCN7hwb0+qidbTA=
X-Google-Smtp-Source: AA0mqf7cRrgZawERCxoYH8BAgxT/AFB/y52bPwxIT6eEs0JBDpcBbzGGDTqZKTdfzon9R74T4AXWGQ==
X-Received: by 2002:a63:461d:0:b0:456:d859:2143 with SMTP id t29-20020a63461d000000b00456d8592143mr11889081pga.396.1668892580629;
        Sat, 19 Nov 2022 13:16:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 31/35] gcc-shared-source: Fix source date epoch handling
Date: Sat, 19 Nov 2022 11:15:10 -1000
Message-Id: <2c14f7d70737636f24a044b353e171662113cea0.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173571

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The source date epoch for gcc isn't being transferred from the shared
workdir to the current WORKDIR for the specific recipe. This results in
the clamping code within sstate.bbclass using a value from 2011 which
changes the timestamps of many files. Since this happens part way
through the build, if pieces of gcc haven't built, or build/rebuild
later, we see things rebuilding when they should not and for generated
files, races are possible.

Fix this by copying the SDE from the shared workdir into the recipe
workdir.

[YOCTO #14953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b996293b4c8ab7ff3ed852045d17290df29205df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..cd2e341099 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -9,3 +9,13 @@ SRC_URI = ""
 
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+do_deploy_source_date_epoch[depends] += "gcc-source-${PV}:do_deploy_source_date_epoch"
+
+# Copy the SDE from the shared workdir to the recipe workdir
+do_deploy_source_date_epoch () {
+	sde_file=${SDE_FILE}
+	sde_file=${sde_file#${WORKDIR}/}
+	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
+	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
+	cp -p ${S}/../$sde_file ${SDE_FILE}
+}
-- 
2.25.1


