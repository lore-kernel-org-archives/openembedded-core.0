Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40984C4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:41 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14786.1783866575021696345
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=AnkPfnoF;
 spf=pass (domain: underview.tech, ip: 209.85.128.174, mailfrom: vince@underview.tech)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80814edb536so31735067b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866574; x=1784471374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aij4URGMB/UyTElt/p02TPGcULtzqCdNoov+1e2UU0w=;
        b=AnkPfnoFAN1Pqr+QYRhx44XE+NTNweBX6qe/70iej/ytFrCQKCp3uhLIh9v5cPH1Rq
         R93AW64UIlUb685oTYGJH61XxlNmm8Gs1232DAVnfd6Q7GHHgVeT4Xf546o3j9GTRXhd
         dJ/vJjGzLBPP9io1gY1idhBR8CKEGKjb8gb+AuTUGQckptdgm5DW+xkjDtWzaDe0vAln
         VurE1YlFOVTer5sL/Y/oEaK9d67IlAxHHwKwsBSnF0TZI8WueN/yjl0w2bg4awyWSNtY
         uryBGv0QFiClflPtScSU6jQ+Q8Ic7Dn254msO/+7zNEtinhWQUaV0DvqQGlJ1kjXz6r4
         xynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866574; x=1784471374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aij4URGMB/UyTElt/p02TPGcULtzqCdNoov+1e2UU0w=;
        b=Y5OBDedx7QBPnz3QWY5/n6pGWXqKH4ABCiZXx9kiTHg27wrJegI+7s7ZfH/FSrIRME
         zYDvF/SPGRaMqTNKCWXkSIjYLR2Ztewp32rShn6ity/qfOrkpXFYJ5rjoPog+ojybKss
         X1ysK1Vz1RdLJerU+plRuoYy80NGi5oHkZ6HQyjMdq2hrWpn1APPY69twM+xH6J0HTUy
         i+LfydR68MmuqctwLwKd8fpDQmKg4ZG8d5fad7UHYGx+YY1TUC7EMnuL3VeK7ksVB9KW
         QZtEvSJc+nyx3uXb1XmQ+eEXgNTUuFu3nl0LqijdYz8kLWaLBfUvgq1moYlXCTCMjOFN
         YvBw==
X-Gm-Message-State: AOJu0YzknBnDO8DW65MrjhxlJTyxieaSfOeAyXRX2krs97dBpccHOIk5
	o46z9r9JJvl06URHeTq9/SdytOu0lqUyHzKIpVayROcFoWBco5DX0lxyl5QWV1q7xcq3umZt9oV
	7ms3HP38=
X-Gm-Gg: AfdE7cnruePAKb7DZocLE29dTfRj0Q0lXw/j9uZF+0KfLfh5vJ6doLUb3mf5ArgxwmW
	uSeVcSy7RCkAWEVVhqns3rS9N9QJXbr6ABptSDj4pUfSF+m36K7h1g1RUHEvEKvUx5QkKhC7hTA
	TUeq2QFF1wh/8iMr//ZAGvRMtl1q8eeVtJmWDcS7oK9bk6pglsZ+6r8d20XmPXtSk5M0nGuiSIt
	1eG3ENhnpfqpR4HHgl8LCQORoeOEzcZFB+KiElF2geEufISDUxfcnq0XILJHWs3hSG4hwdQ6Jai
	knq80/BDAiIbgfd71kdxeJfyqRnr/QQAi9QhSkjRFudC3C7wDebWXl5HtMYnWdVvsulSu4Jl5+B
	x/5at/oddlwFAzvM7PEoMkOo60oBXJJA2UfL3KZlBAmjg+YnqEGCt3G8S1qtLzU5vstWKKRAR2W
	I7PAHC9iCqMpAx9g==
X-Received: by 2002:a05:690c:e152:20b0:81d:cda3:2e61 with SMTP id 00721157ae682-81e901671fbmr31446027b3.53.1783866574078;
        Sun, 12 Jul 2026 07:29:34 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:33 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 11/24] watchdog: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:03 -0400
Message-ID: <20260712142916.2573370-11-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240777

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index c166ace665..8ce0c2fc5a 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -65,8 +65,8 @@ FILES:${PN}-keepalive = " \
 "
 
 RDEPENDS:${PN} += "${PN}-config"
-RRECOMMENDS:${PN} += "kernel-module-softdog"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-softdog"
 
 RDEPENDS:${PN}-keepalive += "${PN}-config"
 RCONFLICTS:${PN}-keepalive += "${PN}"
-RRECOMMENDS:${PN}-keepalive += "kernel-module-softdog"
+RRECOMMENDS:${PN}-keepalive += "${KERNEL_PACKAGE_NAME}-module-softdog"
-- 
2.43.0


