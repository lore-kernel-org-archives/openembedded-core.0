Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67C1C4450B
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:19 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1644.1784055857637854841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tMpVF49G;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a31b9a492aso3013106eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055857; x=1784660657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYZLGk1BPmORRGJtFaeGw4yV+7JMpyQK1nsifcd6obc=;
        b=tMpVF49GHJ/m+WcMaEicgI/scxnOuD9zJhG/v1Pkd8m6UuXbSYfV61PHDtAdBWzKhK
         iPjQkGpy++/pOq9Xz1G7Ae3G4E2Kg7kyATjKVzmW0EnRj6T+bfgy2D1LOwYAF9xl4rbQ
         ZCo2q28Td3wzojylYaRNCyjKXr6wR0PN6hwKehJtk7IrgSuzN5ZLlsPrmlvLZV0TftWY
         wdUOQuNridn/w6dfHYyGyX6Bg1mFsK2Oe47TcaKpKDlELN/5jiOtE00OCqLfmosjef0x
         DYxV43y7zS+H27bg1m9DQnWDhCS5dGlt2N3kvvKP90UIGgDUpIIXMxcA8NasAb8YSfn4
         M1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055857; x=1784660657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYZLGk1BPmORRGJtFaeGw4yV+7JMpyQK1nsifcd6obc=;
        b=XHXmS6B/ppLae+mftsFd2ixIk9bECkmHfr0Bjs27hksGD9Oqfdz+48EJqSl7ibiunq
         8EiP69ioyYjYqADOROkyUky04cz4SgifMFu30C/ExtQb9K7wvbkalFetKqGD71hXvhvI
         Q3tnyFeOmYEEMrPB0LloxreZw15UfpRdNv/QXE34WvkwSIOzE4u7xwVPy36tA3deqDO/
         6ISnBZ8cIXTNewVtNX4Jz7xWdM9hPdjaisb6kRvYH+ojf7vScmhMIb7BY/ZEqaN2q5BE
         gCUJvzu/IyzyPsws5QqYUmtuK4ZsPSOQ5o8LT1TtCtZnWyYVf4m8pnrW1EkGhXg7kLa7
         0Rhg==
X-Gm-Message-State: AOJu0YxiCU0iRq+QjtGCGLfq3M+69VaDDxJ0gDSG6W0pmrI4Zz7Jj3xx
	JeNkRuqx8f8y6tp5GbVey/EvYjkJrpmJwJWX8eiCfXN+Xs3hA8nww7bQY9PPFQ==
X-Gm-Gg: AfdE7cm3LHjrs6xAk2J5zuVzLWRy80QCafUIUmyVfKsWhxcXc3zuniruD7om0JCWrit
	Ez5mCzqyhguI3ILY11vGRmKetaNm6eM8RnHfOtuslIcRMdlBnQqeJiPAmw0/70uAUY0idGFpEgu
	ULw0/65CvQs1qVCk6A4xIPRRe6W6ILQs+oSwMpjVODmxz72RMVuWBShnBJsZ1vvyWjgAML9KZAz
	LQfqpKCi1io/pHOyzEXllLAYMek0zLXGhHhhiAwqoZGP3KXDySxVSKsLyfGeysskqPam5BIju0O
	NQWLW6JZh+v9NQROgVtVY9/9XMZFdjjcRCfUsX6TPUJOL3f9Or0EZc4KGLI8PBxZNWDen66mssB
	cL9ZfNoiECBqmHzE2PPzQc3OvY3fecC0WQY2+/0mHrLW86wCBGTob7Elvxq2aUGWBxt9UfkZ4Us
	BqviQhdiT2CZicfWMh8k+l
X-Received: by 2002:a05:6820:f022:b0:6a1:4592:eded with SMTP id 006d021491bc7-6a3cb7dc9dfmr1858735eaf.0.1784055856737;
        Tue, 14 Jul 2026 12:04:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 10/22] xz: Replace deprecated SPDX identifier
Date: Tue, 14 Jul 2026 12:31:20 -0600
Message-ID: <20260714190405.3328796-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240918

The GPL-3.0-with-autoconf-exception license is a deprecated SPDX license
identifier, so replace it with "GPL-3.0-or-later WITH
Autoconf-exception-macro"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/xz/xz_5.8.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.8.3.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
index 0c0886fa7a..b76b1726e4 100644
--- a/meta/recipes-extended/xz/xz_5.8.3.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -10,11 +10,11 @@ PROVIDES += "xz-decompress"
 # packages, and the LGPL bits are under lib/, which appears to be used for
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and 0BSD.
-LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & 0BSD"
-LICENSE:${PN} = "0BSD & GPL-2.0-or-later"
-LICENSE:${PN}-dev = "0BSD & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later WITH Autoconf-exception-macro AND LGPL-2.1-or-later AND 0BSD"
+LICENSE:${PN} = "0BSD AND GPL-2.0-or-later"
+LICENSE:${PN}-dev = "0BSD AND GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "0BSD & GPL-2.0-or-later"
+LICENSE:${PN}-doc = "0BSD AND GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "0BSD"
-- 
2.54.0


