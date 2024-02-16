Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BA3C48BF5
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:31:20 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.1207.1708101078904366807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N2x8zcLe;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: andre.draszik@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so2877385a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708101077; x=1708705877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLuMwH/ZxvXi9DjEmiKpIdK2asOJ1vwq7qd2hGWUoT8=;
        b=N2x8zcLe78ynMhhNr3WQdLuiH/igM0nzaMhLDpFLvygqM57jblUdFO5xH9/lQAJWls
         uyOcDG5o7k7t2xftvDB/YOX/4hp6afsDYb795bNhTESZmEqhM7fZSFyKsXo6reavFquy
         W5HcH2TcSfSU4fwtBG9xNUBm+NDJqpnbt6lQXj0ANt1jwq5485UVnBeQDBKLQd0KpZuI
         +BgGgSoRDGKPLhnPeYGppTknQTaDNkrL+707TOY72Fs4U1YyNOZBylnxQ9rOWSpZgW37
         1WElFrPPZifpIej1A7wf+3Wl9dYerfv+Q4mRfv7turrlYBVHVV/z1poe5zLMg02zWGca
         Uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101077; x=1708705877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLuMwH/ZxvXi9DjEmiKpIdK2asOJ1vwq7qd2hGWUoT8=;
        b=MwpKcdv6Dkx0ShC6SppjAdCGjLHoiOJIeelKytFIxmos/012WGGrLS8LutH5MXjrbP
         NU3PHEdhAnwkvkkoSQwtY03QImgU1Pqyzk4wmUsHz42Ze+ZMpngmPT3zapGg+A/Yj3A5
         rdseqyxAuZ0lZAUovZ1dch1eDRiKVrx31CYHl4voWQBHXW5otmB02bm1Z3BH3FKPafuS
         4TORQPxmjyj/gNlO4ICJiJYd+zA4gDH2xzBF/JJtDb0Jgx/drSk0NKPlXoDB7aHIqi4I
         7EAVPUyNEaOVukIst0xe08drEB3XkcHzb0aB40y/4OpQk0JCwiafFNrBo4VQmxqzFcMQ
         lnxw==
X-Gm-Message-State: AOJu0Yz+XI1kefkmSmo+b1ivIzfcI3Wy4YEOJwjXoXzXLwTGfem/jeLR
	JOapelEu+7iFQEz5nxlJHcMQAPLKOrM93ofIjlp4H8cqCqv1TsLMJapUEsI7NhaVjUpTg/FTxwf
	ISMMaYQ==
X-Google-Smtp-Source: AGHT+IG8S7K5yR9XlnIB5nDrwSu3jnRvzju1tuwayRCopJkKKvxBvb0MCM+Ce7qT3ElX7j2O4wWNWg==
X-Received: by 2002:a05:6402:214a:b0:563:bd95:4ef8 with SMTP id bq10-20020a056402214a00b00563bd954ef8mr3503503edb.23.1708101077464;
        Fri, 16 Feb 2024 08:31:17 -0800 (PST)
Received: from puffmais.c.googlers.com.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7c449000000b0055ef4a779d9sm133632edr.34.2024.02.16.08.31.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:31:17 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] bitbake: tests/fetch: support git's safe.bareRepository
Date: Fri, 16 Feb 2024 16:25:00 +0000
Message-ID: <20240216163113.2751935-3-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216163113.2751935-1-andre.draszik@linaro.org>
References: <20240216163113.2751935-1-andre.draszik@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195783

When git is configured with safe.bareRepository=explicit [1], the
bitbake selftests fail miserably. LWN has an article about the
problem that this configuration option addresses and why it is useful
in [2].

It also seems that it is being rolled out in some environments as a
default for users.

In order to allow having this configuration turned on for a user's
environment in general, the fetcher has to be tought to use --git-dir=
for all relevent git operations.

The alternative, implemented here, is to forcibly turn off that option
for all git operations. In the future, we could look into converting
these to using the --git-dir= command line argument instead.

Link: https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/config/safe.txt#n1 [1]
Link: https://lwn.net/Articles/892755/ [2]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 bitbake/lib/bb/tests/fetch.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index 41e1d8cf107c..bb30ed651313 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -416,9 +416,9 @@ class FetcherTest(unittest.TestCase):
 
     def git(self, cmd, cwd=None):
         if isinstance(cmd, str):
-            cmd = 'git ' + cmd
+            cmd = 'git -c safe.bareRepository=all ' + cmd
         else:
-            cmd = ['git'] + cmd
+            cmd = ['git', '-c', 'safe.bareRepository=all'] + cmd
         if cwd is None:
             cwd = self.gitdir
         return bb.process.run(cmd, cwd=cwd)[0]
-- 
2.44.0.rc0.258.g7320e95886-goog


