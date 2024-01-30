Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDC2C47DDF
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 13:56:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.18813.1706622961394422119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 05:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iHHZg/99;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ae3154cf8so1980051f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 05:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706622960; x=1707227760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMI5BbYI60ulz6J5nVRM/SkELgtN1HeGn/8RKpPLAN4=;
        b=iHHZg/992VIzewbu8Kygc0o+W16SV/SAiUBgtVcU8Fyn8RbvyY6/RrZPMaoHcj5jze
         zzS6qs7GTSmH7wVfSHxga6yoJMleBGpOLE4KrL7MCu0sFC/TtmtnLPfklmOBIyIzgLXx
         4zsWojr4iVYW1HZKooxzAY7/0EkBdXkxhnI9tYgJT4ochcPtkDYC3gH0YP3wy2PrvGxq
         4wLr5VKQ4PsInL78XRCZ154PjqVtHEQRypVdjPPdxk9jfz9cSPVwOftQ1Paweoc+5gAy
         ImfR3fi+gKPOtUpaKXCd375L/6M7VxMhwT+ODj2CLXEsdsoYHm2j6ryIZCCMO5/X1pm7
         o0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706622960; x=1707227760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMI5BbYI60ulz6J5nVRM/SkELgtN1HeGn/8RKpPLAN4=;
        b=gzsnSTKdwca0YHrethN5zlBBvKBEhS5v6qLKskbOgTRlBB/RvsYDdLzyC2MN8WUK3N
         Let/94YkqECUnsBllkDQIE0yn7zYP7Iy/cYnRJ5BsshEcvwzsRrHx3puKKj9g3Ha0hjH
         tlqI3TNBLknaydzbnAy7Y2/CIxGZsqGEoUQzMdP7bujTlDvO+HpkmnVxHqar+TAXM1uo
         XxNXk4f1CrcZPRxHDqEws1jxRJHoCbVAw6UH9Qr4u6zMsDE9WvtCCowdwk0C3o+Qnc9e
         M6pR2T2xsQKmCiG4yjTFk/k2z3GL2PmMfA6d3pAApChzCzRraLBGxNFqpkSh3/dYRslu
         As1Q==
X-Gm-Message-State: AOJu0YyPs30rjmB8kLD62P3zh6ilY2ZpdnxLKXU1h7uxWBHinICjhMOp
	SIl9Y+MsIES6wa7xU/S1RJl7FNRS0ek2K5x7azaBbNmVFEvZcTTtpHpJ5NZ7
X-Google-Smtp-Source: AGHT+IHYwFp7gX7B91kFpDP1JjHjcdjJ5qLfl30GD5T1gvtIFkUuG08x7TJOi7ZfjYxE1nljpmcSXw==
X-Received: by 2002:adf:f704:0:b0:33a:f090:edd7 with SMTP id r4-20020adff704000000b0033af090edd7mr3196674wrp.21.1706622959816;
        Tue, 30 Jan 2024 05:55:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6b02000000b0033ae7d768b2sm7080756wrw.117.2024.01.30.05.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 05:55:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] selftest/SStateCacheManagement: pre-populate the cache
Date: Tue, 30 Jan 2024 14:55:56 +0100
Message-Id: <20240130135556.4104447-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240130135556.4104447-1-alex@linutronix.de>
References: <20240130135556.4104447-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 13:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194493

This is another source of the test slowness: for some configurations
(building x86 on x86) the cache items are pre-populated in other
builds. For others (building 32 bit x86 on arm), they're not. Without
this step, the test would build them, write them to a private
sstate, and then throw it away.

The code is un-pythonic: it follows the style of the rest of the test,
and fixing that is perhaps for some other time.

With these two changes the notoriously slow test_sstate_cache_management_script_using_machine
takes just under 6 minutes, on an arm worker:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2820/steps/13/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index fb97243bf5e..55fdbb035f1 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -268,6 +268,14 @@ class SStateCacheManagement(SStateBase):
         self.assertTrue(global_config)
         self.assertTrue(target_config)
         self.assertTrue(len(global_config) == len(target_config), msg='Lists global_config and target_config should have the same number of elements')
+
+        for idx in range(len(target_config)):
+            self.append_config(global_config[idx])
+            self.append_recipeinc(target, target_config[idx])
+            bitbake(target)
+            self.remove_config(global_config[idx])
+            self.remove_recipeinc(target, target_config[idx])
+
         self.config_sstate(temp_sstate_location=True, add_local_mirrors=[self.sstate_path])
 
         # For now this only checks if random sstate tasks are handled correctly as a group.
-- 
2.39.2


