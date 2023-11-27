Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C334C46CA0
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 07:33:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.88048.1701070425529925767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 23:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGQh3P7E;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c88b7e69dfso46909561fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 23:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701070423; x=1701675223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jsMVRghJ8I6+V8EBSUKCcXuKMoWXuRj9OF9RLPaFUA=;
        b=WGQh3P7EiNYqN6dfWlqswvu30Qg60S6lHcnOPS6XiFcbRLU7y/rWQYDflqld2eQyYH
         H/jqYf3ZBsEWeYa/LcQbt9WWH3bb1NbHjMifcRrfn9Mslibbn7lkYU6Eqpdc1ZE4YdSZ
         0RyUBwm40DOsJZd2hSZJ8duWrhPO1Oy8mlML7shX2OZyABFJlo0DCUuebiMLFU+svfPZ
         C20ivuDGB4l2iHydm0RIDXxkQoOKqWD1GtcgFvUExVXzJCCnhr0/H1PVBIheYukFMp9C
         rC82QikL9Ht4UiFZwOMv3YkRIYE1ze4e/9akT0uYDOd4KcnI6Jo/KlEPhPBAGW5UXthm
         tjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701070423; x=1701675223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jsMVRghJ8I6+V8EBSUKCcXuKMoWXuRj9OF9RLPaFUA=;
        b=a6We/Javuz9ZZ7rVEJqU6+iTtlCUZtvZ1BbMSXnr2IPmCJS2nHk3IyZpkFkJweKrct
         ztSpSENg3oy8JZeasmC0fun5sd6dfPmw+AT2H5qEQBGekez/hDwinH4g0KwYtZqaV7dE
         C/ii1iOJOSbr74vqBWPMeUKTjh2vnaKi9W+3eCvLlRofB9NR4fqb7NzUPkwPMNz5nmoO
         ppBRlb/fnTBMeB2MkeQQTvahON31Go1BmAZSAdnt/akLMP8n9w5IJqSGt7acUVQU+rWS
         ZkybH3i7t+1qJbkU1/O1XfNN2BJrck9ek3DwDPCBysGXlllzVrj9rZBw8VA9Qzj9NWdI
         Fvuw==
X-Gm-Message-State: AOJu0Yycf0iRXdZKWl8gaA5woqlZ7kpvK91D/v3lqMPXsFqFUjEPyP79
	WFqOgHBFOG7yL4BkE9vVA+dppkGJp4I=
X-Google-Smtp-Source: AGHT+IETaJ0OKgsvISqZsGz6ZUvHVbs4btGjoosWjbgX72F+zzquUYoq4vpABKw07Fs3GJrWlbPtQQ==
X-Received: by 2002:a2e:a58d:0:b0:2c9:99ca:1317 with SMTP id m13-20020a2ea58d000000b002c999ca1317mr2882978ljp.24.1701070423021;
        Sun, 26 Nov 2023 23:33:43 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b0040b461550c4sm2710497wmq.42.2023.11.26.23.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 23:33:42 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/1] cmake.bbclass: optionally support qemu
Date: Mon, 27 Nov 2023 08:33:30 +0100
Message-ID: <20231127073337.630358-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191262

Changes in comparison to v1:

Improve the implementation according to Richard's suggestions.
José's comments have also been taken into account.
https://lists.openembedded.org/g/openembedded-core/topic/89289917

- The idea is now to inherit the cmake-qemu.bbclass only where it really
  makes sense. This differs from the Meson implementation. But the
  limitations of this approach can be taken into account for each recipe
  individually.
- Drop the CMAKE_EXEWRAPPER_ENABLED variable again.
- Improve the comment

Adrian Freihofer (1):
  cmake-qemu.bbclass: support qemu for cmake

 meta/classes-recipe/cmake-qemu.bbclass | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/classes-recipe/cmake-qemu.bbclass

-- 
2.41.0


