Return-Path: <aj.bagwell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA72CEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:32:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.37258.1688988729074126659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 04:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Bu9v9iYK;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d20548adso4375104f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 04:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688988727; x=1691580727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8Lnp9eRgLvTXKKEgZMlRcXvGZr3KGvfz5JjpG6cSnU=;
        b=Bu9v9iYKr0ZB9F7LEPwgS1llmYG4FjrMp2Pb+UBijRAflJMCmPY4Rn/1CTYkWCWdE9
         5du7EAfo/DMk/VD1tqnv/SvNNIiHH01reRY9BSbnqoIuDInxRLDK/7byhQUDxEanDUtQ
         UizpSlE3eQ7O7Y+9oyHZYQ7D9HIIy2srnpIqm7zm8pQqmdudvmNzDGFiHOpGePbOHTFI
         Lfp7l9dG4QlMd2Ol+blxVqjRAPOj+CR/1z1yq5bll7cAMWFIZ70xZSrSrl+5idLf9ete
         cOjTQdkWOucYW9TtNqrz84WVE6oZJX29WPyfXkjDMdzFjN6wA1mjTPNY7o7XFF8og+gp
         hEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688988727; x=1691580727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8Lnp9eRgLvTXKKEgZMlRcXvGZr3KGvfz5JjpG6cSnU=;
        b=EWqEmGzUT9f1xeYMp1YO6evZMjCCimNeANYmAccA4T37nTjsxwia9Rao6tmdcWvzRF
         HintxgOFQJNuE/4Plw8vIef8iELRoH4D44NqM9+rdWKEr15iBWuxu8N8nYI/CzACFrvZ
         X4EpZ3vpGuqbkmghAxPYUgxMr58872MOP0DVr114K0DujBS+4o3rrhntGnV8+UGnYbKu
         rGfCxagfi4E7cyzCjAcRVOdsnwtJdpFi9wxjXlX7xZIHKShn8hU405HnNkf/N80HjGTD
         vb126htztXbf+8hP6C9QXPnWjGFwJ5DMHmSyYzMX3cVJiS0tk696VkWRw8RZBd5pBDo6
         NWFQ==
X-Gm-Message-State: ABy/qLZ2wP/STpz4e+ldATatEsC0yKfrEQwYTzp85xaUe/kW6hlOwDbp
	/ey20rVjM99qN07icSr9T73s42GucGY=
X-Google-Smtp-Source: APBJJlEtuSssJxXWIk7GG4tZnTbgMviTLmhovb+xdt7ORIcksnA4jmoEnG0ra6NOLtl007jKhhky2Q==
X-Received: by 2002:a5d:408b:0:b0:314:1ddc:ecbd with SMTP id o11-20020a5d408b000000b003141ddcecbdmr10521588wrp.18.1688988727017;
        Mon, 10 Jul 2023 04:32:07 -0700 (PDT)
Received: from CMM-C02QQ1FQG8WL.cable.virginm.net (cpc92720-cmbg20-2-0-cust203.5-4.cable.virginm.net. [82.21.82.204])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d5147000000b0030fb828511csm11398106wrt.100.2023.07.10.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 04:32:06 -0700 (PDT)
From: AJ Bagwell <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-core@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [dunfell][PATCH] kernel-fitimage: fix fitimage for dtbo overlays
Date: Mon, 10 Jul 2023 12:31:47 +0100
Message-Id: <20230710113147.63642-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 11:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184072

The commit 42a4f98ab5 "kernel-fitimage: adding support for Initramfs
bundle and u-boot script" added a parameter to
fitimage_emit_section_config for bootscr_line but forgot to add in a
value for it in one call.

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index b88d7dbe4b..3b75979b46 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -519,7 +519,7 @@ fitimage_assemble() {
 		for DTB in ${DTBS}; do
 			dtb_ext=${DTB##*.}
 			if [ "${dtb_ext}" = "dtbo" ]; then
-				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "" "`expr ${i} = ${dtbcount}`"
 			else
 				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
 			fi
-- 
2.37.1 (Apple Git-137.1)


