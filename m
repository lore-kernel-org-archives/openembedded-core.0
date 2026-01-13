Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45404D2F356
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:58:24 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65245.1768327097177004358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=z959KlHk;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b1bfd4b3deso693577885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768327096; x=1768931896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pumSugBNPNQQnXxZph/5yRytvTOj4l/vi+vMKRZZhX8=;
        b=z959KlHkBwXplVooqylB+tdj2lE4LYa+bjKcgCBTP9aecLVQ9xiCBMR2KgJwQSDiRB
         K73Djbz42+pEjISIvg3quipbzdSnWrslsW4dJKxm7k+ROz73KtnVOzar1ROLZFb9mTeA
         u/aVlWgkBWTYswOYYeeXWrZHKGT0Z4vU3+hslgu5ibJ+XxFPWdXjW1CLBp+CaYCV7Dnq
         DVvdUxLMtuBlNx58Kb3ND8Kw5/8C+YdhNaOrDv3fpP+D9Cvea9tJRhlGag6oOEcZj126
         Zpl4JUuK6T38h3BSDpxe34Ke989yFANRLeF9xODgiPOieIjixIbqEM/Jd3OPiPDgQ+3x
         7Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327096; x=1768931896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pumSugBNPNQQnXxZph/5yRytvTOj4l/vi+vMKRZZhX8=;
        b=XrVkY+8LMI18Ah0C62EFyBncdatLnDou/cfzK+iWpu+kxvmdagiQLViS+NSQANYMOv
         VBk+momX0B1fiHmlGPLY0c/yXVDtgcxFwFSn03bEj7pFZH/edASQVfXEpNvBeoV3V/xf
         jnb2wiIePzFwA6+VDuea/pqMc0R8P+wuD1nBh0wlrH3GS1IpCh15/NCf4IMbf8Jffvnc
         bYvpDgM1XHTq3cHFKpCLrwx8tCIqDhHBdEi2+nU5J885vdGEBeKiZetHwh2omZ7hNS/H
         xZ+xTvvFJunPIp4LGIjwwqjLVo0wJUmT1iZ73QOECjL1tAseGTYkQm8luoEE8zTNZXMS
         abCg==
X-Gm-Message-State: AOJu0YwV41EFrAFA5+4AU/eah3pDjlvU7vYfJNdmZkc0dEJq2HxiG2+k
	s7bWnbpB9OTAjcOM+FCCFQOCAsgpH6Xl9i0EJ94bhFKMTVMijNkvGzN68SZYMbN4/X/y33kD+aT
	aZmzgvtA=
X-Gm-Gg: AY/fxX7YWxyvsZYHKaRYKHmFITwLWZTYo3rrSKk9zUClwu0nmPsBconB61wTcopxk+S
	Z/LBXtssmxLHnaoWM1OMNhAL241/sTXXHmbV+JC+nO6VMKvn41WIhPtn6WHX5kRk4ryGFU5gFAq
	HgWsdW+HJKaEPwzzfD0Q777F4HBSzqPo68Fnuh4jjxZ4kZd9o9XRb02ybhLplS5UMKuAx4b9bvn
	1z9VqqBjpUmtcHCJSU/aNThcuAS5cu3i0Cifw+ApUTA3rutFGKBOwydBpsBWZeSlRLCfwUtcETQ
	9zXQy9/BSgsCgDNl27yow+gFphacHycIgyvZBRU4uNmNjMwlF7yy9XuQkD8NJxrCoSVuX3eqO8e
	s3uASnJnhL5MSX7EWahskrKiffadp7dfdaQ8qkWay8wsjzDziblRU3MK+0Vzlj7QGKN8u0cnkjq
	a2LN4SrpDHoWoLdWaxmFqBOEoIow==
X-Received: by 2002:a05:620a:4620:b0:8b2:74e5:b13 with SMTP id af79cd13be357-8c52fb4cf75mr9647185a.32.1768327095636;
        Tue, 13 Jan 2026 09:58:15 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c52ea37832sm38103285a.24.2026.01.13.09.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:15 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 7/7 v4] python3: add new files to compression
Date: Tue, 13 Jan 2026 12:57:58 -0500
Message-ID: <20260113175758.1409859-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113175758.1409859-1-tgamblin@baylibre.com>
References: <20260113175758.1409859-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229287

As of Python 3.14, there is a new top-level compression module that
contains the gzip and tarfile modules from previous versions, along with
a new _common module. However, for compatibility reasons the project is
also leaving a copy of the gzip and tarfile modules in the original
positions (to be handled in a future deprecation cycle).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../recipes-devtools/python/python3/python3-manifest.json | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index ff84f2d305..78526cd4b7 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -167,12 +167,18 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/gzip.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/tarfile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_streams.py",
             "${libdir}/python${PYTHON_MAJMIN}/zipfile",
             "${libdir}/python${PYTHON_MAJMIN}/zipfile/_path"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__/gzip.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__/tarfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__/_streams.*.pyc"
         ]
     },
     "core": {
-- 
2.52.0


