Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FACC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:37:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.7626.1639755421078135762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=IVNTmrrq;
 spf=pass (domain: madison.systems, ip: 209.85.216.41,
 mailfrom: matt@madison.systems)
Received: by mail-pj1-f41.google.com with SMTP id mj19so2589932pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6aBL6WbSd9A1uktcef0nNX3Z1+j+vEp6++jWsRw1eSc=;
        b=IVNTmrrqJNOaejnt3t79OiHIqpaGzFU8dO1LCdAJYbTKaba+/DtfXFS5FKKqGbis3A
         P1Ioo6LF7eOxTGASBa+ZtodaMjl8qDHGxXIHuTzGDW1sohusIElsH/WRu8okWwQwYBPt
         r6jkxGJWWNzrAsoPUv1mgfCRJ9vEqCAlItj2f1y7QPtJAGYDfPIoQND19XfVsA4oQ15H
         q6G5/GaHbST/MwKfm3HWvUZ3s5PX/jABXr9ICYAIWttLmmIbx+v5zwptaAdS/DiP1PIW
         AZQV6LG5k9qPtpUVQWEba5u1N0npfLrW30L17kUBYGM+iXqLofIcHK441go50WPVB/u0
         U4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6aBL6WbSd9A1uktcef0nNX3Z1+j+vEp6++jWsRw1eSc=;
        b=29PTEG7Nm/v93PE4fcJly0QFhBTBwS3Vy3HEkxWIpvzUblVBHzdc4TClsJidHxKJLG
         ewAiqh4mS40enPnqYUiAdqQLSmW0zvxcKVlwsBjkzefvmTVs7Cf/XG5PpGvok1K70qxy
         i+Gy4B28LMA5Nb429CCDKf2Q7tqjv40+Vb74M1MW+lEbDvOotLT1ozLeqdw7MriJUW45
         kHYY1DibBC0219HdBzpB2cu0oy/dotGPXT5dOh+HqYK9o41Lk+1IxVbwhjy4QbYwi4Xr
         JkLPzHYy4hYe4HzmEhAKzdQXeiljLcZlHBwrmUvIPc5wdb9/WHdu1RrfWs9E7jFs8MPu
         6VFA==
X-Gm-Message-State: AOAM531/YA26HeovlMsK5HxbrwyczRIxwiuFVKgtGxdzELHpzjOnPP70
	z8RaCXZUNMiS20mEpFCeGa5j1LjVKt6pBA==
X-Google-Smtp-Source: 
 ABdhPJxEg5lPCVtcLp8K+Aphp64OfM7eOrKhWgp4j+OzT7zsiKHThw69LmtWfRPucmDqSllkPbfzcA==
X-Received: by 2002:a17:90a:e7c2:: with SMTP id
 kb2mr12756065pjb.200.1639755420128;
        Fri, 17 Dec 2021 07:37:00 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 ip5sm8271631pjb.1.2021.12.17.07.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:36:59 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
Date: Fri, 17 Dec 2021 07:36:26 -0800
Message-Id: <20211217153630.1746217-1-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 15:37:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159828

This patch series switches to using the OE_IMPORTS mechanism
for installing the crate fetcher. This simplifies the addition
and clears up issues with interactions between SRCPV and
the shared-state fetching logic.

Matt Madison (4):
  lib/crate.py: install crate fetcher on import
  base.bbclass: add crate to OE_IMPORTS
  cargo_common.bbclass: remove inherit of crate-fetch
  classes: remove crate-fetch.bbclass

 meta/classes/base.bbclass         |  2 +-
 meta/classes/cargo_common.bbclass |  2 --
 meta/classes/crate-fetch.bbclass  | 28 ----------------------------
 meta/lib/crate.py                 |  2 ++
 4 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 meta/classes/crate-fetch.bbclass

-- 
2.32.0


