Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B5CD2E9E9
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:16:49 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.59035.1731331004988278791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 05:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rnVU74Oi;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53c78ebe580so6051727e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731331003; x=1731935803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUowtZMviGnvKU0Go8gaKnoKt3IXYBjixhTKUFgokzI=;
        b=rnVU74OiV5QeKGRud7wOb9SVifFLRZRLj6DmXwWEqJN+4Jfixy7ThCeUVuSiD0LGhP
         WxvXYfSFiRMBqGJU8eZOsAuEYR+RyLchDZ8i9R2hHOP2AS827/W0A/0mF3YcPkMiPbwS
         sZfJan+Tccl1ZAQKb7xRWEUSfO+q/dFPtvz1VJef2dDUBrB6WkA+/S9Y0a9seW+Ak3AO
         fV/oEIZMK9AzfefIS+Z5Lt+x/NtIPng9bAIhiwMifWZo4gxIB8XuZ8d3bMKgskVMI2ci
         WaKzwQmHVzDLHKQbe7FfCIpZ6ql1j++SFb4buqLca/0DkeJbXXDzOgzqL2NBHlHDYSJ3
         v2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331003; x=1731935803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUowtZMviGnvKU0Go8gaKnoKt3IXYBjixhTKUFgokzI=;
        b=wOw3eEEqYWYmLcevRvAUVFROR6+NRcxxWkacHqXrCxVk1IRPvRmBcNyeZB2WBR+wU+
         92h5xSmJQt5NF9wNbj06omy4+Piixcum6FmE+yGkyS1+gsZQjRbQ3kKHnqM5BgzX87Ie
         CZDXPGRlx4ior3dEDmUJVuk5Bun5S0RfNTEms9hrB3VRO2jZ3/4kZB3BDbKoiPoLk/Uu
         qUmooTCVz1vGZVXbN8m8FQUxDNFlJG2f098g6mcweyXJ9/7DF/RLITol826AQejTrHA4
         uoCceKiy5CmcwBgh5i/WFiPSa+wyMrn1quGRZB2tg9kwDmBxPy6a8qsnic/dEtRujsQo
         cA/g==
X-Gm-Message-State: AOJu0YzWtKtefKQpfdcN74l7lmXydIEMLIs1fJYTZGZ+UXCZzimMdDY1
	XJTVn8knvkAOPz3ncae/PCUsY6aGMKO/OnonMH7iAHeg0D8ev/7oaoiZlxnSHF2kNHa5D8e6RjG
	wPLA=
X-Google-Smtp-Source: AGHT+IEbo6Lqt4UGNPUA92r2AcENK63az4eO2LbTa8cGEnL5nl7SfGC3H8LfvkRXgih2nfxU8mWwoQ==
X-Received: by 2002:a05:6512:3e1a:b0:53a:c15:96a5 with SMTP id 2adb3069b0e04-53d8673f34amr4061156e87.27.1731331003050;
        Mon, 11 Nov 2024 05:16:43 -0800 (PST)
Received: from localhost.localdomain ([95.214.66.65])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9dc9sm1515554e87.208.2024.11.11.05.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 05:16:41 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] uki.bbclass: fix debug print logging level
Date: Mon, 11 Nov 2024 13:16:02 +0000
Message-ID: <20241111131604.364308-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206953

Missing/unknown log level triggers a warning.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index d4f25c7fd2..441e4a7f8e 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -189,7 +189,7 @@ python do_uki() {
     ukify_cmd += " %s" % (output)
 
     # Run the ukify command
-    bb.debug("uki: running command: %s" % (ukify_cmd))
+    bb.debug(2, "uki: running command: %s" % (ukify_cmd))
     bb.process.run(ukify_cmd, shell=True)
 }
 addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.34.1


