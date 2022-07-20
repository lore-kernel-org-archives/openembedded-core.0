Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4661ACCA48C
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.51538.1658306715773180322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NeW1ceAd;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id mf4so31823587ejc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q+6j73l87tJtWS7zs2IqEfNFBhmd9V+3TZkxmmOjOxo=;
        b=NeW1ceAd82BtYkpVasFhFojin4VNjqvfmENvuXwdD9cZ0P5KlEVHPmQnbxraGOCrzN
         d4W0JWCDHgZ0SxaIPKfN06jKoJejZ45NORKnch4dcET27TLpAUMImKrGtkrztlChXdG9
         56pDG6rWgNqHHE38u8IMluj17EmZbkQpzP4rMWbGZsFiOuZB//C950DtJBggd9TG6yoT
         1xPNMNw91GHH1lk4CCh0Wr6LD/AbJW5v7AK2/aG7qIxqtioRIAdoL1QiQy3/FgpE6Z0y
         KBFS3TJbK237fGYlVHQFqZ6zb8MA6OkvCoakDF0u3OkAYzMVC0NM6iMWNDJ1c4eqGVLj
         JvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+6j73l87tJtWS7zs2IqEfNFBhmd9V+3TZkxmmOjOxo=;
        b=3pVsQv6X56P2AqO5DkiW55iaEdVWCLB46nY/UE8nNbqx0C8W6nyVnq0zK8cFFiO7Lf
         w3idB+Rjh8x7t3mqtrRaBGtmS0uQVSa834qYBEMILNK78dIzjvdDzFk+NIeoXgaujvzw
         Z1u5YJCD7NEx5oPyYeqv17ndBtdHv+gLtiEWjE7hfxhdPoRpgAua9mOgzAeobHY9urIK
         URBKBfEH4H+eypcz6cqo/k87tTKtqQinwKPyqUU2qr/UxD3xUaWD/SOlmvwPv7R8C1Pi
         Bp7TGOnxmosTYD20VbPY3cMjICTDDfpYzxJ5QLdgxLG/opbm6chDCjAX2DGDgw7LcZ/T
         ivyA==
X-Gm-Message-State: AJIora8gjegVzxMo6eo9SNaumWUVCYzpz7Zip0Evfe5fxWUJ9dtDhWsx
	PtCN/dR/VCn9q4TuGO3goydALd/hMqA=
X-Google-Smtp-Source: 
 AGRyM1tVQle+ghFNJkd3m0/sG1sWZds523/X6bJH/2Tkf70GeSnWALL/dzFCaEyQR8YSk68amlSMyA==
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id
 gz28-20020a170907a05c00b0072b347b4f59mr33035526ejc.764.1658306714243;
        Wed, 20 Jul 2022 01:45:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/51] diffoscope: upgrade 217 -> 218
Date: Wed, 20 Jul 2022 10:44:16 +0200
Message-Id: <20220720084442.2940187-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168320

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_217.bb => diffoscope_218.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_217.bb => diffoscope_218.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_217.bb b/meta/recipes-support/diffoscope/diffoscope_218.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_217.bb
rename to meta/recipes-support/diffoscope/diffoscope_218.bb
index d5ab38f8ad..eceba47186 100644
--- a/meta/recipes-support/diffoscope/diffoscope_217.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_218.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1e9791e3f718ca809d98fb319b150ce6222a682b4009ea00838b9d8705003950"
+SRC_URI[sha256sum] = "68056e6d5382bfe16662c60d47bf710aa7b0ef43bfde1172fad694bc487279e3"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


