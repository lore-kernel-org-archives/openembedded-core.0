Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A188DC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:13:50 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.2372.1742570029716672355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=avgn7Tve;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-728a433ec30so400838a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742570028; x=1743174828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/fRFO5thmglnXAwS6fViR+aYRl19/J7fcZEHM8IXes=;
        b=avgn7TveorJ9HAFfbpi5pE968cAo5eUueygS4qb0vuaXACuFxW97nMkeCM34woWpOZ
         ers0XbWT8PVrPysVFNHo0zI86IONqEpplwmxGL218OiOH76ug28OzN/RrgH4dhDEQi6b
         0ekkA6I8nvVbHKt6PZ9ehT1oUSOhzamKhec6dUzDnszGmI9fcnyY3iAsEZJRDDxSLUvU
         kUbueTMn4kbAUYd/2OlK7XE4LNkPGp3w5CilvIaYepF91kR0FQOdDAdOzTkJ88Hlccvi
         cIzAehW1STfzcWsuaL9c08vqR72ImVQFk9Yl0jKmzqLizk6cR3rm3SyNPQ7W642JNBOI
         AY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570028; x=1743174828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/fRFO5thmglnXAwS6fViR+aYRl19/J7fcZEHM8IXes=;
        b=nnHXH3rU0JLbV2gQ6L8P+JKmvcEMBXnGl9WU6jc8/hhC86Ou5IoYh/jiRZIYsAoT2J
         6uHBPtT6kgf+LPeFlLDn5TTuLstkySQ6h9C47bHmPg5YuesqCfo6ROI0S8XN1xt0pDKy
         HfewcrFLgbGPbxzuT6AtqcFsyrxLeb8V4gJj7eTjTw9GMaSatoFcn2yePD8U03qGQOeL
         xWdHmd2FPvYurLgEDOMK7W4qMQm390xAarxR32+fPixyOPdFUHprThLBf1oG1cn2yIHL
         GkAiE2QecyX2ueO9RucxwYXObP0OaFn+9HLJfIMZZIJ/gVXy6xNq4d+yTA13ahCShyc9
         fDlQ==
X-Gm-Message-State: AOJu0YxNe7ISYCZtPhTXfVosz2u5HzntYBMbdFskQR8l/nSk4ipEAL0T
	+jAv5V0PT7syHdifCZB6JwEkZ3Eww0Bci4in9aO5qDmwdStKCvQwLVUtgw==
X-Gm-Gg: ASbGncteuA74UpZ5tNNTMTs+vCR//eAssCUO750NqrP2J7EhpXb2Axb9oqg844UczZr
	RGKNjuzkC6i07zkAjR1o/86dxMFxncFbciv8U8KmzGXpSj804Ghg0DVM34Rc+DxKz67WKDVYqTy
	nY3UXStZMr4bJOpPBLdfxoj7vg2kF8r44u/q1Dec1gOGWoaOyFcgBl6UhSf2kKIU0MWY8C0Ia12
	ns5A42pidi/2O7DGJBiU1XOfxa7AAmoKRmB0Qg5xPyw2FhZfZhBOHcgYmUhc1NpruiUEqeHQHzK
	2YMQzgAO5VfDRAjwK91XbVh1SWnKHyZx5WzezJ+kkqs=
X-Google-Smtp-Source: AGHT+IGddAwD9BTP8H+tFuThjB/uU+IN4R3NtpMsHC/Q9OmLZQLOr51Jbj3yh7m+THzF1uTuiAOJSw==
X-Received: by 2002:a05:6830:6587:b0:72a:13cf:4aa0 with SMTP id 46e09a7af769-72c0ae99963mr2855813a34.15.1742570028155;
        Fri, 21 Mar 2025 08:13:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::b36f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c0abac389sm425931a34.4.2025.03.21.08.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:13:47 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/2] Fix SPDX 2.2 for common SPDX changes
Date: Fri, 21 Mar 2025 09:12:38 -0600
Message-ID: <20250321151345.484603-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213480

Fixes SPDX 2.2 generation to account for changes to the common SPDX
code, and improves the testing to get better coverage of SPDX 2.2

Joshua Watt (2):
  classes: create-spdx-2.2: Fix dependency handling
  oeqa: spdx: Add tar test for SPDX 2.2

 meta/classes/create-spdx-2.2.bbclass | 10 +++++-----
 meta/lib/oeqa/selftest/cases/spdx.py |  9 ++++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.47.1


