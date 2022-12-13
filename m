Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EFFC4167B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.70919.1670929888813782307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RJVirscC;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i7so595732wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVT61aE2KHMwNeCNVMywMWgQEvLaT3/sNnfD2bMJH8U=;
        b=RJVirscCbF7ySdC3B95LTcZVbGp6xmz+aWr22Cux/zFenrbD0vQTekyeLhn0XmFSum
         89DhazvELs8dlbhJ+CRp4WAtSaxedbQPuNzM2vwk641akIRKMXgUM1a9H4TPNOq8FUq7
         iC0bClJJb6xdRk8q3tVqlatvygjhZ6ir0CqhQ8QuC2rnsRKTA4WC22iFpbBmddP0ph9p
         WS+FTYTEXMzZrhyBhEjvSH/r/P00RXIHdXcioCSosmGR9JWZdTU50UCIqDta3osOYaNl
         /thOsMhiS0D+a4oekwj+PqaGicpfDHGdxq/2ZSfzoM5OsllqyqFJFvU8w34gtaHXU2S0
         hang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVT61aE2KHMwNeCNVMywMWgQEvLaT3/sNnfD2bMJH8U=;
        b=48NbK3WjzZw/N6NE4Ki+lTe0enwP5KYVeVd2rKmCkuk4lCtI1zwRvBqI6OwHcAIxnV
         soL/UDETCpVPiJghXgbCH8D2EZHje6C+A+XYy2ZdjejHSBxYnVOQdvV73IU+GlnPuLp+
         akC1XQ2oBKGqWhsUZ/SoxQmPbk8kPUvoTuUeqAAauT9JtN28xSke7ugeKMV0YeUh2ZO1
         W52rv8aifbF541m9jgvgp/LBoa1B79kB9QUryP7M8xUj8KiBiwomT2Uhsf4Jfa5u8NkT
         Be+WwBEU1UDVb/6g9apgR0lD8vIpmAjaC8rfSqKiqIKBzJhlh2do8kpq5M4GwRuYqywG
         SEyQ==
X-Gm-Message-State: ANoB5pksQpu6H7U/mgjsETiYpIO2JULh52Ay3RjmbCPQcabTeBxY/WY5
	WVNbDAsC9Zobmf0JkRcfUajTbvdYIAk=
X-Google-Smtp-Source: AA0mqf4jNj9mJL+Z3gG12DhmpJNW9pRdIh2FWMDNMU75YRQ+7+mWxMpaw9q5i4qBXuATNd0X0uh3qA==
X-Received: by 2002:a5d:46c1:0:b0:254:1039:a2b5 with SMTP id g1-20020a5d46c1000000b002541039a2b5mr519604wrs.54.1670929895091;
        Tue, 13 Dec 2022 03:11:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/24] libxcrypt: update PV to match SRCREV
Date: Tue, 13 Dec 2022 12:11:10 +0100
Message-Id: <20221213111118.149697-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174526

When SRCREV was updated, only libxcrypt-compat was renamed to match,
but not libxcrypt proper.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
-- 
2.30.2


