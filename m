Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE349C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.95779.1749584090113411495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eIzZ3Tpn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235ea292956so57116415ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584089; x=1750188889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhvtAw+r2hbaK97LNjlw7KltrM0DeCF1PK/5NvzoibI=;
        b=eIzZ3TpnMILJXgH4MbGIDPdfxvMWVudyZLogIXNESS1EoNSLYGCDV1PPuGM5KavnR6
         lY0nTpji4NBMDiKF2o8NBEIYUyH+wvZGnOEmDMQYkui7nsaRcyHdqN1DOkfiqqJnp16l
         hCjSDPj2AGbWbZ5xcN+z9AphI+GC3V94W6Ozu7R9N91g9cB6LWWldD25IscHq8D0Amvk
         yft9hct4rH6G9o5o3NYB1JlmROwRSkgqMuBDiSL5X0RIqlGc0+JP2nxVvqIQCF18Qtr+
         lE8yqmh41kBSpoAVcXbXrn839ity9T0NoDazJD3SOuyl0DB+gcm4OuiXSSP7Z1J9cD0T
         9llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584089; x=1750188889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhvtAw+r2hbaK97LNjlw7KltrM0DeCF1PK/5NvzoibI=;
        b=pXXtb4sjcXBD4FkvSqXC71lTbCFoBo0q65PUDNXQwRhHB/iUFO+d3o5GmV0a9ENq5D
         HESFI2s/b5nHXV0+eTpcGdeZ/Asfv+VRH49gEGGI8G6YMYvAQspGk0U9saNqvK/v+dzo
         cvckcqH+YxiEy2RwnQZR3xEuC64vebZ9l0MBjAUTfdeFiJu1yBWQxW9hMGlFGqeFuRrQ
         VRaIP81xxpYX5HyakHD0XnjRjM8dPNmlkwMy4lPvJSYvhPPtyrEPrBAL9DCOVQ3rQYVq
         9GA1uPrfhctpMVbFZcPBmdaytOwXZlIG43ZryFluLfikdKLsldUkCyRrZheGsstvGD9a
         glvg==
X-Gm-Message-State: AOJu0Yzn27LfM0pt24PvxoJ2uqodGYs39lGE84oJ5ec7PGoLxa3YE9x2
	GMRfSx2DZP+Wn6gWKV58azSiNwfQzDKgRSkGHnPgrqc3Qx4ZyHwZvEJOMGp18HQhkcKkPuxs3Kg
	Fk6EE
X-Gm-Gg: ASbGncvIGhs707yxHu15ocwXTXUl9GbA/rqBjMllZ+gSnyGsETVGKmUQcTV7PHxZK0j
	cIM7SLd59Qd3vHSPbseYSTeJnZstISgbdoA8yYNl8VmfGN01jDqaPw+H2pZJ0hF60/hLNt/167e
	zc30feJTnou7PHixfsevYp9tEQ/llQDzzPj0hWttZoQ/uhFgR5QI8isVVn6KIhbljx3bsw1cmss
	GNpiXymGq81WbKEyW4dlq8ceBdh7ZJJsG+l6ehp4fq/SQxdOvM7I5emYRYqER+ZI9qpepV4pdMV
	V+0F2k5a6ibfcUjQuph/0dvOi3/eQPHjvwTldSWo1tgS6Dw9jUFI8mBWzTbiAXND
X-Google-Smtp-Source: AGHT+IEkzbb1KSjOHeUAWmAX+3Q/6wRPyAAK+ZwupSwCt4MqDvG7GknuoA5CmWiA0Vs3wraAB4i7Xg==
X-Received: by 2002:a17:902:dac7:b0:235:6e7:8df2 with SMTP id d9443c01a7336-23641b1564amr6369805ad.41.1749584089198;
        Tue, 10 Jun 2025 12:34:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/16] gtk+: add missing libdrm dependency
Date: Tue, 10 Jun 2025 12:34:10 -0700
Message-ID: <46c7f1a8d6b39256479abd8a7bb7be1ccf221267.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218420

From: Andrew Fernandes <andrew@fernandes.org>

Fixes [YOCTO #15513]

When built without the wayland feature, gtk4 does not
build due to a missing explicit dependency on libdrm.

Signed-off-by: Andrew Fernandes <andrew@fernandes.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b32290d9bbcfccc9b85fa5acbeaee5d32d9a9091)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/gtk4_4.14.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
index 497be6805a..aae69271ac 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
@@ -16,6 +16,7 @@ DEPENDS = " \
     graphene \
     harfbuzz \
     jpeg \
+    libdrm \
     libepoxy \
     libpng \
     librsvg \
-- 
2.43.0


