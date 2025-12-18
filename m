Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBC5D6ACF4
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:02:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40330.1766059315957183863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dv9to75S;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc544b09so347839f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766059314; x=1766664114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iABlNUQ1WBKW6IPcF4FcCfmPVjkNrlWXqGb7GGbanhw=;
        b=dv9to75SDdKopy+lCAVrLRivJTh5vxPiuJHq2cubrNxzYIWqNupZkcxdbDrvk6PTwb
         RU2e/4JPTDNAZd6xgIC7rP0JxA/EK75KNKp/IkkW9fDULMqHk3YFHT/+diTzUeMxHLyb
         iyHS4OH/wZrptMmccsgiM2WNXMMAf/0nTcXy5NxABAbLR+AQzbBw+hu4MjKV2ocuXbmc
         QLaYaLBs6ZYBU7EMrAs6DnRV0f9OHQX3eJ/FqxXfmfpClzTBkCJo7Fo8+S0ACciJBZEJ
         Ouyvn5djBS1nAPkxGSR0pzAphRIMLQz4pYH7TKJ4N3P0ZRD3zUKgXteAks7IV9bT1yo2
         r4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059314; x=1766664114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iABlNUQ1WBKW6IPcF4FcCfmPVjkNrlWXqGb7GGbanhw=;
        b=qXoETRLB4qLzvBMr81ouynv6rtO2VAWoBbH/mO3M2QAXZLgR/ljHBpeHflZSD3QuaX
         6hld/81UtpXs/ahXKNmn8i2aS2SksRhZtzF9RJEsux90uwGa/t4qU1IygOTIRxgy+q0r
         A7hl70nK/O0doY6WhdfPw920aJo01Rt2dufre0qIxxYhZ5LflgU+9L0Ge53XkJRAGP3k
         NAGCcywVzE/SvAnbaMSOnBwNPiy1GK0+2sd1wQM3lIOx8qe0rHtkGhBmzsvZQbx64wPH
         ghAxHhnpLNbBOKBkSo3ADhJJKoapDR9NIY/E7e9EZBDXKKT+vWa9d2WfeP2taZJ4cGv9
         9WSA==
X-Gm-Message-State: AOJu0YycJV8WfIJHHeDXAK8R/WtTMtMDWsxKIy0qB/vA2bXJChvnbrpi
	Kn+81TtF5K627OHe3YqlsT0fGexfaXnwqN6aKGDnK/1TAbi2/IjituaDV6EVJw==
X-Gm-Gg: AY/fxX4I7jEeRIzV2eN0zUIkBknKX4rxVjTvoyzAuXJ0Jtcybt6yrlNOzxPBnbRcCKW
	OzLoJdkMZkrBW+SpO1WVrsJBJYvDzO8qlUAImzIzrR0mRQDgP0lOrUZK7KAbiEHYky55qy/HeuO
	g8H3UeBYRBC/5IKt+kMe3q04Wn0ERp2Sk8EmwUrTm6qACuQddKybeHe7bhl042d+HAcioomTFc2
	0ScizRnaaHjYxixuoZXIP5DaUZwqvyyNRl4pBUOD2pwGnrISqIMYyQLC4lIiqzyGccQeMefYPE1
	fslX8pErvzONowuJgMX/n8thnrhd6DFnC7CP84+ejpI1sC8dCjhx+EYuZ9QVRbLI9/c6nE2gBap
	sVGojTg1YbMMdtuwUfAEzyeIN+52uZ7+dX1v7cOhK+/oINsS1bUJu4tjNNFGFNmSxY/c0ItxcVq
	h5kTcWWM1e7THAx76qqHZoFeW4zEwJaQCVbA==
X-Google-Smtp-Source: AGHT+IFHP9PDhFEZ+o+6vfrZmn4KoJZ+dlKTT6ogZ5zDY1FdmrIfyZX/0rHGzeQFXRY41XfZUITMBw==
X-Received: by 2002:a05:6000:2089:b0:430:f879:a0fc with SMTP id ffacd0b85a97d-430f879a220mr15100233f8f.21.1766059313716;
        Thu, 18 Dec 2025 04:01:53 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43244949ba6sm4684850f8f.19.2025.12.18.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:01:53 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stondo@gmail.com>
Subject: [OE-core][PATCH 0/2] spdx30: Add summary field and concluded license support
Date: Thu, 18 Dec 2025 13:01:37 +0100
Message-ID: <20251218120139.104155-1-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228117

This patch series improves SPDX 3.0 SBOM documentation quality by adding
summary field population and concluded license support.

The summary field enhancement makes SBOMs more human-readable by providing
brief descriptions for each package using an intelligent fallback chain.
This is particularly useful for security review and compliance documentation
where understanding component purposes at a glance is valuable.

The concluded license support allows tracking the results of manual or
automated license analysis in SBOMs through the SPDX_CONCLUDED_LICENSE
variable. This addresses use cases where license analysis identifies
differences from the declared LICENSE field, with clear guidelines on when
to use the variable versus correcting the upstream LICENSE field.

Both changes improve SBOM completeness and usefulness without impacting
existing builds or requiring changes to existing recipes.

Stefano Tondo (2):
  spdx30_tasks: Add summary field with fallback chain
  spdx30_tasks: Add concluded license support with
    SPDX_CONCLUDED_LICENSE

 meta/classes/spdx-common.bbclass | 11 +++++++++++
 meta/lib/oe/spdx30_tasks.py      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

--
2.43.0

