Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.108274.1597919098265233825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZOYhyZCo;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id d6so1870754ejr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QDWhmitIdiKjk0dU7VtG2B3w9fcAcNUC/vlJLLAav74=;
        b=ZOYhyZCoOdvqfAlF9UQIrP57VWBRDOtKeKQWdFEhsclewGpjSNVK2oL6DZ5Uy6GAkE
         xx+iu3d98x5AO9eLy8JeE3KlWQYRUdNy6RmJWHp4WW/bHdD9SxsPaWGzyUDRf2fOStQq
         yyHYwvMLrUV4ubsQXlchMRSaZLhkluNEsNp9urkE1A31HeraC6DQ2Gi5oXRp6tg4HS2U
         QmR+7GjMP9IKER1vDGXH1aGubpGRYktYj5XIGSybqyvet37bmVNpkFnBVAxK7ST8FqIh
         gYhB5Vaac50wL7igAGMgZHd8j7VQy0hvqtt3maFhQXao7zNkYgSeLJGjSzEHvusQb9jq
         BYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QDWhmitIdiKjk0dU7VtG2B3w9fcAcNUC/vlJLLAav74=;
        b=ML6yyRjRQcVyZx/zoPcycE5qisa0XRkqSBLCJ6pPU78Khd020dtWKRBHjxlbJNdzqm
         IGGG8/g+Dr7pm6RvcDtfN2Ug7Ej43v5QGmubIqJiLzes0oEZFUN8D8VGrqIu1OAMD987
         pcRMcyQlNrmPCWRhf6ChRKLgb1HADSfKszizRlyp5HpfLc1X6uD46RpUqMiwNzVFNdPJ
         2Vpg+apyUtVxrbmol8hWTz7baOV0rDgCwupusItN168yNlX8PhTOoQFAmVYoXpOi92iv
         Tbx8/qZy3ANJZ6kKMp0lVXuv+oj2ll4uEleJlwq7NCKP+B1pPkmQoHZEa3k0pXXVllcd
         VyyA==
X-Gm-Message-State: AOAM532pRXAiKV2ypfsQepTUUPWpVSpPWepCNgIzCy9CgSATkt66G0f1
	NGdOz9QcIdAtq/Q87K28hXBHJZ+siDUfrIrl
X-Google-Smtp-Source: ABdhPJxhKrhJvAJKhtv1thXTMxzkjrX+5n9WK5gH5V0nl0gm44++5eeUD74aMjfx7aJjiQXmf5OKog==
X-Received: by 2002:a17:906:180b:: with SMTP id v11mr2645594eje.427.1597919096222;
        Thu, 20 Aug 2020 03:24:56 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:24:55 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 4/7] openssh: Drop StandardError=syslog from systemd unit
Date: Thu, 20 Aug 2020 10:20:38 +0000
Message-Id: <20200820102041.28077-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820102041.28077-1-alex.kiernan@gmail.com>
References: <20200820102041.28077-1-alex.kiernan@gmail.com>

With systemd v246 the syslog target now generates a warning (and has
been deprecated for some time). Drop the target and allow the default to
take effect.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-connectivity/openssh/openssh/sshd@.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
index 422450c7a190..9d9965e6245f 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
@@ -7,5 +7,4 @@ Environment="SSHD_OPTS="
 EnvironmentFile=-/etc/default/ssh
 ExecStart=-@SBINDIR@/sshd -i $SSHD_OPTS
 StandardInput=socket
-StandardError=syslog
 KillMode=process
-- 
2.17.1

