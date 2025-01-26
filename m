Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7E4C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:48:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.29135.1737895692203144898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a1i3PTOb;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso24674755e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737895690; x=1738500490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8R4xEPGfvekX6rnfyGDt+9x6zAXmWl2fjGUJ/lQvsbw=;
        b=a1i3PTObuy5nCzVIxBmXLCfn59/ZOR7cvb1Dl2cLdsmxlqGCYdN0GzxdhwxCBTXE23
         zUT2OWryKiiC9JdOF4lBRQWiur+/+T3oQxDuwXt0saeZWow6//j1Mp+zcJR7UuzE5GGt
         Up06BiAq2pctTYaqefbVbPcUxPlc/fjyotmkNyaXCUa6BoVrXyjyH/vXsE7wAcFddE4e
         jbkf1Btka2C61bRKLXcSxAF1ELgMAlotcNXoyJytsW/es0+qR78/FD0pdEsJC6O5TXfR
         ObN1dUWpIDqOuu4VGOtUtdoDTiMLUb1EBOLlwYCQJDE8zybBrj0u4raunxHc0tmrQtN6
         KNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895690; x=1738500490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R4xEPGfvekX6rnfyGDt+9x6zAXmWl2fjGUJ/lQvsbw=;
        b=pck3ujldGuNJ1KOthv95lwhPzdeUchphbIdvKn02bmwoc/862ljUDSB4zYx9nWUUN6
         sm1eXRS9/SLwsp6BWvR5buHxtnGyh/W+HTSSLZgtnkkE1DIAdzAqtPo7Jzfvz3tJvK7r
         oztQxgrirBgMIo5Uvb5zgqC124QatgD+nS+ajNEMK+7kr1X3ivCc4ClvW6UQJ6N69nEd
         kIwUgWKsS7iuSnfGOUlMvRSHMK2ATz+dyvoocbD7YprCv0T0A0bBHc2r7sSVSywMZz3e
         EKeYc46L3W3BV0a6IHcfJE+iT7sHT0ToeI4+0OoWrhXOpkLIHntsLeFLfSRceGJ7JVCj
         KDAQ==
X-Gm-Message-State: AOJu0Yz77CWMrVEyDe3mSWpSgTg9jicYk/H3GtKb1RxG0fbVIyhOMu5j
	IrjbFpPiG3dbXo+IwePD/a2eXCsOID/3xAJoYXCe+VVlCAB4h6MgAEXdOQ==
X-Gm-Gg: ASbGncvjaoMIf65S2mRmXXS4ExMsQOKcYmrw93lsZGAIELqIJZYojfmlqVEjZtZQVoh
	LcJIHfMSKFbDl0Mk/qsMtXT2CAAKPvvT1fj7eb1UZSjZwZhbYQsqfeeJn3g9DMHtIbpU+KtCy6g
	bd4cAYbRjv6ryITJUK9KY9T+UKGl9TSAULpMfTNtyrQZgSiKwW522cf1gPNk3MnV5ANKjyDkP+x
	qeNEGGjeCPVVfhbUD09GaGneXON7FlgFuDLjXzBtIzK7Z2Ohcx5JIyLR9iaxlZL6NMR+1W3Cl9Z
	+dsUNh1/IEBQhbUuuQDAvUdtBg4=
X-Google-Smtp-Source: AGHT+IFuEKJI8j1qGnkkP8msDlTTXnEOr5LVjj6BkLHJH+QHqX4v5p76VacIDEBXFutj5VXVsl9L8g==
X-Received: by 2002:a05:600c:524c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-4389143a66dmr314964825e9.22.1737895690126;
        Sun, 26 Jan 2025 04:48:10 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a906sm95938295e9.18.2025.01.26.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:48:09 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap,styhead][PATCH 0/5] pick devtool ide-sdk fixes
Date: Sun, 26 Jan 2025 13:48:01 +0100
Message-ID: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210279

The following commits from openembedded core repository are
cherry-picked and apply fast forward:

git cherry-pick fc17808799d2b667afbe4ea9837b66af70d47007
git cherry-pick b886c26bf893878ba8eb6bee80dd0507e5cb0d2d
git cherry-pick 65950eb601c6c8aac0e4bc8683e544305346229d
git cherry-pick 9ab1e35a0969af144caedcc25cd095a17d758bf9
git cherry-pick 177aa72b37f2061ff3311ec5dbb33aa56a5ba006

Corresponding documentation patches will be picked in the yocto-docs
repository.

Adrian Freihofer (5):
  devtool: modify support debug-builds
  devtool: ide-sdk sort cmake preset
  devtool: ide-sdk recommend DEBUG_BUILD
  oe-selftest: devtool ide-sdk use modify debug-build
  devtool: ide-sdk remove the plugin from eSDK installer

 meta/lib/oeqa/selftest/cases/devtool.py |  2 +-
 scripts/lib/devtool/ide_sdk.py          | 63 ++++++++-----------------
 scripts/lib/devtool/standard.py         |  3 ++
 3 files changed, 24 insertions(+), 44 deletions(-)

-- 
2.47.1


