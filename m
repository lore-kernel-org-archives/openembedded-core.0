Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBF0E77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:40:33 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.36885.1736692485525837439
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxMuY4cu;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: arturkow2000@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d9b6b034easo2125604a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692483; x=1737297283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3RJDlXR5+QFrb0HWmT/G16HIHsOOEHvSdE0OBqVjbM=;
        b=CxMuY4cuZkOBolk8qbt8kgI+qAYf5DNWp02bXHEpMukNLJ0/HBrRwkPwi2vUKNJgGZ
         Mg0iwidEYeiqCZ6JSZ1coADDmNrhArlBQxX489iE4AcXf/GGVp31xToVIaGXrtP3iA0v
         gIndopENo9WqP3KT+eOjDnsflVSVntrzp1HQs134hig6oBhq2D9oEKTomtwxIz4hQgE5
         BOS/npK6GhHl5nO7+b/HuhAl9AAJWOuEI7ISwY0/YflfFiWY5RSKn2Kxm9bZ/GXBMNtO
         d/2XiZOdXjFTw6cHoSWrbOmeG4SPenbLPERi9BGF46u8iMfg5p2uMlP+EmM82/06QRGx
         bqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692483; x=1737297283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3RJDlXR5+QFrb0HWmT/G16HIHsOOEHvSdE0OBqVjbM=;
        b=SRDbyyVAcAIOES3gL/gf+Seu6H0M4YqpaUqCaUghykpwaV6TCzKUwIb4hztp+6VKWz
         r3nIFMNvksf5pKzZNrYgBik0NarNdXZ/LV28hHqSFMDORyjxhK9gdfWz8LSQllNKT+XO
         scAFNq8LFWeJMDn6DjbayQSdcL+V7jK2A2awbwlDLlMsgMLiEs3qOYOQKlR4clNHbW9H
         MTDZo0bZsv9Vak02eMI7+Q1W6TwdzPDd37TOdQGNHdoQoFM9t1UmMtw0VeuyNmkcEcKG
         JY3UwPP2fsUC4pmDj26XalYFunK9rEiJMcKhxbHD+gYQDOOQ4VT1L28J3Z8AmnWPZJXZ
         3Xcg==
X-Gm-Message-State: AOJu0YwctTt+7bEYpkWR3c1yTF+SvBcYEyfiJ2pwqABf/lj16AfsDeNz
	dCuY9yselkTG4BdvPmFrK28RI6Yw2FSJ5uRXWPEk4vWJqn5a05nAVApAxQ==
X-Gm-Gg: ASbGncuPVE/nM87uTVQQG//1vsjkcCuKR7zsrpUCUnwhQ4or4FYdZlFssez+tNj/H0F
	l8vGo60M06867OjJUDpYdziWjQqaQwYGCzd7cxLTmWyTDH8zpwPyb8aIAWkiDPGFEAl/FicWOq0
	lFfOlt2f1NJqdfyhAPyqsb4pVT6QRm5P4z/t3gSv69bk8wxYWDBSzsiHI3v+hTdh2dmEWT6/R15
	42fUDU3hWM2mJ9KrNOulw/YhM5kC1aZxRBajolZGPoRs4b9QSTIvq0WcpiFD8ZE
X-Google-Smtp-Source: AGHT+IHJmy2779NFqkfTnEJ207lMH2C8ctroPE3fsoEdTPzk0/s8i7jAqLacLOgKIK6BvrAmuNs7WA==
X-Received: by 2002:a05:6402:26cc:b0:5d0:e696:1bfc with SMTP id 4fb4d7f45d1cf-5d972e16896mr16569197a12.15.1736692482702;
        Sun, 12 Jan 2025 06:34:42 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:dec6:9e22:e5fb:f0d5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99d05bec4sm3207739a12.14.2025.01.12.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 06:34:42 -0800 (PST)
From: arturkow2000@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 0/3] Systemd user presets support
Date: Sun, 12 Jan 2025 15:31:38 +0100
Message-ID: <20250112143141.1300189-1-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209685

This series brings systemd preset support for user units which
currently are not handled properly resulting in image build failures.

Related issue: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15710

Artur Kowalski (3):
  systemd-systemctl: add support for --global flag
  systemd.bbclass: add support for user presets
  image.bbclass: enable systemd user services

 meta/classes-recipe/image.bbclass             |   1 +
 meta/classes-recipe/systemd.bbclass           | 120 ++++++++++++++----
 .../systemd/systemd-systemctl/systemctl       |  42 +++---
 3 files changed, 117 insertions(+), 46 deletions(-)

-- 
2.47.0


