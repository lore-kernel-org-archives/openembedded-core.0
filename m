Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423B7D68BFA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 16:26:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.45629.1731947213424181830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 08:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lEZJYbNh;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3823194a879so1728102f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731947212; x=1732552012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUqU/XerDqnUC58iEEYUfF4kL+6bbBGHW+mHcqyHoT0=;
        b=lEZJYbNhbgVCSxU7sxJKL9LmpAWCs1sZxXerSw0tcYR7RY1IjtDPCc5NyyrEXKKxXD
         lpkuFeHQh77Gngj74N66eZ0P85gdCvpuwY+m6cC6xMhwnE58pOvl59aYwVfjLBRtxQK0
         UV5cZgmpNpbPX9dlFPygJiHco7eVqCsOhErK9R93LvnRGl8AdIo69VBl4B/BezfKNfkP
         vRyG3M7V14e9RTORnUxTtIoXqBU1cyq5uqsWMd9zhGKEOg9ZRXT7OJPpAkmDLqskMTuO
         tg1aqj3j8HkMuAzi7MDgL2lTNRfx7hOOHo3HdRZp6Srg9voZdeVuwg3NjJ/FNEZIYLKx
         1LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947212; x=1732552012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUqU/XerDqnUC58iEEYUfF4kL+6bbBGHW+mHcqyHoT0=;
        b=MLkaTXF1rSqB0PWFiHHiX1j2ZH4G3LjpGLFT4tdhRQM61Te1t4gwTUR5DACfQZ2dsU
         GgBC58AlMXdgw/T86Q6a1duZxeSZ1RTwThnZEkN4lb39VFlvYYgyY0VwZPcqKwQhJnEt
         BRdRuvJoqif/AnKp/FOLi59x6Z21j5ynti4vR/6XA265PfoJlPv8Rbf5U5JFWfrERV/d
         HOnPO/jSSjPVA0PGqt1T1wRXpdTsBYK1TRJH/tE9y6GvhMbX0Zl9ET5cLNvkCNDyBrmY
         80q5Be1TSxIPBD8cO5MicdScn5AL3GtMt9CEd0ptgt7VMurxZj98vFmI56zbb9N0EsXb
         lknQ==
X-Gm-Message-State: AOJu0YxVv8CrR2XMuiq/d/brmrGWQY4743Y+9pUcMDeu7jjukkFOKuKY
	aPKn8VKAoBYsHk/MqOklOkJDQFUWq645C6J2QUSW8/ZqCPnlipDf6wKh+g==
X-Google-Smtp-Source: AGHT+IHOv5U3T88NHFHylmd3U3RrwBwBF6PZjwYxUupqBSg0yw7HvWG3/APxF5nTBMvSBpxdSjoXZA==
X-Received: by 2002:a05:6000:470f:b0:381:f0e2:7d30 with SMTP id ffacd0b85a97d-38225a8aafcmr8147078f8f.42.1731947211704;
        Mon, 18 Nov 2024 08:26:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824770f3dasm3563048f8f.54.2024.11.18.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:26:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 2/3] bitbake.conf: add an addfragments directive for oe-core and dependent layers
Date: Mon, 18 Nov 2024 17:26:42 +0100
Message-Id: <20241118162643.1423409-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118162643.1423409-1-alex.kanavin@gmail.com>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 16:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207223

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


