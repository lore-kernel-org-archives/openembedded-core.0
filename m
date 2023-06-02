Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAE5C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 07:08:50 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.6859.1685689727019965187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 00:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bvJVC4gj;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso2432034a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685689725; x=1688281725;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tuiUlcLxufx77OTsgXToCQsvdeBKisigBhnhaoOdZsc=;
        b=bvJVC4gj4ot5tOm1DiFwQmZI+rxXj5suYIJDXxYpyvazTAvbqT+M3CtptLnmupP3i7
         GM3gnAyQsGp3hrdH9t6ptHMnMipcQ9Fdv1HYfjERsxftf4LgsqWDY1zp8GSaz1vnHECg
         rNqKUrVMTY7vTT9C+XIXY1lew07nslvRoSX0xAvBCVpRFC3BxPr+b6tX/N0YdWwg0LTc
         dKibMYc7vgkM+/Ku8eTCQBOIWUIt8V8J1Ekr62ccwL8K7n0kr8quH6GWvXNof21+wOxA
         R9LWIhZ+Omalwjy80GbAj2U11r4iXDhoK/r0mSZHyD+W25NciSqSrHCEOtQcz640bzy7
         4N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689725; x=1688281725;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuiUlcLxufx77OTsgXToCQsvdeBKisigBhnhaoOdZsc=;
        b=ArKUg5POE02of0MUxUFAgMIZQs6Ip4n77BDDKEyY75xnFlg1KlrUD/3XEo4/cSoUKT
         Zr8uB5G4KPHyrfxrAtzXJZOyBOjaXWuu7XTi5jOM9OOyVAmKCWzwc8vyV/zT835LnwZD
         sl3Ijrr/dSCAzwQ0PGwpUNe08nZsaHGaJCh9n+g3sZtEzwqSGpotbbaOg/lN4GTf67zS
         n5xA6QRdzQs6rZz87s/sCl8CAJUq7zq3vgiiUH3+Z1PUv3Z2Nu+OMFTj1T9XSqGWZJgu
         NBlNufwdmj0Yy+iD8K0/d7vmyVpVUusLAFu56GcSVeIxWbZGZVVdPsVGi20LA0UilQE5
         sUxQ==
X-Gm-Message-State: AC+VfDwuyUGSqOVqRM24WkauCUUOQbe+kgIEJ7yaLIyUcbBTOMVSKI8m
	0PMSrSdNVqGkoV9TjRna1adfvo4njjc=
X-Google-Smtp-Source: ACHHUZ6RJX6GvuwRp6t2heK6p+/pb8h6FR/IUoGonuCiEw0BokBWe2Trt/Om7uqgdTOjNrmwJILpgQ==
X-Received: by 2002:a17:907:7f23:b0:969:9fd0:7ce7 with SMTP id qf35-20020a1709077f2300b009699fd07ce7mr11658982ejc.11.1685689725317;
        Fri, 02 Jun 2023 00:08:45 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709061c9200b0096f920858afsm393184ejh.102.2023.06.02.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:08:44 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [dunfell][PATCH] openssh: Move sshdgenkeys.service to sshd.socket
Date: Fri,  2 Jun 2023 09:07:56 +0200
Message-Id: <20230602070756.1999-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182144

From: Alex Kiernan <alex.kiernan@gmail.com>

sshd.socket launches the templated sshd@.service, so by moving the
sshdgenkeys.service to sshd.socket, key generation can start in advance
of a connection.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af38a39b4bed9e43c5075008be47ca72191a489e)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd.socket   | 1 +
 meta/recipes-connectivity/openssh/openssh/sshd@.service | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/meta/recipes-connectivity/openssh/openssh/sshd.socket
index 12c39b26b5..8d76d62309 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
@@ -1,5 +1,6 @@
 [Unit]
 Conflicts=sshd.service
+Wants=sshdgenkeys.service
 
 [Socket]
 ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
index 9d83dfb2bb..422450c7a1 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
@@ -1,13 +1,11 @@
 [Unit]
 Description=OpenSSH Per-Connection Daemon
-Wants=sshdgenkeys.service
 After=sshdgenkeys.service
 
 [Service]
 Environment="SSHD_OPTS="
 EnvironmentFile=-/etc/default/ssh
 ExecStart=-@SBINDIR@/sshd -i $SSHD_OPTS
-ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 StandardInput=socket
 StandardError=syslog
 KillMode=process
-- 
2.39.2.windows.1


