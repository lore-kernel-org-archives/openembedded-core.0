Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B1ECFD30A
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:03 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3760.1763849700169161339
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rgMo99k0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-343ff854297so4550816a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849699; x=1764454499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQQkxxwegfgWVnTuDSPtAgw+CpT9zuVIxxU/Lb1lJ2U=;
        b=rgMo99k0XmKmz8EsWPonIpQj4xXAbsEEcfpTX/XZl9Gqm9ngSGkONRAnjlh1mWhACT
         OrndZ8tg6x6Sn8/DHgzVUpPCuGi2cSjSUlyDVsKKR0K8eRsrm6E0YgJbeyoDedrB7Raj
         VGUPz3QpWR2hryXnNQM1msdqZQUz7DSnKoL4cLvaagvtoDYld6OHL0sPLpR64prZS1tb
         retiwvvUVjiYoPPyvqVqEk9uFtTnaPWR7c8kdev4TRYm0ltylwMc0gbONZt/Jko+TFkh
         W3cKEG9BFPKJMiqP6sUaKQBuWXvNqroFI44Il8sQrk3pwQdbVB5ee1uln0Wln7wmn9xq
         aKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849699; x=1764454499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQQkxxwegfgWVnTuDSPtAgw+CpT9zuVIxxU/Lb1lJ2U=;
        b=JvgWi7ud6Pmcv/yy96IZsCtPhXNv5t4oKG/Aai7uQu4ukUhmwM4bXNFenXCuk0SHyQ
         k2fLHMtA+tIzDWJicTgI121El8zgMbeB5i0SmiQhfcMpTlkMSOuoq/Yk31Lwa2yNp3LR
         ZDDkZt2SKRafB53Xif0PIec1S76L4OtJHXFPyBNEdgH20xoonWKgFzIEX9tyeh5JV+P1
         JaTD034iczVXxcu1/hBZ8l6KN1VQQxCVkzmQYUpVS419NFwEZzIpZJ+PTndkVoEFMW1S
         W0gJK/0RR5facbQ5lIMm6AJ8Rc20HhERLevmqbVsNCKbbrre1r3SwKiIFkbkoDYT4v9Y
         WJ4A==
X-Gm-Message-State: AOJu0YxBuF4MiAT60YOeYZ9ZOTqoWYoob6LIvgMMdAQOMnaafdz56oag
	sn9j1Y5uPF7tTLsx7t7Y4DvT4YhSiykxRwNslF/lWsjz3xmgKnhrzs+e3PqeFKyfT97mjEHYtI8
	R9dxE
X-Gm-Gg: ASbGnctxgu9jHBs1uSC1lPucxCAUb/krygzWTjDgHHifklKgvAvHKgYeJTNTjoUic1A
	DY8Ogp0y3V3xEVQxsmBzAz0sfffS5IN/r3i2kQiERIu+eXF5uytB9JjL3EOA3owJ2zmwnIz2ezA
	4nvloWtfUfCXncDFhBOLYIjVsIIu9z/xidYioQ06kqGJQjnnt1HlIMvx02F4UKBXShrzTyWcI+L
	HhmnRHV45w0LgCfiVHCq+s9Jchwpt13HqGywFByuap4JwZAJPX4wRu8rSq25LKooniNvZfvdXYd
	oVXq3jsvn1KX93yVSzU2AGDv+Iw90uQjSIYUHLS+eaeMYwpy2HOI/rr2H16O6lch2EUvfSUr07i
	euvXAsbSshtRzTYs2qUksCq5jszbC1kKITIpCwEUx4kqkl/3UXjvpMTQnTTR+EruYIvDETGbP0N
	wsDQ==
X-Google-Smtp-Source: AGHT+IHfs3TcXoIReOAjG1QcGbxjUYbgYahLTupWQvzrvBLaRPyPPbQyu65aVqwbMLhf7e8Y+HOCGQ==
X-Received: by 2002:a17:90b:524b:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-34733e725c9mr7010567a91.11.1763849699422;
        Sat, 22 Nov 2025 14:14:59 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and raise an error on unknown architecture
Date: Sat, 22 Nov 2025 14:14:20 -0800
Message-ID: <e6de433ccb2784581d6c775cce97f414ef9334b1.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226712

From: Ross Burton <ross.burton@arm.com>

Add a comment explaining what this function does and where the values
come from.

If the architecture isn't know, instead of returning an empty string
which could fail mysteriously, raise a KeyError so it fails quickly.

(From OE-Core rev: 025414c16319b068df1cd757ad9a3c987a6b871d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/go.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index dfd957d157..4559dc63b2 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -7,6 +7,10 @@
 import re
 
 def map_arch(a):
+    """
+    Map our architecture names to Go's GOARCH names.
+    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go for the complete list.
+    """
     if re.match('i.86', a):
         return '386'
     elif a == 'x86_64':
@@ -31,4 +35,4 @@ def map_arch(a):
         return 'riscv64'
     elif a == 'loongarch64':
         return 'loong64'
-    return ''
+    raise KeyError(f"Cannot map architecture {a}")
-- 
2.43.0


