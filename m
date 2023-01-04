Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC53CC54EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9353.1672830354623515844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDwkPd1/;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso23934473wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRAzsTFrgzjaqrB8adlL5P5KqSrJFwepG2TWTVvVHL0=;
        b=eDwkPd1/hauNZamlfukXVZLPTNQvvz9htfUj1DMb7sU9/gH4qMsiesP7DrhXiFsWcX
         ESPF6vSTENZiqASp63G3qWrvHQAHQKIx/liq1fN2+8L3kmck8X/H5U7ey/KU+gLZSsfT
         /0odHFVfXAusryi6eIV+vA0UuCtzUPrJddQN23VWCW1XAq/gkgjKRdV2rnfuhkjeapmq
         8Z56o6QtTXkaTTqbdr2pc97IT1NN39UMt3NRLIVkv+LF6njn6IQb+IH8HQaA1nPJba+7
         ON59Z8rGidHvPwEoMFm4sZEkm2toZ7Di+hduQYxIQ3kXtQH3NYrHLylXe/L5z88RqGUV
         KU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRAzsTFrgzjaqrB8adlL5P5KqSrJFwepG2TWTVvVHL0=;
        b=Cy3otdT0z1R6cp7XVoN3c/Vmm0mPQPBx9W4xkm/LqPMFpBwWSAwLIYYo9RoJuMYi30
         ZI+ta4FPpadlsQ+AiPgGKMMXBtqjICU1Nx5JvQZkWdpTkkHGdRyrpltp1iBewLfSF7LM
         o4N5h5c/JgvBJlGiubj+IE89PhcJKCz8/acUQ/6SlIclfhKcAdFOZ/lpxfn1JpSAiWch
         yoZoLRG61PoSwrPXFv+tg+x8r+88yfZ/FtGvLy4ir8z27PDd1aOL0ZUTmJam5WzQYqtt
         62ueVazv0aMlPjCLXfVaIGDwVIClzqOJeA31GGDXsKOKvsO6MhxgmnAfcQLrt1ebT3sU
         3Fvw==
X-Gm-Message-State: AFqh2krzVaphDfZ4QZyUH3rosumFfJaCz/g7ocAfTE855HnKJj6FJ8ms
	y0NOpwokzv9o4XrW4Kv9xuQcyGpnjdY=
X-Google-Smtp-Source: AMrXdXvmjjpeZ+BCOYJGojDThXdeKZ/VdSVEUjS/1rgVYr4Q0U5W7C55b6bLrg3BkeVpkQkRnhPSYQ==
X-Received: by 2002:a05:600c:13ca:b0:3d3:4427:dfbf with SMTP id e10-20020a05600c13ca00b003d34427dfbfmr32798286wmg.5.1672830378746;
        Wed, 04 Jan 2023 03:06:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/77] python3-importlib-metadata: upgrade 5.0.0 -> 5.2.0
Date: Wed,  4 Jan 2023 12:05:05 +0100
Message-Id: <20230104110548.2537259-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175419

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ib-metadata_5.0.0.bb => python3-importlib-metadata_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_5.0.0.bb => python3-importlib-metadata_5.2.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb
index f0623669d7..893c63d7e5 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_5.2.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "da31db32b304314d044d3c12c79bd59e307889b287ad12ff387b3500835fc2ab"
+SRC_URI[sha256sum] = "404d48d62bba0b7a77ff9d405efd91501bef2e67ff4ace0bed40a0cf28c3c7cd"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2


