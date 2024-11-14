Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E41AD68B15
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:32:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.37206.1731591152711948927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bb9GHW/b;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so5993815e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731591151; x=1732195951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUqU/XerDqnUC58iEEYUfF4kL+6bbBGHW+mHcqyHoT0=;
        b=bb9GHW/bdv3MSEkE/qiZeDIt1c/9NSET4PBazQWHA4fcK4l+FgWNekZ8KV9ZOtupMm
         KCEmBx9jDb8RWVfiQRNsn3EUtx5xyQXHSDjAuhdjoKBYvppkWTmiaplCM0YaxE0/DAcL
         JUgYXUwFolYgphgGi8HCFTJk05R086wGVBgeyQK42uhx5OQh0d5l3xX1gYCExBe954ul
         Y6Dm7F8aZuJd/ARnMhML9ab1c3XGmKHglC1AWdiO0TcKyruxpxc9g4GAZlP9ur3n/TXA
         Ivyi3WQOH46aZkJqpL+G16xTy4Of9+jI1MZeu+eu6l9PYvTcNVRDtx7+qXD9vFDPGZf9
         jBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591151; x=1732195951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUqU/XerDqnUC58iEEYUfF4kL+6bbBGHW+mHcqyHoT0=;
        b=Pq7R1skLJ4TrdSMfjofYeR1n5lsIDen/bnDNTj28O0SkbRTYkQgMfarIldpoeaz3fR
         /wQDTq5JIDuQerWpUnLhPNTw72x0KS0/GRQV835lgplDHRFwZaDfaW31cPukqJqgFgPL
         f0wx/wHjxNcr0ahTd8FZ9KBD8t2/0D+36FYKulNZu49dhZo84Mf+yehBoV7VnojNCcFR
         BL2OnsUlw60t7PRVyUUsEb6TVQI0EcAQLdQGZx3u6D2rwK4rMsweD1omg5bucrX4c0qK
         n0yikVz8iUiF9u0JhdqWWKWsKgWA6Cj0PLuYS2e0cPX5JAKWfGaG4FX7g2QTA1ylkjAN
         nI8w==
X-Gm-Message-State: AOJu0YxjxUVDs0VU31SGzbX840EGLGadAxmZk4ldwEK+ral+Tz0Gg0qd
	M87auzXJq7/gUkMSvI73Zc+Mee+D/eefedroQZ/aNSpr9TFKHWiRbGv/Eg==
X-Google-Smtp-Source: AGHT+IHM/B+OmaCIgJZKZSB/PCsvwk+Yj+z9Qwpl5pbIPPEUTfsign/jCcgR+3Hh7Ci4etI2ggUdDw==
X-Received: by 2002:a05:600c:a39d:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-432d82a9e5dmr44843465e9.4.1731591150893;
        Thu, 14 Nov 2024 05:32:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da29ffe9sm24281615e9.44.2024.11.14.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 05:32:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/2] bitbake.conf: add an addfragments directive for oe-core and dependent layers
Date: Thu, 14 Nov 2024 14:32:25 +0100
Message-Id: <20241114133226.348812-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 13:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207163

From: Alexander Kanavin <alex@linutronix.de>

Please see the patch to bitbake for syntax and implementation details.

The path prefix to fragments is in its own variable so it doesn't have
to be hardcoded into tools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 02bbf0e7a52..b6013f66e26 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -836,6 +836,8 @@ include conf/documentation.conf
 include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
+OE_FRAGMENTS_PREFIX ?= "conf/fragments"
+addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
2.39.5


