Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79F0CDDE6E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 11:16:00 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.6267.1729682151766896554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 04:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cjQ5jGug;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cb6b2b7127so3012217a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729682150; x=1730286950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VXqNc12tVgEjaiGMX2e7DxAAMEkIpr8x5YpMEflC24=;
        b=cjQ5jGugcIvZ02w/CsL3vOc7KPJH1hOljDxv+FoiU/G+ZZTnPU84g7SM+jZYBfaq6E
         ZbNYUNZQ6BzLj7e6/YMxKWvKTtKHDvRskbnLx7bsoxtxezI/VjEfb93QseZQHN3r+PAI
         KbjCw41McmNArbT3krU0zs22iAGH+S4KPlfMphfIN/1386pQrGnEEaAAY2uCx70Arg63
         hnEf1srGkcBsR7gJhoCwbgJq1QFOiomjyEyaIrN5Ak4+ezTns5KVsqbvxHPZWaqa5X2/
         NB2SN+L4t2q6naOTnz90WwtR74oNYl1peFZiHh5HbzlLvOOpdUUxJ2nIjTxWKTpJw68v
         lTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729682150; x=1730286950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VXqNc12tVgEjaiGMX2e7DxAAMEkIpr8x5YpMEflC24=;
        b=lQBbIG7jOs6/1t2rgPr8RH5UhTkONZiYJWwL1V2ukCuYSAatTsUnzbdeErH2F4PFQn
         kGu+3xj3ws20SfttzJZr2onDV7L6N3QFA6C298Jhlu2cgl6M4D74d24CbyanLVnRHjWl
         6XAj+Ab2EEWV5LBPl3kWWDcuIBSyrAsLXaXJkLpsEKTJoUyOSXA9tVmTKaAfOOcWfZey
         w4V9vUWhe3kFHpxSqgoTwBy4audwqFwd/KyuSSrULM7mEQljbiERSzjWl7x6um46jM46
         28OPIcePacw2LFcKltvtd/IUhfp2ivYsXY8zDBUaB7aHSxGD3U+8hJNX5+Y3ej/ToTeL
         8DLg==
X-Gm-Message-State: AOJu0YxCTlEqja08ZMx5dEwmG4YwpDearDDgaU2ASaZPmOTrCxhDgenI
	duPYSpNVhENRlRpYmPVZTwMlGk1CnB4wqd00v4xie2KTzy0U9OS+ig6SMQ==
X-Google-Smtp-Source: AGHT+IFwSkEy6VUo0/fnW2s6FsjBNh6VbXhRGoBsYEh+CdS5wS6bPquMYLp/YMctoYf428MlD5AEwQ==
X-Received: by 2002:a17:907:3206:b0:a99:fb56:39cc with SMTP id a640c23a62f3a-a9abf8d2614mr227762466b.38.1729682149325;
        Wed, 23 Oct 2024 04:15:49 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912ee125sm461393566b.75.2024.10.23.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:15:48 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [kirkstone] [PATCH] nativesdk-intercept: Fix bad intercept chgrp/chown logic
Date: Wed, 23 Oct 2024 13:15:41 +0200
Message-ID: <20241023111541.3437331-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 11:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206198

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

Running either of these ends up corrupting the os.execv args.

If we run:
./scripts/nativesdk-intercept/chown -R foo:foo bar

The loop here ends up missing the conversion of foo:foo to root:root because
it sees sys.argv[0] and assumes that it's the user:group argument and that we
should convert that. We end up a os.execv(path, args) that have the following
args:

['root:root', '-R', 'foo:foo', 'bar']

As os.execv ignores args[0], we can just populate it with sys.argv[0] and then
loop through sys.argv[1:]. As both chgrp and chown would have either flags and
USER[:GROUP] next, this fixes the issue.

(Backported from OE-Core rev: 2a75f647ec7696d353f4b09099d777ba53f34d36)

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/nativesdk-intercept/chgrp | 5 ++++-
 scripts/nativesdk-intercept/chown | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercept/chgrp
index 30cc417d3a..f8ae84b8b3 100755
--- a/scripts/nativesdk-intercept/chgrp
+++ b/scripts/nativesdk-intercept/chgrp
@@ -14,7 +14,10 @@ real_chgrp = shutil.which('chgrp', path=path)
 args = list()
 
 found = False
-for i in sys.argv:
+
+args.append(real_chgrp)
+
+for i in sys.argv[1:]:
     if i.startswith("-"):
         args.append(i)
         continue
diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-intercept/chown
index 3914b3e384..0805ceb70a 100755
--- a/scripts/nativesdk-intercept/chown
+++ b/scripts/nativesdk-intercept/chown
@@ -14,7 +14,10 @@ real_chown = shutil.which('chown', path=path)
 args = list()
 
 found = False
-for i in sys.argv:
+
+args.append(real_chown)
+
+for i in sys.argv[1:]:
     if i.startswith("-"):
         args.append(i)
         continue
-- 
2.43.0


