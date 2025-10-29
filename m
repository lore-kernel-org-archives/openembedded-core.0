Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E903CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:08:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web01.4692.1761739722591081226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQqNFhnK;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so6792680f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761739721; x=1762344521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFW2Qo8Rd5Mlmq46SBmrGDgobhiW+dt6D7ZuKkgVJcQ=;
        b=PQqNFhnKaQuMEF9b4Cs8CbomgWFXmPj8L7HNmytPonVA1wmpX5aQ/J4kK5MatAoS+7
         mZUpsmV9yIy/4siJ8csd4hP8aon0MOSA0as4y+inyfV4FOMJSgJiKCUqnSYoDishLcAA
         DUikLIviK6vw5pPCEcIfnaLC8yaVhMcymc/xZFCIMzknAY/sbGYMIEQqZo1C4j9d+sNE
         KFvYzYjmvyXFk2Vrd0Q9xDAMwWZd2KD3jg7zJYoFTbZweqPHpe+S+9GHag+tbtmzr5bg
         U3xwnQbwtS67tn2uCUBFzMJwlcq7THSFyMkOaUyixpFpVreXHqBT/j2rWX2MdWv21Ki4
         Riyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739721; x=1762344521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFW2Qo8Rd5Mlmq46SBmrGDgobhiW+dt6D7ZuKkgVJcQ=;
        b=oegF5DHXRPDmRLrd7G/sCkbFEOHWOS92NylMzxwlNHFUSQbM3HErFmRXjPPxot6xnt
         KGKbaa5PnZvJIysuJUvrBbUaYAP4jrVUh6YSPj8INAaVbdgaH8TK1eK2hNBvBer6yBwF
         LhM5i274D0W9f3b/J8mTq0QAJZFUWZ0nFx6vaxqyvFZv235oY/+AXHvOgaELXuIJiGTV
         +OKgTuzEb51MTmO0RnnlJq4/yHstry2zlXoGMC8bgt8uWC7Rynr/lEo8XnK7FDUTwGYW
         zh84sakHw5PWTDWRk+X38bK9HyNugPXs25v0uToqLQKv5JhESWO/GnTU24iQnB3KsDXt
         s+qA==
X-Gm-Message-State: AOJu0Yy4aHGUkHPtTFpDTaNDfPc12zUw1QAyDev7cwWzhABN2v/7jaLF
	u/jUdq8KFlSQiyzJQsq0YyRd4P8cUekEhZ6pJf9N1fbz/I4j+pFX/OXZ5xEdBA==
X-Gm-Gg: ASbGnctKuEPkP5+3zxHXNtbcd/fuXKeHcfnPNsuu3hIqJEDouTGKSJHf6D9kT4j4VAF
	6WyH+oo6eMm5aPmjwVOPSOCzctO+xaD/XRraRcm66WVg1lepccLhDmmBcJ9KzlPeu9wCLcP29Na
	dHjkkgl+5yVmy3drEJuYETtP2Dk9eGmwL5ka6JquAKI9/+X0uf2b0s/+6V4vjoWspbZUztS9Bi9
	vkejdfsS7UnI0fb2QiJdjaGfQAli2c3IBJY4cbCsT2T0xKEyNkESRkmEx7iH10WraYs3KklM4JV
	caA7WS2EILttB+ugEKKIbvsdsieRJT2qCMQnB0K+7gc4gqmRXDC3WGcfs6U7JKJ2ZRQiyW/L7Up
	sxqxtNIMdvVGxQKPkdPmtmycbhA6UYN4mK35jfQdt/Q0EK1NY5DT78hEPTOl3RN8HnIPODY5q3I
	Q9bY3BJt6Qrgb/wAeGi1w5kL/+WfWxtdtD6orKFau+DOxu40R3SJ9/HL/pmEDENvHDRlK0rSmT3
	LYBYZcZy2+cgYQY6/N446w/FD7kUJyXzo9reeufLoab7xNsKg==
X-Google-Smtp-Source: AGHT+IE6mD2InEL04J9k5GD6JBpfCLcJhdT7JDdfuJ1wZ9lHdMzZdJrEDN9ChCWzsyIXZ17hS6Gugw==
X-Received: by 2002:a05:6000:2f85:b0:3ff:17ac:a34b with SMTP id ffacd0b85a97d-429aefc03f0mr2203450f8f.42.1761739720762;
        Wed, 29 Oct 2025 05:08:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm25685793f8f.2.2025.10.29.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:08:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] bbconfigbuild/configfragments.py: run discover_fragments() only once when enabling them
Date: Wed, 29 Oct 2025 13:08:30 +0100
Message-Id: <20251029120835.4075555-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225449

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 21baedc9a42..60cdced555c 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -97,8 +97,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
                     print_fragment(f, args.verbose, is_enabled=False)
             print('')
 
-    def fragment_exists(self, fragmentname):
-        for layername, layerdata in self.discover_fragments().items():
+    def fragment_exists(self, fragmentname, fragments):
+        for layername, layerdata in fragments.items():
             for f in layerdata['fragments']:
               if f['name'] == fragmentname:
                   return True
@@ -136,8 +136,9 @@ class ConfigFragmentsPlugin(LayerPlugin):
                     enabled_fragments.append(f)
             return " ".join(enabled_fragments), None, 0, True
 
+        fragments = self.discover_fragments()
         for f in args.fragmentname:
-            if not self.fragment_exists(f) and not self.builtin_fragment_exists(f):
+            if not self.fragment_exists(f, fragments) and not self.builtin_fragment_exists(f):
                 raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(f))
 
         self.create_conf(args.confpath)
-- 
2.39.5


