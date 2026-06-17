Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB3CCD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10394.1781682337512552329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bpy0+RRm;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso67321325e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682336; x=1782287136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmWnp/Rov+mkT1KtCo/qxxLUBehOTlL7+0cqCZ0omZQ=;
        b=Bpy0+RRmiMLHzQO27SA5S6ulJl7q5yIe/bgY0TjDKnnhbGzhEzfTnkFHIltleKVr6x
         nl6bEA3uYO60/cgOLy2xu1k1W817U0n/q90ooMiBkOyuUF3rdVI33wQaaBn9tw54GtWZ
         ohOxdO/iZc9Lwgd/eGaI5HkyScnWPc45szWVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682336; x=1782287136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmWnp/Rov+mkT1KtCo/qxxLUBehOTlL7+0cqCZ0omZQ=;
        b=Zn22c1ojkw6hA6YIRiyi0adFvYO3JSg8AsV1N7WS8OhWBaqXYtLDs1ILUU9eJBjw0t
         5Z550RyZFiORwsKcqxH/XKlAgGgFqWQa+gsz/YEGSzZXR/qd8YM94x5jek8pZ+Y7ADug
         dJDqlvn4dcNVg3bWfUKINPZzuFl+2janGyrpaNFWyyOtDleAQfUlGjoCrFptPxfSRcRI
         imjYAIrhWTgXCSn+oN8LbdzWQMHIJCeOzKrxxisoUb9NQkPgpEf2MU8Z5Wmb2BKHUhp1
         0sHhCr0SELQ4i2TlMnVRjEEZHPNnd6gHtfU0sn51ab0T4xbOtLmQ35gnLoQzKPhU3O3D
         124A==
X-Gm-Message-State: AOJu0Yzr9ERGzWO1Qcl182E6vIceTDb7lr2mypsGsF4duXs5OwkV7d2Z
	LuK39+EtYw8RZltU4HNQ+MqJEq/J6LoEvjetL0xM4XJhiRPOiiRMzHEX9qzxUG0LgyV0gMVdDJ/
	U39lE
X-Gm-Gg: Acq92OE8+n0GUz2YpJ+khUcpecg3KTSFS0hJ6yiXHiZOdtnqG4t5A5w21zcIp7zU06F
	Si4prAAA1YynK+1GphIjQrIWOQ0pFncv/H8kfyN8sxCyxR1fNC05dMb5obzBG6pUq1+e5yaVCsU
	zYE6hCXyec5tNUeBAvMpkbd8pRj0w5a96+0jw8kyhfFkVRIfu5LpqXMOx/BrpYy9bAkOvxzxFlD
	nhi5HymD49r0ipWSaKWQRkniGX1zdbQrXGfiqzAGKdkyxcYJUwkQFPYJcsqV6J9OsegUPFOo8k9
	8HjpEDFtZwZEyK6Iu+iUEFC4aRve5OHN4JIWdQolaZ/4MSDjL3ZciCkSKkMzKaJQk2cMPA5i4qv
	RSJEd2BjKp/7Dj8BO87wUxVnK/ydr+uu2hpwuXdqvxTpzFzNvXHm+iTqyLWvc995dtvDNdTnbN6
	i8eNry62QL079xwD/0aBQf8cIeNfaSNqzsbYmOpDKgg1J77zVUgidJ+wBw7gHD/sY/1tgKXJD2N
	XOq+cqrGYOHsqt6dA==
X-Received: by 2002:a05:600c:4595:b0:490:c2a2:e91d with SMTP id 5b1f17b1804b1-4923413c2dcmr28587385e9.35.1781682335733;
        Wed, 17 Jun 2026 00:45:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/30] setuptools3_legacy: ensure ${B} is clean
Date: Wed, 17 Jun 2026 09:44:50 +0200
Message-ID: <9a32956dd5dcbcc380780bc25e4303280f2ca9f9.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238997

From: Ross Burton <ross.burton@arm.com>

We do builds in a separate directory in this class, so add it to cleandirs
to ensure that it is empty.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2575adeceedae72f6359c0a35ec5c5325a4ec363)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/setuptools3_legacy.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classes-recipe/setuptools3_legacy.bbclass
index 264b1f5cfb1..45f567391db 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -17,6 +17,7 @@
 inherit setuptools3-base
 
 B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
 
 SETUPTOOLS_BUILD_ARGS ?= ""
 SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \

