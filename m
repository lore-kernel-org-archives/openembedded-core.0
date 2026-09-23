Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789FFC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:04 +0000 (UTC)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2998.1790190275282402111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CZtGHy9h;
 spf=pass (domain: baylibre.com, ip: 74.125.227.40, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9d8b323d9so1017862e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190274; x=1790795074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a9dwOogtV8XWeBI+Q/u4h9qkg5SSGOPlSuB6TmrZmQU=;
        b=CZtGHy9htA/0mKTbfuNZ5RE7g0tt4xaEa0iz9MwqnfI1HPql8lsthxpbROTivPzHgz
         Hyg3edkIugWKd2Qf51iYsGuse1bP0tyJ7KWq2LUrTbGd1djnZktwtmTdyuV2HpDAXJHS
         HBX0c6C7Rn02fFiNuQHsA83b3vIhz4czDYFhIMoQ/+r8cpx59iCWgAq7Z+UOGB4eYCSC
         DeQNwlxjBwnZdWVQt5jjBo9w1xB8wVBBlFHMV9mN9aMNNH29CdQ/Hrl4rZaWMp323tfZ
         w3yRXydoZGi7DCxyWw8BUtCWvgTSdAftijQ2zkDHajNVtR7l7O+SNrHLtacC/TeudQuA
         IynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190274; x=1790795074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a9dwOogtV8XWeBI+Q/u4h9qkg5SSGOPlSuB6TmrZmQU=;
        b=MF4KwoPo85q3jCBuJoLwK3UMQnhiVBc1glatid6XowyJe9I3QiKUX4actMD8JMbKJj
         YlGU34M7gXjFp1wAStiQ1u+yAgAMww/OYqFeBibSuRXZoU3T/fqjTur7ow6NX+XBh+2c
         KsOmk/ftJU4Eu9jegfu8hlZy8EEzZFNVbu4Qm4BR9/aRsV8dRBeJYXquunTTErOgUKpP
         /tTcCs/N2Z4rQhsGO10raBGOpLhh46J8psWT1BapEMTt7PZjpN7C9ryEHHhRNGo3gU/f
         eR85y+uHzF4gyr4xLLAw/7Ft2+Sc2rBFXgLKe94p2JwMRrAnstjHl3HO+6bJ6kreIebH
         Hgpw==
X-Gm-Message-State: AFuF++m9lbm5VUH92PayKMnLtvEXyIJCGsRHRb4wsXqJ1Ap0o87UhKDk
	D92O/x3ksKapvoEA4lJkz+3yCSSaw65JtgGsqfbMd3UjHgCqejEYC7HWt68vV4P9vB5aK+xrwB2
	y90c+
X-Gm-Gg: AYBFou2KfDkFmJQoMmeI0z/Qkz0wu+r9RigZBGZBlEvumjfJxXmaiqpXsVnzfN1a0Sj
	As6I2NsnlCiCOHdIjMKuy510gCivnsaZ680uhWLjEPCxHgezd2SPez+LFCQnAiVe6spMN3Woz7a
	p7yswUhl8fE1JaveAhLuuk3v946xvX1qPragEBHnjbl4YcnwMvPJtekj0Krp+oFmpqLeBAfqV6L
	HUxRlYXo39qhIHCgvwCAocrMxlTfje2DnYddH3alAGtBcc+NGBtYJ/AzagY+l+re68GTK1JDn3h
	6j6+ny5CKhPJOWGR/zV1XrAmw8s1aISamc6yqn4LkOzMa0qgQ8HpuyPguT7yamdeLOSr7T4V3mk
	6I7R4DFlpTK1EmNWuCpxlG+usxqdtOq9qdcI4RqlhS9TcHgSTmwt93Raupz5WAq/RIAqkilKzkc
	C30TbLnGG4IlqWRJtUddoH/rc+cASvA61WHtJxjf6YHEJKzZB2M98NQG+zAYE7SVRasmcPqfhQi
	pfNwfvPRr8Eh6l2IRdom7LQYl7Slosi5lM=
X-Received: by 2002:a05:6102:3749:b0:7a7:19aa:8a87 with SMTP id ada2fe7eead31-7af1f208a87mr143638137.34.1790190274154;
        Wed, 23 Sep 2026 12:04:34 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7d18sm4098903e0c.1.2026.09.23.12.04.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:33 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 05/13] selftest: resulttooltests.py: add consecutive-pair delta test
Date: Wed, 23 Sep 2026 15:04:11 -0400
Message-ID: <20260923190419.353493-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246545

Add a test for resulttool.durations.build_rows(), covering that
comparisons are only generated for consecutive sources (e.g.
RUN1->RUN2, RUN2->RUN3), never something like RUN1->RUN3.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index dfaa4edbba..28acc939f1 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -742,3 +742,13 @@ class ResultToolTests(OESelftestTestCase):
         self.assertEqual(rowmap['tiny'], [(0.2, None)])
         # normal case: delta and percentage both reported
         self.assertEqual(rowmap['big'], [(50.0, 50.0)])
+
+    def test_durations_build_rows_computes_consecutive_pairs_only(self):
+        # 3 sources: deltas should be (run1,run2) and (run2,run3), never (run1,run3)
+        alldurations = [{'path': {'t': 10.0}}, {'path': {'t': 100.0}}, {'path': {'t': 11.0}}]
+        rows = durations.build_rows(['t'], 'path', alldurations)
+        k, vals, deltas = rows[0]
+        self.assertEqual(vals, [10.0, 100.0, 11.0])
+        self.assertEqual(len(deltas), 2)
+        self.assertEqual(deltas[0], (90.0, 900.0))
+        self.assertEqual(deltas[1][0], -89.0)
-- 
2.55.0


