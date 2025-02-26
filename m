Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A60C021BE
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 02:54:47 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.2610.1740538482348878434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 18:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=PHHYXSDE;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e65e0a3f7eso28911916d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 18:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740538481; x=1741143281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KI1TBZJzBXzS2DG15QiRTbF+jkQfeZtEJSiFEwP0I1A=;
        b=PHHYXSDE+onv3dP+0me8yHLQR/KWrzxPBwgIEVA7tP3IXi5GcoD0FQFQm0hF1KtmTH
         QBrOvwi+hz5QF+tovl86RGjTcaL0NAtVjbY9MxoAT6L3XLZ/tulxA2M8P0gvjHXdUwMy
         J+YefmqS9JAEdjRExcQ2EE9CDEG0HXbf4WwQm1/8c1IsG507W/lOmtscVYRmkWR6syZ5
         LshKQBoDxhLzgyT48L2NbfSz9KD2YwvzQZcTOFldo/JPphBcrHMMxSu1HGGUmqmYNF5j
         VN7FDAIKC8IIYcQiirN20YWm/rQ/UUA3YmUSIjVpCHHUB3UiJG/M+VURDqApuJJG7xPV
         nhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538481; x=1741143281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KI1TBZJzBXzS2DG15QiRTbF+jkQfeZtEJSiFEwP0I1A=;
        b=FnigU0tDb8e1HnhYkRDfewykh3t2hmnRLqQu8d9qIxFa+skeMgq7tq/fl4wXYwuSR2
         kv8j+JcXytslRh933CvGQ7LL74l+RDlPCxWvnpA09Pm/BnYIhWUONpKl7q2fSXtoOi6i
         KkkDMkZlhL2lB9w8pQPPokhR28BmqP83KHPLhFh50bkbrhIFkdmZcn1we+jCEAZ+HzqA
         beB80jy2hYxHDX48d56q0JaaN0IjVpdIqp5bX0EjfD3jjtdaORhZGKGRO8HX5Rr/VB2A
         s2K+lvvter39puRrlsL9TVo1rc41zL9mG63tmnlvzp9fKCvItkHcPuc/QktJERJzTDEt
         Jr9Q==
X-Gm-Message-State: AOJu0YwBwlS3mhviG+bXfvyPjlbBlcusUDkGAxjdQFmYPcTilC6j+DTa
	6f6hgsL+wSi62CCrTieoyPBfTtfAuyNQbQ6XE49hN7O4dt6cIJL3LZ4iHA2Y2FrA88TsFTYUX0B
	D
X-Gm-Gg: ASbGnctkTD5QzZlqtsa6cWaGrtlTog1KHNlRUOSZn1i8p3HyAhn9NZf1FsrOmRKTq1S
	wgP2EF0zBhkq0WINJdwp9f7D78n1oMZnsVEHnzbpOTuMaQteZOHONDA9hgpTR/XbDCHjeER5Sks
	qrB4cX+0mA2fTeUyvOcM9aOWQXo8ap2cuqswDIO3DF5V3skM/TBwq+99xozCq6vQAAXGFZ7NTAN
	SJxrXxydoM6B4qlwu25R/0j2ETGQxdhIfUzczsv1Ix6uOfVWXVZvKTWmNpwmm9AQiPVWVsppQjE
	T+VJrv9KzHDbYDYEcd4YciheL2zZ22MCVAYGstRcR2+1Relvp5nLR8b21PvMTg==
X-Google-Smtp-Source: AGHT+IFJJOwVKC2xQlNSYhFTbdJak+cPfgJg1Rbv6y44gQFDo0m5zvS4ZCklFCNubHcZbbNxigBU9w==
X-Received: by 2002:a05:6214:5012:b0:6e4:3478:b55a with SMTP id 6a1803df08f44-6e8868fadadmr20218266d6.35.1740538480718;
        Tue, 25 Feb 2025 18:54:40 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c33d05esm186124185a.96.2025.02.25.18.54.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:54:39 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] python3-flit-core: upgrade 3.10.1 -> 3.11.0
Date: Tue, 25 Feb 2025 21:54:35 -0500
Message-Id: <20250226025437.2042320-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 02:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211939

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


