Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17854FA374B
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.2198.1666901785877338429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MrhSbNXp;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id v27so4803060eda.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2FHqbm0QJgpmfAn1fom+Xz9vSCubwNulR49cEaPDX0=;
        b=MrhSbNXpkJm3yyMfzv0PziXlxboS1SpLKWf5cHb/zJEstu3GMpD44PMG5QNTr8Q+V2
         Z2p/z32US3fxRn75O+tajTX5FEizcJ7uvRMMctsIWJaTwfhSWn4LeSwOgsrB6+1IAb2/
         yhrDhbKqVxAjMsaiPF7Skdv90yHNK4RJSBFFatRH2HWuasNsx2g8W1q/JB7hmwmeyF5r
         J2VMCj4yVAXZczUa6Tjk8qmbjVvqtBIEDHrwKq0WVNsiuFriXHK5R+tFzIp2U7hoZOza
         WI43hUtG2DtIrrreZngnD2hD167ZMvp6SBem4QSuQomS4CZ5e3h0cr1ZpoC98yJ/9W1H
         WmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2FHqbm0QJgpmfAn1fom+Xz9vSCubwNulR49cEaPDX0=;
        b=WWxlus5OXphHpiNM0TQrGJs9voWykA5PesvTo35uPzM86MnsNjSjgmJJ1GbuXNEbe7
         PXF+F0n+fU6RYFwKSLL2ljUJQU6q87njKNtqa7Rq6zWdT6rs7iwUc7EGO1N8lMSDNZ+z
         BQwiQC4sT/rPM1ELG8vx47b0QNQe9jgHnX11Jlqd3hgwH0OpkUObPYKW7dDfWSG2Wu21
         K2w9rZse3GnI7vl1+gCBIYQFvaml0yF17B+EIqWjKB2SbUdcqEZS417iU/vFm6MQO5wC
         y/uK71ElF0pJOysIkX0pQq8j5MFAoGSi1UHUyOpQg1IGL4Px33HQTfakqDxtnREjojMJ
         u3ww==
X-Gm-Message-State: ACrzQf1E0p7vSD1jaRrQ7xnaN9JpriVBkN/PvXBh8oz2dsO0G/2hH6Hu
	6VtYnhJTmQmxgIBWwH9RaH0SYlRF38vvHg==
X-Google-Smtp-Source: AMsMyM7GZXPv4Ue/9N/4JZP2YhLI14MI/N2IKFWoanpTPtKrPkAgN47FgJCKioPnDkUER59CCH8xXw==
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id eb11-20020a0564020d0b00b00458a2444e99mr47505290edb.46.1666901791403;
        Thu, 27 Oct 2022 13:16:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/23] ovmf: upgrade edk2-stable202205 -> edk2-stable202208
Date: Thu, 27 Oct 2022 22:16:00 +0200
Message-Id: <20221027201611.3644334-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172214

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 40542239e2..d1bf8b080d 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0006-reproducible.patch \
            "
 
-PV = "edk2-stable202205"
-SRCREV = "16779ede2d366bfc6b702e817356ccf43425bcc8"
+PV = "edk2-stable202208"
+SRCREV = "ba0e0e4c6a174b71b18ccd6e47319cc45878893c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.30.2


