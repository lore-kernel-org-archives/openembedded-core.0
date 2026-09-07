Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D089C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:56:18 +0000 (UTC)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35663.1788789374900462007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=nDcZrBr4;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.228.76, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8ff762aso252024a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788789373; x=1789394173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+KasWRXa8YcqmT2Yon7Aqqtt3w6Koq+FeQGBDlAnaI=;
        b=nDcZrBr4lmyKKXRRjDRv19T+u8Y0YIkTw3IIlIheTw6JR4bvTf+BjwcrX/n+O75Fjw
         pfowvViEbeUx8M425gjveq8cYw3fO3uh9gg3zZmQEwQznNtBxE82MGxdn1ZbtSHMyrXL
         uP7suMp46ziMzi+kl03AyCrtMWTI+Zl6aiplI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789373; x=1789394173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+KasWRXa8YcqmT2Yon7Aqqtt3w6Koq+FeQGBDlAnaI=;
        b=CLVFgm+0s+CROA4knh9tRQFXbQLl4v99Pyy+ky5pwXcuNmYJYrHDSxTn0b4FjbfNs6
         tPp5w39dHsDXafVBs5/6FCS1Roc4pSPF7wJXRJfpNBYpQAQ3WZdA7jjlx+rIT6cFkHmh
         5+HYxXlKmskiN7IYZZ0JdMKm39HxmNcJQnKJjgdiW6crhSBbzoARN+b9TBkUPjSCQjlu
         GdeunZYGmyJKNstl2dK0pTQ35SEi9cR/eDACRk6HLdRhzk0oAZXRsiQijPW+9RMgSd7c
         VL1lNa03/0YQCLGCEKa5vnrwGoL2qMsf6UIYbOUsd4bS6bTs2sleS2Ujtzqu4rLc0S2T
         HoWA==
X-Gm-Message-State: AFuF++nvXPJhqXmZpaht4pelUSMC40NgYreNoTksl5AL22osnps4QEo5
	JlPL9Su//1Gq4SFt31Q8p/sfaD7d/7Ca3N+2k4LfONcyPh1KmrHYApL2WDjCdXBgmmeC2Z935O2
	GigCMpAI=
X-Gm-Gg: AYBFou3gfDsQDC7rNZXFWhp3V6flfzofNVmkjCITZLdpqAoAT4CK09QCZ8CMso+IWgC
	QEVbn5IfFyHJQuvwdkMCAcfdNzudX/H43pzQ69rPl1Uy26yGh+cX9HpIwtJvK7rN7aUiNpvZpC0
	MAwYDwC+9PVqzDQCKEH775Abm+WcV3uXu7gEJ0wZnuP1rN56SjVUhHMZ6iUx9RCNq0SwztuTurN
	AVbUupdGUzGFzN93AVeb1nh77EyLwebAyZvMWM5ny7ak2StDo1vOvpdxIyUpZ+jvcIikwmNlrV8
	STysuHut5urRVoZgSZFJo7EbNgRotVakZyp/iiTpLWC6uzMHMXRNTrihW7LUfl8eLlS3HH6G6pE
	/D7AjWmUHqq4us3PWisCFshEbpT/XPD3IFA0d48I3xtK7KTFnI4eOTDHFvY0vaLss+wEN6SuudF
	Lnl9L2JuLfRg4pVPJT9KQ9P20CJ9MPCoBET4K+G6G2zpzb5DOxND+5VRl/bur4ACknwvoNijjSa
	XC2HSIuPi2j1OaC6cuXpQPTNme7ENZdBdwV0jVFexelM5Zjsxc5P2wCG3M2dxWOlpJXtK/qs9zZ
	WDAFIqpYWeZkLnX4eENpZmL5msDyFktfbL6NTpBvejWLEfBqSjz5OoPDc24TCa3gyaM=
X-Received: by 2002:a17:907:7207:b0:c21:7bf1:2c88 with SMTP id a640c23a62f3a-c2625035993mr560968266b.2.1788789373092;
        Mon, 07 Sep 2026 06:56:13 -0700 (PDT)
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm478290566b.34.2026.09.07.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:56:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v9 3/5] libsolv: explicitly enable comps for rpm packageconfig
Date: Mon,  7 Sep 2026 15:56:02 +0200
Message-ID: <20260907135607.4132821-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
References: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245296

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.39.bb b/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
index 48fa03eb70..8215a2fb2f 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.39.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.55.0


