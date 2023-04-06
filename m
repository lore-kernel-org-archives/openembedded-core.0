Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A320C77B72
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:56 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.162551.1680796968039447023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C1G5On7H;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id l184so14923560pgd.11
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796967; x=1683388967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJJPajX1qLA1bDQtINuXwSBhq4UmQEZnbwiSF5kOAlM=;
        b=C1G5On7HOAEPmdzZB7yZngKcnWvZZf+VvVi4MxLUL7xsXfvNWiHPw0EcNwSGVzSFKe
         yMR8WSwskbShdNKgD+icZ4vLhLYUmPJ4I6vk9t8TKW0z0LQ87k5MoVwXh/Pc9BOExYaq
         jikhbt88lvlLyfbtIrHruFDMJYkW6dbrqqkZ+3VEfJsQ778OfGQW5hUrLLTUdK+Uzw0Y
         W+iOTIkTGcKyY3HmBozU8OWHm3COmtArzgP+gYurYOB44DYHcnT/iLa908WQzY5NIV7q
         KBHowfbhFkkMiy51J6XLe/Bd7fueSSXKtW5aIv4pbaVqTdpaHvHVFd7vcT0/niloJgKz
         xkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796967; x=1683388967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJJPajX1qLA1bDQtINuXwSBhq4UmQEZnbwiSF5kOAlM=;
        b=0QPru7SLSuouMKjc8rrp9DK41aiqUkQZ5l4brQ6vHUB3JRXSCmDdIi2+fGpmVXPJ4y
         rhfOWyXKb/xD7Moe+wGrx8pTYjxUHsCDA1ZGvA7Rzt6aJfZVpz5Zw+cJbAnAeX7ExFug
         VUIwgp8JktGBIyRkLAkP3ubLgRrR0vs9uU7MXU2U2r1Y76F29fmXEuRLWS6AtmtD1dSl
         9WGbFdO1BrFnp9kWMMd+ty5d97jFFl6oWlG9WvArwMcPG5NTe7+skp1wZIwk8D9+Vleh
         pMZlmFzJPhZ+anfMSwI19lIQlIdVoxcodPkw6ZlWbeF1zkvf3Uz85PnmugQ5h4FcSbIu
         lDgg==
X-Gm-Message-State: AAQBX9c8FKlYWVBpHxwc2EC8iQXZYFJN69EexjWtEhT23uIBf7VYxsoU
	2tkEctu5vkFa8l/wvTBZrrwphhXgYgYuB9ZNNOI=
X-Google-Smtp-Source: AKy350Zmp1r9geyY0+SvYBIF+z3CVH5fF+pumkb/AwlzW1BsG+LyGi15XbopIhfHopfQk4uVQAThcg==
X-Received: by 2002:a62:790e:0:b0:627:f837:2f5b with SMTP id u14-20020a62790e000000b00627f8372f5bmr10393764pfc.11.1680796967053;
        Thu, 06 Apr 2023 09:02:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/26] oeqa/targetcontrol: fix misspelled RuntimeError
Date: Thu,  6 Apr 2023 06:01:42 -1000
Message-Id: <21c513fccbf743f9000c3b7b13fc4962c3ae5c7d.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179793

From: Enrico Jörns <ejo@pengutronix.de>

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92ffc35052768c753a89b4839c70db87072437a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1fdff82889..b8d4ea8a70 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -205,7 +205,7 @@ class QemuTarget(BaseTarget):
             self.server_ip = self.runner.server_ip
             self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
         else:
-            raise RuntimError("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
+            raise RuntimeError("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
     def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
-- 
2.34.1


