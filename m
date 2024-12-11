Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5B7E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 13:46:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11279.1733924804765997986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 05:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BAIg9K9E;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434fef8203fso18543835e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 05:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733924803; x=1734529603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHkrQJD0jQ/dsYE9WYjB0XLYiMe0s9tRp0EVoPoACcc=;
        b=BAIg9K9EDIOt5mkv8QSLWBkJO9o7YVZAoIDgqosjP3w6uHRQ9LID7J3AynZVJyC1r9
         2gZh1qCMN/B54r9rJ1/+ZtPoARizwE8t0RV6GidfrzHF9y7s1uIbSgNbhgviKG5K0OpH
         JuOKcaz+6jW4Xzf9JbwAPhYdEl5NEeBCj2ArFekB+yuYCOBwEGRtWlqXteCNpjfyuI3s
         mhqIcJ++VZlbxARmZLhGtsqpqR9cEXXFbejaYPkRFd5h28pNQIw0leMZc6cKGwtdbJTo
         jHC6MThLmNALefUzdjVw3prwtltZ/plTi4F55CnNhrogySUgqnLPaZy/XaYSYfc4+Tfj
         YkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733924803; x=1734529603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHkrQJD0jQ/dsYE9WYjB0XLYiMe0s9tRp0EVoPoACcc=;
        b=Xuv9XQD4DK8ZBnlz4CMR5eooRnLZa/AtkIR70pznj2dAicsMzdGJk82xkuXeSTBTgE
         zSPdEap/oG++xMimeq+nSEJdLiVOd6bnkw7WFHsIJvKLT6sigRjFczaSufDr4S40JoXP
         xS5Sxe75MPFvxfdkcYbKf/kX+Q8TCjCWXHrY5ESrRi0evo6C+MkxRtyKktKPnBSFFPBc
         5jiHfj6LYOmEd2ET8eSXJrjGuzVGLjdQBqQxHTyfdr1Zxw+Ng6fjOwvmSDFyoa/wsCkZ
         hEb2DWNYWAvfzpR6piiUKDSj9xQ/VsfYtSqq7ZRdmKEltaqy9pG7hFzqnFbkUXdOrdAL
         BVUQ==
X-Gm-Message-State: AOJu0YwJFbO5C/9DsFyLAwuFNs4pfjIbceAutAb1WzMxl0buo04NUFaz
	XxWMIQtY9jzHzoFbUwE/2PHK4JQ9LpFbpSzMe9ZsScXkPdmkMq6O6yQ3AA==
X-Gm-Gg: ASbGncvYj4nW1tAHrJNK99mG2czvR3zLDbO3ZQF20Uqj7xNfmjf5PZo5yj9zk6JgkaL
	XTHxxfD2idoRmGMqt0MgFfj/OTqR8YfdBNrGnbDo5euuMijbQVc96GBni8HWJ/4VMCyFpCDoIg/
	YChzJE7ZYNGkVhXGimlDsTs81mOJZMVKns6Z5r/FkyrG58+e/enxxIGW90fg2TzM3PWp5QHe5Tb
	dGFW+zwPbB/So9a0s9iF4AWjoTI2xDW27nGqs8gEeuJRSovpik9gZhqCy8Qv+yqrldswG3wVOkP
	TfLXe23nwN2CGsc=
X-Google-Smtp-Source: AGHT+IHx/4Di3QSWCt5ocbsYRBBSyKAzC7nMRL1fPRDxlOv2HGH5YFrx40jxxxtxhIcutv4BKNOP5g==
X-Received: by 2002:a5d:6486:0:b0:386:33e8:20f4 with SMTP id ffacd0b85a97d-3864cea578cmr2554369f8f.59.1733924802962;
        Wed, 11 Dec 2024 05:46:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f533sm1354045f8f.3.2024.12.11.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:46:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] bitbake.conf: add an addfragments directive for oe-core and dependent layers
Date: Wed, 11 Dec 2024 14:46:29 +0100
Message-Id: <20241211134630.2685983-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211134630.2685983-1-alex.kanavin@gmail.com>
References: <20241211134630.2685983-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208580

From: Alexander Kanavin <alex@linutronix.de>

Please see the patch to bitbake for syntax and implementation details.

The path prefix to fragments is in its own variable so it doesn't have
to be hardcoded into tools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d2c2e0022b..0ed0766cd2f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -837,6 +837,9 @@ include conf/documentation.conf
 include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
+OE_FRAGMENTS_PREFIX ?= "conf/fragments"
+OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
+addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
2.39.5


