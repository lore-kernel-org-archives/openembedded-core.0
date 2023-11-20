Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305AAC5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:43 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.637.1700498377239639714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wNuDUB9f;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b2f4a5ccebso3198716b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498376; x=1701103176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CG+uNEliWPJJewp5+jR5tN6xV3766+phub5FNT/t2Y8=;
        b=wNuDUB9fSC9IUS8c7AoVlVHoBui7VMqwiyze0dQv+APirYXOxlUAzEvC/yqzv2+Bwy
         ogJB0Hw7dDwlrqzA9OKpp9XPnkpN+G52UCsz2cawNYcqQsR+uZO1gkFls+ZknjmDZwYR
         ZKxMpTIuQuwfheFOWr4leXkNHq5ve1UPpEQJSyKFhOmlb4BJ73fBDQBgpOkYREU+Ahn1
         bVANB2tR2Sus5vY+/xMGzMPPJSh4cRbUPO4lBDzKLj2mv+LU5X21g2MV4HWKYEB8CfDg
         yBaeAVdjhDqcKTY0SQPsyWm5V1nzdWPmwj4qArC76KmzGmJUoEQK64n+xvwz45RNI+hJ
         2Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498376; x=1701103176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG+uNEliWPJJewp5+jR5tN6xV3766+phub5FNT/t2Y8=;
        b=I8EGZRjplaStgtyKlz6yLu8//TMIbm5DE2XSMc4ivIhzRknHcvBK3TaCk38CiAGydQ
         3QxvpnXcdRcXylc1wK/aaPEYeOX/GstCmDBtU4ClHaAFygXH1/HnAVO2V2Gyg2oPwzHo
         2HcsUbVLdL3Th2Hbup+wX2/IzMV0IlncyILN94NJUDDuZuTHM6B3BJSEmTXIceaYjd9o
         leHHdC+i9Bmfz7ZKXMzyagwVOl/XtdIVtQVuG2CpX/pAuY+ZDiMdz31Owi3zCS31MsPH
         b9CXOphVPiNPx68+F59HgfG7dKNDQHPz5Dj1zIsw+LVPk52PaZW0WwG3+9MfAqmhi1n7
         vilQ==
X-Gm-Message-State: AOJu0YzbZUCf7ts4LyanSr4De6RqGQOcOxSaW/Om6fFDvXFlC50pHxOP
	/NPf4B3eNeoQc3HZcP3UgfK2aoxRxM6X/tOhWPLVGw==
X-Google-Smtp-Source: AGHT+IG1s8EAxgvXUI5GVzq+4K7Lw8TXjoY9ygt05azzycRrPMmAfvudccv7VHpkn3Y2YULq7T4CGw==
X-Received: by 2002:a05:6808:1448:b0:3b2:e32f:fddd with SMTP id x8-20020a056808144800b003b2e32ffdddmr10452467oiv.43.1700498376107;
        Mon, 20 Nov 2023 08:39:36 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 21/33] patchtest-send-results: improve subject line
Date: Mon, 20 Nov 2023 06:38:35 -1000
Message-Id: <dad633385eb8c80852b2105f732002e2de75fd28.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190910

From: Trevor Gamblin <tgamblin@baylibre.com>

Pull the actual email's subject line from the .mbox file and use that in
patchtest's test results response, so that it's clearer which patch it
is replying to.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98ca0b151517b3544454fd5c1656a2de631c4897)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/patchtest-send-results | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 15ee5b077f..bb4604aeaf 100755
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
2.34.1


