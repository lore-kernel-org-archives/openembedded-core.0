Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB72310A3D96
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:25 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46591.1774529484143004979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ML1/S14b;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b98652f05so256608f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529482; x=1775134282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=ML1/S14bChLB3dXTenjpNr92fVUpZoO8XF5DjkmF9cN9UA+frZOgss9UqZgTLNJ89+
         JDxAKNoy1qf9YmGXaoJym2ehaB4x+jYHCGCaXQKyLiVI/cWMM6kKP2UDY4LkQMY9eYnZ
         +JBZ85GUQr7tn3zUbErM8evaq6yslhDtNIlQL19oXDf5QO/YhOAECx5xE6FIYjFx5zlc
         jkzVlr1f5qaxsqCZPahGxeEq+7MDb89k1eJ3e/iuFWWyiGhGzi70QPYwX5bMXWl4ng4o
         y1OOqVnm9vTAt3ZRW8t5HuKns7tVihBl+wCoieANlc+aQRyEqLu2CatuopKcnlBobOrK
         Ovww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529482; x=1775134282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=ZLxoDJemRsYIBIbZx75oQqnsN8J1w5Xrihqu3T3oetqjFIs7aEkxgjVbnunhyI8isu
         Ge+1WKpkmahEDVHS2A2hyUVm9z9QNpyTQGFR6i8b+55jIM2yXBTq7OtoYGVE6/3kgu/U
         LD4TzM1dgaXZ8WINVRPGZcLjcrL8KFojy24l6VBEix3PWYXB0RWEZ1hI7PcSVYyEXOCE
         iJ9FGD5jQbJBd+2V21RM/ERrfvpdEL320W7XAHkIl+NYRun/2/AkUzZQsRQaDKXKGKHT
         YiCfIH+IKUufKXkXB+GU4ZfqYcsFMYp5e38lz23dAJ/RHO78J6R9i2TdYVNvlCFtKFsV
         iJPw==
X-Gm-Message-State: AOJu0Yya0pXbBNK/YTof3xFOQEClccxERAMdHxxaQyDc862S990O+Sk4
	b9SrF4dVXU6ziEATTOiF3LhvXTd/LcWmQDsqXTplqqRljYqnB+fSuULuq+nWHw==
X-Gm-Gg: ATEYQzzwjJx77Zd0+BB/VozMC/O5QHPeOrwjRO2OqvzpOvQbczUhFhaPNPbhyqqO1Sy
	ui+S3mSdxtblzCFFcNUfeZqbjzw+egk9V2Vim4Cxy+lDOk//VuIkJOIZ9HVpusYmAEcHoDNJh8t
	HSJrfCFug8Mahi4ej6z/cUHdbL6SgpC/riyoVW5jJXCknyDfZn+tl/lnz7tsU393FwGoBcA6Sne
	0zoUFNTEW2Bhh/O3mwuy3I4zfkI22/xd89BK4ul67hFL9i0LtxqdYkdEWtnnASNhC6MlyHh7+fx
	x4BD9J4doxt7I3CMOUSBDUiUDFT59HyWbxnr7PHB0WyPStXJCg/eUKOh3Pxf7Evhs5zFI+pYmf4
	V7fPlNprTb9oTPTaAEoVh71mFfGdljwRfB63nUIsI4t5sPdgKHMcJtq0BVcQCE0tI9Ovkim+Qe5
	7LviaZB+O+g8j2toNktdozLvjj
X-Received: by 2002:a5d:634a:0:b0:43b:8ee9:165f with SMTP id ffacd0b85a97d-43b8ee91723mr6600872f8f.53.1774529482249;
        Thu, 26 Mar 2026 05:51:22 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:21 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 04/13] python3native.bbclass: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 13:42:25 +0100
Message-ID: <20260326125113.1853869-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233988

PYTHON_DIR now contains PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3native.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index da1283d6b3..755a6c156c 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -20,8 +20,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}.so"
+export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
-- 
2.53.0


