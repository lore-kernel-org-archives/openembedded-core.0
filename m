Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387A5EB8FB0
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:38:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10718.1694086690877865440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ZpeXx2Ro;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so13041125e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694086689; x=1694691489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9CK/lBXLLqqr0rGdy8s5wtVAJSHpoY6PBc45Q1SGJg=;
        b=ZpeXx2Rov4eNkaE1akXhiZfIhWMF4Jk6U0l9szZSUJU0PbrXgewj7QFxtRruz45eX+
         m2jkMUDKCOibmVeATO0RRDnwfwn3C6KDeoywZl10Cx3krSMJ5xqHgySOkLyhf1CnurSm
         QNqtQZPS6I6da68uqCD1eO/0f0Vyzj/meUR1PrwByKuqLSq4wybw0c1XEpsN6zr8PtC/
         ALnbSxeQjBzSUTFWwhKj+D+jlIjSPQ7hWuYXe793D1IvcsVzP4F9r35HPnyB8dIMz+gQ
         tBv52GbQg9zQ5VTyV24/3Fgtla0uJKZn0I/d3nmBp4FAY83UBZ0MZubmyyEpZHjzdfVd
         Yg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694086689; x=1694691489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9CK/lBXLLqqr0rGdy8s5wtVAJSHpoY6PBc45Q1SGJg=;
        b=ESigoIy/N3QD0RbBYBwBr+eJQ+50NRa6Cqg0KpQUVmo08hpqrYZYgqX1RKvz91Wgba
         uYupwQH1GgfFqlpMFsGBwUvDOGLA1jJ/nuV6Rwo1Qry+Ho/z2iNpRgiK0uftqLhrwAY9
         WVk4HwUDmF93m7v/OBnoiOutaAxf4iTlIWq0+FvUWnJWyLd7RAu5bhnqoFmexlu5jKyU
         R2/bnuaogVHa6sDpqB43Z63KqB4t5dqjneQJKDN3e/MKIMCrJCwbZPLHzenop341t/I9
         zUa8eCASPLdMf+iLOcCBuVpSITop9teJIwORqMOS6u8b33nTEf1rVJQoPdW9rOLKeihb
         sGew==
X-Gm-Message-State: AOJu0Yw+olQSqiyMXsUJ91htTV7o67mZY24n1yHgUxAkByBmwOjECm4u
	pBIfEtXXHNHWcFszsD+7aZxgsCQppfnDgapHZTIfsQ==
X-Google-Smtp-Source: AGHT+IGicqvga63vBA+5gtRq3mL1ZI7pJ3KYeB3wQ4zuiYfiB6d04ut4KAdIbAPNLqOrPktL4joPOw==
X-Received: by 2002:a05:600c:1d1c:b0:401:bd94:f45b with SMTP id l28-20020a05600c1d1c00b00401bd94f45bmr1943664wms.4.1694086689384;
        Thu, 07 Sep 2023 04:38:09 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003fedcd02e2asm2277293wmi.35.2023.09.07.04.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:38:09 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] nativesdk-intercept: Fix bad intercept chgrp/chown logic
Date: Thu,  7 Sep 2023 11:38:03 +0000
Message-Id: <a2b25a85ad779ebfca71ac69705ea78d765fd348.1694086051.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694086051.git.pidge@baylibre.com>
References: <cover.1694086051.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187381

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

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 scripts/nativesdk-intercept/chgrp | 5 ++++-
 scripts/nativesdk-intercept/chown | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercept/chgrp
index 30cc417d3ac..f8ae84b8b3f 100755
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
index 3914b3e3841..0805ceb70a8 100755
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
2.34.1


