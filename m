Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A89FD7F9C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:39:44 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104791.1772221179669196932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 11:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eM0pVVsS;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7103601c8cso1050115a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772221178; x=1772825978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmUl6dYody8ANqPV6iGnNK8UeVt6rCGEr0njUmINr4s=;
        b=eM0pVVsSgXxxHMRs3w23Eqg4wMavSYXzBc9GslCCsNQCLySfdlk8k4UHhex2wEb1N/
         ULWS7JWZUBU6iAGqJJ9w2zSyfNJmru7WamofSbFSDQCH2cPHDCk4ZA8+T56ZD3QdjlRY
         hoTVGXB4rqiePi6sOEbGf+52cXpEipYPhxPrmnBcd3pwoe2H8JbsKVmkQqoobugNqhzg
         Lz7CprXIrY75Lk/patAci1ou4KDI0/BfwW6cRH+xf+a/+8j5fo9mZBlX+qDG/nXjfRwY
         ZbgozOEod0uKxusU/QTDq85S9ZyM/mENCZeKIdqDboD2yPWPghBb+oeZTFh0bVT1xSE/
         x8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221178; x=1772825978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmUl6dYody8ANqPV6iGnNK8UeVt6rCGEr0njUmINr4s=;
        b=KdmBvXZtP6aCpcA1iSpgfaZEBwpbWN6+T7YVpHZaDDKOEwNrT8gYtf5fgeOw/pBku3
         zeVuYLCpmvmEdGdp4HZjEiRTpDn3A2z9mz/88xxbuRav8eXpVgJvolxBgGibPPYCVmF5
         E2CRQmg82ZIa5j900HTbfV5lvb2LFm93qslixbot/05HhxsRSeRjps595VIsSF0spMN8
         +A5RR68pGQO4eQuObW2b/bwO/oiSFC2mHoMjjI18ECF6vYt4LXfHyNUxRDDZLaDITJud
         c7H6hZBopgolEzCuAR+Nf0/gh6TEKhdaBZD7Zrl7e5YEFLvf9fbR9EMAKgXM7RGvVUGJ
         4c/A==
X-Gm-Message-State: AOJu0Yy+p8uPt/HFumWC7l+Rh8YULTl8iR9DoWRYKqQMLgHUd3r2yvKQ
	pCm5Mc+P05JnJtZ+mhRM5chZo24AE2Rh8M5o0ms96imPX0KAievHtsup80EKkQ==
X-Gm-Gg: ATEYQzy1mKJ647fbQV2iS40v0eOpEcYp7RJKDtoJdD6C2LRrXjgM2wpULY012W78MuM
	KzGv6DYDfNUD1CzCGxd/hJtp3kC83TKKvdrkQ/HAtAe2svlkTN6kaxWF4F0Il4cQXrbtTRFi4CT
	hIz5Hbtpef5EcAIgqcdFWXavYTdHHhKvRFo2j4582BNpitWG7MdtnNrR6KFv91J3o+kjvnwRK73
	VtjQOMdZa7xf0cob/e5VhRKrOq4z2DPAbK5BDsIZV0S8f7S0zIgSeTcntUdSjB+q66VMbFMVW1S
	AQyAUseM5nJ/yqaIRlOoBFB0w/ecGgkLtvc9Klp5i58fZR1es2/GE938tPBlMhG5ACypN9+GWjo
	cA8iVztp39dMIJRXCO+IoGsMo2T+V3XQ24RofVMT5yBPiEkZxN0KR2zTjPkSfuyPk78sCNpfWMF
	KAt+yhCLtWbdeMH480JEMAANjznnjXF3v3nhEiSj3mE9cJiVGClCHM9WCUu2eRaSj+qqSSGOZee
	c5jD5txy/o57GROydiIofQfYUO5sDxF
X-Received: by 2002:a17:90b:4b8a:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-35965c4e4b0mr3626719a91.11.1772221177884;
        Fri, 27 Feb 2026 11:39:37 -0800 (PST)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5866738a91.8.2026.02.27.11.39.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 11:39:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Introduce PTEST_RUNNER_TIMEOUT variable
Date: Fri, 27 Feb 2026 11:39:27 -0800
Message-ID: <cover.1772220652.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 19:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232111

In https://bugzilla.yoctoproject.org/show_bug.cgi?id=16163 analysis showed
that one of the root causes is the hard coded 450 second timeout passed to
ptest-runner in lib/oeqa/runtime/cases/ptest.py.

This series introduces the PTEST_RUNNER_TIMEOUT variable, which is consumed
in lib/oeqa/runtime/cases/ptest.py but needs to be updated in testimage.bbclass
to make sure the value of the variable is consumed at runtime.

For python3-cffi which drove the change, the value is set in core-image-ptest.bb
to 600 seconds, as an example of how a per recipe change can be enabled.

The test run on the AutoBuilder cluster that proves this works is:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3136
https://valkyrie.yocto.io/pub/non-release/20260227-113/testresults/qemuarm64-ptest/core-image-ptest-python3-cffi/
where you can see:
PATH=/usr/sbin:/sbin:/usr/bin:/bin; ptest-runner -t 600 -d "/usr/lib"
in https://valkyrie.yocto.io/pub/non-release/20260227-113/testresults/qemuarm64-ptest/core-image-ptest-python3-cffi/log.do_testimage.2323256.20260227191837

[YOCTO #16163]

Tim Orling (3):
  oeqa/runtime/ptest: Make ptest-runner timeout configurable
  core-image-ptest: add PTEST_RUNNER_TIMEOUT
  testimage.bbclass: enable PTEST_RUNNER_TIMEOUT variable

 meta/classes-recipe/testimage.bbclass        | 4 +++-
 meta/lib/oeqa/runtime/cases/ptest.py         | 3 ++-
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


