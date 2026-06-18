Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCBDCD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:42 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28946.1781814996680656876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=QnagOb2c;
 spf=pass (domain: baylibre.com, ip: 209.85.219.65, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8de4dd10a61so1466406d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781814995; x=1782419795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YHlmFxBO7OiG03t5uYxhrr4iY3mHth/huCwu6h5sDQ=;
        b=QnagOb2clVcyq4lTXGo3nGJeCCPwAVPOGqMi/63qZViidyyDPMAXia9adw4dnskZgs
         ztMtGgLkPnKPkCukUNoBzMMgzAiNG2xXfds/eoa9h/oZIspz3op/a54w00KR7OOn1idN
         xVvZT2tGs88kluvkTmKqgcenqDtgEvn2MxCXiWACM/0Yzxa42EfhGWf2GxHSsCA47yda
         w6V52woiPvoLBofYt27uPG0pxjRPpt6XYbTfg5OwUJ+uJ0RwzPiBn60MY9Vefq/lB3cd
         LZPOSCPXKbhurCiSDoK4otECRK+eDR1FctrmMBdN3NVtim1jRJnzyS3FwME28E6AtjPp
         olPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814995; x=1782419795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YHlmFxBO7OiG03t5uYxhrr4iY3mHth/huCwu6h5sDQ=;
        b=JOhcOCgXe+qza5mh72aaU70jx5Kj9oBUBKnmhy22k+uLW68iBzGx2qPN3jcr71qYYB
         GEjgYc7UEj392E699LJ1+Gz+nYd44eHducaTfcD+CLfMfFnSSYGhS+xJsOsQ4cO3FUkD
         aLMluLECsbvdoOkhxmA6jTn55Kr+ue7/3F6E6XwJ57Og9a116h6W6XNtYVwCK0K39m3m
         eH8F/N52syhgbIaDS/w0Xv/Z6nkLu7dimw5do4C2y+xQ+rMgr57562JMOQvwEYKZIWuw
         wSsbDgGE0S/6DJMiMJn5SL2XLx6Rnl6ah9wxhz+Fuq4FS4plqoGrYXzE2mzdnSA7IaFU
         6P5w==
X-Gm-Message-State: AOJu0YxRRpsVR5gNguxueWHQE9Z1b1tSfVGWzv+xOWfs0STJZT/IW1bY
	tF8UzlbPDSKDPjLLdbBeKbevyOr+Np1ct3s+Dr1pBDmXVbSj16tu/QWCOEvUTmWil7HB0a8QjSS
	ur7fdVbd/C5Jm
X-Gm-Gg: AfdE7cmmRdBpvhFE6ercf+axNQrkNXVnsVxq2r8BPNBvH7fjh258bcQvtcjluoBtHyh
	OUnulEiXIkNBSO85p6DL0NdJy0n/m3y1JsDkHgROlzrCQDontE186zHa17MJC8rh6K217pr0ncY
	3AvintIifzJUeUO8BeuGiO+F6Yz5gabcFH4WjboSouvZVNOxWDt8jkWqHpqI6cm0wxRxJbMsAKM
	SwKocoLillI6lB5ZQhVIz2yrFSXd3sVkRo8ug1QR/EIse20xwXXISEOwsuSYEUjGfBenM1fR9Dq
	yWsYFR6SpXEMUlQIH1ptC2p93hctPbTvkB/M8ifwIK1xRx/GcX3X/rpILJwaRXx8Ov4TIINZF29
	Y6cn71frXOxWHl2W8k9KgDhQDuyCCjttQ5jP53+/zSKftd/hsSRNtvIzZqwKsCwwWyMtwOl15Yz
	D3hRtC2c3YTNRkWEih
X-Received: by 2002:a05:620a:4046:b0:90d:6234:caa2 with SMTP id af79cd13be357-9208e0afa23mr99948085a.40.1781814995377;
        Thu, 18 Jun 2026 13:36:35 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9209de35275sm25456585a.0.2026.06.18.13.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 0/7 v2] patchtest: cleanups and fixes, part 1
Date: Thu, 18 Jun 2026 16:36:25 -0400
Message-ID: <20260618203632.131125-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239101

This is the first split of patches coming from a previous series[1] I submitted.
Compared to that version, the changes here are refactors limited to the core
scripts/patchtest script itself, and do the following:

- Make sure that the user has enabled the meta-selftest layer before running
  patchtest, as otherwise selftest results can be misleading
- Avoid duplicating code for test results generation
- Remove excess whitespace, unused variables, redundant function calls, and
  unreachable code

Note that this was driven partially by Claude Code (Sonnet 4.6 and 4.7), but
I've gone back and reworked some of its changes before submission.

Selftests look OK after these changes:

|============================================================================
|Testsuite summary for patchtest
|============================================================================
|# TOTAL: 38
|# XPASS: 18
|# XFAIL: 18
|# XSKIP: 2
|# PASS: 0
|# FAIL: 0
|# SKIP: 0
|# ERROR: 0
|============================================================================

[1]: https://lists.openembedded.org/g/openembedded-core/message/237047

Trevor Gamblin (7):
  scripts/patchtest: refactor results methods
  scripts/patchtest: clean up startTestRun()
  scripts/patchtest: simplify _runner()
  scripts/patchtest: simplify traceback logging, remove whitespace
  scripts/patchtest: simplify run()
  scripts/patchtest: clean up main()
  scripts/patchtest: check for meta-selftest

 scripts/patchtest | 147 ++++++++++++++++++++--------------------------
 1 file changed, 65 insertions(+), 82 deletions(-)

-- 
2.54.0


