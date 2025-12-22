Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81305E6ADDC
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87701.1766434122852905125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2+sCz6e;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7a6e56193cso725675066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434121; x=1767038921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDom70w5YyL4XiO00R0Zq8h6ArdzF7GqEkmFMbtZA+o=;
        b=D2+sCz6eeLwGrSiFHA1z/t8lYdsN4bkYTvHSCN5W5D1f5auVg5VF/1hype0ebhG1Ct
         jpiSg+YJ0hXAzcZvZ8LOatcEtu7BnRn752NAZ3ugzwGDgU3+BiqBroF2Vt1OdTfEtxW2
         WvTPqmu/jrU4X1f6d0rb0CKZDrABfcUj27kbmhYWidjptJkEBRoniADBh6Jy4X1vmeHb
         zsm8akGGgfqEbSRS/oVkjYufbUJLyiGJ+tm1xH5xIAgv+Q71Fs4hQQR6vHZwr4VRQMhP
         HL09HWZnZrRQbpZf7rV6Y6WSwr0vm82SYr4TdzURqVGWvwq0cZ2Be/P7doQWiFrp6JZR
         ZlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434121; x=1767038921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDom70w5YyL4XiO00R0Zq8h6ArdzF7GqEkmFMbtZA+o=;
        b=nbnaWU3tM8PdPUwSGcyzBvpb1Bik5m9chOvZliDJZuPfmaNh7T2bWyQ7gDM4ctkMS5
         gCb9DPkqYxdORazW1Br0L25I+n4db7AYdEtAL/nLlxEFHPbqR5MZNFVzjka+kw8+vAUw
         hi0bjMVS2TBuvJX+GTtQb8we+c2E/505/V9337pDOteCc8u7acNu14mNhAYSdxlQ2Wfx
         0VT57qMq7+A1UhHyVAkDnO5yQHqp5jqHeg/L5eKhautn0zGiPYDowku6XdvDyhvsInHV
         +14P5doaW5ZoYPHcFSPgsIQo0r+aBFNyi7ImJnP46WBpAb7X2zH1aSyu+nQivhdeib4U
         wlRw==
X-Gm-Message-State: AOJu0YxRf+qBlJZqnrdbLRZPeWx1xRvoWGvxpcyS2HduWGgjjC9mRt4C
	KBGdGF9gMFDP46aOOoEXiHZPQ9JIgcODn5026FR9k+sLlUNFg6tUOzyGLgolwQ==
X-Gm-Gg: AY/fxX7eiIW5Idz77xXlpdW0f8X/8h3k8GT4oUjxXMxgvkGl6DQdKeLL+cZj6lvn7eF
	bcP3e+FGO/lVUmDJiScp0C8/TUPUkfyBZNHnfeWtcJwn06KWXtNvfiaYPCaO3WJjwn43+l/XfrT
	m21WPqS455BWqHvb5v5NWh8L8RrRRXyc2djXDENOr2no9lCX0uVxPTBT3taFwvzaIGmqT5kNFEF
	AItXe47dyD/RfjxF4NCsKMIWKkyjWLxobCo4Is+URgzTpwqmdKRdfvy+K4bZpBE+QA+D2Y0CIcc
	oYbvGkGeEprGjWXcZRI9VawdxR1iM7Inmjx5vvSozUXGDt0n5VBIWDq87wrq6c3GMbDqCHcYbMZ
	O89ekqD9HPU1PGj8qBTdj/nOUCd+Cs5xnJtgkL2nBhDkFa7uAe5qjpKbqK+5WLAsz/FGue/bsye
	bfAUTtCSm1eGN/4sI/r9Ffvpqao0zcJOs6B6MkOqLyDIYWa/I=
X-Google-Smtp-Source: AGHT+IGu02ewvqDeAHvS/skpdZOK73IxltQtN64gKxrFE7Pbmw5Cdj4yE2NTkODkFWWKIaxioEZJUQ==
X-Received: by 2002:a17:906:6a21:b0:b76:3399:457b with SMTP id a640c23a62f3a-b80371d8c90mr1268183566b.37.1766434121069;
        Mon, 22 Dec 2025 12:08:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 081/114] python3-setuptools-scm: upgrade 8.3.1 -> 9.2.2
Date: Mon, 22 Dec 2025 21:07:03 +0100
Message-ID: <20251222200739.2278706-81-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228406

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.3.1.bb => python3-setuptools-scm_9.2.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
index 81e04ddea5..175da34179 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63"
+SRC_URI[sha256sum] = "1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.3


