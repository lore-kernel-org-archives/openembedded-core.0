Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907E5C10F05
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:15:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.17184.1702030531672695527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOPFev2P;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c236624edso20166235e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030530; x=1702635330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJIW+94NEVtrivuuZeCZTyNeE6Plg7E7ozfJj+P4UHM=;
        b=dOPFev2PSvuKksLQ9k4JP77kSwWOceoc/kWPbWL8v8n/JV8NsSeNGfHKVEX1y4knzV
         pvkq++s63q7V+ZXa40vmeRG30kzBScusdR5wSMtaT10y05rUm8rYcJEiGGNc5JETv8IZ
         5S5CVIHqRyj7f2vpZ1f0TE2qIzDVqqa51n6j+Siqh96AxPcZcqgQw9LNZCEj97rKjCi5
         fjoU2ERGN50Ql0fmdeB9iuW1JOnPu91RB3BfEnikTDTovZFC947zsmIxiKZa6k6hcw8p
         TFq2xdu25+t4yEQRw3uo/xOEFPhlmlp0EHuIJJh0V+t9Z/QymaxQXr8DCaJ/9IjQyuef
         O0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030530; x=1702635330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJIW+94NEVtrivuuZeCZTyNeE6Plg7E7ozfJj+P4UHM=;
        b=LOFaK6jPHZTg1Q5Kv+bSqWzvz035/7dAkJuHfOAddVBAaCU1tPCJ+P1Z5h5pDL3WnM
         4C+vEU2EK6nxSuKyZ/n+XmKSn0XkE9L80z6GhYM14PX7UXGuCb2+nLpx+jAi5lN1GqPy
         xfuxUsSZiT3QiFq6cKEaD3JnvdVdFsU3btkj9cm+xzONBc6lA7s3a0+APgshRGxs28bX
         PPNYXmaXDrt3cgW0fqIlL7fMKdBZ//6Y/lMLKlXoU70DM5CJupis5d388O93SkCDAXNV
         6FKpjOUikUYgJNPL6RlpFdBXpMV8JSy2agIU5UJBIDQqsRn72VvTs8dQFUxH/tF6sl+M
         396A==
X-Gm-Message-State: AOJu0YzN3aCicVZJ7vIInzL7AUMBYimemDDkhH6+BCIBBbOLPWeMp9FW
	ltWRdA/xnUbnKAP0IZa8o3SjZdXylRk=
X-Google-Smtp-Source: AGHT+IGG6Og7WKrQ/tiW/5F3beFwyai8QgOT+0BMOvp1vEr4syhBeB4QaJaSmnRmHAdoNjOY5oFkyQ==
X-Received: by 2002:a7b:c396:0:b0:40c:24e1:b6bb with SMTP id s22-20020a7bc396000000b0040c24e1b6bbmr1878538wmj.128.1702030529967;
        Fri, 08 Dec 2023 02:15:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm2746707wmq.43.2023.12.08.02.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:15:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] oeqa/selftest/sstatetests: re-disable CDN tests
Date: Fri,  8 Dec 2023 11:15:22 +0100
Message-Id: <20231208101522.198832-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208101522.198832-1-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192033

With the rework of printdiff, it is not longer useful for checking
absence of sstate objects in a remote http cache, as it would only
report the top level missing signatures, and leave the recursive
investigation to diffsigs (which relies on ability to list cache
files - not available over http).

The CDN check will be performed via a separate 'printmissing'
function, which would be written specifically for the purpose,
and so until then disable the test as it would only persistently fail.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 07e82d25c62..97ac0d2e9d9 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -930,12 +930,12 @@ SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downl
         result = bitbake("-D -S printdiff {}".format(targets))
         self.check_bb_output(result.output, exceptions)
 
-    def test_cdn_mirror_qemux86_64(self):
+    def _test_cdn_mirror_qemux86_64(self):
         # Example:
         # exceptions = [ ["packagegroup-core-sdk","do_package"] ]
         exceptions = []
         self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
-    def test_cdn_mirror_qemuarm64(self):
+    def _test_cdn_mirror_qemuarm64(self):
         exceptions = []
         self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
-- 
2.39.2


