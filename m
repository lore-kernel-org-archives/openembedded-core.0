Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8F0C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 21:37:15 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.3962.1708033027470270625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 13:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Sl+pQm0O;
 spf=pass (domain: baylibre.com, ip: 209.85.221.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4c0232861afso397550e0c.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 13:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708033026; x=1708637826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDiONfPaQ0Cl7W6Qjcn9KhFejvm8VYAL8JFYQaYB4XY=;
        b=Sl+pQm0OUoctNAx4LB1w02Sd6LibS4pUHPNVg5Nbej526T91iiX8UKXDpBdLKxAyd1
         57Yf3u/gvfaP57pqkmZUAvelS10n0aaUKPsbTBcYN5fFPzF4wKunT5724gFbccizkzVX
         a5/hOjfTUnMy1iimCwmcMkoA4gwE7gsvHKUPWzP9rc+o0koZtCApZ0t+TH10Cz+XCJcn
         rfvBd/Z8C6r0kqST4jguLYVWF8x2jczo2gs/ZOtekWMZNRfRBuHxZsy80Ksu1MLU1vaw
         hWAdG3LuncC3SlD6X240N/jnhIIqSNv5JR7J27o0a2PK0ewysOIlsJ2F91yv2316VXkN
         Y3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708033026; x=1708637826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDiONfPaQ0Cl7W6Qjcn9KhFejvm8VYAL8JFYQaYB4XY=;
        b=AqD1w0be3UUwnW9mu5jsFHsGc88dlljoQ0rHHW/TFUH0K1i44+jYmGAZesiiCYPxMo
         +2P9tXAOoeQFwn4J/mX6mMiYpqGvY72EC3w4jcVVddIglgOG9laz7+fErjvBU1iFXxZK
         60us3LTiXqhQ68KLGGcoeFfLXqRE454X4Q7/6l+jrbT6wZZ7wtwV4VFpqwB2DnjR7b0O
         KpyzuSNUhyEpzYAdJoW6LKG/OJiAjn7Z2dxTJeXzTYWvdvgv0dV+gNEsBbyDx8ZSeBwy
         zfnfK5kCyBD968dZnS/SpoH52/zhjJD2uG1erS7ImfwM8C49j2wcIz7uUZ4eODkvf/1q
         CDFQ==
X-Gm-Message-State: AOJu0YxMPwkxMFqiJEdzjr/fY9udOeS8gjxea3b9Xap5SxhWhLht/OGx
	roL6UfzViOB8jSA1es+2XFbq18IMoBglK7J2RdMeff2g3MoD8G9nXYn84cX6vhAEFPKAdM6X1tU
	O
X-Google-Smtp-Source: AGHT+IGBcE9JUL/XXv30cEguMDnxN9Q68kKXxS3vWKPArF/fq0CYVWCCBmQLkUO0YnCjIBySuKfHhg==
X-Received: by 2002:a1f:e744:0:b0:4c0:2416:6fc2 with SMTP id e65-20020a1fe744000000b004c024166fc2mr2820204vkh.5.1708033026280;
        Thu, 15 Feb 2024 13:37:06 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id na4-20020a0562142d4400b0068ef8c3a138sm1064410qvb.9.2024.02.15.13.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:37:06 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: use Message-ID directly
Date: Thu, 15 Feb 2024 16:37:05 -0500
Message-ID: <20240215213705.3315438-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 21:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195705

There's no need to use regex for extracting the Message-ID field from
the patch email and mangle it by removing the angle brackets in the
process. Pull it directly from the mbox so that Patchtest's replies have
even fewer differences when compared to other replies. Also add a TODO
so that it's clear this needs adjustment when full series support is
added.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 8190fe86c32..8a3dadbd111 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -65,7 +65,9 @@ subject_line = f"Patchtest results for {mbox_subject}"
 reply_address = mbox[0]['from']
 
 # extract the message ID and use that as the in-reply-to address
-in_reply_to = re.findall("<(.*)>", mbox[0]['Message-ID'])[0]
+# TODO: This will need to change again when patchtest can handle a whole
+# series at once
+in_reply_to = mbox[0]['Message-ID']
 
 # the address the results email is sent from
 from_address = "patchtest@automation.yoctoproject.org"
-- 
2.43.0


