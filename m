Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B6AC98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:24 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3002.1790190282184619979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=aRHXPFzB;
 spf=pass (domain: baylibre.com, ip: 209.85.217.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-78fb1fb9508so158929137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190281; x=1790795081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z1rHm0E3nzKP7ENhE5GmbSZVJf6tc/xv+MsIZK7AOMY=;
        b=aRHXPFzB63GFx3b6yIChrhwrjrVC1kJEct22P+gFYBMTgQ+8Z05lffi+Mei8bgTIFz
         oC7qZxR0gRtQ9ON0fE5xkEL3pKESXOznOBXUpxMN6EC1ckcwPP+yWMXQ9JYU51t6osIv
         +THRInzNtmxDZlNippOAhETyVo6RECygL6uNrVwPOVXyK9m0hsiICqOU9xAKuSPYnWPy
         b01Rk/wn6f7bKhQ/2sdESZffazh4EoewPOCKWLzii9xXhy7lBcAnbyk+Bia4bKrE9u80
         kWiUqg0+Z9q5P6sRA7fioxyO7KptG0u1Tj4BFX49hHwCtUyp43+yA+50vQI3TecM7Tdk
         A74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190281; x=1790795081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z1rHm0E3nzKP7ENhE5GmbSZVJf6tc/xv+MsIZK7AOMY=;
        b=wJZnJfRoPSr2sgQONVO0bBkBLTxk9ZF6tDeWR86mQ8kg8M6O1h+oLWf8+3POrTMOoR
         CK7T2ro2sYpim4FxVQ7ZgxcAgE/dswmmAZ3T3AenC854lQCimjTwayUmJukWvl22o2+0
         nplRiHBqqF7AJowB4fiZ1c61ZAy5pmtiFAlJ05B2fU7hsuuGDrJVY4RUlPC2IgFG7XLO
         ASXvIvSAQcPwcOOm+JvY9Chmm34FfR5XYhyQXTasvyRGIH/k/usvCE1DAaUpY5IANTQK
         HlQt+d6vF+Iyt0nRucFTRIj+xKBGnsQ5saffu/EaaA/Yhw0k9LOT3aY0GMkrMkLIymIJ
         VcWQ==
X-Gm-Message-State: AFuF++nfMrBxAqtYGGAVXJLPFIRIv/JwCw091pC7exJBo85wYZ6PEbau
	LHIPUF5yBttRnd1jXIV0w4B7FCtdkZfkd9MPpLazGRiyjAsgj6OnZygzgXu1Gz3zlhLvLt7ax9l
	d2igz
X-Gm-Gg: AYBFou3LP2sdjZ4R3hcN1IaGUo42gLM7A+OL87m+8sEn3D1L2lE7QfWYDrOGUaraZwa
	AXk36w3LL/XvKwqarbzQ1Wr3MOa2jxuoVBfwNQlJ/90CklENVjHyvya21aItGUiNI0BZsJSyKgu
	/sZ3Jrx6lk9u54QbIXH+utNImEJVvXfh5+i5JuCjK8X41v8ozqPqOo74QamIBExFH2bzMiXbDvQ
	skNGHyOt+6zlYpgopDxRNg82Ouw9MwgFj8n/m/DnZTykA7mn6Oqh9p9Dz/HzHekNU9P7evqq+qr
	Ah6kEJ5f8un/J4JVJ25X1IzJ9U6V8D2uxIkmEq8O4Kcl6V+ILdvN9s/m88zlynn3xRt4Crza0Tm
	boGSstztj8PXzabvokxw0Jxd4vTNkQAVjgtiP5hRX9xIpR4c2fUeQ6XJ8HiNnkOVR7CrerWU7dj
	JBusIA108CJ4B/spYZspu1gIUbUAoW2XpglXoqAxeCOaVN5ZkdzWQrjc8VrytHUlb5whShGR71d
	CcZqUoj05/7HRPlz0jbNZaO29tZLnql9g==
X-Received: by 2002:a67:ee54:0:b0:7a5:3035:fdad with SMTP id ada2fe7eead31-7af1c68d908mr110089137.3.1790190281058;
        Wed, 23 Sep 2026 12:04:41 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516a6ffc7sm4313732241.8.2026.09.23.12.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:39 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 08/13] selftest: resulttooltests.py: add multi-pair threshold test
Date: Wed, 23 Sep 2026 15:04:14 -0400
Message-ID: <20260923190419.353493-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246548

Add a test for resulttool.durations.filter_sort_rows(), covering that
threshold filtering applies to all pairs when more than two sources
are provided, not just the first pair.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 76bcc53711..c80027bfed 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -771,3 +771,10 @@ class ResultToolTests(OESelftestTestCase):
         args = SimpleNamespace(threshold=0.0, sort_by_delta=False, limit=0)
         kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
         self.assertEqual(sorted(kept), ['big_change', 'no_change'])
+
+    def test_durations_filter_sort_rows_threshold_checks_every_pair_not_just_first(self):
+        # 3 sources: only the 2nd pair crosses the threshold, the 1st doesn't
+        rows = [('t', [10.0, 11.0, 100.0], [(1.0, 10.0), (89.0, 809.0)])]
+        args = SimpleNamespace(threshold=50.0, sort_by_delta=False, limit=0)
+        kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
+        self.assertEqual(kept, ['t'])
-- 
2.55.0


