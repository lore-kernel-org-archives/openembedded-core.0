Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61907C25B78
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.1143.1715044504314934999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MY71/Muy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2b3c1ea9a68so1651301a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044503; x=1715649303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7AnVRSxIKtYuf0ywbbYH2gMA5NjwE30SWIXQ4oYqb4=;
        b=MY71/Muyy5Y28GmNOAsorBO1mUCG91GtV0kEQek7t//etcw6Khx27HWpHfFYQLfmud
         D0ThbkdjxJHGuvT6knLjqbT+ckwVma3w4F3wZMkjxmKGFdvkCx4Bm3sNUY9NQylPm5DR
         qhOid2SHx6nNGM1jyyXdQomwDCLnXwMEfn1j90kv+Z10Zy+pIiIgLLWPUYXM/3uBZu7g
         7uGCt80y5XOx5opn/LBBJBt790S1epBAonv4ZSbSa+MMOR/883gjyYEboBeMmceOHUvK
         KyU5BkSNfRsLsZSunAX+nAynXpL7DPhkxPYw0yFso4UoTHQKM8JebMPydEBOoAJQwQQ7
         23cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044503; x=1715649303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7AnVRSxIKtYuf0ywbbYH2gMA5NjwE30SWIXQ4oYqb4=;
        b=LUnIJPLjEvpHybRXNqyYcPzJW8iSKDOhgxAs1k3bRvao3uSoNfq6twy6revigoIR0V
         TNBpYdZBmopQPv9oP5KrANwWt7XBZoCvh0ms3L+g9WU+miknjQpmzIsNUl8HN+vicl3F
         IIGYQco+rH2Q+NAJYv7nr4bbvwNk2NcfZ9i142DD0qYYi37DxUmmtZu9ObKGGebUrzuw
         RkAO3V1DJ46fQH61GRhMhsuUtlrOwHGuROtjYFKFlnkPPtS2soaznOlWIBRAPCmxmSYg
         lVDmwj5CkhzsPDKX/tyHxO/nr29+rYFV3YHgcBhu6Gsm6elaFqouLowsGHwqld7mxlwO
         Oehg==
X-Gm-Message-State: AOJu0YyNzrPmZeECRlflA7owcYEe3T3BQW8jHXrPIqFgBcKW1JwgcZ7E
	ae+p30O0Gs2lPAFQPRMTuL/jjNOnVZSuyQhHsFFv08fdfBu7Nt0JQJ8xkhKA
X-Google-Smtp-Source: AGHT+IHzwnIoC04DN80rYwbzVHW6xjQFyWQOmHpYuxkzEr+LQDRfim0BGY3QWxTXIOKw9/qJFdq/8w==
X-Received: by 2002:a17:90a:ab83:b0:2b1:54e4:e125 with SMTP id n3-20020a17090aab8300b002b154e4e125mr1742704pjq.22.1715044503149;
        Mon, 06 May 2024 18:15:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 06/10] pcmanfm: Disable incompatible-pointer-types warning as error
Date: Mon,  6 May 2024 18:14:51 -0700
Message-ID: <20240507011455.313230-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199053

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 22c9fa59dcd..2e463cd7b36 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -27,6 +27,8 @@ inherit autotools pkgconfig features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--with-gtk=3"
+# GCC 14 finds extra incompatible pointer type warnings which are treated as errors
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 
 do_install:append () {
 	install -d ${D}/${datadir}
-- 
2.45.0


