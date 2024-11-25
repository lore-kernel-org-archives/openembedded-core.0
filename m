Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB28D58088
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17215.1732536102772732789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aUsELPIE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso39599635e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536101; x=1733140901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg84YcGqUu0Il5gP1sE/tW0AL+KfQcpGtNU/0UDPHZc=;
        b=aUsELPIEQqLzGBc/LQnsrT1PLlaDSDtzhrh37u4gdSY29v197Jg0aAOHQfV6BUmJuU
         y3hsIzoYYpa06dI5Qn8Xv7Pp+ZdLkBCmLeVdwP/WcIeqjAGd+pKS2Iw7deZdK2SJSFXa
         1U47ljXdGotLJW98HtOCPp+oHl5P11/UNFBjIsah9h7BHP5eDR6yTb4VupnDptHtoemA
         jbQGu+twyZzd6OtmlLllsE3YbMip5BBSH9FpBTmXFiYJpxDayBJ80sA3xPt2g0Qgg8qV
         7FQfcf5UQCbErkNdG2mM9TltJIuZs/p+SSUPH/Dw2JGVHkZhtGYqLtEc3Z83B5Cqa5gQ
         sENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536101; x=1733140901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mg84YcGqUu0Il5gP1sE/tW0AL+KfQcpGtNU/0UDPHZc=;
        b=LUWQ8OpAfbrKAUwrE/F1lLfA78WZpFK1Bjaj07LUl5rPl0W8x+A7ih0JQVqAmLMhEp
         p5CPRUpFkKS3hvzC/oCxgszNYvzZGco7ru/izZIGqF1lRBxz3qnyAioHr5b1DJ/fJxx1
         OKAPBD75Ujgu+bzQ3P93jmkC3Eo9wcPzwziMnEkyPenNUf+meW8dgAukTehsY20DbKlZ
         2cxdYjCSb9Wfond1PL4BnnxiIrkmegSsGvsSaVz1j9+p/B9xI7kIqd7l4uVI19sKnVdK
         JCzU/4PsaWFhIFoRuDBebUoCjfK9P5/V7PeXXL6I+7OuZS/1bG5eh7slgU1DUJ/DmBc2
         3WrA==
X-Gm-Message-State: AOJu0YwEld7KxIHImB+BsB5c2bpd0zpBI+IKiFbhXX6RoROqDhUyeudw
	Rm7i9itjAoT8VB9RcCCziHcuKYJ+rQNTA4PSwEEY4+UcSxEwWhYD2v9fCg==
X-Gm-Gg: ASbGncvhHTKYzdLlRKFaukutQAjpV2EhtZ1qyC8L22g1jvNw7Yi2tkHrI1FOMy/EsiF
	B/O+rW1V7RHdle0eO8BEyvGos9dkEAus0yThxAsTOfebGDqVg/2/iWS2SR9g25yEvUlX1eHn7sO
	R9obit/1WlhKOsPPIuOrYtQn2Zj1R7rZzKZe0a57mlfjl/kUTIvIu+XwJUklKrYET/DxmNEr7PL
	CuA2xBl8dPBGiebx2zPL4AzFkGG6ezu/P6vbSVP4VXJ35D3yzwc/dAH4npGTvP9UKJ0r5cUIDsX
	dW8I/eIQ50M=
X-Google-Smtp-Source: AGHT+IEar3xSLSK+aO42VAqCZqO675qoe0t4UG0kx/qZI+OMo7zzpnUAqI//MEZlWCDIKv5LprxFJQ==
X-Received: by 2002:a05:600c:1e8c:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-434a10f016amr15703045e9.9.1732536100851;
        Mon, 25 Nov 2024 04:01:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/35] mtd-utils: upgrade 2.2.0 -> 2.2.1
Date: Mon, 25 Nov 2024 13:01:07 +0100
Message-Id: <20241125120127.2205232-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207762

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index a40d79c8649..3545f8e4262 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.2.0"
+PV = "2.2.1"
 
-SRCREV = "31e990c56aba7584cde310685d663bb122f16003"
+SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.39.5


