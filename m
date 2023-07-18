Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A24EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 18:00:25 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.2760.1689703224827213051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 11:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=xgm1mCkx;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-635ddf49421so27373006d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689703223; x=1690308023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQjTMwvNvm7THY8rKD+6NGwO10xUzzrRaYXci1T8ZuY=;
        b=xgm1mCkx2rZpFcZCteccv4AGb/7ORmF/QVErnRZvEU0/1HpcijUVXqUio/ThVcvgPo
         7YTKuBBVeTuaXYCxWADls+cTnZ6h/clm3knLf3JsR1WXCGwi5QxWsiFVH5lWl3G0w8WD
         F6m8kJeqyajMWDnuLFnQQ1T60rjgDWeAZSfiAcmYr+VlaNNKOXXm5neT89JATK8lMXag
         YDIsCFGljAlGveaYYYpXtsAx2+oxrsk8WRcrQL6gg8659Dll2GD7bR4egOVpSAEPTbst
         b2ZI6SQcpoONzjF08Vsv2S2Ls9n0BKSyHy2fG3iCLlEoz1a9zzkH6R5mdssPmq8pbOiI
         BgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703223; x=1690308023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQjTMwvNvm7THY8rKD+6NGwO10xUzzrRaYXci1T8ZuY=;
        b=YLyK4nHJtp97obgarMY5u/wip8ZC5Dplb5uFfT4imTH/3/PpYhZ1Y/+1KAynaNEsPj
         pUevpI1CCFxTxl1RDtQ2PoQfJMnYTFRE0favC9j843eZ9unQH3rG6gPFBHb8jmzWU3kS
         DGrcWYvYIZxxh+P6bigOqBaU0U6IZA5kM9hatfBkuJ8AHyqNDlL9Rad09iX46STevxlH
         ggzn9YbJy8zuTzmSGUMalsV/TaIModHDFZxXv8hlc52NkHEJfjnpRnywuz3EtAcLHkfU
         LM9wt5Jh8LxqsDJhS3owo6t5XrC5THWhyclmf7vtsfoDY/IZtHDUWomTTGSW1kthtZUS
         hOug==
X-Gm-Message-State: ABy/qLb3yhUwjDeNdsk/gmHuOOMGdupFbj1EjSha9CQGnzpMjoBRpaei
	QHc6SR7WLpHjW7fzxk5WThAtJQPx773QjJ6jnF8=
X-Google-Smtp-Source: APBJJlEwYAq7OJ/YiwmBHrjoNScFB0tROSGFbFQYL8QC2wtM9nuHHRJXeV31oUsd3ixh+T62kaqfuA==
X-Received: by 2002:a0c:f08d:0:b0:62d:fa7c:6b95 with SMTP id g13-20020a0cf08d000000b0062dfa7c6b95mr12592819qvk.32.1689703223457;
        Tue, 18 Jul 2023 11:00:23 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a21-20020a05620a125500b00767303dc070sm777277qkl.8.2023.07.18.11.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:00:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-cython: upgrade 0.29.35 -> 0.29.36
Date: Tue, 18 Jul 2023 14:00:20 -0400
Message-ID: <20230718180021.2934900-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718180021.2934900-1-tgamblin@baylibre.com>
References: <20230718180021.2934900-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 18:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184554

Changelog: https://github.com/cython/cython/blob/master/CHANGES.rst

Bugs fixed

- Async generators lost their return value in PyPy. (Github issue :issue:`5465`)
- The outdated C macro _PyGC_FINALIZED() is no longer used in Py3.9+.
- The deprecated Py_OptimizeFlag is no longer used in Python 3.9+. (Github issue :issue:`5343`)
- Using the global __debug__ variable but not assertions could lead to compile errors.
- The broken HTML template support was removed from Tempita. (Github issue :issue:`3309`)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.35.bb => python3-cython_0.29.36.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.35.bb => python3-cython_0.29.36.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 71596caedd..6aec6b012f 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527"
+SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.35.bb b/meta/recipes-devtools/python/python3-cython_0.29.36.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.35.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.36.bb
-- 
2.41.0


