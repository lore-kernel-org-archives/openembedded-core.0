Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED55CC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156287.1783358228507946509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H93mXeQ1;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47d6c634f45so1283329f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358227; x=1783963027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcF+RKnkRqHOvB30D9u4n5WgQ58kDxlbxHYqIKSOpmQ=;
        b=H93mXeQ1ONLIlluXDgOBDyJDrFkIoTApP73vOsjdGKDqdlYGgQy8rGYPlsvGidd0tE
         LhUP0gCjrq17evt0/tm2wMBiRDrK0fnx6vkF/d/KTgcEgLjqms+Oi0/dRMKBkhgR7Vgt
         a8MmybhFZUnVKS4IPO2iT8dwyJfr8DrkNwuFlbB8x5qn55x1C8YGUbaFeui+ma36SCql
         oFhbIe09usKRvxez6RtSiQ49HO/mo1hCGzg6tPdoyqRQdGNFEjIAxKeB73mTdn/qh2PG
         w/vULDzcRp5XlaFesWImEe+ODP0oSYdrO7TeixZSfoVEqNfRdUY1usdKmbF3xoL2O75P
         IqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358227; x=1783963027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcF+RKnkRqHOvB30D9u4n5WgQ58kDxlbxHYqIKSOpmQ=;
        b=ZUSOtmq+LXMmiW8YFKRNTz0XxFI8Zieg3F5Yr7uZjNrEHCcaujuPnqoTCOzSGbuhVM
         EePaptYaSUav2Lrq4jNuMKyBaDf7tMoVZ05NlD4eI19l57Rp/CyB8ie6Lo3W2RxYxRu9
         4NauPIubmL3wIHmsgGXqSiPSrZwUb00dGptcjvwtUvZnPsp7GlDq5n+GbJGJCh755leu
         IUv/l8CUW1z9o+i1Lqgei3n1e+ztAOCoG5MXgiOnMjuklfo1PaDJtzDmTGnFaYLq4BGq
         IZre8I7PFJ5JIhP+GKQ0ebfdrMLXzNC75crcQ08tcg4WywDPjRaq0ScdrMynoRj1/6P0
         aJqQ==
X-Gm-Message-State: AOJu0YzIwzt87Lp+9tCqeYRN3Z0fXkzxvYmRFPuPmL4STtMxzkPXCnCA
	nPEBAVTDjNuPAGbJpq/wfGle3MjZ8oJ5xZrKCcFk2tM5kz+nJBY+M6T+NuuuVg==
X-Gm-Gg: AfdE7cl1z7J4I2UmAxpZI4KzjSybw9zDZpNaYG/COk0d5LGYAa8FVI4XUNYBCqogLeH
	7HlbjGjQ8WlR9QrCf2klzzF2c0Py7ebtQeiPoSz0hu6sJSqyB6W5CyiShKTGU8jDre1D394/qAU
	kCUvFy3sva18bOhdP9BN3rSnLtswHKilZukcbjDj5TDIsIemzmWvjXk2rUioGLPkNdaSJ1uL3Ub
	BLpneThjiXo20RqWHKnbV/nAJoTHIkWvJWnA2UCR6Apu/mHLk/wPi6nUD4InX8qNP3JhWVwCgrI
	B5TC5DzTqcWfQGhg+x4YVilxZzZAIRlHhlviX8GJQSvT5Y6gZgkOSZzGuhzvlQzvhmHePACbLYg
	3qTr69kdz0dB1HdHtS89IcrM8F6tp9TDHwkW0iAen626mNuUhjtMd1RJ2+42sOaV9LyGc4WCQGi
	EshuZ0RaNaITwZ9sPjIzudalVrTw+gnRUNA9nfZGCTna95lnWL
X-Received: by 2002:a05:600c:820b:b0:493:df58:42b6 with SMTP id 5b1f17b1804b1-493dfcfa776mr2303565e9.36.1783358226371;
        Mon, 06 Jul 2026 10:17:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/45] files/common-licenses/MIT-with-fmt-exception: add a custom license
Date: Mon,  6 Jul 2026 19:16:16 +0200
Message-ID: <20260706171701.70536-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240288

From: Alexander Kanavin <alex@linutronix.de>

This is needed to correctly specify fmt's LICENSE, as support
for license exceptions and WITH statement isn't yet implemented:
https://lists.openembedded.org/g/openembedded-core/message/239820

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../common-licenses/MIT-with-fmt-exception    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/files/common-licenses/MIT-with-fmt-exception

diff --git a/meta/files/common-licenses/MIT-with-fmt-exception b/meta/files/common-licenses/MIT-with-fmt-exception
new file mode 100644
index 0000000000..1cd1ef9269
--- /dev/null
+++ b/meta/files/common-licenses/MIT-with-fmt-exception
@@ -0,0 +1,27 @@
+Copyright (c) 2012 - present, Victor Zverovich and {fmt} contributors
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+--- Optional exception to the license ---
+
+As an exception, if, as a result of your compiling your source code, portions
+of this Software are embedded into a machine-executable object form of such
+source code, you may redistribute such embedded portions in such object form
+without including the above copyright and permission notices.
-- 
2.47.3


