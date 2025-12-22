Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6F0E6ADC7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87706.1766434125362492240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lvmN80NA;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7cee045187so777659866b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434124; x=1767038924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPbSoBTvP50l999jTXlnk/ZNJMgULQbF2xfk+4JLHEs=;
        b=lvmN80NA/TN5NmyRaeild6OiMsid3CABdDFEOTEMfhoS50HJ4LWD0nH/mtobqzJNcj
         7qi9d1S3mVgisLgGpv0JGaxrSKydcjUyqDPllTvSjdCyYUECc+fpc7u8RZBMnrM039XM
         0ez1fKGTghngR3Xyg747GRaP61ebaIPH00zN/8Ilow9cKKbRL1vWO/gzyVwNMCVncIg4
         c23rxZy/7YO5cLuWE4642p9y+FqIQRBimbLuz/4lpiqEcBCqtKLZKNRIMiHYvvx+sGDS
         bI+f8N7xyT+AoBXwanfjRAN/4Q4HT3wub17/FhnkALFbRFylfLH9HZZ1EqUf/T389nhK
         K5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434124; x=1767038924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPbSoBTvP50l999jTXlnk/ZNJMgULQbF2xfk+4JLHEs=;
        b=ZTju/TkKQug9+QgAsDvekUDpwu+d7uYt08vw+PTonTwky4Jt1eAYOZQRH5rbH69tnY
         hSyKKD/MnXIvRpib1tIFG02MQlFrQ3L2lIJneQvT7dzlom0RYOPfU3F/T+4cE83DOM/m
         1EPeeswc3KfiGG5sOpgTsfoQ1PbGwet7NRA5pAqwo0ceYqGV6jJjmT7RPmnlAxOd/o19
         /H9FwEa1kvTVuwmkUvbJRMu5Kp4kvG6cPdJDWksir7cpgD1njR06/mZQ0iqH45N2+nCI
         vYCYwF2xBMy8dVzccXU1VthA5rDqmFA4BCkiGAQDtSl9+MpgWimkLNuR3pTAH1Zrc2ch
         cFIg==
X-Gm-Message-State: AOJu0Yw9y4e9dae89m+EipaXjvp7usvroaVFKKhtH3nNmf5OHhadHeZv
	kORJh5vSHz5sVuiVrYImcEklnTzoodaTXoZbTl8LBLNq/q6FvahQZ6TZ7pvOJQ==
X-Gm-Gg: AY/fxX6TR3aWAUVfIdG5GBd1/CKd8rlK3BqrDAbex5oNFOJoRvY3v+gwgWgwatjlItx
	OA45/QWJwkkzR1tsuK8BlgQvA6cSPE/nEYnUgicqItEvb6M91CCGYrbjZa5lGpKlHeTK2v0oe8f
	jI0zxOrij4oAl34Y8DYLYANXqHkZt4qxTwGXKXE7QKA9ZORM8C2c1cB1CV6BZ0c45gYlK/bhYls
	+lmjvwAk6qwruuydiykjJYJOQbJtZkRv/XAMGf9IRqwB7Ce6WqEa0d7451jtOmkTM8X+mn80s86
	ClJrVqj1QHocPRCJyyTo6OVxR689QXCE94kofYkX6Yx9K440epKSnNAdmcjwz0xbRtxSiVxp4W9
	ZWTBcXbNPtzfrh2fXd1W1LLmjgNsCBNgpE90NhOKv50v1wQMqeJYKNrRqs/WrU7Tm41hpNp07QU
	9wtFow0HP1g2yXwsdwdeehqa6t3zgYwd+SDpmePabsyJqHXPk=
X-Google-Smtp-Source: AGHT+IERv8d3EzAH2xuAvRBTG+pnUqzxIqxe/48jzs3adJFI3D8+IUgoeGndeQAFX7oIn82rWkjRuA==
X-Received: by 2002:a17:907:7f01:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b80355b2523mr1657459766b.4.1766434123646;
        Mon, 22 Dec 2025 12:08:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 085/114] python3-urllib3: upgrade 2.5.0 -> 2.6.2
Date: Mon, 22 Dec 2025 21:07:07 +0100
Message-ID: <20251222200739.2278706-85-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228410

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-urllib3_2.5.0.bb => python3-urllib3_2.6.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.5.0.bb => python3-urllib3_2.6.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
index 62fdf8e345..3957818f6f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
+SRC_URI[sha256sum] = "016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


