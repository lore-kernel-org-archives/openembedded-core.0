Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693D5C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:44 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3040.1790190289483072835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=VBi+VA9V;
 spf=pass (domain: baylibre.com, ip: 74.125.227.12, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so543100e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190288; x=1790795088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pr1nqBDsfLrONsaf6MBoEkWWC8vN2L3inm0wiSksSQY=;
        b=VBi+VA9VCoc6h6OLD5zxnE0Jp2rVRTVsVpTZVVZmcWmRMIpzEVZnrUqZIXXk8KxZAo
         UBepZWBSNGdLt0nX5Nc6gWtOSE0QQs/Z572TyNDH/cVgnKz47AYtUTvckf8eY2jG39LS
         DDTFwH2inBVqvukJi0YDrMELRQxSt32cDMmPnCkuggoz57rSpYS2ys/oS5Rlqs5EXLq0
         y5G1VNLQoSJXbWbsMDiShFJEv0VAk1h0MG73Ns/BJsEJKvRkEXzrCT3JtyWpjJo7At22
         r/PTQkaekJKRGdb5FIXwxyVO+i1toFNjkQtQvqYAE2DbBSkUkzTm2oqwbvVTZ0F0k86K
         UGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190288; x=1790795088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pr1nqBDsfLrONsaf6MBoEkWWC8vN2L3inm0wiSksSQY=;
        b=Gbxtai/lsZ7zyqz7GAcJfajNh9+LdifEl4EqHKYZd+ew4ng+w+jTeLZzhEHzsVSxMD
         VIe8uCMtaqBYUsMxHkmLPDphOYRXLAAtUdEZw7nfurApqNlUPHHZRQ60QYuORCmcekg7
         uueBEgFypU4jQXlxgc8KRXPLiniNJYNA56IJZ0Udy0cWvK0FH8tUk3Ok5JRPJVhZxwdo
         owgcbM64d7/1R4VNsCxoJ9MA9VLUeMG6A3dZvF4pNaNdIvnaGn3Yz0uDQIF/NS+zxI0Q
         VksmIqGnmvpcjc2AUt0rFdGTuzwZ0PDY1G6O+sfsarAM7+cNXy78ujKyaJS9HNgF/euG
         Dzjg==
X-Gm-Message-State: AFuF++l1muiIxIhBzI8WMzzpAuXGViQubzfOoeblcoydU73HdyU6N/Mg
	0S6ibYIfFeQDRKSboYtrYTFSgPodmbfLXi5as3ffVrRJEoG+g5bYon0kZ2U8N0mzOEynR5xD3Kb
	2woGP
X-Gm-Gg: AYBFou08jimjoViBtwkM+H+nWccUW1zpbGhKIwKGI9zxe51U2dewUSJOa2w2DiK0UjU
	xlDr47k9HVnDnbJxEu4CSUvF3DN217Ib8l+xkItu/sIu/qcGFDi8lDKW270fy3w0EQiJNPN0ThB
	w1g8LBI8S9R/25N0gB+VSeylL4VYqfAC9G2tT1AI8keIjQeUlkXabSlVgH/HfyT+Iiz1ZmkLVin
	VE+N/w/tvVLIxXRiHTLiOKuV7rREdpl1w4KiAqECCmxU3NX0+3SpIo7s57HSaQ8ZnbhCuC4CT8I
	1HjWEwPG8f9ELRHNcbLl/nRALAXNRccc8JQ+EeY99E6EMTpSzKMhAPhfPGVDtepI72GTSuXzfqX
	npFn6t41A4MK7eYPzvrUzO6Emjbg8byR/j/BNxzfO5ZTvLC1/FRVeJds1te4UjTy2tt2fFpFqZs
	l5TEW7e7VG18EVAo/c7EeFPvRRy+ofj5rSTkwDDmfA45W3Pwxejqs2fpF/fkvCl0MSR+OdEakNl
	MI9Vy9mxGUFnxrciwradOcuj4QhvpHZZw==
X-Received: by 2002:a05:6122:289b:b0:5c9:a60d:3277 with SMTP id 71dfb90a1353d-5cb0b584feamr161991e0c.11.1790190288378;
        Wed, 23 Sep 2026 12:04:48 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm4059969e0c.7.2026.09.23.12.04.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:47 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 11/13] selftest: resulttooltests.py: add limit-after-sort test
Date: Wed, 23 Sep 2026 15:04:17 -0400
Message-ID: <20260923190419.353493-12-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246551

Add a test for resulttool.durations.filter_sort_rows(), ensuring the
'-l/--limit' option applies after '-s/--sort-by-delta', truncating the
already-sorted rows rather than sorting a truncated set.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 886c5bb3ed..d45213b5b4 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -798,3 +798,13 @@ class ResultToolTests(OESelftestTestCase):
         args = SimpleNamespace(threshold=0.0, sort_by_delta=True, limit=0)
         ordered = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
         self.assertEqual(ordered, ['big', 'medium', 'small'])
+
+    def test_durations_filter_sort_rows_limit_applies_after_sort(self):
+        rows = [
+            ('small', [10.0, 11.0], [(1.0, 10.0)]),
+            ('big', [10.0, 30.0], [(20.0, 200.0)]),
+            ('medium', [10.0, 15.0], [(5.0, 50.0)]),
+        ]
+        args = SimpleNamespace(threshold=0.0, sort_by_delta=True, limit=2)
+        ordered = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
+        self.assertEqual(ordered, ['big', 'medium'])
-- 
2.55.0


