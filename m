Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6E810A62FD
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48789.1774535441682562535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oI3deR4H;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b87970468so1032058f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535440; x=1775140240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=oI3deR4HYF/IChFaD/GkUb1z0ACeNT0sHewNWWkjhqpGBOT0DbDIeYrm6PK+9ZlDa/
         uH/ajpU3IxwlPCg/5Zy0AYIex5myXRUrKvxLiCZTKFM3dDTNGiIZ1bpRK/5k1dwIQcSU
         nA+k+N24rClnfCWOiXqgf3CWKoLuE0Y2CmuIoR87NLrp2nDkgkhxE33TVCuPvssFkmDc
         eSBTqzC9Bt1NR99M1/cq335FteRTCITS6zBNgo1zOi7JzgkNYZ3ziA1nE2KameQgepej
         sXyKolI7QQ0mdu+iPhrZAeO1HNcgenvNCi2Ky94WA+ZOktcPdH0kJKA1kKmRQrSuM7oL
         h6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535440; x=1775140240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=ovClKZ/HyFABx3WTUMV8NndQG2O+yVuaUpDILXKAGRzdKTSZDXgwPUOLk1uyMHkGk9
         Yc4HwyA6LjTp6slYp2XSoHZ7iUnt3f7kim9Cjw84DHCDKYTBNdvJQsQ+oECw/wGa6/pz
         trR1z1tR+lIMLsCeDXeJ/V4QVWwMtsCr6YJ+SZvbf2ZZU1v44029AA8y9JOEf68ACtDf
         xoa0J0stv10jehB9sViUULbTko9+xwBhDjZJd+IkHeTDj6r1dJBOQcup8uGql2Iwsk0h
         9aZSrHQWDHZACg6QuZmjgtMCuWKTyLNdIGQ4exrgHxwV718Tn7IY4c6MKwHQDDvxMwWY
         WDnw==
X-Gm-Message-State: AOJu0YzhjXOO4RAwZXjlLzcpUHTtPEjQ6RumKXDok8ijKEmg7989H8vS
	Pkd5JlHPJzsUI0LoYPVU48KIx/yj77ukkwO45VAiaX1f66o3fr7KCWQj0krX+A==
X-Gm-Gg: ATEYQzzmMr9Rsj5shiJL/7QBqNwgT8kFHQK/+WeNxBR+HTI8aKtF2jSlVlIcPLsE7wD
	qZ6qzMfVR0oogu46fz5xENZIxDFP0IRSeDqbprz902zoQc8J4/hdLMpInWL1DlBppojVPVyoVbf
	xg4gu3SdJzeJT9nEsStewdgCg57lSo+fzLK+yWWn6BPRV159qNKwc6fI/D1m3Dz14KYRu2Ml/jX
	9awK14UkDaBiXXN+5UZGdDu/Rj+YjQsWd8e/HjWKP+KkptyS9KjCbBTia4VU8xlzprx9DRt7ses
	umJEJkkGsTq2HGx+RzOh+W32E3XxmnQxjd6hoX2/qYqzyCs7SXA81+x53VJnbdw7A6050sqx00C
	m6WKwKisQEIgrJCT5IrAq1vTc39vnuKAJ39dNf0Hqf64Sr1YiejW+sXYX6cFM11w4P1vLzo2eoU
	2Sj2qZwHqEEnpJyw==
X-Received: by 2002:a05:600c:1e2a:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-4871606d963mr123121325e9.25.1774535439612;
        Thu, 26 Mar 2026 07:30:39 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:38 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 09/12] lttng-tools: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:30:17 +0100
Message-ID: <20260326143020.2083293-9-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234012

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c..ef80c53e9c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -35,7 +35,7 @@ INSANE_SKIP:${PN}-ptest += "dev-deps"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 PACKAGECONFIG ??= "${LTTNGUST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
-- 
2.53.0


