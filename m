Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E1ACDD1C1
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:52:55 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.72397.1727452373911201152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Te8TVsKA;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-277f35c01f5so1142452fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727452372; x=1728057172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hk8RVdUav1OZf95Hbzbsx2TpxVvvdX7DOPyKj23/pIo=;
        b=Te8TVsKAOPrXZhFLMsrbtI4d/4QJ6EZcIVgnnnCgMatjdCeqgCxOhRc9Gf3xTYQGSI
         b1VMt4LV9vYqwtYKq/yJVxMPvBhu6b2J11l2/Wv8upaL3qE/SUk6fbY2jSyiLPyfBhwM
         2fJ+bBletdEQc7eW+IkYT64iGuWnngIHVfYujqi2L3gWGYIARZyjW8kP7FDUsgduKye6
         Li90lA0CJ3DvfIV7xMTmO7fJLPnmJgqMwHRhBHpr0TZzBrvzKAo2kLDdGPFusR7ngiZg
         7szGFX5fvoleYwON849ENWKDiciWg5EyLk8v+73hff1RYVvDDfKZMdAALBsHu3ByVXyz
         ElLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452372; x=1728057172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk8RVdUav1OZf95Hbzbsx2TpxVvvdX7DOPyKj23/pIo=;
        b=eakKVmHqK9VvbSbFwCFV1oQRJso5+AnJjMXEvumt7GvGeERxO9lyhOUiMQA+ba43IB
         dcsNE+SnEdwOvDtcGvPT6klZ7x0Ey9VekaolTrSNuJVoglqmguHDDRMrDD0yLaETCEjv
         s21celIHzRSDY/MEthev5yfCPaEEQMbnT730S+O7VBCiHFXVCQz9ERafzO1SwbUgtIRu
         p2FAA48cpDkO7KFlUn0cHsxkXpTg6CkPf9HB/51d9cWDz46YwOE3GH0cG9KWR6vPuiJw
         W0URSWrJu1Otx2eArePuoBgA2Aws3tFikTdLP/Cj9SDPR7MYtSOkGSEnyBmAvP07KxvY
         i+Dw==
X-Gm-Message-State: AOJu0YxYq+sRmw5mQAqpnDKSDhi0Fs+gqP8ioDe7NfxnSIIwOMdLO02k
	QTqTFMuilN3aCsDCei+j2ecCV8QptcviS+VXzw10U9zqbobi1RqGiCoMvA==
X-Google-Smtp-Source: AGHT+IGzpsDZDEToX5yQqR4JmUs1P0NlFIAUS31SVdIFMf1yTIPJA8tb+gPX3/p9nb2j86N8doiZ3A==
X-Received: by 2002:a05:6870:d614:b0:278:1863:f4b6 with SMTP id 586e51a60fabf-28710a7e49dmr3579137fac.15.1727452372582;
        Fri, 27 Sep 2024 08:52:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8a23])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2870f778f1bsm698589fac.1.2024.09.27.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:52:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/4] SPDX 3.0 improvements
Date: Fri, 27 Sep 2024 09:51:53 -0600
Message-ID: <20240927155247.1012846-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205030

Various bug fixes and improvements to SPDX 3.0 support, notably
upgrading to SPDX 3.0.1

Joshua Watt (4):
  spdx 3.0: Find local sources when searching for debug sources
  spdx 3.0: Map gitsm URI to git
  create-spdx-3.0: Upgrade to SPDX 3.0.1
  Add script to make SPDX bindings

 meta/classes/create-spdx-2.2.bbclass  |   11 +-
 meta/classes/create-spdx-3.0.bbclass  |    2 +-
 meta/lib/oe/sbom30.py                 |   15 +-
 meta/lib/oe/spdx30.py                 | 3375 +++++++++++--------------
 meta/lib/oe/spdx30_tasks.py           |  112 +-
 meta/lib/oe/spdx_common.py            |   20 +-
 scripts/contrib/make-spdx-bindings.sh |   12 +
 7 files changed, 1560 insertions(+), 1987 deletions(-)
 create mode 100755 scripts/contrib/make-spdx-bindings.sh

-- 
2.46.0


