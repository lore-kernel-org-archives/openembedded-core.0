Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB02EC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:03:15 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.11412.1645714994394644536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AP0ZNjnm;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id r13so4981508ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2igQqtKFPd0ece85L/Zdon9Lb9CNvc65Ka70ECtI2EU=;
        b=AP0ZNjnmvM7SRmIn0b5Xb9nSWwrr3HrWIWkrigFH326MoeC+7BFee/gBbVE5vEwAWu
         nvdn+5mFMemN1O87wy/6+5h2D3mh8fUYBlA8G3HikdSguW4OM6hdt2HTn8JMloj5i+fc
         bRiadnGxfPbP58K9IiaycrVZIQjP7auWFXA4sTYpmHgBd1WpU28Vj/C5npGBtgKYcMo1
         m9ydtqhcrzLycSQQyK7aEK2352GmT5Ppp7tuLYrekf/pKpglBvIvK+44z4uEN+ng7Do1
         PGEc8ODLGN0HALZI4tXroVcgWYu2ler981fZ+4hpnZww1hnCwHOgDKknyxO+4tahXULf
         JrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2igQqtKFPd0ece85L/Zdon9Lb9CNvc65Ka70ECtI2EU=;
        b=z6NVzosJxtdFKvgNVUTHGXIotbnnUR4AL8LwSJo3SouGMSD9o54/7CaRJuLnwPEpGM
         VQNYQxLCMUeH0GBNDGogD/9LsmCU6e0SKB5zdSS2SfMcVy+pYmY2S1lMJBOcL9e6yylm
         FNx20SB5O4jY7UkhxdzwbxUQN279oduJ3Gg8k6T4nOvbWjbNPJk278BZozz7YwoTtoUt
         k8Y4QpdRoSyUCNe/lcSyBBRbTb+KYbU0ndurXgbuKbfmAhY8iZJw7U+Qa4VdiT13EeVe
         dgvM/IcPPAdPlYH7QLiXakutaTsKVC4sON8sylV/giz1Jvpr0eX+SfnKiDCVl18othL8
         OBjA==
X-Gm-Message-State: AOAM531QkXCqrUpWOb+K07Y23n7WU+ov07nhG2arFYc1CCyxYAYickz2
	hfGxa/Pe6ilWosmFCMUoocdMYPAfNIg=
X-Google-Smtp-Source: 
 ABdhPJx/+fb3gSU/l3Y7l0jOmdcGr9YqOAIbiJeyiPJeWyqaw462/W5ITk1Dafu8exWkCvnDFEKWXQ==
X-Received: by 2002:a17:906:6c90:b0:6cd:37e6:2297 with SMTP id
 s16-20020a1709066c9000b006cd37e62297mr2660505ejr.507.1645714992961;
        Thu, 24 Feb 2022 07:03:12 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 z12sm1573173edb.77.2022.02.24.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:03:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] insane: use HOST_ variables,
 not TARGET_ to determine the cross system
Date: Thu, 24 Feb 2022 16:03:02 +0100
Message-Id: <20220224150302.1341776-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220224150302.1341776-1-alex@linutronix.de>
References: <20220224150302.1341776-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:03:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162318

Almost everywhere those are the same, except when making a cross toolchain
where HOST_ is where it's going to run, and TARGET_ is what it's going to
produce.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4fc3c06c64..890e865a8f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -325,8 +325,8 @@ def package_qa_check_arch(path,name,d, elf, messages):
     if not elf:
         return
 
-    target_os   = d.getVar('TARGET_OS')
-    target_arch = d.getVar('TARGET_ARCH')
+    target_os   = d.getVar('HOST_OS')
+    target_arch = d.getVar('HOST_ARCH')
     provides = d.getVar('PROVIDES')
     bpn = d.getVar('BPN')
 
@@ -691,8 +691,8 @@ def prepopulate_objdump_p(elf, d):
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, package, d):
     #if this will throw an exception, then fix the dict above
-    target_os   = d.getVar('TARGET_OS')
-    target_arch = d.getVar('TARGET_ARCH')
+    target_os   = d.getVar('HOST_OS')
+    target_arch = d.getVar('HOST_ARCH')
 
     warnings = {}
     errors = {}
-- 
2.20.1


