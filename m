Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D449C36001
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 00:00:10 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.502.1742601608777560756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 17:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAoHa8nV;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: joaohf@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so640409a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 17:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742601608; x=1743206408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mylC5bLLmgwmvTHOdFc84lhCFlcAKMGUoQ89owc8PxM=;
        b=lAoHa8nVfpy21UPilGSOUH+gabYqyambYm1lzRmN7ZbUyibt1FK4f10vIWXms4vdiG
         CRvhSYuHRss8t0hoW6Quwxa2NprooVh0BOp6DXZwV/e0t6S5slwvru9Jfs5sTBl8PM2f
         E3q5ca8qFPUa+2HPo48EURlup9NIvJiVQF6J+OF1Q6DJDNs8mrz+T8tT7OD5ugeGe5BF
         H+R91kqRq7yJA/xSPHHXIG9D7iGCXdzFjz7kYJMHbGKH36nFJGa7wu5mnn3a2jTKeDdX
         6Tbjm9xg0/XgV89Bu+MVOJeWzFygKcxx1a8tBtRlHaNl6K9NKRZUViNdBVyqbgXsZa12
         Rh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742601608; x=1743206408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mylC5bLLmgwmvTHOdFc84lhCFlcAKMGUoQ89owc8PxM=;
        b=LVPoy0XO+KtbAy7FdfZhI0I+aWOD0/KwD6zzdPZfgtarpkJMY2g1NfIxTgP+hH2mtf
         W84sW3r7rBCbVfDiLbrRYXtsPfAYJlEeism/mH2yJ+t77RQylkllafa7VxsUOjKFdfWF
         J5y+mXv+XeGVDTyo9TTHyMInQ4uhRRIdlV6e4eqobJX7a454fxAUqNGk9g/BUsxjDQ7T
         eppmUiBuOMRVfdKRrg+upxntp848p53gcAPS/jGGooTpjYisQCmhpgNJzHzudbUu/qgL
         njeN04dhG7xATeB+/d4xPmfjLii3qxLvQlLmRtv228lrlEtd8sUBWUsF5xwFcHFtpSnH
         BkRg==
X-Gm-Message-State: AOJu0Yxlsgfa8/4FJfPcQtM0C22uop21n37yEXCAMi576mtnDvMc7Z/A
	PZUz+KMIAYueADzuyaduyrMQ835RBetP3vieAWhaqlsYzllmO+dilLiXpg==
X-Gm-Gg: ASbGncu/R1E6TivA9iF8iQ3MK+5Hxm5ZD8+eHOV9iY9Vhjc9G3UVtXd2RdKKywWFR4X
	DRx2+sBkPgGIe25vluvcj+Fj363/RLNxEiaM2cJZm2MFLhezRk5wFRfJUMVdzjhM1Ml/8iye6CW
	Gh6e+ZWtNfW2K5FODAhlJvr2/CyTpVnt2Wuq4qU001oegOhLJBZSpRonocsRwzXMIhYsxvqSOLl
	jPUHWGmrm84WlcEoa58AiKzdQZBKqXEFrijDVnmqKDGJwCyU21jIMDEF469T3SCtha/TpCW3F+s
	YRjmvuft+kwr03EQXMAgsOb3Ez/FWCFX/O4=
X-Google-Smtp-Source: AGHT+IFdZBm405Lsnj9kVXxuvBIbqcKS9FiqpV8BnW5bx3O/lJzyAgD/nIZ7SYvitZ+mZueFlSfeQA==
X-Received: by 2002:a05:6a20:748a:b0:1ee:d6a7:e333 with SMTP id adf61e73a8af0-1fe43312e67mr3517988637.8.1742601607466;
        Fri, 21 Mar 2025 17:00:07 -0700 (PDT)
Received: from porco.. ([189.79.243.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803dd2sm2464644a12.19.2025.03.21.17.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:00:06 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [PATCH] neard: use WIRELESS_DAEMON
Date: Fri, 21 Mar 2025 20:59:55 -0300
Message-ID: <20250321235955.556242-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 00:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213488

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/recipes-connectivity/neard/neard_0.19.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
index 94df1ac3d6..b04187bcc5 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -40,9 +40,10 @@ do_install:append() {
 RDEPENDS:${PN} = "dbus"
 
 # Bluez & Wifi are not mandatory except for handover
+WIRELESS_DAEMON ??= "wpa-supplicant"
 RRECOMMENDS:${PN} = "\
                      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','${WIRELESS_DAEMON}', '', d)} \
                     "
 
 INITSCRIPT_NAME = "neard"

