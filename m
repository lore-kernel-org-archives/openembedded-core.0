Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F9E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:06:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.78443.1733663203651643020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mX111snx;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso2783883f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663202; x=1734268002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63sBXNjb7rRENmQkhA/Xesr/lZ1n1Ik0XEx/mdpXD5I=;
        b=mX111snxUNrwHwxJtrZYff/RPYBXKcK1mb+ZEP1ZFvHsZus72BUWt9LV64poiNSe4c
         i4okgPVSKFkl2CABKCdHt7WtekYlks6XVOwI3LamAjfD/gVqYgP8HzhYHkfilzbUI7fc
         gtsxIIOSyL3DhbXPa54hFxB1EiaNYBiBPrnu+0uXnh7AMUiROI9k/EvNF/ZMPPbz8QTq
         W51yA++24WxLpL3RPTLulcQlTL3VSpj++wsdDweSDLlCDEDE6Ou4yzW+z/VMZM7iia0p
         Dzn2tgNO1Wia5xUToQHhPVsExJ5h4LgSAxQ2lSxj2fEHG3+O12JnrqLQlvKCcoOvv4+g
         W6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663202; x=1734268002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63sBXNjb7rRENmQkhA/Xesr/lZ1n1Ik0XEx/mdpXD5I=;
        b=nWtU0zYo8iFC6uTvKOvY/qAhxt0HiGXesTwUWVsodDc0mVazJ/qhgJUTlNUzr2TqoG
         uxd9QrrL3dH9gPNMsH1bSqe1uvnqqgdFvqidCID9aB6O5M9bS767VuYSFH9csuydnC+d
         /313YzrKRq0WSr4jraz65hxA90Zf6dnIHLzMmUtsTQRd3oZVxt9JSCrx1s7Wsp2K8fZW
         R7ZHi7BHV9mEjOWrWeCCEg8gXpRNmp/29j6G0ynug+G/BIRNNv+wtOn5/DtLnu8hOxUl
         PXEqpb+WwnKDQ2GC75/4V1jg6UZk1LhfTo8+nKIVZd0lkhkNarruou0uduqbdFiElEnh
         sr3Q==
X-Gm-Message-State: AOJu0YwDUugCgRE+XwNDyt71juKXj/rafqS+ERzSL4Sa2sCmoGX50xeN
	GhNRugEddhN1ptY+Ab7M57/Ml0/V3jT6V3i8cu4K/7M+IOs7uSTf/N8sug==
X-Gm-Gg: ASbGncuoX7RrsnMXmWb6/qp42/zYSkLOnFcbD9YfG+Pd4Ty8LiGp5QUtbI7kDuLo4OT
	cgpGMqFg0Fkiuxe1Iqy4Ns8DJqbjChp65aDvgKqaY2yAFqNGK4e/ejq45RwenB+ANsajbUWigb+
	/ZULkIhhfoyv68ltk619cJvsQDKF5OE21nhdsKeoo1nteJ7vHpf1lK1X4PaIztpJfiwD/1LrWAw
	eoQaDXu/LC6nYavkZ4z8BT0dd8kCqWUScJX7LsvkMlUaUSdz9z1uJ+KSc7+sXNpAUUbXtLw1iw=
X-Google-Smtp-Source: AGHT+IGTmQYgDmiAES3oHqF/yWP7o7ZzHUukmWaNzsHX7Ba1Lqoiig1cPWaCE0DAabYep6J5CF4ZTg==
X-Received: by 2002:a05:6000:1a8e:b0:386:3aab:3a5d with SMTP id ffacd0b85a97d-3863aab3b8amr1340139f8f.45.1733663201484;
        Sun, 08 Dec 2024 05:06:41 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386257de681sm9745476f8f.30.2024.12.08.05.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:06:40 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 0/4] Backport a few dependency clean ups from master
Date: Sun,  8 Dec 2024 13:06:13 +0000
Message-ID: <20241208130617.4032-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208449


Guðni Már Gilbert (4):
  systemd: drop intltool-native from DEPENDS
  systemd-boot: drop intltool-native from DEPENDS
  python3-poetry-core: drop python3-six from RDEPENDS
  dnf: drop python3-iniparse from DEPENDS and RDEPENDS

 meta/recipes-core/systemd/systemd-boot_255.13.bb          | 2 +-
 meta/recipes-core/systemd/systemd_255.13.bb               | 2 +-
 meta/recipes-devtools/dnf/dnf_4.19.0.bb                   | 3 +--
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.43.0


