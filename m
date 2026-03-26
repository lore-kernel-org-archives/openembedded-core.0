Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C656F10A3D94
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46589.1774529481895188048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rCaGPQ0q;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b87970468so912312f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529480; x=1775134280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=rCaGPQ0qzaL0SCy9risHPsT6mUyyTqADlQ0HxC6U6uwPoH8mPn9Wozb6T+mw5NMmQh
         P0DV/r9gZc3/8ZbUX8tBNb+MZWtZsixIbTJ6h8x8E3Dv41hq+o7KmaWoOj6ykWLi250E
         D+OWtt+2la495cJE035qdMX0TnOuczmTwe8rFQTcteHONMRMVEoc5wzD9jQBXe/aGMP8
         NvsJOfijXwD3t+TfgqHLk8yq+Jk919BZju2yDTHUCl1MpRRNLLSq1cpIg9YqICEPn+6F
         u0cTjub91od5F6b2sBkr5kIf/6P6wXNZwMk+17iqG53wWXLcUAjtevo9xpsrhPrddTI5
         DNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529480; x=1775134280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=ZuGcHTmE/schbQskMDXOq1POhZJazpmRXX2ZEnaKFleAghQr7o78lkJalS1ZhmmuNw
         +/bm5WavOige1xjPMeIjhwp9MHycPnCbpWrwfla8JF/CF7Tpe6BoSGR1B8AjXyYm5iWk
         eiBDc8uxkvICx+O4l5QbWxev6F8g53BVXz1wyhKFlr1WZT3iq6206MtpRr0hvRF7hJx9
         Aw46HXudH/Yy2VAWAr6vL94+F79MHgitGJI2O+t/YAfm90xKjNtpjqNII0r0ORwP3LZa
         mkdeQ2wSTryVnmY7p9noPp1aJiDdXV1W4TxmL+MQz1mP2OP9Plez8FHWS9pvA+G8Yqr7
         qL9Q==
X-Gm-Message-State: AOJu0YwftTfsBmNf3vBKIFmUnNtPvT7hp3MuU/+jArKWfi2+fbGxfejU
	/Qh8MTfSulfSPqLf/C7BV66dOzvmoZVw3Q0gS+ASpvzm75qJenD/ahHs7NPSrg==
X-Gm-Gg: ATEYQzzONzC8sGmiY2WR6YpZ6arrkjf34h8OHVOVB0ZdE06TRW9AEFydKHLTrZpPJkc
	kMrcIMwMF02eGc3bPQgStXa6XMAn90SWSMTlSvrdVTJd1JgXFT1hfG32CI/ej0RcHSVLSSFQZg6
	CV6WWl0xHQ1Dxft/s9sN5ii0cKOx3/FFLWvKLOXOvT81RLhDBbHz6cgvaH5Mo6eNA9YBOj8h7Ct
	QrWb33eigj4RwW37b6OozpGDH0EPIGWuTc9jQgRne3jAEWlIxW9nUKtFaP/pgpHO7OwnBv+AwXO
	Y2dFY29HEEuhcUeVoZqwotlC+O68+zkOPfbcGutYjeRijEBF3hi1XCREr9Bo0/Bzokm3jB7tpND
	5IolX7L1ZHA+GgPK4lKiEWen1Mt6oMDYVs2he0xQE3Hm6zAJaJY07FhdW/PGSBFXd4DrvoyuUME
	E+DzNKYfA74W0YOg==
X-Received: by 2002:a05:6000:250d:b0:439:abcd:b314 with SMTP id ffacd0b85a97d-43b88a3d3e9mr11546410f8f.18.1774529479687;
        Thu, 26 Mar 2026 05:51:19 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:18 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 02/13] python3-dir.bbclass: Move PYTHON_ABI into PYTHON_DIR
Date: Thu, 26 Mar 2026 13:42:23 +0100
Message-ID: <20260326125113.1853869-3-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233986

PYTHON_DIR is now suffixed with PYTHON_ABI.

Python build helper classes and the python build modules
use PYTHON_DIR internally, some of them do not care about
the ABI flag. So it's important that the destination
directory is set correctly.

This will also allow fixing recipes that may or may not have
been using PYTHON_ABI consistently, since it was set to an
empty string.

Also added a new variable called PYTHON_MAINVERSION which
is a combination of PYTHON_BASEVERSION and PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3-dir.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 3eb0dea9b2..f3ad0a2d91 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -6,6 +6,7 @@
 
 PYTHON_BASEVERSION = "3.14"
 PYTHON_ABI = ""
-PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_MAINVERSION = "${PYTHON_BASEVERSION}${PYTHON_ABI}"
+PYTHON_DIR = "python${PYTHON_MAINVERSION}"
 PYTHON_PN = "python3"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
2.53.0


