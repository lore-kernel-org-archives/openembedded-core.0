Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F04EC02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:17:38 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.117400.1738678650713321174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 06:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o9PbkhMm;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso6512669e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738678649; x=1739283449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=o9PbkhMmLShVMCGbTBdo97s6do21C8V4D1JT38cj5yAMvlTIJtZ4V6MTdPBV2YcEKM
         wgEw8bWy5R3eDH/9dIcmbAtgJMjybKgc7yVl71b/JO5Q9a/LyLzhvZmdvLRa6ZlwLX//
         JwlVCoHsCFqyu8FZSWMwJorZDE383cU+GVZzYPgPoYjKv+0mdGoJZaKNLkWyivgbz9h6
         0k5VPsHse1bRwYgXykrjjmACj7IZP5wa0u20IWg8S6jjwKkRZqVrRmYW0xRS4S9Qh5RC
         TNtdjgBJtAwlfzZJyqn27swpWrK6YwCJ5+N+suCOEukFc4p8S7tPhjs+rgEiAIjQJYAo
         n3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678649; x=1739283449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=WDZg/OB5DYTbBXubDXHJzPyGxIjQdaRG1LKiPtDLvgVoMHibXcjQ6eqB2YdsJKdc7V
         gIZ8dQR4pci1VT4RgmaqxZgk4eq4qv0eAEGdiAxNhe5mWTUM/m7CgAQ3osefQEd0u2vS
         entJHKCktgPD8ANQmLMj7oFSYsIEOjSTCp00fgRK8J4+0v7igcb4mJwo6Z1j0L8nas/r
         BoNHFQi7hFFQBAO9Q7QGGfWqTH/V+Y1Rpm/Xns18/VvrdULjlO6nwpNhRQYB7oNeGnXd
         f2UjEAxQhb/+vNb1Hrk+puVqMlaOclmQJKDz14FaL89MjKIfHiYb/Hnd/bfkbjr42MeJ
         Cfog==
X-Gm-Message-State: AOJu0YyL2lnxNcOWwaZYKiFz1dqSL1lixFIix6esyU5z/BkkN/lDajBf
	3cNgIRXizEn0fRl3PiQHFZd3TRPSQnTWrGv+HSqsWF6b2KE2J/i0EnOaq2mX5pG1dhvTmmR/RyW
	oSMI=
X-Gm-Gg: ASbGnct8P7VEyOfZYeVUCvGFzMwvgyNgIL90aMoPR0XJVEF+rYzgO9ZkY2rmEUiMw4e
	1jEJDs4lBuL+6jgmg4k7xuv6KHhv070m6IhN6ZrRo7Fd/a6b5lCgKyZD5xXlxvmOPQ1A1Zhxdnk
	6UjpoOUY2i7wfJCeL8bIht7FNlec4Gl0Lc/R5tTbG99FKamX4VreLlkGCDvLNtqhxTj9uZ+mmBT
	p+/m1wCvZKZsuaegW5xlxIeNr1YmL4scySsYmcFaeegAGGTQeC4THJ0uKM3JkT6DU1Adc7mX2eB
	qNgOHEW0/L5ToR9VzyVVjCRfyCU+6DZK1KjHRrNptDs4bcmEUsy3bfzDCP4M
X-Google-Smtp-Source: AGHT+IEPDxF5qphUlMSTeDaeiVoMhG61EztfrvQ++elhW/BqX9awCCeeN4H3BBUSg9MYm6a7Flm3Ig==
X-Received: by 2002:ac2:547b:0:b0:540:1a0c:9ba6 with SMTP id 2adb3069b0e04-543e4c32b45mr7754454e87.34.1738678648812;
        Tue, 04 Feb 2025 06:17:28 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeda2sm1603211e87.247.2025.02.04.06.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:17:27 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 2/3] uki.bbclass: capture ukify command stdout and stderr
Date: Tue,  4 Feb 2025 16:17:03 +0200
Message-ID: <20250204141705.1222153-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
References: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210806

ukify tool can show important warnings and even errors
if it fails so capture the logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 92f690526d..ccda042ab4 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -190,6 +190,7 @@ python do_uki() {
 
     # Run the ukify command
     bb.debug(2, "uki: running command: %s" % (ukify_cmd))
-    bb.process.run(ukify_cmd, shell=True)
+    out, err = bb.process.run(ukify_cmd, shell=True)
+    bb.debug(2, "%s\n%s" % (out, err))
 }
 addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.43.0


