Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11F3C98313
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:34 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3038.1790190287050695604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=OzAJOF+n;
 spf=pass (domain: baylibre.com, ip: 74.125.227.12, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d9so526047137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190286; x=1790795086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NjyO6MTjDM0qaFwSiDRwDreYDNMPiBsbrQ4+AJp7Sz0=;
        b=OzAJOF+nDjG+/DVJPqjfCZzXpo0ByNl3FaKSK9/lD2/HWaPu1BaCO8r3ptAXPhaYd7
         o3vYAh2jJz5LMHb7W+Xb6wT8vehEYpkjiUx2Fs4lRuta442IY8y0dcc1F+IJErhPa6oc
         OVskEfRUcTEL7c8+wSDTOaV+oNTzWfHOWzTW4AMl3kv7EBCTiSxcO+5jNAUUmSK5chlH
         Pd/i2yHHgK/sm9QjNfEwp7TkR55CMICRxFC8Y7dJUpVLdS6sIZBL6YnL8xOUT3FqhpJh
         f7W91awUm4Z4IZXONSoE5TU5Jtqwl64Mb6AR0sstWVAjfxUErQ34B9MVTlYMPYZ6fjtl
         geLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190286; x=1790795086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjyO6MTjDM0qaFwSiDRwDreYDNMPiBsbrQ4+AJp7Sz0=;
        b=lXupRX1+x5wfi82A7Jx2Qt0g7Oj+34BkocD1tPRvdGC5HV0mkEZLy+t/ixp4DnrCU3
         K06hwE9ZrZ/zZUrde2tqFwqVy5+7Rhi6h9LDqBTdmrgAn8194ZlI+OVR59mfYBy7u+HJ
         kEnEEIwWYCnWaldhzx6WMnha46L+Wz19t1b4kr95qNbDh4UuvL+Zp8PDmT7rtDMdvbWm
         ciyXQEuYLtSPXw3x4LyB+hHOwGfjPTr69/v2eLvRe8CqnPMa6sH4XFb9CA6VPywxPHwP
         OVfE5SE4vdD0D7KzRka3kEOaNADS2TddVIqEORLhaR+yorOLKfvcpevfr+djEWyR+iJf
         I02A==
X-Gm-Message-State: AFuF++nGWvi6eHoafccPwF//jb8/Nax/vU8KytZzEUmkSvzQbNTCy3Kj
	nuVt53zLG1THbAyKUaXbWqyjsEiz8abhktgQVsabQeP+dgkjp05ROKKDYqQDiPPOybDs+aCfehz
	tiJMi
X-Gm-Gg: AYBFou1J2vJuim77xAHZkoaec+G/r+GSaPwm5vsn6iYSu/354pptNgtggMNJPzqqqId
	1HAmNzmLKATcRzGKzt1X0OlAP4GOyHdhedtmDVNet3Ixf0obgTKaZ5jU7LRVnFhsdQLuO+rnMcv
	jABkeHeKpY+h3plTTuIAJhZQ6AFq/VLB07HYjx6ateckfHg9urXvWh24siR6PpvjIbYoU3uejT9
	jusYKPNv0MkOlvunqwqa6LYSTRZJqe3bM1HZnt0+Oi02qtOsF9YxwKFvAW7C2YET4q9RwRWi5zk
	p8FD4kbF8TYz6n7tTB+8tmL1O7COhW+LffXp5Xa/c5A8+6TfY4QkLpbY5HrLyWrvvfRKTpd4eg5
	hXLHi8b+TaZ5DHwWwMU5raeZL9UQSRNdbFziVn0lgOZRqDawUr9omd/hDSJklQRvVDJX36K+PlZ
	o31+VY1DdqEdv8TKXVFH0NMsxsqR09FW0p2/9xzfkQj46sIwsrZqFldC73vCWuN3iOik/saDmOg
	ZCiOGQkqTpatP2kY3rb/t7eKFxjE6M92G59B912etDK837Nk6SjnC4=
X-Received: by 2002:a05:6102:a50:b0:7a6:d3f5:3551 with SMTP id ada2fe7eead31-7af1cea1e21mr154367137.14.1790190285827;
        Wed, 23 Sep 2026 12:04:45 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985237bbf9asm1293997241.0.2026.09.23.12.04.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:44 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 10/13] selftest: resulttooltests.py: add sort-by-delta test
Date: Wed, 23 Sep 2026 15:04:16 -0400
Message-ID: <20260923190419.353493-11-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246550

Add a test for resulttool.durations.filter_sort_rows(), covering that
passing '-s/--sort-by-delta' correctly orders output by largest
absolute change first.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index e6e75dd9b9..886c5bb3ed 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -788,3 +788,13 @@ class ResultToolTests(OESelftestTestCase):
         args = SimpleNamespace(threshold=1.0, sort_by_delta=False, limit=0)
         kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
         self.assertEqual(kept, ['big'])
+
+    def test_durations_filter_sort_rows_sort_by_delta_orders_by_largest_change(self):
+        rows = [
+            ('small', [10.0, 11.0], [(1.0, 10.0)]),
+            ('big', [10.0, 30.0], [(20.0, 200.0)]),
+            ('medium', [10.0, 15.0], [(5.0, 50.0)]),
+        ]
+        args = SimpleNamespace(threshold=0.0, sort_by_delta=True, limit=0)
+        ordered = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
+        self.assertEqual(ordered, ['big', 'medium', 'small'])
-- 
2.55.0


