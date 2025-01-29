Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E626AC02193
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.19282.1738173917734392979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w+pChZo2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2166651f752so16021005ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173917; x=1738778717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suqRx0QmP0olUg42W/3rUoJz+0dDu63k1QA5/RiTXzs=;
        b=w+pChZo2j7OPgeH0L47I6CWLxLgtjiZfOzHG1fByARx8mQk8T2bzZmEURWw33ASiI0
         CkJ8QjhMGP2ZTQl2tAPCsrwLhO58w4EyCJIetW6X/6mkCZYVt1aFPKSWmmBTu1RRCPHF
         LtZQEiJl6e+7HkncfwEDWF7ways31e0tzXnhZUoeL+Oer5l7g0157KeVDJylqD6Ecl++
         XRcS7qpwCNZzpcOuJunaqqTOEQ5Ut4p59if/an1EZr3VKGm62HZpIGgz5YW7Mnr+Objp
         p/RXOVZsNbOTsyyt2TdqJbtX26+UiSb7OU0UbkpGedXPvI+k8PeXkuTvvr5EtF/1/ijG
         nNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173917; x=1738778717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suqRx0QmP0olUg42W/3rUoJz+0dDu63k1QA5/RiTXzs=;
        b=oKq8i0byj7D+qnoBE7SzmwAAmRV/dFIO5Tp8LrIASI7DOdp4iORAAEK1aKscQ65gL2
         e7CiffeqrXCOsF1eV/RvdjF9I9oNMuVXq9Cd3i8G6ycScp70/I8mf9c34kYGGKArSRqw
         u+DLQCiPCdz3GwyBAdR4jFXSh87Dn2VRzpOy6t4EYtp6vmeufx0br3xEj/ewQynG58cm
         OzkjHyBUk+u7iHN3KLoTPBWCzeCjS8mXHSwP6X0gwPxJS5IfQ7J7Lr3xqyHKZQSoIHsS
         A28+D2ySDESAcQz2Ta5jkc8RZ/432YS7MT5lwAukXM9SFBfrzBv4YCE5DV/jnF4QxaF0
         jEeg==
X-Gm-Message-State: AOJu0Yy9I+PM64Upl/BRjZP+K9lcTCamtsCEcOMnNaQdkp6YA7M9m5Qf
	j6AuOR2TDOD9drpAnIxhjYHNjC+N5hl8NVbbofl6gZrEYK2q+IiWFAlcllzby/pkE9XKPjhNFp/
	daYs=
X-Gm-Gg: ASbGncsvoV7mHs3TvNQ+pfRpSiHkAbl+rktp4SXrhq93yEIwWPf7wGyeCbKbkafq4y2
	meLKVjGOvuYrizzX3/aksy+6UqA94yZsHBpL678vuFHJQ+UQdniWZW85PTxGE/re9B774o1logq
	2bPyuFfj5IX6hCxBTyCx3W54aPvk7ZFMG8uBKpEhU59j4r8A5JCRzRbgAk4mKaply4c6NEm4zb6
	NVjOVwGBal0gfjxED/Br33fcvos87umqWns5aXZVfiubfipdI8gcfYsFVgvFWtcXJ0kW57LaNqF
	hAY4
X-Google-Smtp-Source: AGHT+IGb4itOEUMwulWXPhZp+XHDnfifrvTgt21YFeOtd5Etwwl7UaXiuHQJQYZkCHcrT0Qyob7AWQ==
X-Received: by 2002:a05:6a00:2302:b0:72a:bc6a:3a85 with SMTP id d2e1a72fcca58-72fd0c72bbbmr5829605b3a.22.1738173917049;
        Wed, 29 Jan 2025 10:05:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 5/8] devtool: ide-sdk sort cmake preset
Date: Wed, 29 Jan 2025 10:04:54 -0800
Message-ID: <ad633eb3b90adb1087609c97ab8dc83ca0f08ad2.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210399

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Sort the keys of the generated CMakeUserPreset.json file to make it
easier to search and compare.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/ide_sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 65873b088d..eee5425aa7 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -493,7 +493,7 @@ class RecipeModified:
 
         vars = (key for key in d.keys() if not key.startswith(
             "__") and not d.getVarFlag(key, "func", False))
-        for var in vars:
+        for var in sorted(vars):
             func = d.getVarFlag(var, "func", False)
             if d.getVarFlag(var, 'python', False) and func:
                 continue
@@ -545,7 +545,7 @@ class RecipeModified:
         cache_vars = {}
         oecmake_args = d.getVar('OECMAKE_ARGS').split()
         extra_oecmake = d.getVar('EXTRA_OECMAKE').split()
-        for param in oecmake_args + extra_oecmake:
+        for param in sorted(oecmake_args + extra_oecmake):
             d_pref = "-D"
             if param.startswith(d_pref):
                 param = param[len(d_pref):]
-- 
2.43.0


