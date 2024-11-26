Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C21D6553B
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:07:04 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.52961.1732644421971755149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYUQOev/;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a7750318a2so23869375ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732644421; x=1733249221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuKMWSKoGSuis2izNfUj+gY1b+STsN6nwbmbFN4fGj0=;
        b=bYUQOev/0ybjDvQC5uT2/CqJDpNZhsTN2FvNzDcOp6uoH7T92UItcqa/hXM8YvwXIu
         b5+1TNZvh1f9jOeRIWf1rOq8u1KbQuWNjzcQOchLb9Escs9V+t44GbQoA9aFgP2K+e9i
         AohfOsTz4jmGTE75mfHHjU1jDgiUxvAF8O28bBOZOO/gGx4gD67A8ofgefdQEnitHzzE
         61P1BE8npBk6Cbz6WcrPsKo9+Hsc+HLQdbLTg0jh/ji3RjaJYzm/Z0813UNgS4+RA0W4
         dpVSlHY3bJv5WhO29JeENUBIJvjp4IgOEWW1glQT/IShaut8aKZQDTgf2vsMmsgarw3R
         euYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732644421; x=1733249221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuKMWSKoGSuis2izNfUj+gY1b+STsN6nwbmbFN4fGj0=;
        b=JfyxKZU+yrv6j/em4QRDm8R6TIaQav/jiI2eKQ4zNTfgBYr9Cmi3gkfG8lbepWzEOT
         olTnvcwWE+AVQE4hrhwn0O6huXAA9CVSjbD1VPXGKRdvFZDfNkN/60aN6D2ChZdFFDz5
         aYzI5BBGgMWByTN99zr60ocEMDfPDSQJklE21fBRuYe4iqK9a4uHJJT19dHV6b8ZhuHk
         AHRjkXrCvNu3sBWwIDXIgA3ML1S1VDDVKlfxdVInja79pS6BQmU/aLAHddgezm2X7G9v
         ns4Z6+1eeGdMFOVLcBVwZVzGDRrd7bkU78kXK80VVf0mimZw/QdBFQR1Jk8UaYUr17U6
         xonA==
X-Gm-Message-State: AOJu0YzrLMRMLbE9zlXRW5N1XHPHjD91pTZw/l1+wWYQn1kM56xF7e8B
	itkgEH6hsQEm2Q1Ygf4lVAtP/fHeu5bcJos6JZ9XizFiuA/RNV63VypIzQ==
X-Gm-Gg: ASbGncu5LbcpJLqEtvPRp3qA8NpJXI9lAfRqxWKrkIcYJeyoXGG/admVRu/cRimx5ne
	JlX1SLq7tYgQMYvIGaHQqvs81kDGm513i3epnn1jmq60RhoMLkvhHvsMDDLbUCdgBewfFVRPcMx
	orPyqzYHMn2SvMkIlAWuuZW32mqEEC9+2PrxkU7JlFNBalKe2yQ0JAE8SHcl6l/L0LRms6fDRnJ
	CxE4QxLxbrAbRtnuOEtMyk4OlLwkfRGFFDo4eQoop9RiDbfgsy1VTVqhG8nIzeuqDFY3v09hWQu
	huwrig==
X-Google-Smtp-Source: AGHT+IHajDzZIOrwHlp1Ft5g0C7MIVEfKhWYfhuHGzoz8EiXUSwHEmTsc6br4H1TQyj56VJCjlwSKw==
X-Received: by 2002:a05:6e02:13a6:b0:3a7:4674:d637 with SMTP id e9e14a558f8ab-3a7c55259a8mr297015ab.3.1732644420201;
        Tue, 26 Nov 2024 10:07:00 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1de859f85sm2251899173.30.2024.11.26.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 10:06:59 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH v4 1/2] python3: do not overwrite FILES contents
Date: Tue, 26 Nov 2024 12:06:41 -0600
Message-ID: <20241126180642.2022572-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CANNYZj98i-RU060Hjxx3PgX6guCvfkzY5-_mE78-yVwz4Ks5ug@mail.gmail.com>
References: <CANNYZj98i-RU060Hjxx3PgX6guCvfkzY5-_mE78-yVwz4Ks5ug@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 18:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207879

From: Dan McGregor <dan.mcgregor@usask.ca>

Instead of relying completely on the python packaging manifest,
allow some default values. This is useful for the edge cases that
can't be found automatically by the create_manifest step.

In particular, tkinter can't be built for python3-native, so its
consistently missed in manifest updates.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/python/python3_3.13.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
index 8db5b813738..fd926811a74 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -360,7 +360,6 @@ python(){
             newpackages.append(pypackage)
 
         # "Build" python's manifest FILES, RDEPENDS and SUMMARY
-        d.setVar('FILES:' + pypackage, '')
         for value in python_manifest[key]['files']:
             d.appendVar('FILES:' + pypackage, ' ' + value)
 
-- 
2.47.0


