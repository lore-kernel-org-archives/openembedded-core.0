Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32038C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:23:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147256.1783329797522947394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hx4bEbjb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso28850305e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783329796; x=1783934596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpWnEcTsXgGmN12ASZDn2+m3PHmxizgSdbZ3eqF/w5g=;
        b=Hx4bEbjbcU5pLKi9z54JqyUdUYqkXKVnc29FC+F5KXWZzVEn5uDUYY4rwFyj2PQRhc
         pazLu3waAMRsj3KbaC/jMOxWU3SUw7EWhhVsJeHJyk8jjxMx+RSc96vQ24ODc5Jwm0Zd
         TczjdWmxTspEhylMkt5uVesnYW9Qwir4aQjyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329796; x=1783934596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpWnEcTsXgGmN12ASZDn2+m3PHmxizgSdbZ3eqF/w5g=;
        b=KH7zj9MRNcFsfEIfs9v5xpHBltUUiWFuFzwPb3u29Lwan/7UGqabxAoF0MxU++FnDc
         tDXp7EdJzYs8r1ZIQjAH7wYVCbUEAgt6nZ4YDts194SNyNiJvNgZtCcqZx37RoZu0FLI
         fSTj1KEc3wYoXmT1BrSqg4Kr5mRxAIoGdJ8NrykU4uR5x46/dCtNuh8L72UNeFe0yMRH
         wgnIQz61I+eruYaKoIsElE8YH/v7Rg1vu5vDzxDVb4nUfQq0ntupIRlGo3j0VPg/grD2
         G69uc8fXFA+WD71Z3UmxxXOavYRgKUwJYF5pgNvm5G3YrioPe54V75KAglpWm0XLzQ/b
         8lTA==
X-Gm-Message-State: AOJu0Ywg/y/kjyvBv75Del7ydQo2Eg/L2jl+9y63BHVgOzFhW2BJd7TW
	6YsyD5FdNqI2jtD2im3VU2jB7jXm4xq6U5sNzFTBbfqOmjXNgLdg9DJI5GLk4GoagPynaxrm0kV
	yRkiChTo=
X-Gm-Gg: AfdE7clBZmCvB+izc0wu4AGK7zy4LzVavay3tMZWveg4CJ9V7fIyI6P6ZrMYXcZ5fRu
	xkffvHgIEwQmZBEghTbcGTbL+9kQNR4qOc7RXdULr60H6Cn8SxA1Poc4wvY2GYex9LdSlq/i1DI
	DT2kWZOgbkAquvfbfPIXkLD2S5IBVH2kw0fvLvEtLDX1AbLwAoWxb9Dh0Hrj7zxxhzEmMRFR62q
	NkQyWo9uKNGI7si30xY1y4vlybWRnwKJb5nSAEZC2Htsrc8aLv9lWBlKd9UxapUcfgxxFpNpxTs
	ZAXwMJxNjaVHZVeoAsdNx5FNmaHFQLelt18fmclAoGD/zab+SvXs1NM0+0uyJn/M1L3KszP2xO6
	/Xe26yPNK9ecDBwd5ncXMUw23LiFLvfWKVHPcujmLggZp5ZlGAJbH0iH1LQWqW0SZa7qNmFqkrt
	A5fz1BEzZG26djHgy0VvkIICSpJb8DeYJY6+kBY8u6BA==
X-Received: by 2002:a05:600c:19d3:b0:493:b89b:9a27 with SMTP id 5b1f17b1804b1-493d11d7d60mr122345425e9.9.1783329795447;
        Mon, 06 Jul 2026 02:23:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm591882555e9.13.2026.07.06.02.23.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:23:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libjpeg-turbo: Add PIC flags
Date: Mon,  6 Jul 2026 10:23:13 +0100
Message-ID: <20260706092313.518724-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240229

Our cross compiler generates PIE by default but the host may not. Add
oppropriate cmake flags to avoid build failures in the native variant
on hosts like OpenSUSE 16.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
index ad9c640ce99..98e2f00a57a 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
@@ -26,6 +26,8 @@ export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_D
 
 # The binaries have RUNPATH=$libdir, which is redundant
 EXTRA_OECMAKE += "-DCMAKE_SKIP_INSTALL_RPATH=ON"
+# Ensure the -fPIC options are used to avoid -native compile failures, e.g. on opensuse160
+EXTRA_OECMAKE += "-DCMAKE_POSITION_INDEPENDENT_CODE=ON"
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE:append:class-native = " -DWITH_SIMD=False"

