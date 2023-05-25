Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D20DC77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 08:54:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7548.1685004846479725755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 01:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jN0BOs1L;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so1891995e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685004845; x=1687596845;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JafWyXomMZMo4kMJI2bOgFyd+weOfgW8iKaAmXC5ubU=;
        b=jN0BOs1LB8fzuKQVc+wF3lMYUh+6Osq1EV1HR67krHnJ/uEUAwPCSfmP4Yvaacm8gM
         6c3tvf6teg509sSt82zrHinHntyLKm6RyC399AcOSCJAJQJ8qlsHkBQgfjjqzfACODMl
         zdnyzvph1TNNC31ycfBYuJp4aay5UaAKlNZCJAKLKTQkgHozZU1BZ7fRGMO971nv4Uls
         6DeRE2psTus7FGqfuifiIvDWhQs56HB1rORhy4CHVMrt+kWqjtR19LhKcPKQ466rq6Gc
         nAEgIxCtElZQR60T98+MAe93vJRmoB9fMHvhpCGeJnl1sxcoDPpWCe97zR5npj2AKtXa
         nSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685004845; x=1687596845;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JafWyXomMZMo4kMJI2bOgFyd+weOfgW8iKaAmXC5ubU=;
        b=arPTLOIKsX91WI2CERIcBVUR607WLuGTTT6AKCQqn+a2Nw5mEWlSAXA5XBySJnFSn7
         k6VEFZkEhKw2OfXsQSi/EwbuIWAp6bWu04X1siYdP3z8S6qG2RtW1eiAi8OrrhvqRm4o
         hbZ9Nd5A9r8TVcUCvd27joEHsytDe5Up28WVSBHXOs9lfX9Fq57PbnbUoUS5t+FVPKUc
         hunRCLRmEmk7mz17IUVqNnQjpywkAnqVYElxo2xERl93wlCYyr5jtfmhL1gXsTrVIPgf
         YH9tvtPNjqK0uSlkkZxFdMiRF9qf3AN9BhGkpHsUZewQ164drtCeN8OzbP9GSrx37QzY
         NifQ==
X-Gm-Message-State: AC+VfDzoF+Dq3BjSJdfWeh/04r8OnqZ3VSmfOGL+GDFyL6uhpZuu5EA1
	F2nwujP5y9OOEkKcmAoiTZiEGg==
X-Google-Smtp-Source: ACHHUZ5dRb2fqMSmhqv2DclLT8sb6xxkFjab2m6xPKKiGf9TwDQv5KaHQblTUbLuXYMEp90hPFoZNQ==
X-Received: by 2002:a05:600c:28b:b0:3f6:580:b091 with SMTP id 11-20020a05600c028b00b003f60580b091mr1747695wmk.16.1685004844872;
        Thu, 25 May 2023 01:54:04 -0700 (PDT)
Received: from [169.254.19.53] ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d4744000000b003062675d4c9sm1052230wrs.39.2023.05.25.01.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:54:04 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Date: Thu, 25 May 2023 10:53:23 +0200
Subject: [PATCH] spdx: Fix license parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-spdx-parse-license-v1-1-c5e1f6218487@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAMib2QC/x2N0QrCMAxFf2Xk2UKtTIa/Ij6kbXQBjSUZozD27
 2Y+Xc49XO4GRspkcBs2UFrZ+CsO59MAZUZ5UeDqDCmmSxzTGKzVHhqqUXhzIfGkKUeXOOG1gg8
 zepkVpczH9IO2kAahvhy2KT25/y/vj33/Aem4YAqCAAAA
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com, Louis Rannou <lrannou@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685004844; l=1093;
 i=lrannou@baylibre.com; s=20230525; h=from:subject:message-id;
 bh=gfe5XQQbAhmJcJ69pnZg6SXaUIqw1wJxs5yXEECg9fk=;
 b=YfrXtiyHuZxINxSo+tevywD7c7MUtxGTWdMFxUeS9GcKeIkBJDjoUC4SI6H/HSQm1+YykzQpN
 g3Y7ecqLP3xCloAmSWHFbEypveuv5j6Q+wp17oNsL95TmMTaSxANflQ
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=YvNJAioiQmOQYTta3eRaRV3xzOzDE0YgBIwM3nJXa4c=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 08:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181706

[YOCTO #14890] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14890#c3

Since spaces in the license name are not mandatory, we need to add spaces around
 `|` and `&` before spliting.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 13d13fe1fc..e0f62a43a2 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -167,7 +167,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
 
         return spdx_license
 
-    lic_split = lic.replace("(", " ( ").replace(")", " ) ").split()
+    lic_split = lic.replace("(", " ( ").replace(")", " ) ").replace("|", " | ").replace("&", " & ").split()
 
     return ' '.join(convert(l) for l in lic_split)
 

---
base-commit: 0b44b95ab2be378b03e14953fd482ee4c9a19973
change-id: 20230525-spdx-parse-license-e8b0305a8a6d

Best regards,
-- 
Louis Rannou <lrannou@baylibre.com>


