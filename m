Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87D4EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 14:05:27 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.12253.1687442720715447322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GxkHFpUS;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so513460a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687442719; x=1690034719;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSTgHBUYdkiOUXLyI3WcFYTpL735qPksG1Jq8omA7Mo=;
        b=GxkHFpUSWRS/omFrtyl9K22c0igddcBtqZArotebRx0lzjc05AvhlQuZiZoh/eyCnA
         FMZ//l9h7gukPclLwfIVndCui5+uglcS/Kgn7qfu3Zt+olhie66pNbG7IRSAx4qHNp0Z
         s+y6vBZ6fdtwA7jMtU7HouJBkFEQbF8hMH2+pp1CbI40oXbyfa0BlT0m8fCK4e44e2wI
         yjgb1TRruc3k4EgbrnDLZkRNC5hekzXyum7cFs2QPHVvu75vQolue0w3VsKPuZhcDJh+
         udsPMlhr/A7NZJy38Eizw8QlfSwfd2S/Dpylkb5H6w2c92M/P3cqhTnl0jnFWZqP7puu
         HVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442719; x=1690034719;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSTgHBUYdkiOUXLyI3WcFYTpL735qPksG1Jq8omA7Mo=;
        b=FDnc/1Tl8hZcWN4AODVmg7gBf4vCutijJ8JhDNXSfev0uWS+oG6OOvCC9Q1ePoxj1g
         lZDgUDzOoL3jekXljqKgv8wGu1y8XSkMD75GYFghz7Defm+iY8GS4R7MFV8KGW2Wiwnt
         bZV+9qkkE63yJ/rWAdI2woAjj1NR1PCeDaxGoY3+l+ayjnaePfopc+fx00RD28ISoRM0
         Sj4JUDrhmSdlrlPWqEjoJVCyivfmXqVwXxYnLevTwLuEzWyhiutQ820sXebqaDRNWcZS
         ip+dmXmTC66CfJhZeL311Z6B5WmHiUQYrPIrOSP+dSOU/Uk1ps0Xqmw6jooJiKDftC32
         kGcQ==
X-Gm-Message-State: AC+VfDwLEZIEgpb3uNmEtLGulC+7UpcLSNq90BeWIjkaV9JXc9mXJ7up
	6V6UCup53GXB4hSc1Q7Lmy7rSrNlZok=
X-Google-Smtp-Source: ACHHUZ6oZDwYWzcg5aK9mKAawBUpOs6ZNpDL8tgylyG5nJhQC+PRg1sRQ3oXFeExXpr5xXgU/Ca5EA==
X-Received: by 2002:a05:6402:164e:b0:51a:40ca:d082 with SMTP id s14-20020a056402164e00b0051a40cad082mr11079752edx.14.1687442718579;
        Thu, 22 Jun 2023 07:05:18 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id b17-20020aa7d491000000b0051499320435sm4005575edr.14.2023.06.22.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:05:18 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] logrotate: Do not create logrotate.status file
Date: Thu, 22 Jun 2023 16:04:52 +0200
Message-ID: <20230622140452.593-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.41.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 14:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183245

From: Jermain Horsman <jermain.horsman@nedap.com>

The first time logrotate runs it reports an error:

  error: state file /var/lib/logrotate.status is
  world-readable and thus can be locked from other
  unprivileged users. Skipping lock acquisition...

This check was added with
https://github.com/logrotate/logrotate/commit/1f76a381e2caa0603ae3dbc51ed0f1aa0d6658b9

This error is only reported once as logrotate removes
the world-readable permissions if this happens.
Since logrotate creates this file if it does not exist,
there should be no need to install it in the first place.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-extended/logrotate/logrotate_3.21.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
index 87c0d9ae60f..f0755e3ae5d 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.21.0.bb
@@ -66,7 +66,6 @@ do_install(){
     install -p -m 644 ${S}/examples/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
     install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
-    touch ${D}${localstatedir}/lib/logrotate.status
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-- 
2.41.0.windows.1


