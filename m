Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F7C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.31803.1742141573817604543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W21xW9Q0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391211ea598so1942325f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141571; x=1742746371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Quwy/3iiJjA9yoU0aZ84LeFCH5HV/5BauL6uOW7IlVQ=;
        b=W21xW9Q0Xf+2ISq0ysQoc0GaUrPOAmPed6i9Yj48GBs2D1GVA5RcdAFBcqjBNROi/p
         LAcsRimRo3SQRCqLY2k6SUVLvC/VUJ63KGyPo8S0nTDzFGKHl8abK453qxIx3R6hYCsx
         zgNyoY5rfTgKrK9zDIWnXt8Rd27fuGjPj+9Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141571; x=1742746371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Quwy/3iiJjA9yoU0aZ84LeFCH5HV/5BauL6uOW7IlVQ=;
        b=SE6FFX3u1eVt5zbyCFMdBGLOqJADHQLfm7A75zzlf2O4FCgQ+oh+N2tcTB59/TmqDy
         skdiVeRV2Kz/QGbt3vz+BvpH/n1wzYSziGu+BUS00cD3cuNutESBp6vzg9ofk2s65nFG
         zB7PK3gQCKEV/4CgjiKeZAIZfXBR6IEbiKI8U+4nQfaHB8Uq4QEGu40vCaxm51NdCcwN
         QdQMur+yT1SUYDC6cZoXsmmtQDtvJEIL7vbBxoFViJyY4rBh0N0vSE4o1QpvlNTLyKyr
         Dsan3anVyns2xQYlslxsHxKJmJ+yNBMfFWw7ZhnZl94rNx/YPInGB3Rd+cqJMF4ImTT/
         Imbg==
X-Gm-Message-State: AOJu0YySpJ1sY1NKQz/jSCRn6a2Npf4wKpOnZBux+mN0gvIvEvdt9WVh
	VqqQXo9lCgCso6OIZ3q5jfyfMBO5c0oztceX33Otqn4rcLLOf2SLNI+Iy0yrl84ms6o62IM91qA
	M
X-Gm-Gg: ASbGncu98+Wtp4gs6H6A9Nckd+T60v6bUO6J2T8GP3tEOs2pO0FCGPvpxN8sp3MhSKJ
	q0rZElOJOM2h0ZFtOeHRcdK8awds0ZG8fc+1gOyqKltVmM/7srZotzFp0S1ba4O3hAsy97Zc9Tm
	8audvVUx/HU/rGXrjGDxHDrJxkSCoDO4mGE0H+dcyodEGTPp3hPAV9pYeZtosiGD/4pFtl2bv82
	E1dbYVmCo7EFj7H+380pEhy84ei2GZhbjINiH/T0jp3Tiz4m+NKDlB0UERlWDJSznvsn2PIGswS
	uPASVHSXr6C2Mg0vcML6aL4k1SOQ5rk4aSDA+w4xB09fsa1vtHfCqmMOWA0KhzUFcFhMAl8uMQ=
	=
X-Google-Smtp-Source: AGHT+IHM+htqQqLz0CcgFytZHdd5ADFms4Ei4PvZv/oD6T1TQD8k5Au4qj3FDXEkaoxBrK+OxCDFXA==
X-Received: by 2002:a05:6000:4027:b0:391:1222:b444 with SMTP id ffacd0b85a97d-3971e9720d7mr9464348f8f.20.1742141571295;
        Sun, 16 Mar 2025 09:12:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/43] python3-trove-classifiers: upgrade 2025.2.18.16 -> 2025.3.13.13
Date: Sun, 16 Mar 2025 16:11:54 +0000
Message-ID: <20250316161209.3629986-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213031

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...025.2.18.16.bb => python3-trove-classifiers_2025.3.13.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.2.18.16.bb => python3-trove-classifiers_2025.3.13.13.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
index 6bdce9dc79e..f2b06b2919d 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b1ee2e1668589217d4edf506743e28b1834da128f8a122bad522c02d837006e1"
+SRC_URI[sha256sum] = "2a5e24ddafb20da2225a825fe167c4fd4ecbf312cef4310d67f19dc40da7dc8d"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

