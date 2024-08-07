Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461F9C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:40 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.36789.1723045419038157025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=m5aWOHm2;
 spf=pass (domain: baylibre.com, ip: 209.85.160.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4519383592aso22741cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045418; x=1723650218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/ByShdq0QZDilTce0fRGW/+hm//Ql6/wBKOfFJ9PDM=;
        b=m5aWOHm2Cscz3oeSmx9UURcM+m/lbhQDpGotzSuzLuj/Jt84juXP7ruQmUBlAn8fLn
         MyCLHGNZ2TTPdrL/cd/XO2REFrZbxlJpxHTwIgho+SFjsoEIye5xqJXiWgsJdpBKmZj1
         zTfaRecIgqQZSL2Gr0nTu5VZFB1FvUJe33k/TEgVihhTKQzdBgu2m/lcA1gpOLKU2VVE
         rCmu5DDerpgI6OwgUCpXVmH12hr7FknvY9ZfSr1zZ7ng6jDcIUngOKJu/rC44mfNn/3b
         Deyt2tThF44bVwaJVGu14kiIxwdOc6h6wfqfNeWrrxi5IqMAgiBqzdkx7gt2Tdz06uNs
         /94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045418; x=1723650218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/ByShdq0QZDilTce0fRGW/+hm//Ql6/wBKOfFJ9PDM=;
        b=p+5/PQAG7HsMWfJX3TAkCE17XkV9ks1D71g/D6u9YFSWw3LjzBgGAM5+Op9t98zP3C
         27rIiyhwEwuZujkwK5TaYM1oZ7ab/GE/Egv4meMlsMWwsEeFt2WLqfbrY1YBmMk1NfvW
         WY9Oqo0Otvms+zxIOGe12EvC9tjkGUB8FQBUs1cO/J3kmmDxSTaTsDDBU+cfMZyHc5ui
         BkgQAB5gN644nENSup410obj1NqZ5ugfdy2RJoAiRz4sA+Iwh9HaznlzfppY8PLmmu2d
         1PO41B58lXiGZdvej9t8akqiIk0/Kxxp7e8SQPBd2jYYoW2Am5lxMpk1miOdSV7ji9Sc
         DpIg==
X-Gm-Message-State: AOJu0YzHh/pjgpBu+ZSkv6v0fT7gCvW2PT5LLwxENhGv7RfU/tDoh4RD
	bIZVjEeWaZfng0rEr7pW9vA0PIvavbPoo9HQTmoofW7OBfP/zC6Ro7QWSgs3UFTm+bsrJr+5CIl
	2
X-Google-Smtp-Source: AGHT+IGe354nkvCisv8GvZ1Vrxea7HLs84oT/QfiXcbonEMGlGzbIOZVSe6atqi5Q+crBidIafXIIA==
X-Received: by 2002:a05:622a:1190:b0:446:41cb:b1d9 with SMTP id d75a77b69052e-451892205f7mr196739801cf.20.1723045417908;
        Wed, 07 Aug 2024 08:43:37 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 2/9] python3-hypothesis: upgrade 6.108.4 -> 6.108.10
Date: Wed,  7 Aug 2024 11:43:26 -0400
Message-Id: <20240807154333.533180-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203081

Changelog: https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...on3-hypothesis_6.108.4.bb => python3-hypothesis_6.108.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.108.4.bb => python3-hypothesis_6.108.10.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.108.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.108.10.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.108.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.108.10.bb
index c2dcefcb67..ebb82dfd79 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.108.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.108.10.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "bab99a308ea39be53882f1d89ab77db48e0c03b5c37fbedd2f59f9b656ada301"
+SRC_URI[sha256sum] = "8d8b3a57f27bd964b04e58c5731ab9862134fbb5511958c814aaca3120286f28"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


