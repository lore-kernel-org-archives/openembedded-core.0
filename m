Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538E1C83003
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:36 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.518.1686191793244939174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oT5WO5hK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-652d76be8c2so36014b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191792; x=1688783792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S55LwzPzUoT61rocTdi0PQvyMM0DlgT0pKrCtxDOzU8=;
        b=oT5WO5hKa/8qqUnAUOthqJfaQsAdf4uPmgvyt784If574EaNLPAlMC6S5BDmdWfnb8
         rB/i4Ae1i8xMWdkl099IsPVfEaAebw3qAbUjNvbGGj0NIj4c41IxJU2PBt9MdcxF8j/M
         NuIcbOXonKBEiTldl2GcC69FfOTNkCY1Z2910MDFv62y/zbLnnEPU1GlOSGhDWdylleJ
         s/44zlhQmxEPHiz+tN7DSDNdLcAU9QELJk7l2Ri+84tsbnsaWRMA5wV9yz88ldlNV19X
         ojd4YfDMIJnV195wmET9ws6dt5Fe0AffHNyNmeVO6gnrwNl5qkjr52PsI72rYNNZ1UJO
         laKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191792; x=1688783792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S55LwzPzUoT61rocTdi0PQvyMM0DlgT0pKrCtxDOzU8=;
        b=WOq0y5Hxtpd6glSNe8nmQIYHj7EEJahLsU6TDynkpxXGr+56ibQbXZ8yVw2hkzpNjU
         XSaziUVj6QHUKHsXhJqub9zdXoG2WdIy1AbS4SFf8O41hH7lHH57PhdiTKkaTOJ1+7QM
         sjzTxWqvn6t17PZ0PVWU9cD9t38l834LF5lvhDhefDDjhWClb2dXPRFv8PxevLK8psPq
         54j788QIuM1O+mLQXmQY66HSAAI1fEOTR2H2ToRo7vbYOMDLekkQ/LqxCyUTY3g3oJfm
         oa95xhYD71HUOH4aAz6CJ7AwDMpRk40yc+fbAkg3hGkddpd20xvjX4jLB1LReV15ZRq3
         ULbA==
X-Gm-Message-State: AC+VfDx4XBm0GJaHbOWHxKjz6E4Lm0/yR+qRLe/qituqXajHuMgUE0nf
	B+er/mDbX6jeH8FfblwZ/Cti7Ob7XtGRuot0FmM=
X-Google-Smtp-Source: ACHHUZ6CPLOF+sxd1Mbk5flCCe9oHhF6XX3BW+H3izEJUg+MGRUGZcyMUIXIhhDyIw48jb/r8UYyPw==
X-Received: by 2002:a05:6a20:3948:b0:10b:855b:a39f with SMTP id r8-20020a056a20394800b0010b855ba39fmr5537601pzg.44.1686191792266;
        Wed, 07 Jun 2023 19:36:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] openssh: Move sshdgenkeys.service to sshd.socket
Date: Wed,  7 Jun 2023 16:36:04 -1000
Message-Id: <96798603273bbab40a7e19bbb67a9a5398648c21.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686191643.git.steve@sakoman.com>
References: <cover.1686191643.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182493

From: Alex Kiernan <alex.kiernan@gmail.com>

sshd.socket launches the templated sshd@.service, so by moving the
sshdgenkeys.service to sshd.socket, key generation can start in advance
of a connection.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af38a39b4bed9e43c5075008be47ca72191a489e)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


