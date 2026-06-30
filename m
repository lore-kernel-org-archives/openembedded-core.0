Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407D6C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31373.1782853466139901847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sA0xKPwW;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b554044fso4156002a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853465; x=1783458265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl3IVP9TddPJCuo5/rwAQhd9obrBiL3lX9pHeA32ST4=;
        b=sA0xKPwWGXI49BOB/YrQJEW7j1Hek+wyGw+fsff9HImXVurwQRQggoZ7Iio1Ltxkzy
         uWCUXXTo4ERl4d7tQdELpjXJEEfoZyvz3BbnzGS9eMTrWM8IE3YmdDqicP31Y6e7Ur+7
         kpFqgFdA41dGmCZW4YLb0wmdzP+dEgDgRTEivvsmc0aCzj9qoFwv4D+IzPu0UQUoY33U
         Zf4b8WIH7hsKQCSeKVMOH3Dox0ECfsavAMdOMKhhTOK1zfEBhrvztdCAOa36AWLIUvqy
         FtbWPiPlILATlJThSDadVZhk1B9I6eWvYpOGbV9B/QsimwUjbqWppE2VbzSjnyd30fiX
         CNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853465; x=1783458265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xl3IVP9TddPJCuo5/rwAQhd9obrBiL3lX9pHeA32ST4=;
        b=m60bNP+87v/HVbaARdNjqvoLim0oMwgJcFibc4lwAZW5ma5HvmDhrO3RekF5dg8Sxd
         5Yy2dZvLeu9MilfsUN0onpPHS/Fot3MxyCQVuBl9So4dw35ZUhFmUG/YluNpTA/AMIbH
         rPXCYEwCAO6BUmumup236yo+lINP1rCr+LtUMz8q9fArniGMZmqOOcE1vnzIz7F1J3lG
         dIvghVp1ay0T3QaMq7/duCXDtckTIgIeQd4o2dCWiKOC4EwDVL9mKfcKf1sx0a6Fk9Dk
         oGH8N4sPP5ighE9lm5dHDvWvL0kXoV16eWS5wDFPGlJyybQA69ZYnXb67u2wHbw1Ussq
         Acbg==
X-Gm-Message-State: AOJu0YyD/5PK7gpujEeLl1+KACL8TOXOH4qW+glxwzn1kjnzqvRDPqCB
	RPbx2YEkQAKlQwaa4cLwUMtlLviDZim0bx90qcSobLspNWaKxRWK8MQRkpNY/Q==
X-Gm-Gg: AfdE7ckORiUrBtDH7U2y5XI4DYuiGXqqSG2gbIWkA4uvMnHOPXNRprHsvIj5FgtVXm9
	ojxFvtOsF98N1j+ufwi72p1zzj7m2e/4TXvuujPXqaJ5kxO9UjAoRmMFMn0Vu2iPiNfxK4Y/32Z
	dH5Tn/y1PkY/8iu5HekAdvB5HJLJE3FUr/vwfRyw1K0BbtMBppPpFZXJTmt/WlBXTlvgAQWTWP2
	tB3zU5JG87JHY+ExLpbu1zXH/+YQ4IdXAK/EdDTxEe08H/RdfOe6LZHA4lOtpfAlBDBJILor9oP
	ouRVr84TE/JUfygoyJw2zou9SiTvFw4QZMM2lzt/IM+my/p12kqVZlox9wuZmJd8QzONysQsLKO
	w7ymHz16O0IHESwFml47xsXUBWGHF9R9DABQX2UPdfQbqN1DSTXAg5e61St1MorZJwCqUj3dLvU
	RN5d97Tk2X/vPJGnvP48fB
X-Received: by 2002:a05:6830:264a:b0:7e9:c102:333d with SMTP id 46e09a7af769-7e9ec61500dmr4502734a34.9.1782853465190;
        Tue, 30 Jun 2026 14:04:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 01/10] spdx: Skip dependencies that are not in the taskhash
Date: Tue, 30 Jun 2026 15:01:35 -0600
Message-ID: <20260630210422.1903245-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239916

If a dependency is not in the taskhash, it cannot be included in the
SPDX data because the dependency may not trigger the recipe to rebuild
if it changes (although aliases help with this), but more importantly
bitbake may not restore the sstate object associated with the dependency
which causes errors when constructing the final SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 79e18db11d..d747a9cf13 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -330,13 +330,14 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
-        # If the dependency is part of the taskhash, return it to be linked
-        # against. Otherwise, it cannot be linked against because this recipe
-        # will not rebuilt if dependency changes
-        if dep.in_taskhash:
-            dep_objsets.append(dep_objset)
+        # If the dependency is not part of the task hash, do not include it
+        # since the dependency may not be present in subsequent runs, and may
+        # not rebuild if it changes
+        if not dep.in_taskhash:
+            bb.debug(1, f"Skipping dependency {dep.pn} (not in taskhash)")
+            continue
 
-        # The object _can_ be linked against (by alias)
+        dep_objsets.append(dep_objset)
         dep_objs.add(dep_obj)
 
     return dep_objsets, dep_objs
-- 
2.54.0


