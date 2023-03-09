Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F56C7618E
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.16123.1678375210112749934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l2RnCEVj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id g3so2242625wri.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFlkNPPNfmqqGhJIkh0rDDMddgghrcqGAQE2i/rPv34=;
        b=l2RnCEVjSkpfgkd1vC88WMAOkzgPCk4BWT/+jeLqUGFOa1nn0jTgYfB3R3cTxNg3S8
         lCgcXYy7dypwLINchKneq2W4TC7ab7GAPCZiRCl1e4pk5MynMQygp3qBJDv1jUqABh/t
         szaINeGGv2IONl2t0eZocoJSzzq08PtWrTxyFl7PWtVfx5ESmNrcd05/vVeE2e3T1Q59
         qULPQL2HncX5FcBBIo6QGKZt5HUlYLGb5JhuBqf5w1Y7/BXhnEl54XJ27TAv1FVeHxzg
         gNblmTfHUkCLSdB5L/NA47R6ca1zdeMhoW/6piHZT9PNuRxfZ8M2wY2FUXUgUzd+MSE8
         HzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFlkNPPNfmqqGhJIkh0rDDMddgghrcqGAQE2i/rPv34=;
        b=XaJ5MySeYC7WggU8RqzNYAlu1kUfyp07J4Jvqa+tWrF5eELpM/ddUJ4d+9GtxsVWk7
         CEYo5hjIi7dfvAf8zF6/5DOXZLPnJEB33lTlFH7jF4TrBQ9G9JrChpl9GwDENVhxDWMB
         Jeu9LDone25RodHnZKxmXYDyP6HyZqTcrHeO/zsABSs3ptcDAdIbh/vSAbhMRsAu7mE3
         x0saPVu1/EU8cLDp/kLli4hsS/sYsSM4mjuuZ0FQKZDc7DL7DgwCh5cJCRrOyMIqbXfe
         4Yp0EpafSlJ8hh0YZjs4o7NF442uplMAR89zeW11XcgNZ+vrohmn6Z87lRnnY/VBHOTd
         04Lw==
X-Gm-Message-State: AO0yUKUL6hxatpn5LTukhIayocENGi0yIFjbikwKM0s0UhMqAMM+vAQL
	T8YlGL2BzHE+yEaartJvtLNbCXlY65Y=
X-Google-Smtp-Source: AK7set9iW4dn3NfczFG9NgY4nc1lZQZ2xRUQQ//IBqADtcrG1bOTqo91nbXKdi2T2AYNnCtyz0tvSA==
X-Received: by 2002:adf:f7c4:0:b0:2c8:60de:c849 with SMTP id a4-20020adff7c4000000b002c860dec849mr16154032wrq.22.1678375213807;
        Thu, 09 Mar 2023 07:20:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/26] vte: upgrade 0.70.2 -> 0.70.3
Date: Thu,  9 Mar 2023 16:19:50 +0100
Message-Id: <20230309151958.3619193-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178242

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vte/{vte_0.70.2.bb => vte_0.70.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.70.2.bb => vte_0.70.3.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-support/vte/vte_0.70.3.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.70.2.bb
rename to meta/recipes-support/vte/vte_0.70.3.bb
index 001f413c19..6da76a3053 100644
--- a/meta/recipes-support/vte/vte_0.70.2.bb
+++ b/meta/recipes-support/vte/vte_0.70.3.bb
@@ -22,7 +22,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch"
-SRC_URI[archive.sha256sum] = "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
+SRC_URI[archive.sha256sum] = "9457134a02f3157fca04f7e0d39bdb0f3099be0a3ce82b7139d0c98a80748f23"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2


