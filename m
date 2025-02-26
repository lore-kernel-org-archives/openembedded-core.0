Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392ABC19776
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:40:03 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.11773.1740591598119028125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UDP2x4Kn;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c08fc20194so4692985a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740591596; x=1741196396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KI1TBZJzBXzS2DG15QiRTbF+jkQfeZtEJSiFEwP0I1A=;
        b=UDP2x4KnleNIb5+kZBzlv5urm2Un7bqE0s1yqrQ6CY+hPqBaY/6rUMdeh1fN/wsdT5
         918Zj+ijAflr+MKqv99vi8kji0gHZ4X6KqTNKTEZNnI07chhwypi+e9h4bf/FAo8dCLr
         XZwF9RW10xTSC2layfyzTMqpv5WlSuWuU/3jI4Oz0R+lC3B2btHY5X8Y5TkmBYSvRg/M
         EzX2Uu6M6VrVC3dUTxgK+24am4j6wvk9fmWHnpnG8O5vxcxcebcf9Wozu+ElGhxSDWGi
         w6QL8e7jh/eKWZKcYN1OUizdIY4s+J1+nusuCBVxSHOcUV1xcla5Rb+L9owB2dBbo/zX
         c5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591596; x=1741196396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KI1TBZJzBXzS2DG15QiRTbF+jkQfeZtEJSiFEwP0I1A=;
        b=mIWlrgW2biE/9eRMof1OZbMxHOILJj6xFweWfLmy2Y1cW6E+tbLVUjSUkji30Qeewd
         bH/cuLnMzEkLAGENhbcx0Y5UlbcUQhEh+XkdCfrDj0jXsBKMUw6LJFlGBaf4Z3ztD0DP
         N8M3Zs5QreIRtkP4LAo9XAbslB1hMIYvyKPQC9KDKewjsPdFnyb5Be13jWtJYir6JZ9r
         VdFoAIGhVpwt47MWe0hzPjSiktzL6it2zC/dVLuFZRjrlduCtpkahbXuqXBswhS8gJdC
         pVTunbEabgALhpHmmzdIGaQWvp0JYJdy82S6EKFERlw/GhlacFa+fDIlIEaIWTI57Zky
         Mysw==
X-Gm-Message-State: AOJu0YyQ6Wi9xXuOgIEvRbugX7Y5X3xGlaWZD4fR8I8ulNJ7lzLzANVN
	2xQcJF4cbiOO3L1CMUwqx4lgLynQkgWkld4YJJJ/8ZV7lYiGLm0qxxSr4HMsDLt7cLHBb0tFhgM
	y
X-Gm-Gg: ASbGncvjtSweOjPb1XZXCEaSnA+MXCZFq+BXuUfapwzFP83HHhVrutJFfUn/m1bbJgr
	eK7xZVQxLCCkfyWP7vdtBWD058YHULw7okSAO/2Ww7J6KFSUkkWijejVvWXYF0/Kfh78tG9Uv4+
	tMoNr0vX7a42SrJ24f5XM5o7fO45MGXw5fxxx2Bs4kR51SJVAdR138mQEg1wRCVLQqB+TYOKHZH
	AEnlbKNZaO9AePxfDxL7rx0Q/DH8wRNbVzVPVIftaknboaQiDSmpP+FLIrM/Pcyi/2LZ16RYYFs
	llkiNmdPsYjJdHYQFR6uwjMpwIz9XHRgAC1/cU86Smc5abc3AoEY6viaDDMP9Q==
X-Google-Smtp-Source: AGHT+IGXZ7QjT9fC3QEtSiXGIp5wSI/VJPsyZxo0kcMndm/A4HDMlGAiApAlEIEoyeX41ZZ3JDjYRw==
X-Received: by 2002:a05:620a:1916:b0:7c0:b587:9f5 with SMTP id af79cd13be357-7c23c0397f8mr1023934085a.42.1740591596206;
        Wed, 26 Feb 2025 09:39:56 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c2a3751sm273330085a.25.2025.02.26.09.39.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:39:55 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] python3-flit-core: upgrade 3.10.1 -> 3.11.0
Date: Wed, 26 Feb 2025 12:39:49 -0500
Message-Id: <20250226173952.2337140-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 17:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211965

This update is required for latest versions of packages such as sphinx
to build with flit, otherwise you encounter errors like:

|   File "/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-sphinx/8.2.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/flit_core/config.py", line 444, in _check_type
|     raise ConfigError(
|         "{} field should be {}, not {}".format(field_name, cls, type(d[field_name]))
|     )
| flit_core.config.ConfigError: license field should be <class 'dict'>, not <class 'str'>
|
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel

Changelog (https://github.com/pypa/flit/blob/main/doc/history.rst#version-311):

- Support for SPDX license expressions and multiple license files, as
  detailed in PEP 639:

    license = "BSD-3-Clause"
    license-files = ["LICENSE"]

  For now, only a single license identifier is allowed. More complex
  expressions describing multiple licenses & expressions may be
  supported in a future version.

- The metadata format in produced packages is now version 2.4, to
  support the expanded license information.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-flit-core_3.10.1.bb => python3-flit-core_3.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.10.1.bb => python3-flit-core_3.11.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb b/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
index 55f200a3ad7..1d44b58830e 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "9c6258ae76d218ce60f9e39a43ca42006a3abcc5c44ea6bb2a1daa13857a8f1a"
+SRC_URI[sha256sum] = "58d0a07f684c315700c9c54a661a1130995798c3e495db0db53ce6e7d0121825"
 
 inherit pypi python_flit_core
 
-- 
2.39.5


