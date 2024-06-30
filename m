Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE68C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:07:58 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.4343.1719778077056596080
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l9lG6CkX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-701b0b0be38so1845482b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778076; x=1720382876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y3TRaX/wZLLmTLR6sVG+dWBa1DgAlYJIi/A09sGp58=;
        b=l9lG6CkXdxzE1ZPSTIdHw/Xfw6tS/HB1d8dlL3WdtX0dgrt8XGNr3DLU03OFnpnMpr
         E1zRkDAfxu64U6xB2lpbKV23H/8fnxIx9OPz+o/C01/r9julvnr3d0fnN717yOZvVj9s
         eyBJREtC2MtPU41T97KlMKWQFix8lhSjSj0bKCeZHudUbvKCbWYtJJa1VLSHptPQzWG1
         ezaOGc4XhQ9w6ClVbDwVcg6YwUN2GKtMrLeOK77uH1WA+9mwU1h7BpQxI/l/MncDUZy/
         hnWZcKmGSOf32ogqSTNJljC17zUsEFKCOo4uZd7k+yBgmEAAlQdwkRrojFs8CXRN9a5T
         7g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778076; x=1720382876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Y3TRaX/wZLLmTLR6sVG+dWBa1DgAlYJIi/A09sGp58=;
        b=jPGY+uhLuF1z82wmS/NqqyF6SpncuwUR3ZXg67/hOgwr2jFvZaVLChYTr7CWtjABmu
         GxQVAB4AyMr3BTff63J8cHh4xCjV8J41ly88C8N/Zh2mzT4GA5R0r5uEgQ0JlK9dsLL6
         bhzTKdafuoDhs+DDotwkcKAIkwvO+Kzpcl0wRHISBBHTyCXJLdgNk/HJybN1p1iufvj1
         RMFOuaksjVRZLAsY7pYb9ODqUKhVH3pj265gJfCbeUzXdELCh98mGLno9CcmS3JuMRv1
         /cBnsjrtTOdXS/nEFQA97T1qTxDORZe/A7wx4pDoEcocL5ZlLtXSg9ydcKF/zf9ISTF0
         PJpQ==
X-Gm-Message-State: AOJu0YzGrbKNf24ilhaGzUaAVHFg3kiLpB9c5m29TzBpdA7UOlHBgRDv
	0xIVUupi9eQC9k9HphoIKKdLKeeCaOupy4neGp/lBAU409NIsZDChxgS7ef6YqbXqlFUhjxsIJc
	gVtM=
X-Google-Smtp-Source: AGHT+IFZCmGEuSn/Lca0a3mVr7js21IvnQJ2E7C0lVkD7X1cgNAQwIeJf2qg7gYlQpGRu6RhlrSKSw==
X-Received: by 2002:a05:6a20:a124:b0:1be:c7f4:b42e with SMTP id adf61e73a8af0-1bef611cefbmr6595888637.20.1719778076293;
        Sun, 30 Jun 2024 13:07:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.07.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:07:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/35] libxml2: Upgrade 2.12.6 -> 2.12.8
Date: Sun, 30 Jun 2024 13:07:14 -0700
Message-Id: <0dc695fe1f6deffc65d61257009bbfed4f2c53e9.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201239

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-34459 libxml2: buffer over-read in xmlHTMLPrintFileContext in xmllint.c

Other Changes between 2.12.6 -> 2.12.8
======================================
https://gitlab.gnome.org/GNOME/libxml2/-/blob/2.12/NEWS?ref_type=heads

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.12.6.bb => libxml2_2.12.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.6.bb => libxml2_2.12.8.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.6.bb b/meta/recipes-core/libxml/libxml2_2.12.8.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.6.bb
rename to meta/recipes-core/libxml/libxml2_2.12.8.bb
index 14fcff7fa4..fb103f0273 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.8.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
+SRC_URI[archive.sha256sum] = "43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


