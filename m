Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D82DC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:13:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15934.1741875221815016315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqhFELf2;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso9227665e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741875220; x=1742480020; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=BqhFELf2Tb3Uar5boe64AQdS7YflKL+6VUXBjjIkuEflvjhPllbG8B47GSU0ffDkmT
         nuNDgqol3xC5wofNgqKnzhmRycIDAhOjx7d4wjUwBoOCcGBT8G8o/bugML/lKbbQff7O
         RlisaPHuBf7qkxa1IXk36C/3njgBhakzf98h4g0UBFLYuR8yK3ZOuLXlzvUBPqxF/JoA
         UuFgWHuGst5DicgBjgGeYaeyGICwDAUF4CbbUb8jCqEmZyWMNZs2hex+lxbTV9J+5s/F
         It7/pUNrVkzJKFGfhrz9mBS+ysVqZ2Ohy0bZGpi+amMfbFoY6M8+T1n6lDH51/apAOPC
         k3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875220; x=1742480020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=IQrFsvUg6wFuTKNzqNF06cfujv4OtnthzmaM5o0eb2gKwSPigdJIpYr513UOvVHc52
         tmOx5BCgAdn3MGlqHcifO6C7UYPsLLhtmkHn7yUvZegzHTUu+TrDo3C/4Xrk1Is4IQJV
         Qg24Fv/hbryfOJlH5XFdm73CX41RJ73VNQdqv6VBa/Y1hFBUOE16mHLwMGnZI3/zZ9VU
         +oycC8QrHb/eLAl+jhTYbr4zg/mtbOiGJJz3h+AYEx7sY/tJybiah3ISbPiys1v2wjto
         vU04716LBonWVhbUIBguhEGiBD3JuCF26Erl7mAeqLRN7twvaSPfA9ssLIDCSPqHmvO6
         jsSQ==
X-Gm-Message-State: AOJu0YxlZQJwWAK9b/DXELCtOy8zCf7+6yXuByBC/NEFiaeCDW/IyqPe
	mXJPCNiUoYmP72zzsowWJPSbP6LtU2bwDjArgH5bD7vmA8t5n/+RU5/y1X4C
X-Gm-Gg: ASbGncvyrTOWCB75vN8wexFvEB1HjD4FzysESGUGxMJbqhpQL8AvAJsiOWpaCiIWOmP
	xEVZreCvt7C3he5TADmJgENQApO93yshccU9ymQ5ZdH3SYroBYdAvsk5hcMkmKN4DKhFjcT8GVy
	SOtNTZpz9tNR7tL2Hy1eD0mfqqMQ2UCPX9wqQv1urs/o87oYw13XAdeJqgfA0xlwwD3k0Ja1MFG
	56jdJ9aB3lWVlrCl4JUJ6sdEZpeOEsVznjFhzIGE5gBAeTI7yIseu8bPXxSzu3OZJVlLcqQ8HEp
	zgmGzXmz1OYQ2ppJEOoozTDAdCRpTW6iGkYEOKbQqoU0lo6+ncW2kyNr7oxTQwRX8WeZgSwIrQL
	vRCtnhvHvPQk=
X-Google-Smtp-Source: AGHT+IG6d21YL+U7wYA+yrGrTN7IqREAaoCIDYMDvJ3k4/KT8q2HPVx9iwC7scPnL1tUs0Nn+iKMIg==
X-Received: by 2002:a05:600c:45d3:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-43d01be665amr120971765e9.15.1741875219892;
        Thu, 13 Mar 2025 07:13:39 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c613sm21845565e9.40.2025.03.13.07.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:13:39 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 14:13:24 +0000
Subject: [PATCH OE-Core v3 4/4] eudev: Drop --output=... from kmod call in
 init script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-kmod-v3-4-a8b5d73c83a5@gmail.com>
References: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
In-Reply-To: <20250313-kmod-v3-0-a8b5d73c83a5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212775

This awkward invocation is no longer required as kmod just uses the stdout file
descriptor, rather than explicitly opening /dev/stdout.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev/init | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 477a525b21212ad72d2661e27e1218fca9fee5db..790cd3b9339b6334dbab1feaa65f8948d72c76ea 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -27,8 +27,7 @@ make_static_nodes () {
     [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
     [ -x @KMOD@ ] || return 0
 
-    #output to /proc/self/fd/1 since /dev/stdout not created by udevd yet
-    @KMOD@ static-nodes --format=tmpfiles --output=/proc/self/fd/1 |
+    @KMOD@ static-nodes --format=tmpfiles |
     while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
     case "${TTYPE}" in
     'd')

-- 
2.25.1


