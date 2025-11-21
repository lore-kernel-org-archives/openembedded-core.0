Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EA8CFA779
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8836.1763722847862105221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 03:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MWJ2HJ+G;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957c929a5eso2635245e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 03:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763722846; x=1764327646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kj6f263pJPT6lHGgPpEfTPtjAQuaTG8kO+EwoZ7dJ4=;
        b=MWJ2HJ+GJ9tGEiXAKFjsPpcIi6EPkqMwP/HyJq/7FcUfxMLH1yjoikvGyemsI+NVBI
         xTivgADfLoo6x96MBMvpPOp0qyUPkCRCRFWv9r/0H2QCbBs0r0S/9/jlmh9GWKH011uz
         4Q2CKAHSIXhcyZVhGOxGNH6eT4lL766vE38gs5Cd/jAqIimKmMk/yi/OwpXgkOmBXdff
         QJsONaZB6GI2E/klwgco/EksOBtumEZpJsIbLG0PakCBSCDLC6wnzZRK+QtRgi3sGFTf
         X0EU8o7KCZie+B0gJ9guPrm47USD2sn55NdKZ9Bjd1tRnUzj+x88rnZQtG8DcwvzMfuD
         S5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722846; x=1764327646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kj6f263pJPT6lHGgPpEfTPtjAQuaTG8kO+EwoZ7dJ4=;
        b=hVpiDh9l28c+X7zr3rfraLoxZlotkOnvLgZxUCISZIUbi4Ay9T53vYWd3X0LauGk/Z
         CAuVkE+ARFS1jnvQOnk9BIUscd9T5iXNThOw1imXcZjJzxkjskz6EhqNyfdx6ucxTsw8
         W057KuRR3NDqKUAvSxWlAW0lwdqVpFIeZu0sjC/T5xUR4pf4FEXMniUMCknhABSQHTST
         mrWs2/9tJ6KERWVaqxkg6wPDA6yBZ9I6h7fGpNkJZ0R7UrQTjz4AY/DImK5RKWzei5zW
         /naHyas193ZXWWxjkowddT6YJ6O0KJ3FGJVu7uCEGXwR/SPrh2zSWiqY7yKuV0UgH9qJ
         0P4Q==
X-Gm-Message-State: AOJu0YxSuAmMfhYHJg0gDYbCY35kmXvZWv1Cm9Ii7rtqHnczdskzmoAs
	5f/Jqyn6DUlHmeJtOqyihVyaeErMzxtoKm0YjDvXvDgVBSKOO+PfcoPoRDHWejaWC9fLD7NBhXO
	fyMOgMMo=
X-Gm-Gg: ASbGncu04ktGEy4qahGzYr1OaRtLLjHySKLovnIiFqAypt/90LDFgTJ9UtU1ITTuV7j
	6JIOExNFAVJvsgoJUeYQC7ycrYM9UfX0zjvM0ikcmYeqWQnLPyWIHA1KZMypBD+fqI8XELL1Wgd
	dho+ZMe/eUSy7y2hxwKyjI7eU6C01SEMycpzp6NbdH9xN5m8TnDIq5c3c5kKfpv15/g1hZsPy9m
	uYI4BUO8Dsi3OX8YfQ14+vJz46gLV95b0/NQMdvECHV5ewlSs1rabmxJhL7oD0SA+fxAU9hOxlv
	cRd4fea/ADsCWakjzMZEV9gcFl/AS3YRSyZARm3zMW/LA1va2TeW30ju5OT2GcPiaU1ynRImKDK
	JucD9bCCp33uPNJlb85ZWob6fj8HvSe93PCpM7euSp7nYBU5URTnSyXLDvvLSVeH13oBWqBcihs
	TwiNnny+ixKShSxd5Zv0+VXZMcYZwXOCusQtsohFsTqWnr
X-Google-Smtp-Source: AGHT+IHgRkct1eGsF/8086bhTYH+Jo3ikW0h4heaxJveGGiLUaHPwaR5JRR1je52tv13bvcZvZVhUQ==
X-Received: by 2002:a05:6512:acf:b0:594:35c4:fed1 with SMTP id 2adb3069b0e04-596a3ebba1amr649853e87.13.1763722845630;
        Fri, 21 Nov 2025 03:00:45 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db746f0sm1509617e87.3.2025.11.21.03.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:00:45 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa httpserver.py: fallback for multiprocessing import without bitbake
Date: Fri, 21 Nov 2025 12:59:51 +0200
Message-ID: <20251121105951.1158626-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226668

When testexport.bbclass is used, then build environment and bitbake
may not be available when oeqa tests run.

Fixes oeqa test execution:

https://ledge.validation.linaro.org/scheduler/job/123974

ImportError: Failed to import test module: apt
Traceback (most recent call last):
  File "/usr/lib/python3.13/unittest/loader.py", line 396, in _find_test_path
    module = self._get_module_from_name(name)
  File "/usr/lib/python3.13/unittest/loader.py", line 339, in _get_module_from_name
    __import__(name)
    ~~~~~~~~~~^^^^^^
  File "/lava-downloads/core-image-sato/meta/lib/oeqa/runtime/cases/apt.py", line 8, in <module>
    from oeqa.utils.httpserver import HTTPService
  File "/lava-downloads/core-image-sato/meta/lib/oeqa/utils/httpserver.py", line 9, in <module>
    from bb import multiprocessing
ModuleNotFoundError: No module named 'bb'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/httpserver.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 9e61cd89d5..cd42d3ed4c 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -6,7 +6,10 @@
 
 import http.server
 import logging
-from bb import multiprocessing
+try:
+    from bb import multiprocessing
+except ImportError:
+    import multiprocessing
 import os
 import signal
 from socketserver import ThreadingMixIn
-- 
2.34.1


