Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C449C27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:16:57 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.10772.1718115412199887946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ltd2CK73;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6efacd25ecso215611866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718115410; x=1718720210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FhiBxHIp4ag/+PIcjkNBZJe9HhG67ZETiQhe/puHes=;
        b=Ltd2CK73d9Ykh896dUS3W46kZ0bGZWtpxe2/wQ7bV2MECRLQcWopON1d++4aBYD5nx
         SFiF4T+R2Ll1H0gV5CWp9ctifJQ9G8Qh47WiWm+crqSLZKr0FFr1mtCjjTfhrlhYaRA6
         PZQWzgIe3Cmqblomue1yxGfLHwEZzgSJSF6tkY3IAYyEuxPO5aparrRWBxt8Ghws9Uz2
         fVo7FK9Jy9zacSJF6/K1MLvOFLvYTX9aQVA3ppn8ONYHo0lVl+1llCZT72Ie50vaZpss
         m5rGViSCWRsNcsEdNlKrVIGr6xYXB1dmedFJqjXbtxugvrD7YMO+EehJvGJiXujYO6NQ
         GLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718115410; x=1718720210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FhiBxHIp4ag/+PIcjkNBZJe9HhG67ZETiQhe/puHes=;
        b=fsPrrEXOiqnNu1PMDq182otR+sA5t/BsT7xz6WZoAOCr8Zqs6uMIbT6nKQxwseRZws
         R+RAFOI6C1rjUiyBkRNkEISS32xHkiblrEmN0Deyuh7DBCYpUv5M7EdN6uCrLxlycfj9
         CxBgLzUuZ5Wr2jZ1tvTzwG8/+9UkZmAn08x6E3qw+cmIOJu/3FH5otm0VwW+QMZgXFi4
         3TqLTFR7m7Hu9oj/gwDNK4575uLW9KxqebM4Q5ntFcgdA+wy9lVAKx6RrANaq4UjMxkb
         Ylumz3kVCV7Rx1gLpuoUy5E2rZ+8Cw0CeUEpz2V5sc5+5+vLJLdwu3STgkQiTji5RB1s
         2Gmg==
X-Gm-Message-State: AOJu0YysmUWQZFBHLTzHMlYsM2Qn79b+gd6fySXStB+BOqHyG2A3H05i
	sBLHmAa1OHA4BVKzxCFAtIc1Lp5RIdkTdPUUls/l4ndgJ7CSNOcXSraJwA==
X-Google-Smtp-Source: AGHT+IE0greqQddHH+UylABN0gWEIj1q3tBPJTO82B5bhd7x3DNOo5Q30F/pgyD95o8GGR8s8REtag==
X-Received: by 2002:a50:8759:0:b0:57c:6031:8ebf with SMTP id 4fb4d7f45d1cf-57c60318ff4mr9032959a12.31.1718115410202;
        Tue, 11 Jun 2024 07:16:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c7fcfc67fsm4311033a12.31.2024.06.11.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:16:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] sstatesig/dump_sigs: allow setting output directory explicitly from command line option
Date: Tue, 11 Jun 2024 16:15:21 +0200
Message-Id: <20240611141522.3075000-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240611141522.3075000-1-alex.kanavin@gmail.com>
References: <20240611141522.3075000-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200527

From: Alexander Kanavin <alex@linutronix.de>

The default (current directory) is unfortunately non-deterministic, as
the operation is performed from bitbake-server and not from bitbake
process directly. If the server was started in a different directory
it will write the files there, and not where bitbake command requesting
those files was started.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b6f8ab92cb6..f7dd211e89e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -152,8 +152,13 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         super().set_taskdata(data[3:])
 
     def dump_sigs(self, dataCache, options):
+        outdir = os.getcwd()
+        for o in options:
+            if o.startswith('outdir'):
+                outdir = o.split('=')[1]
+
         if 'lockedsigs' in options:
-            sigfile = os.getcwd() + "/locked-sigs.inc"
+            sigfile = outdir + "/locked-sigs.inc"
             bb.plain("Writing locked sigs to %s" % sigfile)
             self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
-- 
2.39.2


