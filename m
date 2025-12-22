Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63249E6ADC5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87705.1766434124812048631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NrQbOvHw;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so829082966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434123; x=1767038923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/rEDuDhKOiFZNgDMAwyBs/sldFZp6WWVDh4xFvWSVI=;
        b=NrQbOvHwIhACFIrjGLjGhdX8pgcy0b9Z2sRdYl/m2pfUGYNcOLpzY8bwIEyqEyrh59
         0rLS1T575rm07BkoLm37sy+bslcWRa0T/UZYF7ZH5ajH8+nT0WOdoxz2PCrUuKq063a5
         7EvaYjLM7ebaKBA0KulThyT/gWvf1vYCgIPkx+Xv2PLnwqpUgw+VgOJVv5gRGQ98hlf4
         PrePZpLqhPubUgS9otytMrF2Jl3yKtlosQ/3dBQ21lE9skpfgAODfpZkLOQ17PDOakDG
         6Az+D/LYJ9jfntlCVnyroWDqacejaquV/vifnLumlIN67zf/zZ7zxf+j8fxyUScXjHCz
         Jy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434123; x=1767038923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/rEDuDhKOiFZNgDMAwyBs/sldFZp6WWVDh4xFvWSVI=;
        b=tZSOWVSL1s7UJypjtLVRqyItjn4q4XO1wTBlQwewSt4KX6ZsUZ4Z06QqUqyuQx4oN/
         Nxd87gRbVUl0L7g6vWO0F+Y6j7b63MdMCeNL9O6v7H+9lkl/7R0MM98v55OzavFO2cc0
         9zBNx46uywM8Do+vK17X8HVB2JpZX8kvtd2+faxGemAovE2MojEOZXEphgZI/IHQ/paa
         fTkLcXeHs9HvGsZHsON98JQvzbkujLpCenguAXnKaNOICDUhjzlxP4RXcOcyQWp+hUVK
         gMAdw+43+0OsyJr97Tshu7ehNqoZNL9JacTZOMuAUcbh+AiNAqmT02R/Drl9B56ib9ek
         lIiw==
X-Gm-Message-State: AOJu0YySyp1t/EWau+BH3UsXbDO/imbbAFXZkuxqgmCfk2hZQmC6DoJ0
	thg4+mz5gfibI2sa5Fxqk2dS9DmOGCwPr7hecaxIQXwtS9UxA2GLCjYYn+cSnnil
X-Gm-Gg: AY/fxX5ljAIwBpezqsAIWQoCuMVytP67RWPVsCwott61YCI7Dcb5qpdhhe+3duQFYGo
	Gmyx/ZwZ2qhrON6/wHUnJ4vigEIOZbw8Di/rgBp/P0iC5W9Jp7zmpn8eAG4QIJGuwSImFntwAgN
	94b0LMTAb+Mj5E2cQC8XwnT0BqHJ/YfT6m27rJCQZZtFLuGONzYmkDtg9rhK95L/xa8owEInOK5
	vSmJMn7Mak6i/NYXBEUM62800ykW4oxLpErZnRN4u+G1AcIXuX70t02JLr95NMaLr+2n2druTj4
	XVWT48RpeeecgZhonAqmojpMRMiUB2icsu2f0U8Uh51v+SUX6yKcJurfKUYVwFoj3aZtChXL8+z
	bQSKwZKIr3mx4jcH9jhyKE3rnmb8wSJ/3Q5MtYrfv/SVL8G0qNYUyV5V4Dubjhntz+kTFkSRpo6
	J5XM0yivycb2vt8xLsK2hXE9iEEffDQOXhKs4We00OF8abpr4ALZRAA1rjUw==
X-Google-Smtp-Source: AGHT+IGlRp9yu9LoiRueZWnCEqO3mF6xXSXO1XHuFjI5XlT/XSxqYopeW+NZoMffrRWdpao2sqKoKA==
X-Received: by 2002:a17:907:3fa7:b0:b4c:137d:89bb with SMTP id a640c23a62f3a-b8036f8acfbmr1300262066b.29.1766434122986;
        Mon, 22 Dec 2025 12:08:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 084/114] python3-trove-classifiers: upgrade 2025.9.11.17 -> 2025.12.1.14
Date: Mon, 22 Dec 2025 21:07:06 +0100
Message-ID: <20251222200739.2278706-84-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228409

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...025.9.11.17.bb => python3-trove-classifiers_2025.12.1.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.9.11.17.bb => python3-trove-classifiers_2025.12.1.14.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
index 4bbdd243ef..5ca8ff24c0 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.12.1.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd"
+SRC_URI[sha256sum] = "a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.3


