Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066BED58083
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.17241.1732536117768367166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JnkAcswd;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-432d86a3085so40237015e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536116; x=1733140916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c68HUNqRDxjENTKlIXsYsOoHUpbbQup6x7V/87PiESs=;
        b=JnkAcswdYQPsgadc54bOg312wMwH2KpIi8Bry5rlIv3JgbP9aqoUEvqUwMYY1uBAHP
         1ET6tbb0wXH0/BcvfJ/inydaj00TVw+U70ssQet+RuBDyR84+xvQUCJfvDYp3NHjsB/k
         K2D/27WeiSh0TI2SL9g54VAInvE0CLTWJWDp5Vfm8noySgm2d2tFvLrbNgsne8HoaaDu
         b3VIzdRgUm8kfE0rkiXdmikx4HNiGlYH3AzePow9QoMay3BCkdFf7bFsScDIGg8ivAmm
         Py/2z94OoRLByyN2tXRTrDkPmbnLDdEwF3Lt2Bzrf2zgrInykaI66vgtBK1/x7yk+GXw
         84Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536116; x=1733140916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c68HUNqRDxjENTKlIXsYsOoHUpbbQup6x7V/87PiESs=;
        b=itUOFaqzDxw0P2fIfWYAVzibtRhHfHTuCo3gy6KS23TP8R/0TPWXIyDBLUb0wZQf5n
         Sr22wBHdmxVX80gfgfWwTKNNlhooPJugIhnN7RJ2SxIly9g6sCMJgKW7WMXWbjJ5DqvM
         I19QXPQfdLal8do3xgYyXI4FABg9PdwZO3jZ9WDN0SyqRItyemw+0LzylllJ9CGgjN1I
         LctbGH49cbfffss/6hW2Q9zjKybpogkWvKOc0uKzxDDOBUbvRU47i2WRkt/Z4MA3dGK8
         QIHcyVOyPfhjoZpAHOA5maakC7WWCbgWnlCfOxpvyvBtx7j6HEjgAkK7H/tKb/F6E53e
         8ejQ==
X-Gm-Message-State: AOJu0Yy/154i9yglgGqGnnA6Pp+Wgzcqq5Ak4Hu5rpR1fre4tWl3ypkO
	KpxqHpeFRscWDXaawQgorNVsGCX34x2ik5cCWztAHtlReOkQx/AWY+k2Pw==
X-Gm-Gg: ASbGnctLg00LDpmsdVi93/50OfR5Muyxhq3YDbA+Xxdh2JMpPJMQ3ceQUgiUxc85lmd
	hU1UPDKQkiR3f+P0y1UaitSyWDaumfbhGgNtoVBtOCMxyexqaDjl8zZVVmoy8MYWhBiLmNRCom0
	LTgX96w/K/2HI/aQw5drQKdGELBSWbiDWHTJnwZgE3HEsnSGaD8vui26i/F6dT0Z6Qc6HmoMUUp
	7u7N/X6c9SxLq+NyM7OnrVsKzqygWYY/J4nJdMhRPp/CskN/Zq41FcltSkRRg7M+t8rl8KqD9Wm
	7puYTrGZayQ=
X-Google-Smtp-Source: AGHT+IGprp7jUWXddcuD8UguCOwsR9E3BBVINFPFXee4UVNa6MA2cdm1k9nlGLJGWnugUdA7KJadeA==
X-Received: by 2002:a05:600c:5253:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-433ce4ac0b1mr96625105e9.26.1732536115954;
        Mon, 25 Nov 2024 04:01:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/35] libxml-parser-perl: correct SRC_URI
Date: Mon, 25 Nov 2024 13:01:26 +0100
Message-Id: <20241125120127.2205232-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207782

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index cffc133a450..17072ece079 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4342f85bf14a1fdd6a751573f1e61c03"
 
 DEPENDS += "expat"
 
-SRC_URI = "${CPAN_MIRROR}/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
            "
 
-- 
2.39.5


