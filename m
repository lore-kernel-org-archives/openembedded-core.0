Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA7D39010
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:55:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18013.1768416939281243652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 10:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyebnZZd;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso1240835e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416937; x=1769021737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsN6jLGAVHm/Go4V+J/jCizJP8VjM8wl4KUM6aHzI88=;
        b=ZyebnZZd0yp/7nb1U57XJhuIgVtIc6eqXxGNOt4cRoEFGdRfJRVKW33MTfNWURM2oy
         xMRvRHh1VNku74Aoxf3cLZHaC3pPj0C0I/XORI0gyKe8wGECRAocf/r+wc2fqp2GVTq0
         dnKGOGNdGIvQyoWsCsxJlJ+NEDf0CxFMAR1CzcNxWXVQYQ9hrRqFp1JaSBYfTWtwGZQ1
         swZLskkAkaRc7ooexdiEiz3YkEDr/BBxWKfzElWJDaXSz6iM/FpUAHJEF8ENEA4DDYRs
         sse7fuyGv/E1gGVAvf4lLnHgCPMUAaxv08LPENPJB1DjRaES68kaRCn6ArpcTzjNs4ln
         TdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416937; x=1769021737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsN6jLGAVHm/Go4V+J/jCizJP8VjM8wl4KUM6aHzI88=;
        b=c0vOkMMrmaIzBkBA3SxYQu9kuvkFfhPffyws4Qpqs0mjgkgGnybMEzYgmG5i23O6CG
         VGTj9PWs4FX8o4StgAvieKcPvo29js/M46eOolkOJzL6aCAkFPD2CHGhEwobJL4lMqDP
         Z/+On6HRDvhpm6Fh9adgauuyoirN+5Vfalti17TXR0MKJP2Z7lGEnuFF6e106Zw2z4+o
         ND19WjLLhkkswY9GMwwLZMouj0ZFjS70gdntXGRvLMuOw8oGm/oDxNAoE/eEpPBDSPRE
         DjHsWvMSR9FxcRznhV+BfBPT1wyCZt2LLf9vCDybutAstP3wg+MQRt/GJDlSNO5DWQ5V
         LefA==
X-Gm-Message-State: AOJu0YyDCZgOdD3JxV3dgwzPtlOx5YUiLZB1xqVKvWNdpgHqto41Ocol
	5KebjVAc8FKPznI39xncxjsR9okT7hvOzEtHh7BKkFGpOZyvJiCs0xQl/4oP0zrx
X-Gm-Gg: AY/fxX4bM8Ojcvp/Acv+tuh0KNQKR6Ctj6oHGPoYp9Hr+okvh3d8317wY5yg8z5bxAN
	45gYz5hVaD0KOsn7SAJGh8m4J/j1MDs79LM46EHs0LoJOyXB1IlYtonmiKf6YHmRWO6AI3i3FLz
	5dps3NXt7LMSphLnECfIfkz3+M6UA5htdBqvz3aX5zk2Ml9t7gLwrQn8bBmFeXMVQki1RP2TPIr
	+sU7HNMXUWpDPe76vLmn1wckxq7m6zL/EImnsDiLNFz7MqHBsjuibdWG3uf2AXYPSb+zLWYPm64
	u2P/TQPkSFWZEIAkJt/vm6UYN0At0HZBP1CfHiLOjtpghtj+gGcfCh4pTgBxyMt1RVsCGd4+rw/
	XqTlv3CUsvp+ykoSjOBBHt42t8JyipHlJPv1Rfl9QIhunXNI++59WZTArNTda6dI6UBHuY2xRsN
	GQwisWeqK36Ov4dtLWgj5HnHU=
X-Received: by 2002:a05:600c:a088:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47ee47d3988mr43945135e9.16.1768416936992;
        Wed, 14 Jan 2026 10:55:36 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428be2b6sm5586085e9.9.2026.01.14.10.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:55:36 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 0/3] Overlayfs improvements
Date: Wed, 14 Jan 2026 18:54:11 +0000
Message-ID: <20260114185508.380709-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229368

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Changes to v2:
- Improved commit messages

Vyacheslav Yurkov (3):
  overlayfs: Fix the QA skip for ignored mounts
  oe-selftest: overlayfs: Make the test more deterministic
  oe-selftest: overlayfs: Add a demo case for /etc

 meta/lib/oe/overlayfs.py                  |   3 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py | 103 +++++++++++++++++++++-
 2 files changed, 103 insertions(+), 3 deletions(-)


