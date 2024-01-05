Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A96C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:03:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.23898.1704463399162290051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mjMpxb/7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da9c834646so1099102b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463398; x=1705068198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lghNhx5JIu2yDyjTZiWWGL9lJkqfUVOcvo6TQa5cBkg=;
        b=mjMpxb/7PXmFtnDjQpzJmapzLbUl/QawgkzaIDeicCjsZphEBK3Tk3AOCiuomhte5h
         VTOmYKksBJ1H9OWIzQK41HDZLJJx8mRVahGOWizE4nuUbLBKCM8NZ3v0FGA+2R+sOux/
         us+rS5qs6W6MBhgTi25rUVAnJBGSxf6Dz9sqYcFunongQUhGs56cnOzsCwyjv89dL6YS
         4u6vtxF5Yx8avhSldeairE67/0EEqeR/mtPCO3kFbfcrKMEDbwk6lp2GUd1JWhd3YXU3
         CUy0YZjDTuZrpIFRTPzTRWiRnDmiDp6m1/tIvdPpy7+L34oiFTDHw6pK0Wmigy3Thv0U
         pYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463398; x=1705068198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lghNhx5JIu2yDyjTZiWWGL9lJkqfUVOcvo6TQa5cBkg=;
        b=BW2Bi2sZlahqsdEMeHDLE1N4mm1AmPLt/A5MLJEbuWUN1OYMmJUmFcBOVWqm/hOwG+
         yBNKQOdwMJAoo/tsIIDadF+DFquCmLD4irMnDxeydxF1IUi83v2sQl7J3sMMJ5bUho1r
         oq92ISSQTzni3R0LqNc9NiOmzJUu7ZXZ70Ek9mDoEPrVjak9NOnS1E+8NRBcU3WVVr3R
         kxDNbCBKFVT5EASiq3hodxlgWjG1JCZHZJoMOWnmqUSpKSgEiz/dvhw41B5v/EPt3Wh6
         30dZe9663UVm9cuaf+KEuZCbodxGQawNAUnVKtiS3OLePLqJQzdf7zS+zCrExlz1YR7u
         C/OQ==
X-Gm-Message-State: AOJu0Ywt8AoU1aIG7QHNVdKCEOSaO/FRJOiEmSlRf09HCwacyKStB+c0
	YUqudxZhUlp/zu5v0SM+Ij8H0G3tsqgYpbOqSdwZUrAgGS5dgQ==
X-Google-Smtp-Source: AGHT+IF9kMEGCZh82q4gTkwhOYeVmndpUC3Iss5gBnCqM5ipXHbZr1rog2Ul+QJe5bGjA4BX3sRa0g==
X-Received: by 2002:a05:6a00:3cc4:b0:6d9:bef5:f6c with SMTP id ln4-20020a056a003cc400b006d9bef50f6cmr2534434pfb.13.1704463397779;
        Fri, 05 Jan 2024 06:03:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm1430097pfq.194.2024.01.05.06.03.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:03:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Fri,  5 Jan 2024 04:03:03 -1000
Message-Id: <cover.1704463208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193360

Please review this set of changes for dunfell and have comments back by
end of day Tuesday, January 9

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6418

The following changes since commit 3ea36d92800b139eaaf75995cdd59912b63db9ee:

  tzdata: Upgrade to 2023d (2024-01-02 03:43:26 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Dhairya Nagodra (2):
  cve-update-nvd2-native: faster requests with API keys
  cve-update-nvd2-native: increase the delay between subsequent request
    failures

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20230804 -> 20231030

Peter Marko (2):
  cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
  cve-update-nvd2-native: make number of fetch attemtps configurable

 .../meta/cve-update-nvd2-native.bb            | 27 +++++++++++++------
 ...20230804.bb => linux-firmware_20231030.bb} |  4 +--
 2 files changed, 21 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

-- 
2.34.1


