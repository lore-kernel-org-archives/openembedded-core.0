Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B87C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 08:23:45 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9190.1699431822943506837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 00:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3nGuXj/;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-543923af573so11202283a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 00:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699431821; x=1700036621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ3Jc5SdrSm8khRouHy3n47v3FhdlHUqzPAEUcljLyg=;
        b=X3nGuXj/Bl86RXX/5ZJowdLARamBsf5HCAKsy27Oiv5a45Ymo0++0k6eWsfjC5VVJq
         KN/6+Nw79Phs7bJUiZ+t0Ztr5w2Hf5scJitZ/KbTxPP8jOiO1LBg1lhV0ze2a+Zc4bHf
         swohT5/DhJR0sF9DBVVSb6kW1avnKvTaBBQIj795KmjNlHCwJ6cpBSu5FR3nmTmU0wIA
         1mTvdIsxvavIgFMKmdl+tGiSfSFYGOle6Zq2KahcoMn0bIcCTwqgXIklN8trw8muMK2m
         FTafOmpESFAsnT0Ju5Ib/Sq44VOqBPHxJo2xoD5KHN+SFHexqhbtZ6P+9XHAJ3fFl3ca
         qzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699431821; x=1700036621;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQ3Jc5SdrSm8khRouHy3n47v3FhdlHUqzPAEUcljLyg=;
        b=XtljRcqF/A0rzxrgremq7hmI2+lmC3tZiBhJPOv3A+avri6r1xlQqgrn3WHLoohBbG
         SzP5cAtazdcNi7uMtEUqraorj1i+bTxTdy1wiVTyNmT2xmPJe6n9hErWoqaLwt3xdh43
         Qav3Nl5s2hq6W71FlyK5vB3x51+z68MPIueXmvpBHQ2qzc9SlhyPRnRrKchTtqxKKD/G
         pC+ogcZXzq4FXd4qmACbbQigccqslExR6ZsMlmK3BuqC2DbfxTDQh7x/Q+A/LDBSdiff
         9XtjyRM0QtwVIPt/0+impgNSwo/cStPDPO7uCh0qyoTfsy7PdjsB7q3GXz7mkR/71MUP
         /qog==
X-Gm-Message-State: AOJu0Yx7hUhtxG5UNiLIgcbX1aSW+D+1/YtUq7bguuiSJTtULbO6v6je
	U2KuQhOcvEb1t0IWQvJcVcKQIgi0Wp4=
X-Google-Smtp-Source: AGHT+IE35wdOyPCulTBLojQ+WWMs5xZAWX9+Pv33mLWdmOyYiy6o4zQhTcF27t9QFDHfPS3AU6HX0w==
X-Received: by 2002:a17:906:2cd3:b0:9e3:fe08:27b1 with SMTP id r19-20020a1709062cd300b009e3fe0827b1mr207369ejr.73.1699431820984;
        Wed, 08 Nov 2023 00:23:40 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906359400b0098f33157e7dsm655026ejb.82.2023.11.08.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 00:23:40 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] lib/bblayers/setupwriters/oe-setup-layers.py: Fix indentation
Date: Wed,  8 Nov 2023 09:22:30 +0100
Message-ID: <20231108082229.640-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 08:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190306

From: Jermain Horsman <jermain.horsman@nedap.com>

The writer always printed the script was written even if this
was not the case when specififying '--json-only'.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/bblayers/setupwriters/oe-setup-layers.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index d5bc19a8cb..bd71ca1f51 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -45,7 +45,7 @@ class OeSetupLayersWriter():
         logger.info('Created {}.json'.format(output))
         if not args.json_only:
             self._write_python(os.path.join(os.path.dirname(__file__),'../../../../scripts/oe-setup-layers'), output)
-        logger.info('Created {}'.format(output))
+            logger.info('Created {}'.format(output))
 
     def register_arguments(self, parser):
         parser.add_argument('--json-only', action='store_true',
-- 
2.42.0.windows.2


