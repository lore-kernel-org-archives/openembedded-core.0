Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6415CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 17:02:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.1967.1711645332073071891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 10:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8L9KOhs;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-341cf28e013so727006f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711645330; x=1712250130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqM9jgyDVLYe2n/6mo++KobrGWg9PTW71kpzNoMmc28=;
        b=C8L9KOhsopZvOZUWmZFKdH7RqN4M4JMopYDjBosR7dBMH4xEnlwCt1vTkIrsKyb61z
         UIYhLCISwtGKZzUWTaj9PWh6YvrfRC/6JptYBHYdML2E2FgTHRy+qz+UGNemfq8ElLIP
         bKsxsT1T8rsmONWwJVcEhhX6vc1J8Gawxy/wen4GL2zU+Ti29pl2K3H4QkJhDLKVtxkJ
         uM1FMfqYO0JfWJGfv1p4Lz7vfhwiwe80jRTNY14CtGmNu4kKIRGq3OVs2Al+qDbK/+/b
         3ly/NE6H+iKM9I0QAa0nVmPzf8ZfwIIbLWbkATs98IvonDAEptOTbuHeA9XyYQDOugAd
         Km7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645330; x=1712250130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqM9jgyDVLYe2n/6mo++KobrGWg9PTW71kpzNoMmc28=;
        b=O64quiQhXx29nwF/Mn6E0r5IpZQszH1OZ9I1YGmKKvSLGVYFG8O288dnXsmhCyzDfM
         7XpIwaZ/+rY6vfhMDMD6oMGEam3e8Gp/13nHuCIvT2htOvo0EjM24C+eQetbb4ifzfr+
         +px+bH8emw81yN3INbdfJlox5blZCv9LOnhRCm4JaV5sS6RF6Sc44C2IXNOYll47D8im
         lBiMmCfSmgxQEPCVB7y3p0clH7N7rJX9+d3PeisD3BUCIdkdOpn5FMbRpdRhI9HVi1c6
         o+XFhsAWBKGm5n7ia+ZyDBg2RmKBbmexCt5KW54oUlszZL3TuTl5zDXI/jZXMQYKNYPq
         Gd5w==
X-Gm-Message-State: AOJu0YwFi+mVLKxtsDvFolT7DlbW/t9MTYFZ4GeM3p7TV1GmQbbqbY+n
	S4Px4JCEa3zQCjmBJXAd9KwNCRqa8ipCbca4wlLSoUERFZVdzby3yt3GsVTO
X-Google-Smtp-Source: AGHT+IHuEZ+xoK95SQW737hu+GZt+VW/Jqeg8qnt7ryzvtyvt+PY+wPhg/LlE0f2Cq+JTWF5Ur5XGA==
X-Received: by 2002:a5d:6d8b:0:b0:33e:d2ef:26f8 with SMTP id l11-20020a5d6d8b000000b0033ed2ef26f8mr3291816wrs.53.1711645330272;
        Thu, 28 Mar 2024 10:02:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bx6-20020a5d5b06000000b00341e67a7a90sm2272335wrb.19.2024.03.28.10.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 10:02:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/sstatetests: run CDN check twice, ignoring errors the first time
Date: Thu, 28 Mar 2024 18:02:00 +0100
Message-Id: <20240328170200.981712-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 17:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197597

The current CDN isn't able to serve all objects on first request, and it
was suggested to work around that by trying again:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15335#c16

Once CDN moves to a better location this can probably be reverted.

[YOCTO #15335]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 031c2266ace..e2f509c3e83 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -959,7 +959,7 @@ class SStateMirrors(SStateBase):
         self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}\nFetcher diagnostics:\n{}".format(missing_objects, "\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
         self.assertEqual(len(failed_urls), 0, "Missing objects in the cache:\n{}\nFetcher diagnostics:\n{}".format("\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
 
-    def run_test(self, machine, targets, exceptions, check_cdn = True):
+    def run_test(self, machine, targets, exceptions, check_cdn = True, ignore_errors = False):
         # sstate is checked for existence of these, but they never get written out to begin with
         exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
         exceptions += ["{}.*deploy_source_date_epoch".format(t) for t in targets.split()]
@@ -984,14 +984,18 @@ MACHINE = "{}"
 """.format(machine))
         result = bitbake("-DD -n {}".format(targets))
         bitbake("-S none {}".format(targets))
+        if ignore_errors:
+            return
         self.check_bb_output(result.output, exceptions, check_cdn)
 
     def test_cdn_mirror_qemux86_64(self):
         exceptions = []
+        self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_cdn_mirror_qemuarm64(self):
         exceptions = []
+        self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_local_cache_qemux86_64(self):
-- 
2.39.2


