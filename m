Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65788C531DC
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:18:33 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.42238.1723454303602073133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 02:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qq6T3Ubj;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7aada2358fso774461366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723454302; x=1724059102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WTKlJ5ayQ2g5UHyST5Hv0IWDkctBRU1uLJn1WY2nG8=;
        b=Qq6T3UbjFPLdZu4w7GZdVaajCfKxPW/NULMpzsSEtbOpMvLmXkMF91y5+ahFZViavp
         Z/GlxyIHAALIoDEkUREzCh5lYue85aFzO/vvOwr3R2fYtRwpRO3tasmyn0/0QA6Zmb/2
         pKK7Ka9c270U7YO/de4TDEUpoE1EEYlNcirwOkqek5VbleNup/gti+4s8iUVz1bgPu63
         3zKt13O92YiA1uAoPyq8WK/zxAU/D9w5rFPuNIUeaBZ7Akt9btCSWc5SzJaYFHRhJ6eU
         nrlAte9roJ4M6Qdj3ZcNcvS65W6WqDttEIji1pVdl3zZcU49R94jwSo9saYUdcnbHUJU
         TLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723454302; x=1724059102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WTKlJ5ayQ2g5UHyST5Hv0IWDkctBRU1uLJn1WY2nG8=;
        b=TB87moJAdMAQYVx0Ww+0r6OrzXaPO/Y+iEfaSmJz0db9LTZkV2gQuVioHi2HtdLBYI
         DVtCVuoWasvfR3ym8R4+LBqo7Nl02Mj53Y2av3WgIeGilh7vmMZG5QI2dQA44vSMpO5M
         4bY5avwywQA6wkSFT4cKi01UoJ8xO7BxkiIxIXGzIfCqYMALtIKctCjbqnhsyvtWRbC5
         /vRm/kJLKg4j5NrNXuC6qWKJGNzr7WI6bLg2r6vzHl99HeVk2ydCzNwn/sT8/hShe26W
         o/V0TgxNpJnoIAgW/VTV8IPkZBIcXz/VUfcTjCT9eBThVx00b+Ll1NpBb7BZxzHYnKFE
         YfRA==
X-Gm-Message-State: AOJu0Ywk09BlY9yFCN3lux0Y1urZ+iHViy2JQepU1eiqiZHK9clll6WN
	ZXvIM3amhljb7pEt0V8eT/bhQnIRTjAspX2bKOriQsfSrBaLoETBvSAt4g==
X-Google-Smtp-Source: AGHT+IFl8H7NoGezC3hAYBoQQDIEMGNbbp7leN8rS0lXrYX6NHxZl7QmvkJ75YTorim+J+NyZxQrXg==
X-Received: by 2002:a17:907:2cc5:b0:a72:4207:479b with SMTP id a640c23a62f3a-a8091ec7f57mr1130210866b.5.1723454301648;
        Mon, 12 Aug 2024 02:18:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb1ccf15sm211892066b.134.2024.08.12.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 02:18:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3-babel: drop custom PYPI settings
Date: Mon, 12 Aug 2024 11:18:18 +0200
Message-Id: <20240812091818.1014311-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 09:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203211

From: Alexander Kanavin <alex@linutronix.de>

Upstream simply redirects Babel to babel nowadays. This
also fixes upstream version check.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-babel_2.15.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-babel_2.15.0.bb b/meta/recipes-devtools/python/python3-babel_2.15.0.bb
index 03d06c46840..c8a0d231001 100644
--- a/meta/recipes-devtools/python/python3-babel_2.15.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.15.0.bb
@@ -5,10 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7ebed8cd9f4ff11f547e3afd024a28c"
 
 SRC_URI[sha256sum] = "8daf0e265d05768bc6c7a314cf1321e9a123afc328cc635c18622a2f30a04413"
 
-PYPI_PACKAGE = "Babel"
-
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/source/b/babel/babel-${PV}.tar.gz"
-
 inherit pypi setuptools3
 
 S = "${WORKDIR}/babel-${PV}"
-- 
2.39.2


