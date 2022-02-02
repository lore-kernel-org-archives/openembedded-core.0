Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45625C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.2252.1643826505216199653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AckmoY3H;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p15so227554ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cb/qqOATwY5eQcnbRwPBPmdCNXnAigVQZr6N+qXFc0E=;
        b=AckmoY3H/smJhyemJh37RSeNHMUQs551m5pfrp6vWQ3+Q+5GerVaarIohJx1Tb/hlK
         TDz+ES5znz0VFiApMCpxbBB7Go/e/HE+WoM4JbYCYk0mR83saB2eYuOGNTJXIkV1eRqw
         EidylozQH0cXCiSeM8/8Er0xLWUcx9Te53z1eKZX0v8MYORTZxhLjERqu3h/G+fGknq7
         jmOzFmLJ9H8eVISxM3QyoQZ5JU48XTs/C3HZ8yFMoRIETD2A2+3zU/I/sSe5QRGkBtmK
         QW6DvsCsZJaAvPtjAT/yqh/d/y4wzrMCOeeWL6h0u+mVgf+sTtD7ew5qVnaVAPu7kyx/
         1/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cb/qqOATwY5eQcnbRwPBPmdCNXnAigVQZr6N+qXFc0E=;
        b=k9oFF255551F3onsqR1lXFhFiOh3+xZcuIUAx2QY56MRtfURARsSeEXrC4xKeXGVi/
         b634pefqIdortaaLtjK8NR0Zw6ASYcN1vrYWn+vSjdWyUmByO8n95z1kgrlpuAFgnCJP
         bSmp6kA+35xieya5WgT90pC16RQApIMVtZEMFmd3rGSoEN08TAR+e/YKcqszFF6qWZg1
         mKY5ftNa9fnZ6SD5Ctfh+tdgs3ZiRu1ghil40WOhNgDUsubkuRgVp5xgFawxGEenE4zF
         AKrdssUVsbas3g7Ib3cn5PCXXor/P8KbltQmq4G7FVA5E9Xxh4X6h7LyA0RZrEBTOpH7
         6SfA==
X-Gm-Message-State: AOAM53376dJnxOyJWQjg+Ye4R78dqpw3HBIFGDFGGnjBONgkThDoQWuO
	KO9W1Oj6w3uyvXI7Aqx3MFOCrfn3rDU=
X-Google-Smtp-Source: 
 ABdhPJyBe+CKkyGTmkEeLOFLmLfggI6IaRFOs1ezarqIa1YUKrJ9G+oHUxRjGMoxsajySQK7bFn2/Q==
X-Received: by 2002:a17:907:7f87:: with SMTP id
 qk7mr20078304ejc.748.1643826503788;
        Wed, 02 Feb 2022 10:28:23 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/33] harfbuzz: upgrade 3.2.0 -> 3.3.1
Date: Wed,  2 Feb 2022 19:27:49 +0100
Message-Id: <20220202182758.919991-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161249

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_3.2.0.bb => harfbuzz_3.3.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.2.0.bb => harfbuzz_3.3.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.3.1.bb
index 647bafc4d3..656b556d29 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd"
+SRC_URI[sha256sum] = "8c083384838f39f4a4856a6584def595b10cc071754a08d5e999293462b34296"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.20.1


