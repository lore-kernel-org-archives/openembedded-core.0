Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010D4C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.16187.1672594996021258153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wCel3hca;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id jn22so27125498plb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CawwWhdw4ntqYtSIUtXDEFLGFcI+kkkzbxbyFGuPnI=;
        b=wCel3hcafLWLT39I9S5cWpmCU1ch+zVRvockWcowrFUAgM2s4rztyLe3Ck39VWbMwY
         BPb1rhPLMVfqAgl/Y6SasOY8cKH+2K29MBtKCqk14vDdbNcAIneGFO0YwLqfkemNS1Pt
         8b5u5+n5s8rMOw8TxA2xF2HrGcA0Xk4OGEa2OiOprjy3w43CcXkYmEuEj7XrbgKGqcTt
         dCzcjBAfL5Dord7FImpdZK3SS6v1yqZGP72B8CxbgItXMP9DND44jI/g24zP28z//yw6
         CpBX8s0GTYcjDWLikuRCMCksNo+PylU2ADY9cY94xNjUcTU0AXRlB0PLIiND1+UPUDsO
         CYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CawwWhdw4ntqYtSIUtXDEFLGFcI+kkkzbxbyFGuPnI=;
        b=fPHiwg0xIgdZR54Ua3qIBWit0qtNlY0hprJ8uRIenmcP0BrzbLkQOpv/PvpIiTaRGV
         Btz8e/SWWa9NygqT5SCu9Vho8AZvCXhXLUjLD8ovqdK5RvfkBhTGDAF7FFSNGzDn7LGc
         vR3X3NtxCzDLj1QHUNpnoV5XuAcc2KJVNGn55cQyrJLlmWKx12oouAf+vW7mFoRFe7eY
         GFUwqo0NQqpan6B3T5YyqrqL+Ua5tsJhyZmAfosqw6EYeQGgyspyimEGkPzQtfMqvWrQ
         TaFGaIsiQfMx/hmdLKqYkIjjbV/m2+tekT9ywI4tH8aOTkY0WtKILcC3qCT9iNrfHvB3
         EJPA==
X-Gm-Message-State: AFqh2krGf98/vPCQEli5J93sBv9RluI2dBdv+7SONXFQyO4IGatBI2w2
	PSV1BMsfKyERHbBAN/oqzkIGcB3m7stYIbW1nvc=
X-Google-Smtp-Source: AMrXdXsyZdJvl7+3AZGqvpIiyS1zK442gisgPOkMMlj+i5zCYwoijYzur2DToTPxufS7d1EMR77x4A==
X-Received: by 2002:a17:902:d355:b0:189:7e2f:d64c with SMTP id l21-20020a170902d35500b001897e2fd64cmr64475063plk.55.1672594995089;
        Sun, 01 Jan 2023 09:43:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/18] bc: extend to nativesdk
Date: Sun,  1 Jan 2023 07:42:30 -1000
Message-Id: <8b107bfc3ac8ef89b32665126d10d02d42ba305c.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175232

From: Chen Qi <Qi.Chen@windriver.com>

bc is needed for compiling kernel modules, more specifially
whenr running `make scripts prepare'.

In linux-yocto.inc, we have bc-native in DEPENDS. But we will
need nativesdk-bc in case we compile a kernel module inside
SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 95b5c89066baccb1e64bfba7d9a66feeeb086da9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index ff3e8f4409..8ed10d14c2 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -32,4 +32,4 @@ do_compile_prepend() {
 ALTERNATIVE_${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


