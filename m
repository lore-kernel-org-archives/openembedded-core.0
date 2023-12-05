Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99717C46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:42:41 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.1733.1701801755919781472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2hb5yvy;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: jandryuk@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-77dd4952308so5913685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701801754; x=1702406554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byKWi0JtfFlzBP7YGPIp599a1080RECCu3sjS1KKC2U=;
        b=D2hb5yvyt7FHC8d1ownwbK+Q4XQXPTnM4VelYJTMNpHlgfMZjAwXGzTgVRc7z1pYgg
         7yuu/RnUsJoh/24kjVVDx1KBd9W0WFLEYHufGFjYq0uaxonRBiD+skNDLNNcP/coU/ci
         YIyk8XCz7GPSZ6HLXIrS+LmMaU9P2f/XZcsfE+bLhPSx+jhEw9WMqcdvgM1iAGIgihDS
         GT45EsO8b6ZuRGp0u2bMNFku9qWJnmeHFpaHIr6ub5Xp8J6cTspjIzpCmX+7G/1xD2Bu
         qN+yx+oMOwn34otVyLlsW2/HVOISgYwizp36tR4yk3nw9cOrazP05S8GzfEk/gnzLWrU
         xS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701801754; x=1702406554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byKWi0JtfFlzBP7YGPIp599a1080RECCu3sjS1KKC2U=;
        b=oap0E9/oapXm6RJYLys0WBwuQFelu0S8mYj6vSRABlNayEQ6aN4gTHoBo41ndt94qS
         Z+lepM1c5AOCHg5KGpkuNqPFO0A6HnavKLaBFZRKEr8mVWacfm8YU1bDHy8+vN7Zuu14
         PBGrU+5qKdDqBz6mDYNrNvlCLkqHz8XQEvpYcI2NK02h9dHxSlPZWXi0kR7YEVFiV3XQ
         syaDeFWvB5BJsevmteuzZHTHXhLM3h4BGHF4TO1l/iSPC6SY8w9yiJXH7fdOwbdsG/ED
         KlUZ6oS1WunEfnweeXBxCaQLD3fRsWzw40Kok0u2zep1j/t1ycQkvrPnN6zrOt5SkK05
         6zGw==
X-Gm-Message-State: AOJu0YxZMfgiyUq6hVaaBLCBLDjrIRYaHxzAgJVzwWApov/n8sag1WXQ
	9LGsSTWOU2HpoQtVq6pYYU7ROf8879A=
X-Google-Smtp-Source: AGHT+IGeTTDhp0G8G+xHc0+0IvFFWThILTp20/Jh7i6TA8TGCdwrr6btrXzzuuaIfFLE/FYV4HC58A==
X-Received: by 2002:a05:620a:1474:b0:773:c43e:5e73 with SMTP id j20-20020a05620a147400b00773c43e5e73mr2172779qkl.25.1701801754070;
        Tue, 05 Dec 2023 10:42:34 -0800 (PST)
Received: from pm2-ws13.praxislan02.com (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com. [207.172.141.204])
        by smtp.gmail.com with ESMTPSA id uc7-20020a05620a6a0700b0076cbcf8ad3bsm5267386qkn.55.2023.12.05.10.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:42:33 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH 0/3] linux-firmware: 
Date: Tue,  5 Dec 2023 13:42:03 -0500
Message-ID: <20231205184206.30387-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191859

This is a small series to fixup up linux-firmware packaging:
The first adds some .pnvm files needed along with the .ucode by newer
iwlwifi cards to the linux-firmware-iwlwifi-misc package.

The second renames s/bnx2-mips/bnx2/ and includes more files needed by
the driver.

The third creates a new bnx2x package.

Jason Andryuk (3):
  linux-firmware: Package iwlwifi .pnvm files
  linux-firmware: Change bnx2 packaging
  linux-firmware: Create bnx2x subpackage

 .../linux-firmware/linux-firmware_20231030.bb | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

-- 
2.43.0


