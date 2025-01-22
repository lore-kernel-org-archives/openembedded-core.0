Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06CDC0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 10:03:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.39826.1737540212607862073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 02:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bygZBUnk;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso45837975e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737540211; x=1738145011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aELK4diICl+2IAIFh8A7HeK/ba3qKTyOGJ/Ec5M8Uu4=;
        b=bygZBUnkF+CuqzYonPbwwqkXszbMJ3/VNtZtkAhSEeFnCzVVpbCWAdKUm0+bHU2c9Z
         Y5R5hJApYlfakxsoApr5NjiTYDTR/QEMNQ8KI9xxkpfrNZl6kUliNbogrJ9MK36usHhk
         rlgeMho5HlRknZAB/LsUWVYny9mD1Lv2nmVjSOU5Z9y5vdF0tODdH54q7f+2+iUv7HwV
         Npn3aYix/CUWquCFMCMattC45QeaSb7gwL6nBqpjdS4oQOlZVf652WpTyjhLqF2vqZgA
         JkwVZiSjJEDDT6tbDJZSaeS+ci3xGeB2gvqjZCZN/TZFkhnry9kgOoD2sMxEnwMvyYjz
         oH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540211; x=1738145011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aELK4diICl+2IAIFh8A7HeK/ba3qKTyOGJ/Ec5M8Uu4=;
        b=l9WqrLE6Dkx5pbExD8xvCWwtvIQ7caiVihCB55Ce+jpx06OUfs7fJ7WvmJ0PMIqn7n
         bhA056kFNhQ5G1FQWCOa1prKOk2cXaR2JtbtU14hYG7ALDMcWSIRpaNZPfZpA0HoVsbV
         n2xl7XYicXzSMUYdsFHYOypPJ9n1RInH1lCLJYHrGWRrcIanQuy3/aRFaZK6yTpDjf5I
         7lHJszfZQu6Xohf5usaTGV63jylhxLKWZrn4R8qb4Lv9334MI7rkT944KG0O4A7YAiVR
         6+n0roHiKpQfsOuG4obAD/XtRBzmhu/uv8BbiCsX2J/25/wWuYzZchkks9/S0GrD033P
         suTg==
X-Gm-Message-State: AOJu0YzNCN+UQyvWeicwj+OUg/1hZxMIlU/wKMLc5tNCGsN+ymUBeDA4
	ARhG4JkJpnj6mmD3h4NZCG3y8HNMsleUndVhGTYx11Jk1CEP6QxGiD/GWw==
X-Gm-Gg: ASbGnct4sQbxNLIp6C6OjyczHV6qqbbFRD7rfkBcjF3KM9H872Bd/+FDPIC3VDzol04
	dcr3HxYekgNF5vaIh4MQdEDWD1nFu+s9OsXrQzk+E7KdxCErb48UCT35M2qOklgoKQj6GQHz7dB
	Xz7fRxp85pO+7ToqCKBTMrlneoobUkOBQphamfT3jIkmd1hoptdUp/K8Wod/WhuBhDFxwOYD+j7
	qZDY+J8Y/dK2Umi6EOpVdwE7Z2oo/jMUgrRxh0fA3V8iMTx36KUDxOYgfcKpR2bR5mS+nyD0lQQ
	CFKqTAytXNt3+mD4J2dgNKaPqjK+kF8=
X-Google-Smtp-Source: AGHT+IFKJaYSi2uqzNppmkFnltU6EV4UhRNioZN42kAeh2v9G8a8n7N4ZylZCNbrWI478Y0mOv7Sfw==
X-Received: by 2002:a05:600c:1e0b:b0:434:ea21:e14f with SMTP id 5b1f17b1804b1-438913ed04amr187532645e9.13.1737540210757;
        Wed, 22 Jan 2025 02:03:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm15606997f8f.28.2025.01.22.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:03:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] selftest/virgl: add a link to RHEL merge request to address the missing vgem module
Date: Wed, 22 Jan 2025 11:03:24 +0100
Message-Id: <20250122100324.1561841-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122100324.1561841-1-alex.kanavin@gmail.com>
References: <20250122100324.1561841-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 10:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210142

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 27090ae5cd9..4843d810a20 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -273,6 +273,8 @@ TEST_RUNQEMUPARAMS += " slirp"
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
+        # Merge request to address the issue on centos/rhel/derivatives:
+        # https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3449
         if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'centos-9', 'ubuntu-16.04', 'ubuntu-18.04'] or
             distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
-- 
2.39.5


