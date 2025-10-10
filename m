Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B375ECCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:29:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3749.1760081377363764793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 00:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rnz1bNPT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so11131715e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760081376; x=1760686176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fiEXNRav4KikrDZk8fiNqB0YksVjyxH6A56zkmfLx7k=;
        b=Rnz1bNPTV9n1plPUBmu2+IRzFhqbJ7mwF/WbY2CykJpNjp/LKrxnbXf3joSAfsEh5+
         0O52TLH5NdI+EnJg66jVgfFHRwqKYO8VFabkZ2YU2xfpRE3VQkbqTVP8o1o4Sk5Alfmu
         ZmwpHqMmTGIlP+mbhQ6GNTpnh9Dse26kIte43iKKmxWfYAWjYLJTLLqIQPuemtAwhMcF
         ReVhG+DrbbhIeFuUGTQp5XMR/32P2ca4PsFvSzyEdap74QNkXjrEUx43sb8p61IUZD/p
         AFlzCFLYy91UJ5Wy5rgVVrPMcxig+cfGZWh6yPdsxpiJQetnE7Lvc6BiOVxuFW8jEjeq
         ykoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760081376; x=1760686176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiEXNRav4KikrDZk8fiNqB0YksVjyxH6A56zkmfLx7k=;
        b=fJSgklDJFcpbj2npx13NtdKJto1b13MFTR4aSdK07+VAVRZw+i9Tsmam8CrGDuM4iH
         FyOpU4Vk6fwYgNiSZ8CjoO4IMPX6IYOQ1X4CNjTOZqilWVPYTYKqop45e77WBYsfaf9W
         1JbbfUZbenus5wW/o6Gdv1EW7teEP+MnyxJAglx0A71LqpRkUGQy2YRZnyvwp3V3I3t/
         tXwkgT37fTOwCUovdiLnvwjtj7PK5z59a1r8ImWu3MYAJyzl5Cbcs2Ax7IeXClYhyB8v
         JrrjPm6Oy5SOdgRcTHbMyBSRrE/BrEA7unARB1rh4xVm4Q7iwIpdnZbW4jMaHdYGMovO
         TxdQ==
X-Gm-Message-State: AOJu0Yy9keCkjgTdRMM5Xx2g37FSliJBdpULeaEdQjRANVFMU4F/1Vv/
	33iG/vUzFMSYQ0B6f8OgUKcsHvcZywu7WduQeu36vE1XUaKMk/PYDb4KqZ9aMg==
X-Gm-Gg: ASbGncvM3ytC30FSrG68B6U9LG1mNlsCIUkuIAYEWsJwV2vyYIqBzXXdZRUmtahVmi8
	pYG5+ieajEx9tT0AY/z7JFyydyRMOay8EtuIwnX2Q4sdSScKacGLjXatl04qMEStyWh2aTAQcKI
	8Eh0YrnE3iOjHHgrjUy+LdrNpP9+xb+ewK9YJzSVvNaNLekvvrTOwonjqxKX9DrRT8mO/1z+JCO
	ajqnWLpzpqThyr2GEhOaEYEuumDYGt4WLdjF+pCFeS5jCLVbIh+3zvvi3m7g+aKQIUXS+5qvpU7
	DYB1xZYB0L7bYhN+bDOAjFYQGxDrEwMtxcwaZhKXgK/NacuDtVTNttfl2MlFwJWSMsNlbniL3dX
	3AOY1hj6z8eEZxhcGjpfyxEGXSDi8yQ1bPA2bGL6WOLbhViLKBxpmIYKNNigzZp4YiwBM/nh8DQ
	+ApXcrmkhp5h94CEWLnl6tD/w4vEHWIceKAb9wy7c8hJ+ENfZ3Xuz9AGxcMAOC3l5bzBpbNtoGI
	30P
X-Google-Smtp-Source: AGHT+IHpE3RDRORd5ktJgdiqwbkzZi2RTF25VRY0OmCSOW4bztyzzIedByCpH9Fl1U7NYG5o5pN0Pw==
X-Received: by 2002:a05:600c:4e41:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-46fa9a220b1mr70420955e9.0.1760081375350;
        Fri, 10 Oct 2025 00:29:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb483c7e0sm34042005e9.7.2025.10.10.00.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:29:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/bblayers: fix up compatibility with integrated poky and separate layer checkouts
Date: Fri, 10 Oct 2025 09:29:33 +0200
Message-Id: <20251010072933.2782348-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 07:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224665

From: Alexander Kanavin <alex@linutronix.de>

Specifically:

- when using integrated poky, autobuilder clones it into 'build', rather than 'poky'

- do not use a catch-all default to tweak the commit id openembedded-core, rather make it specific to that
repository.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8026e7ed4a4..982287c9a54 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -157,11 +157,11 @@ class BitbakeLayers(OESelftestTestCase):
         with open(jsonfile) as f:
             data = json.load(f)
         for s in data['sources']:
-            if s == 'poky':
+            if s == 'poky' or s == 'build':
                 data['sources'][s]['git-remote']['rev'] = '5200799866b92259e855051112520006e1aaaac0'
             elif s == 'meta-yocto':
                 data['sources'][s]['git-remote']['rev'] = '913bd8ba4dd1d5d2a38261bde985b64a36e36281'
-            else:
+            elif s == 'openembedded-core':
                 data['sources'][s]['git-remote']['rev'] = '744a2277844ec9a384a9ca7dae2a634d5a0d3590'
         with open(jsonfile, 'w') as f:
             json.dump(data, f)
-- 
2.39.5


