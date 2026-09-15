Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8F4C982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:39:15 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4503.1789499035001734108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=KTYVYn64;
 spf=pass (domain: baylibre.com, ip: 74.125.230.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c3d02aso4451985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499034; x=1790103834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=553kIQ3mo6f97d775CUh+t2Ca69Tw6qE3sLMZ5ZM6GA=;
        b=KTYVYn64tJ550Y1IymSIKdepKhJhJc1LIJnKE+H/eXVwrMknFDR+B6hBF25LP21iXV
         Arqp2Cdq8XWGFgmlamh5Fpuh67BeVS7H4mkr01cb8LBhJEykOHiJj5jVijEeJLFDqh+6
         hBE4UOpb6982vdZpWC5KrkZPJamO2mwxfmuugGt4ht9UOaDeRPBxshVyv2k4F0EfXMKc
         LJesaOH1mD6tI/ZGaq7HiQEwDsub4egkb9Ffx6PSAZaGgXTvzKOZVUd8TqoSAF2TNPAN
         RJELA7gy3HqMB13Fbb5LAEyZ0ay8wtQxmAlU0RNd7niHVzLMfNrJb85SuqPJXRKrRIXG
         iOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499034; x=1790103834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=553kIQ3mo6f97d775CUh+t2Ca69Tw6qE3sLMZ5ZM6GA=;
        b=R78cgs734bJrn/x+hM/0qynM1zr9vqr1LTPUgIwMOcr79BFR+cf8loEd1puDOMvSpV
         brAtXpYV0IN/SAHVjLFtGXTPbNX+MqwNEyQ6CROosC6vgObWk8C07/kckFNMIvRQ7sjL
         iQPy/69kYSqIwwtMC5DXltXI3YkZ0HdpE/y9gQzmKVkNhb+hxHnrGwCnzGGzstAXUJkS
         6hDBI1k6GGPx46/AlzblnP85cknF+d3hcAtAXU76cDQFBYpkZZpiD2DzrpNYpfdumwx5
         iRA3zrxEFtVIxuzvS2IoxYuUNg7PNXd69yVuHCsgWzd+dyrzaE4erkIbKO4UEoGxdEVw
         0J2w==
X-Gm-Message-State: AFuF++mFvxZY5VPFv9KOM0yAqts8+z+3bL1A+BckmNT4sSRzYMUURRw7
	ezhY9Iubf2uxB6GMACFKooUu74++b2b/sW3e0qWpODpNpnGpIiIA2j8C/b96wH4iB56iDaSaO9/
	FZ4ul
X-Gm-Gg: AYBFou0yRvQ2neUIusUkuQ+FvjediPpzz9is3H1s4S8QKPcQdsxtWbghnTi1DUCdlIA
	t9Zb+co/TDBc2YEE+bLwCQ7c4RLFJN+7iPsI0LP/cuKhdfuL+KjMJ800w8l1BGK9RcuKTmBYuYR
	nLf3qNcpjrCX/k9Kosfa/bHSrwLdv2KWDNKzgJqVGUCyc3n+JjJSq7J4X8iddsB4V/0rYwsruKc
	Tc+/G3j4VQKEhI442jOAR9D1MobWRLMqDRpjo4WM6t0y5doliRSfB3Apg5yzYseFIKxqaEvcxRW
	8N0eiJIU7OZUtGIKdkcflOStl3ATGFoSw1WiPZRIaPeh7dqwaZ66MVb0bIjyGS/ysFDag/HWKQc
	UGvP0PIYeMVTOAvuKX2JozQnpvRzt25tKuGptC6e+dQ1CwQQhXwKmztilJOSvKO+lk4XUG0maYo
	OMsO01+/riu4DVDjApEIiW+hXCWD4Pvcq/vySBJgluZI3eJVQ2QzLoCxF2rQTJ0s1Nrj+DlQLa5
	hFINy4sgQp8RsSKGZTfhIuZ8AakA/VKjA==
X-Received: by 2002:a05:620a:2945:b0:939:b0c8:b068 with SMTP id af79cd13be357-93a346833b5mr693532685a.16.1789499029108;
        Tue, 15 Sep 2026 12:03:49 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cefc98sm24682785a.33.2026.09.15.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:48 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 12/14] meta/lib/oe/tune.py: add riscv_pkgarch()
Date: Tue, 15 Sep 2026 15:02:42 -0400
Message-ID: <20260915190244.2983746-13-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245888

Create a new function to help match RISC-V ISA extension combinations
against recognized profile strings (e.g. 'rva22u64'), so that we can use
simpler patterns for naming things like sstate/build paths.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 7296f39e66..0d8e4417e7 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -90,3 +90,32 @@ def riscv_isa_to_tune(isa):
     # Eliminate duplicates, but preserve the order
     feature = list(dict.fromkeys(feature))
     return ' '.join(feature)
+
+# riscv_pkgarch(features, exact_pkgarch)
+#
+# Prefer a RISCV_PROFILES name (plus any extensions enabled on top of it) as the
+# package arch fragment, since otherwise the full ISA extension list will exceed
+# what the sstate class can handle. When several profiles match, the one with
+# the most extensions is preferred, as it is the more specific/clearer match.
+# If there's no clear profile matching the extension list, then fall back to
+# exact_pkgarch.
+def riscv_pkgarch(features, exact_pkgarch):
+    if not features:
+        return exact_pkgarch
+
+    current = set(features.split())
+
+    best_match = None
+    best_features = None
+    for name in RISCV_PROFILES:
+        profile_features = set(riscv_isa_to_tune(name).split())
+        if profile_features.issubset(current):
+            if best_features is None or len(profile_features) > len(best_features):
+                best_match = name
+                best_features = profile_features
+
+    if best_match is None:
+        return exact_pkgarch
+
+    extra = sorted(current - best_features)
+    return '_'.join([best_match] + extra)
-- 
2.55.0


