Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13393CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 06:22:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.3309.1761286942449227406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 23:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iymsq74g;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33292adb180so1661259a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 23:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761286941; x=1761891741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5Iv7zlf4EL8Jy9mRrR8bmuQh1moGHnmf0Xb7gCYdRk=;
        b=Iymsq74gkKw2NJmZCm+lkNbNW9I1mM24X0B1xSnR1lAbBDa67y6MX73oVQZ6dHG8Zz
         rhrduG5G+euWGECLpslIUmUqvCzgq7aVoEfiiqCfdiqQWpDI3Sg6UtFaGhzheeVaYRcf
         qH6yXNFwOB9yzeYrl6gKXV1Jh0A1kZAK7zm6PyeJMxOwpNS8fHpO4qDqYc4fdp7mwZTI
         ak9P7/9Cq2LpBrJZEfUWfzRGShrMVfBON1Rzw7OkMkD8k7YA+BzkW7DFsaD0eOVXJQWg
         Lny/mRynbBWxWpk1S0vhcsAk+G+BGQfNkZHnUtzyi4N5du3ato/S1JReElLx/QKmXK5Q
         Hvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286941; x=1761891741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5Iv7zlf4EL8Jy9mRrR8bmuQh1moGHnmf0Xb7gCYdRk=;
        b=AQtiuwI2uCKR7V2PAhBqvUfHcs4s07cb69opUfqwV0BCAJEGxvhVhN1r+3AGtVK2Eb
         EqYouv2iZuLOklLmemPFuXr42mNChfm5dSNQmIlrUsCLaOG+EflEKqBXtNcunea4MgCP
         OyjvJUN1SVCceP5qncoP3X9JEj5+6LSOlt1GRPdNwZt4vtjsGh3qcmqLM830/4H4iOwm
         7ZRmtBG67VHk1U9TQk0jQbfaDqPPzzfcfBVH6EFTreJsQehx10lNlBJFB1HIh3zrUNbc
         78Ad43cNBszmjOfzybhggFNUZ69oM5UlhJd8DcXXPGiiL/PygUxefjq9Jnt/2sbygl0v
         sTzQ==
X-Gm-Message-State: AOJu0YzLtpnFwf5kYoNlFdOGf2fjtjKl98is4dJAbTH3jIH+vfYFZror
	n4dbD+AjBAlh5X1oi7okcZh1sUULDNpbH6MXG1886/OpXAUKyKJnd14CoAy8Dhee
X-Gm-Gg: ASbGncvIFFENVc9jpt8Wh7EIb6SwAxY5fi/ljxMOek3aPkGibvucLyj78FtC7KrsvjH
	h0jv73DhW4rDrsuERzPY7hZqE19J3D9unZFitomICktZWgGmk3+TkJ+7AanK26xX3co5/gvnUQ2
	grVhRlhvnaq5KsoVsqm17zJIEPNdlZvtdz3gDl2v1qzrm0gM7poiuBVK4N/Pbvx5hw5iPW91btV
	ouoh90yPaPjHO7AsEzdww537pZOLDYzWHFHt1R3lZajjEnUkycekgOUXe1vSeRyaz7nuo7nnOHo
	DZRAo+HH3tzdBQX1w8tQnYXVHU3HWc5HpMlQMG7so51IRpApQvuyzCJ7OXdCGfNcaj8R4dSQ4XS
	qGyfj0UBF8+ESLFeoWxeLdARpGdpouIwWkAYGLAxhXQNpJmR375YY98Fl8fWmndrCqwUqqiPfwj
	VWRGHt5lYG5jl+iuEkp4Zb9Ch2ialZD/PzxhU2uFGdfMw00s45N5BYdt1q5v/2LAXlus5K0Mx0
X-Google-Smtp-Source: AGHT+IEpy81cSocXZ1w+0c3GcQ2rGD3ktaKdPpHdCjQGWI9JR1+aQSGGMuqy3N8Wxx2Zrp/nbKEt3A==
X-Received: by 2002:a17:90b:4c92:b0:336:b563:993b with SMTP id 98e67ed59e1d1-33bcf8f9153mr36876216a91.28.1761286941501;
        Thu, 23 Oct 2025 23:22:21 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a359sm7959073a91.12.2025.10.23.23.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:22:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] devtool/ide_sdk: Fix help message syntax
Date: Thu, 23 Oct 2025 23:22:19 -0700
Message-ID: <20251024062219.892203-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225281

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index d9b54f79911..87a4c13ec59 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -104,7 +104,7 @@ class RecipeNative:
 
 
 class RecipeGdbCross(RecipeNative):
-    """Handle handle gdb-cross on the host and the gdbserver on the target device"""
+    """Handle gdb-cross on the host and the gdbserver on the target device"""
 
     def __init__(self, args, target_arch, target_device):
         super().__init__('gdb-cross-' + target_arch, target_arch)

