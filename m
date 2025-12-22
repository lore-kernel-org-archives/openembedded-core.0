Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF25E6917B
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:55 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87648.1766434068316507900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZ9Ify5d;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so734686666b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434067; x=1767038867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMcGEODh6hfOYbRTlk51BXlCyhyoVAW197P/2WBQS4I=;
        b=WZ9Ify5dW37wflHbTU0+lvW8u5KqpBL9QoOsT5YQh9E2iuCu0/ynsXy6J07NWQjgPW
         IRmNjZFmng1u8kYvPDqiNxBagD31xG3Vdf34qRp+CxB6mOz/x7zFlSCL+J9Y5LdBAi1N
         qhNR3IiovB16lDN4cjXy0T6OJjdXBtdJ1RA76RDYic8tV2yXVpZyF20ACzSViPvrEO2I
         xRl7zyxhjwPl2jACErQ3u1yDWvwoyW///FiNnZSSIiy8CtG/VgAI7VBhm9eYmBxV9EAG
         ld3wVStim29aKTiCfQJO10vonv+JXBgJ58FGJHdmmlxAcSW4J+oe2TJVGqrueP5HsmZj
         QkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434067; x=1767038867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMcGEODh6hfOYbRTlk51BXlCyhyoVAW197P/2WBQS4I=;
        b=v64j23X5020yKgx7bo/gUE8c1shSrjVrYwhfpgnPCVx466fKR0eJx1GS/y6ry/7eHO
         2R4jd9qtIKdbgxYdwekkGMJ5pZDO0GwhZmfCBH499+l40Jbe6LySUgVxnETkbcJXkmP2
         ZgFXl+SIBZAqnLibqP7kA4+gw8zeN2QzjU0bl7xtMaLV8ye3MSbnTn9yWj1BmWhNKz7u
         Gl/yKeRcU7L+4Bxlbmm8WemnmFtL+ibr5yhYZiKTjt2UilELhwHxIck6BPzCd+JAdlZV
         Hdkhwusn6/y2Zy8TLKfolJs+qufkeun7XQt2ygMddgQbHUSvJ4w7QnUAjgtWLejCzx6W
         0Agg==
X-Gm-Message-State: AOJu0YwkSpgJQ8j+TJYEYY1QCFoR4Y87pQqQ8hUDMl+BOuFEzF6d/KEK
	lM8+L8QF375kzIUStifacLnLVF4aBJ7k2TYD3r8YOOavkVOrakbyTMVguGJQBA==
X-Gm-Gg: AY/fxX72T3rACf6fKZcmDhcaq475PNKKRhWCGeYJKRk0GMXbwGbPhNVq9KviBRuRELG
	PTJne52y1rJfwB3cooqj7X+5KLqbn+SXdIsDKkIVbzth8sRHDI3J+F2X45YYLIMDARvLg0oNd9J
	5pj/Y5BuSfnWwyywfrhtmFDSnssCn5EXIo94Bt24rGv/KGhNlaWpvzfDl+CRKy8V7KNDHxAhtRI
	pUp9K6IgiITVf3BjV3AzkjGeDdxQhxrrOVPnPBn5m8m4DJHTbVqAR9D524+1jqNjPXEit1dWSw4
	SftkWK9qAoSnsccq9VWGX9wHbcGDz9zvn6v4JMZU+oPUqKnIzOIZk1JpeJi8IGU4dCBfLQZnwld
	T8aVXaO+NAQoiq5ftv5XI93DHw4ar7HzU7rTsHfFpwBPc3tQns3UJXWCcPZXQ8Zd4gWm1zU0zd1
	sB4KgJa5hbPjIyGw+/rj4ypWY9xGL4/kdeBS7ukaK/N5Ff/Rk=
X-Google-Smtp-Source: AGHT+IE+sxeE9m96zcKd76JqhSiDv4XjxluxRJ27Tno9dnwDlyEKsqIjrszzJZZIE/foJEdM8bVTDw==
X-Received: by 2002:a17:906:9f92:b0:b2b:3481:93c8 with SMTP id a640c23a62f3a-b8036f1d812mr1159133866b.19.1766434066493;
        Mon, 22 Dec 2025 12:07:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 002/114] gtk4: consider only even versions
Date: Mon, 22 Dec 2025 21:05:44 +0100
Message-ID: <20251222200739.2278706-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228327

From: Alexander Kanavin <alex@linutronix.de>

It's not immediately obvious, but gtk4 continues to follow
the odd-even scheme: https://www.gtk.org/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
index d04251927f..92791db169 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
@@ -41,7 +41,7 @@ CVE_PRODUCT = "gnome:gtk"
 
 GNOMEBN = "gtk"
 
-inherit gettext gnomebase gi-docgen update-alternatives gsettings features_check gobject-introspection
+inherit gettext gnomebase gi-docgen update-alternatives gsettings features_check gobject-introspection upstream-version-is-even
 
 # TBD: nativesdk
 # gobject-introspection.bbclass pins introspection off for nativesk. As long as
-- 
2.47.3


