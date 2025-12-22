Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE72E6ADDD
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87688.1766434106994373825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ME66xmtw;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so734775966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434105; x=1767038905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hk2E373VyUS7YYWde6/OHthyMqzuL7RWwTvjtQ9cBA=;
        b=ME66xmtwOg8Smt4/k3LNrVweOiJrCRnmj38Zuw8AnjB87KqkGTiw9hxc32TJ7YZQgx
         V5ea/MsgC2sAFK0lj5obQq2gf9SeShZTPIvSxaLaaP9pUz+emU7kyVfFAd5Zmfo1eJUI
         H9E5Zu7iaQszlL97E/iVdXTpoXEuc3Xg7b5wVLmTe9TZzrju0yICEWn6nW5BUpZzuJiz
         WYB//yqiOWNwfeV3TLzXg00tUmrG2PJ3o3CMOl8HRaIkV6l3NhOOA23Mfe+QZE5CkKX0
         elbwlxZzeQ3Jn3gG1ObdJiUzfFkHVlmcLMkdXJPt8+ULVdc2iWMHKWhY1167j0OO+uVt
         kXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434105; x=1767038905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Hk2E373VyUS7YYWde6/OHthyMqzuL7RWwTvjtQ9cBA=;
        b=FnrNuKrKeoUN20ChBppRqvrZfjFOO3ioMJWqn+fOgIKn4JJ0UrDdfR35YwjkSVV0mb
         nqJOen17An4CMyjKxSQMM02UOB/ieeC+Lmka9RBLShfJlLj35qgdehMLjSb8XVD+ZmpP
         uo+w9gCgPbJ8xaEWcVeY51nF+wsF46N3cRH6Pm8Qsddz6/0TxXdKuld/GT3aZmqBdMKJ
         HztaJjR/0QX7R4IpvE6CE7N/3LgLwAQkeuNJNYqqLELrCrVLdqjMmUOTjnJC43WK2fkX
         t3eICdkOO+rtMOiIbIdqQwPXAR3xu2P+ucyGDprDfRPks5gGLuBKriHo+xwQ6TUdUEOX
         Fjjg==
X-Gm-Message-State: AOJu0YxlO+q5XUxfQclJP/HAbEtEdy3kp6UL3D9kpEdQ3a3a6Xz/M5N9
	NOCgeo/f06qUdK5riJayDGiDfuLwzIDTUUUVgyDLwyqSP/kH/geUhTF7TGUAEA==
X-Gm-Gg: AY/fxX7aNAX1vv9XCHTohceURHjNG1rsBUHommlIFMkPCH/3le48Rzod6M+XECkGDQ7
	oxGbSqcCUo8azqssDWPuP9gT/OhaGz80UwuxsMtVxFIbzsDZVw/CALjuGe2acBp65MmnmXRzTxQ
	Fsof22S9fz2gihFOxQJxsqqi33N/wrWSsiy63f72G9dbqgnG+LZ0N7h4DKEruTvk5Zua9LKjCwf
	PIo5i58qHWH8EW5XHblK5dIapvcokSjbsjCHbD19fqJx3R1R3aFj/6lCc2Q52UsTr32wXVSsSM9
	kn349cVmWg9et8sUUyEleVo2Fn4XT/UcSeQFUeGRLtJ58XmiPq7cInK84wX3SuLD5aNFyRrr4eq
	stDU7+PDSZ+PEw/2tlad6k//wuo8KiYFkRpXeBM14Dbc+m7SY39T1CtZtnaUV+hKGNGZb0J+NDg
	Eh1FNaUYBXYKQ5lDrC6g16s29ObU/yZuLI0LUN2lz0chEQ7ZU=
X-Google-Smtp-Source: AGHT+IEhpURJM4IvfgHRsG2iVZqnQB9BNJWRk+cFOwL056r7sc9pDQ8m3UJ8arCmVqEFIZK/QI6+pQ==
X-Received: by 2002:a17:907:8e95:b0:b76:4a7c:27a1 with SMTP id a640c23a62f3a-b8036ebf139mr1075427966b.1.1766434105343;
        Mon, 22 Dec 2025 12:08:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 057/114] python3-dbusmock: upgrade 0.37.0 -> 0.37.2
Date: Mon, 22 Dec 2025 21:06:39 +0100
Message-ID: <20251222200739.2278706-57-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228382

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dbusmock_0.37.0.bb => python3-dbusmock_0.37.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.37.0.bb => python3-dbusmock_0.37.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
index 50c46abc95..afbf0f0c57 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "38754c5ad2ad8f3936ff67d4b058bca416588a72bc094e91ded9f8f401b06310"
+SRC_URI[sha256sum] = "e0c7354f6887036ee519f2fbba55ce14bb21c3ffceab06c085d15bbbda2b1d03"
 
 PYPI_PACKAGE = "python_dbusmock"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.3


