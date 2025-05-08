Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA3C3ABCA
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:16:47 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.5809.1746735398213581996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 13:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=it0F5kvY;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso2242455a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746735396; x=1747340196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMSqsD8IFCjzp9YMl+wdWZIEghpxdrWFtvD82em+qso=;
        b=it0F5kvYS3vG0FRhR1EFAt9qMrTvQEgJJ3MPCJ/OeYsbp7IF68ja99BPe29OlgOZ+v
         Rutd3bRH9LBzpldhx1AZZ+dkx5vu/koH5KQYhLXX/bj6kNQiibJEiPqWdVn3eK9tCf9t
         +PNlCIMZ6x8arYi8UOJuahtfBtsBVvKM+NrWM5BPsmhB9nc13kdwBDyog+MsrvvEjBBX
         LnaE3nCExul6p0QkiJzWe+1RQwyDDoINUTrQiR7Z+apLZQ+CGSay4EGCyrQXKoQBBT5b
         vEn+ftrvzv3Xp2r83+Jm7ymYmsvXh2nZffwHGnsq0PafHsjpo68LBkS6frvbxaLPWQWR
         IaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735396; x=1747340196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMSqsD8IFCjzp9YMl+wdWZIEghpxdrWFtvD82em+qso=;
        b=wlSqJRm8kBLEFk/pKf3q9zAvcwSo8SjM5D59ye9GKoqo7ATHzlNPDCGDzwZRjw95jj
         SDMLU0ESXQ7gUaA5Dd8MbKOpBaL2v/SN15bqXrArzEZ2pYbsJ608T0RFmUO84T7rrvM8
         XowGgXTfnmI8HY4nqGc1iohSMuHobxAciaApMPAFzCgsHwLw86BNdRE+b/YJwhQdC1Rg
         vFnRB0Q5JzQv/uGxD83X7z14BtalAKDAOFmjMkhunGXiSiTmfgUBqyIVPhLDIoKVP7fr
         F8bxsUrrcCXHJMUxSx2QSnufVyJqtvILdZh0WpCTlxg8KRNBzoiQBG4jzNLfTIGMUQZj
         9scw==
X-Gm-Message-State: AOJu0Yzw04xQ2Mib/b9d7WzTxbox7ByUB4XKDQUFSvNsHOTqzbjjh7iH
	0KLhNkiKY0OzxlMEyvbfxY0YKwhRY8DGfc4NxMlHtk+s0281i/F0VpYcJA==
X-Gm-Gg: ASbGncuoSmUlGZDXvv2c3mWCyp3eUIbsyHljeDfJs1tneG2k3ZlwLwLKGCSJr9uDs9E
	7cyDlwK98BlI7kh59Ny2OJ8dhmGMO9/jvPq/6r7YAu1fVly485oeHzuZ3NIl/j22xBay4dGB0PL
	dKb/HympOkd2cTAPT/lJVKwqtvtQvggGmrhkP6w+xSxlhhAnZLvuUG+FVF+v1HXCtnqeovLBm6C
	XDUMtHmbPPxxaeUsJJ33mAinJOQqSNDvwO+0F0oYoL4qwBMISIQ9G8mq7x65fP4KL8NWaiHDWfn
	FSZ5FXPzXKyxSj0h6rVySYygWVC6p6RWmJm2OhpY
X-Google-Smtp-Source: AGHT+IHG6C1Kv6rQlsiTiuQGIYe5CGBdA93IOiZHORK5h49ucQZcN1+WvVAi1oXUml0Xa0RZbbjMSQ==
X-Received: by 2002:a17:906:7312:b0:ad2:1371:ff35 with SMTP id a640c23a62f3a-ad21913e570mr93258966b.39.1746735396239;
        Thu, 08 May 2025 13:16:36 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:625:1800:c942:8429:98e4:61e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933f4e6sm37610866b.54.2025.05.08.13.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:16:35 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.26
Date: Thu,  8 May 2025 22:16:28 +0200
Message-ID: <20250508201633.44249-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 20:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216158

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.26 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 56b22e4270..8e55bd69c8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.24'
-DEFAULT_INSTALLER_VERSION = '4.0.24'
+DEFAULT_RELEASE = 'yocto-4.0.26'
+DEFAULT_INSTALLER_VERSION = '4.0.26'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


