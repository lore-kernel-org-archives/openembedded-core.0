Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C14CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:05 +0000 (UTC)
Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18102.1790786314801055196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=JgO97KaN;
 spf=pass (domain: baylibre.com, ip: 74.125.230.233, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-533245fd18dso37117811cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786314; x=1791391114; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5WuLrxpdOe4FbIXQqqVswNqbKO5R0ZPX9RNzQLzYs0=;
        b=JgO97KaNZHUA5Jn/wLOd4gQu1NvE/gxdfAyuEmEIcrSZ9/AyLZS04Wcgd4nCGfOI8M
         MMTGONcJbUtzByub/2V3LaaecSFhalA0Zgic1qKykViSY7kKqSVFFAa2prxM91YrQ8Gn
         r28gHFWodXlUbAFI8kz8kZRgMWJK7WB85ancdc0sH44Xfmc2uf0NPhHodvt9QkPgAo/C
         G0c84gaNhSlE0Gx5bf+a9+t0YEcom4r7DCIDDoTRoUwFgUkE0C1PombEYS5hgnCmwtmQ
         x+CUQ8mCF8y7V7Zbem0CNmF7Y6MpqtDJ2yTncfHVFhvF+MSQ097qrnG9wm8GFkaCStOe
         ezKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786314; x=1791391114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5WuLrxpdOe4FbIXQqqVswNqbKO5R0ZPX9RNzQLzYs0=;
        b=vcrZLZ43hSJQLZLSrA+ejEvZ4RQGwSTPF2+0C+DF7LMGKh4VZNhw8y0LYAFlUG+7ay
         VAzausRTycV2HZDpN0K2zdt9vwjYkrw7aEvKiuEijHHj1vmuS1W8HRmeY0zfOn3T8SJh
         Hr+hrd8gtBRNfYrDOquBZ1WQZ6mAX5PjAzYkDD4EK1cycfCFfh+t5UFRhvq29ZSffVVq
         apNQKe6RUy8leMIJ25Bmwmew1yFf6QnXw2bcywG96gqt7ssAh/I4aw7fy0t4n17TSJ4B
         4gf73ThHcP07nRKz1qK/fTNwVoivqHkig/sInFRGshts9ywPNucghtLPlf+Q+AmCHT5E
         6JnA==
X-Gm-Message-State: AFuF++lt+TY8v8P31KVD2icK/x+cM/4p3hW78+oVH+YgLSRxmrbqaDsd
	BJKHWTEXnobQfqEwizpVe33IYoS/dLv3WMVjZvBikjxaJS/WBQ2cSg7PrzIQDEPGvslLOCwjrnU
	TW78s
X-Gm-Gg: AYBFou14cqejQAI9580QQdKAvGDwwfZTSTWgti9VxLVM+MWD0ReB+MmIdnJ/OCuHSRC
	SHFQfKbBgYNvAbYGt9SbjoZfXeb7xoyKVJcTe7YdvMgwRKDsLyTdNQ5jenEQiOenzzRSoDMIGmh
	fic0XvKKoYmzIBPY8KNMdQbyR1ceum+NpMfADeCyFhsQANskXmrQ8vU9QpWuIVpMf9mYAkJSyzd
	rTkgk//VqgebmdPORgoJUUP9tCferU8GFvverGd55ae89oeO7bxrPdIy8ua6kOH4ApwzZenvnuK
	qfuIvCgNzZ6KGVWHmKKU1w0JM0+aT+VPq7Temsu8i4yAHEefJI4+SNjkr/iP49g1pbGhmnp6NUQ
	3piGF9jjcI4/ShPB2QTSu/rqRfMXqjm3plxEGr7Q/YKlrkdDdSWQAhBP1DAelQCse73jP+LR5uM
	pqBhQDvDb/XSEZBczXuOYiyUFMVZTuhTU34N28HGb89TSiG+RIXxdXN5uIl2Tyv62Jsck0Tei1o
	8ZuEHKmhdNbXhkVHt6nlnrerorq7sk+Ko2iwbXXols=
X-Received: by 2002:a05:620a:2988:b0:939:fc74:b6af with SMTP id af79cd13be357-93cac0bcaa4mr276387485a.11.1790786313553;
        Wed, 30 Sep 2026 09:38:33 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:31 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:16 -0400
Subject: [OE-core][PATCH RFC v2 12/19] meta/lib/oe/tune.py: add riscv_pkgarch()
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-12-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246992

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


