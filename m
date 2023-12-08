Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83119C46CC5
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:15:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.17062.1702030530654850610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVHkLO6D;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c09f4814eso25545355e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030529; x=1702635329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwMmJq+BWUg+eqoxdQ+B4BP01uLc9pERMwKRbjyZ0QI=;
        b=XVHkLO6DR4alTeTQKrrpdqXISRwr//b3AlZpYNgr6N6Jgo1HNyZFgHDdGqMdKR9dcM
         L0Bn/FheXKtcsgTuqhS6vw2NafEII8CQ6W/pldmkBNj5CUQkoKuLfy4HdgmhUMZcx9sc
         zilnbsG2Jcy49vX4YtjPXVGmJdW/5DYPcfIB1CXAjajEVoU/di6VlbHqM4HxR00KQ8gQ
         KDy6nMbJJ9BoRuEWig6kfiM5J0baeJe+9xaHdYGNkTZas+q26X29QbcaY7dWdk6tcZXY
         /vwQKIqcVm4uKDw0UM25DAgCln8QEeFUXlC7lQioSItre2b4LT1RGXoY4V8Qh1tDsJXN
         pgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030529; x=1702635329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwMmJq+BWUg+eqoxdQ+B4BP01uLc9pERMwKRbjyZ0QI=;
        b=istazMXZbj9MlMCWJ3QVsmkxghGd8LPCTLpV81/6zIaBhCZUUWuiSCw7OhLQMIIfLo
         ODsa3HiIdd92ytYVf6G5KQzANFA5/FslMtPuR9j2YniOpTwpmvYiNUD9F4dOYZWDZUt+
         lOwc4+dFzpuh6Zuu9b68gTDUuZ/IfqrjUbLU2DQmuhgMa2rdYEAO5tM43CTEj9lRAjKi
         lBV2viWNTnjTAhrrjEMTHAkr67BaywpT4kPq11RdWT1tg9Vjx3jXaeNHD0uHrcSjqeF/
         2JpUApPEFi/wAlMrVYKyBMm7mQpciq55WGUVEyb39enZc9ek1zFSnt830SOLnmLWSceD
         I0Pg==
X-Gm-Message-State: AOJu0YxzCYPXxObBIhWsdi8NR3pIA1aDn5lxSSfxe5Tg6fi2DjjK6Cp3
	OugohF5G8VQw8fDo9Qfd5o5LGD0NdLI=
X-Google-Smtp-Source: AGHT+IER9/UbFvlRL5I01ntDP9TdVE6zq5X+TuRvo5T53F/NH6CRrFGpdvU5dhsZMa8U412QfkFgxg==
X-Received: by 2002:a05:600c:2946:b0:40c:2572:2017 with SMTP id n6-20020a05600c294600b0040c25722017mr1961749wmd.159.1702030528827;
        Fri, 08 Dec 2023 02:15:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm2746707wmq.43.2023.12.08.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:15:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] gnu-config: add a do_compile task
Date: Fri,  8 Dec 2023 11:15:20 +0100
Message-Id: <20231208101522.198832-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208101522.198832-1-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192031

noexec flag has an unfortunate side effect of not writing out the .siginfo
file into sstate (because that is done in sstate bbclass
from a task-completed event handler).

In the absence of the siginfo file, diffsigs code is unable to trace back
the change in task signatures if the change is really basic and
affects tasks coming ahead of gnu-config-native:do_compile.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 718f798a00e..c72de159ce2 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -19,7 +19,8 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 CLEANBROKEN = "1"
 
-do_compile[noexec] = "1"
+do_compile () {
+}
 
 do_install () {
 	install -d ${D}${datadir}/gnu-config \
-- 
2.39.2


