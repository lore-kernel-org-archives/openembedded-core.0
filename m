Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA34BC79FA3
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2594.1788641128417533333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sj+eTAGI;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482dbe4d247so1316797f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641127; x=1789245927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZUASDP1ecdzK849cYk5+mUdR+TRMCCbueKhxx0fvwQ=;
        b=sj+eTAGIUjDvda6gHtyF0xPrwXYmDoPjsTKx6GU7p5SrKdH+Y/4i1tveYpbjePeimW
         dymqRt49I+lb6NKnOcdrfIfl4SZnoMgPwFIeA0gsu4zhf0u4tG08/4h++rLCL/90lnOE
         cLAmZGOKJvLZBSJ7pziGwY+hkuzj+mtjxHSYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641127; x=1789245927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZUASDP1ecdzK849cYk5+mUdR+TRMCCbueKhxx0fvwQ=;
        b=QQ2sgKbYWpwfLpme06Xx8H/C/49sd+kkEko9NZbs0zT+6JUUa5n3VoXHdLVvcMRk6M
         ohlcn/4szlWXZUjGf23FiQtSMozIUoJCI36w6/ag6koKQ38HtQywdN3XjHqtDmQGmNtS
         UwaiCrQSobOlQd8enJ78hUp5mzxC75VWCYE1uOJfzsf1/2HHV5EGU0QgVVtM7k2iqb2u
         IycSevISE2Cv1buwsWHSCqQYhXl5rZwtznylXTs6lbdZwJAQ6YMf4DxK3zO12AqkZUkh
         SwHes5B90+jp5IT3oXnGV3zPVZ+yTOdXWhoz/gHMvwlBKz6NxE7EVldiwwr0ojR/UO0D
         YemQ==
X-Gm-Message-State: AFuF++lDE0VHe1Oyo9yukTzkwD+koJaO4lrt11mYGDzeeqWBNdWKp7SX
	CpQywOoN4yqbJbLVGs5jVAvpdBMw1hKuT8D/EdumdVQUKNhTJ8GEkyMhx9x5vM1wBCHZjTk1fIH
	tRGpxfV0=
X-Gm-Gg: AYBFou1TELjtDCy44CFWFsf8FoNRQmAbfpGqokKgb9y6uOKL48BOb9IF/lAyPN4vBa2
	IuymX5haidITU8u3fFzg2kbdgdD3ZejMaFMr82cQ9cpcC0z8EaoCwSO6cX5Gr4KVOIkLPWpze9o
	CWtzH94INE7w45/oMFQ5r4ssTssnIYr9NNgRbeYtU6/SQ6jPvl6CEQauDyb+Aq2DpEmu1VYBWWL
	3+01pxL1coS+EOTHWCHpN+iZ/4E7P/qytY6TFdOVWE38G00xL1LhROsQJpLwmgLhJBlJ8rKrOE0
	WMrIZtM/Se4e4CMABztXh4bXpUpEhZHO2nCbvqRxgYqS+sUM7gYqLdWOFMS0DJ57FIFkIZgZ483
	4DPLVQHfvz8jOQqgyFO29UYsI5GHMb5zNT36TAuZmRLUHft+S0Yvcwwpg9xh7ysE80a0Xt0BmTy
	HkI5yh0Jahs8IeK1vlBvupVZYFXJ/0zx8Hk5SF+AjDbZYEeXMEZsFnhXCEP13ukvI2EhV5NGEB7
	TVRVg8JrnrpXVc7vZfL/B+hPAMYDMQwxx9WkrZTHaWzWg5L8B1tyeYo7k69+WyksQ==
X-Received: by 2002:a05:6000:26d3:b0:485:8393:2176 with SMTP id ffacd0b85a97d-485870902eamr25564543f8f.21.1788641126607;
        Sat, 05 Sep 2026 13:45:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/40] python3: add missing pyc files to core
Date: Sat,  5 Sep 2026 22:44:29 +0200
Message-ID: <b03920bdb50fc05ab89595cbdb8d155533c07396.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245180

From: Tafil Avdyli <tafil@tafhub.de>

Recently _ast_unparse, _py_warnings and annotationlib were added to
core. The corresponding .pyc files were omitted, resulting them to be
generated on the target.

Fixes: 01982411b5cc ("python3: add _py_warnings, annotationlib to core")
Fixes: 9dfe1e7722fc ("python3: add _ast_unparse to core")

(cherry picked from commit 300a0ba0bc96b66be63f8c4324342ed1a9ef3c73)

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 11ce2c97d2d..5d46e4e8b9b 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -324,16 +324,19 @@
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_ast_unparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metadata.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_py_warnings.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",

