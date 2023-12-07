Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8806AC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:36:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.85708.1701959772052924414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 06:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=O+gPCw/a;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b595bf5d2so12045535e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 06:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701959770; x=1702564570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=57jHGlrR8vgKAMbHHD/Acl8ot8D1Bj1TySMitDiAIsU=;
        b=O+gPCw/a3IuqwDKkdL4WGqETP0T5pEy0CviR4bsQG2fqY/JvzDudcW4h87NEHuy0V9
         UaLO5s410Nul/o7ezqkLzqA5VsOfljeNvQVLOiDmZ6DGbWTVcc+kra0aSQ1mG0I5phg4
         o0MSCEa4kZYbwzX5ciDlc4iARuGC3MSuCnPPUoJEDjDpAD5PKUgtiSMI03+8lamWDk9f
         5MsHymH0SsvgcGqrGJ8B/4s8MCp4M++qhVOYJala8xXO1h35yGD+eufJz1F0yv3cai0a
         UxXgZ2N+qKjSB9vxLzHNKHGuj/mki9yHSh5vRpAJjHtvytD/hn4PefhGklosFOWtcSOZ
         oycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959770; x=1702564570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57jHGlrR8vgKAMbHHD/Acl8ot8D1Bj1TySMitDiAIsU=;
        b=g1TaXXiGjLxiQoQ8hwNUj54qvMf0X5+fs0trXwf59PhBNJoOChhHBQOxGq3jJS+PV7
         WF8H0/Mtrkob/LF9DlH1HzJxuq4AzoOFZY0uQBbolHs6ludNa98LKSx35+BhxFVqw0kp
         7kSstZUqwt3Iwnk71gb9WwNpyE00TO0m3yyA0vVufZGxFe9jMNePOuS/2qOZF25+jRBi
         f7/SV/xcNtWmgHw/dKrdQ47jWXtkbUW9PdyYu8u3KBpvpfwFLZYx6cIJGQlokXDnoHhX
         Axx0JGpRJGmCkqLZItSHuboY9aCFDkzt47cz/3Kd3mSZQTD5OFFzCEgmsDZd/hIgwLpa
         PRjA==
X-Gm-Message-State: AOJu0YwwaTxlIk8jZ03WR+PaXC2ouQCzw8UYC09/YJJ1mFN5a+h//ZoI
	Z7FTiXq+hfsUUWR8nAH5aaPPAs+79WVfuI618ofWQw==
X-Google-Smtp-Source: AGHT+IGeN7PM4+l2u3BUhTzYZj0S1id0VVI7/wq6+Tnq8lGfRMA3Nctp3mpRjJxqGKSH4A4sNi+X7A==
X-Received: by 2002:a05:600c:230a:b0:40c:2a50:99c3 with SMTP id 10-20020a05600c230a00b0040c2a5099c3mr405104wmo.242.1701959769956;
        Thu, 07 Dec 2023 06:36:09 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040b47c53610sm2072570wmn.14.2023.12.07.06.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:36:09 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 0/4] Image screenshot testing proof of concept
Date: Thu,  7 Dec 2023 14:36:03 +0000
Message-Id: <cover.1701959631.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191958

This patch series is based off of earlier work from Ross Burton to enable QMP
based screenshot testing. 

Eilís 'pidge' Ní Fhlannagáin (1):
  login.py: Proof of concept for screenshot testcases

Ross Burton (3):
  qemurunner: remove unused import
  python3-qemu-qmp: Add recipe
  runqemu: add qmp socket support

 .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 bytes
 meta/lib/oeqa/runtime/cases/login.py          |  39 ++++++++++++++++++
 meta/lib/oeqa/utils/qemurunner.py             |   1 -
 .../python/python3-qemu-qmp_0.0.2.bb          |  14 +++++++
 scripts/runqemu                               |  11 +++++
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/image-tests/core-image-sato-qemux86-64.png
 create mode 100644 meta/lib/oeqa/runtime/cases/login.py
 create mode 100644 meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb

-- 
2.34.1


