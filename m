Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4021C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:08:57 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.115390.1738674536635017039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msU6WYYZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53f757134cdso5782327e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738674534; x=1739279334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J+UmwTGRa8mTtxhISnPL9gKGyfe3dwZQj0PbR9hXvI=;
        b=msU6WYYZsJ60fWFDz9koO4+g1QMrA3RfQHnXy/bV6cI/LRtZgoESLeK6YqErLVQhnj
         dgvkAbVDZZZGcED4IRTriQ3dfGUG0i//szXo2CfvYibor6V8NeWwM19n+sGjYgXQgdO4
         NtfgXsG9VQr6hAxGaKOOnVGsexLBjaJmJQ32sivWKzFxZ5OeRMuzj2piIfvkjPDQ3Ogl
         1z/0XJFcUEQppsEdqZhjwdhCnaRfPMYWyuv7EogvLke2yT+A3RmCnHZUknKNBqrVrrkK
         b0QeMXT4JJY0KqCtHFZeLFBFjDaBsw7mrSBnX9lyUuG9M2wQBxNAlTNJ3VWoV+hkEVGx
         B+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674534; x=1739279334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2J+UmwTGRa8mTtxhISnPL9gKGyfe3dwZQj0PbR9hXvI=;
        b=qbAOvVrtBIhQ4rN6/7JEfRwdoKMzJ5wRj6b3BpX3IuLrKLXRLNwoTuz/B+7tJ0D/Ja
         q8wf+o0sVGc55Ujl4z1DZyBKE/vQxm+CaL61UH2OxN5pYtc159oZOaaG0/oQG2Dp7Amy
         d8MkirOAsrppze2v9eS6YWAYz5fvPihWCNbFUBKfMJNVyg3Hi5DEgQh/6hZ+b8v5i6Ar
         iEup7XGep98ug4MTEKfwHQ9HAcpcEs/jUltSvwkLUaN7WcF3wSRNlYPLDz/4rTcmlwwI
         LTd0nlinkkTR2/HAeRVqtGt1lRnFj6ufTsI3lhm2HgBq2VY/sSRo3GwsFKAVOEyxh2fz
         +UMQ==
X-Gm-Message-State: AOJu0YxJ3ZlF+4uxycfbMwI1FjZ5DEhNzB9F/sEhM7SsCqgtO50Fqk52
	fg8cdzBVXtjUxRhgH1kF5NLfmX/kJSMbQ/YH1v07Qm6PWabu+cdlOhWmX9DD+Io=
X-Gm-Gg: ASbGncvgfwH8YiUnKjoeULtQCkm44aipn2K2mu0VYbi1dx78jZMj8RBscCKb2EN/VWj
	pZ4e5PER1YJ/PDsJR6t3AMGWPB3XiNm34lJ7KcN3UhVWgRJLegTgGQJ6JHpzCqj9ZxXr8ClanCM
	3QKrpIvrTejs0KxK9/+m3Kavbtp/0mU/8jqI0jTtSNWbibgCCwHm9xX/ZBUj6mpnXJfQjzqIyKg
	4Q8+D4rrO0pkgnM7MiXSpreW6ydW2idhqp/RepwsBeTM7O+O7wUNTKe/xpfWAMcJWiPswWOaWt6
	UhFRWSG3agVz4niky4yCKOoUTu6qOjewov/XauTn2OihnLvdA843Y5qgrHW4AICTRV4gfdFT9w=
	=
X-Google-Smtp-Source: AGHT+IHHAsUZBOTs21zQ40frG29w17+W4zBE+gPcLYVhGT+CIdC09kbyWJaCB9ZhiM8zdVRFDvkmBg==
X-Received: by 2002:a05:6512:3d0:b0:541:8e09:ffad with SMTP id 2adb3069b0e04-543e4c2b422mr6937716e87.33.1738674534307;
        Tue, 04 Feb 2025 05:08:54 -0800 (PST)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe4bdsm1566027e87.214.2025.02.04.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:08:53 -0800 (PST)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [PATCH v2 2/2] python3: Fix typo in create_manifest3.py
Date: Tue,  4 Feb 2025 14:08:40 +0100
Message-ID: <20250204130840.2282237-2-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204130840.2282237-1-omri.sarig13@gmail.com>
References: <20250204130840.2282237-1-omri.sarig13@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210788

Fixed a misspelled "posible" to "possible".

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 045240ea0b..288d5ede3a 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -1,7 +1,7 @@
 # This script is used as a bitbake task to create a new python manifest
 # $ bitbake python -c create_manifest
 #
-# Our goal is to keep python-core as small as posible and add other python
+# Our goal is to keep python-core as small as possible and add other python
 # packages only when the user needs them, hence why we split upstream python
 # into several packages.
 #

