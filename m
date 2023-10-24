Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46227C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:14:59 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.17670.1698153291140084662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 06:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0Zjooy4p;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-66d76904928so29247446d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698153290; x=1698758090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnB5GmUrFl0Db23rKLUrrls7NHC+H5lnSFVd4pev9vM=;
        b=0Zjooy4pCo/1n9AzkLcxRJIMoFFlF5v+dDrqZCyxgGyueh3R4w6Y5hu5dyvADzUqAY
         /WD6XNL3q4Khy702U4vs1FziADdaocvnE+yqt4cabkV2GyOkW73o6ZoOzdHD5oyK2LBz
         tWcbOOREyCEw+SmaoFcYMFvCuGcffuMK0IxboyRLDKij0+AgPkTsfH8NNkXU1ac2hKf5
         3lCrIlrnx1u6DTzpi92U8aynPTJqXtaBLNFqJRqmrArXwdlrmN/xszxU7hELyiZaqCPI
         hX3tzR8Lm4Cihejzyz7/Q1n+D+dcKz84DTFvo+TX26U24l+7NeJ+meNdmEF3TJBHaSnz
         aDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698153290; x=1698758090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnB5GmUrFl0Db23rKLUrrls7NHC+H5lnSFVd4pev9vM=;
        b=TjgTcwCnxA1lSarHKfg8L5Ewdfgk8tqVWFQaTnbrnft15jwjTGvf+HGVh35w5B7Pl/
         cryYv6AAQa4K8Jqsz18sWghyWuCY0Q4jQ9V3nmIlKALs+cf0nN302Wq7662uPYWCGJ0r
         ALeeQNqoOQmbVo4dyQOVKlbdmxC41lEK7SJs2VcpKGvF1+0jUeMRap/KGAoKibIst0rn
         UZHVG0PkCZ1L56QHL87wugko6/v6lVflsp46jR8SyzQg7tGaB3Vf0eL1WaAb8ssnYcTm
         zGXwLvUo3UiDtnjkWofolB3rAxxdHAAclxa8bHjj5nstpyoGPr7nf5pkPXBYhngKXwvR
         cn8Q==
X-Gm-Message-State: AOJu0Yz4N/b7U2mfCev1FBHvGXEIDbg2XqU+IcD8EeYrh/8G1HkV14vP
	F+i42D2lOzenHj88rT2sEiiyH5Ut7XYnWYY5yko=
X-Google-Smtp-Source: AGHT+IEJwXJ5ZnME323wo8TeW3Li13R9siYDV5WZug9/T/IqhZj9K0x0ns7IIXU7CdavAiRaJVbMOQ==
X-Received: by 2002:a05:6214:c81:b0:66d:9e52:a431 with SMTP id r1-20020a0562140c8100b0066d9e52a431mr11186809qvr.3.1698153289997;
        Tue, 24 Oct 2023 06:14:49 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id bu7-20020ad455e7000000b0066d1540f9ecsm3645638qvb.77.2023.10.24.06.14.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:14:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: improve subject line
Date: Tue, 24 Oct 2023 09:14:48 -0400
Message-ID: <20231024131448.63649-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189645

Pull the actual email's subject line from the .mbox file and use that in
patchtest's test results response, so that it's clearer which patch it
is replying to.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 15ee5b077fc..bb4604aeaf1 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -53,7 +53,12 @@ with open(result_file, "r") as f:
     testresult = f.read()
 
 reply_contents = greeting + testresult + suggestions
-subject_line = f"Patchtest results for {result_basename}"
+
+# we know these patch files will only contain a single patch, so only
+# worry about the first element for getting the subject
+mbox = mailbox.mbox(args.patch)
+mbox_subject = mbox[0]['subject']
+subject_line = f"Patchtest results for {mbox_subject}"
 
 if "FAIL" in testresult:
     ses_client = boto3.client('ses', region_name='us-west-2')
-- 
2.41.0


