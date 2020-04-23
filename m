Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6996.1587651135362827111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OC085SMT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d17so7000109wrg.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1UW2M1C9hDpYaRvQPh2fwqxnzSe1/OP+kNoX8i0cKL8=;
        b=OC085SMTUdLcq/7LLS4EApFnuTa90rIQQlWOHVcndrIgjzchqsZ89Qz11C4s6rmUEi
         jfUd5FbR3P/X8s4AU3SDUxqOhliRU+Ls8SlaMl/5H/OIlyXgGxb7PdPAT51s3O/cdUMQ
         xoRP+5JLYdnw+/p69fKbu43vhbM1gXX56d/sUXHR/kSE2e3mG/ARIRLXzR7Hwv98hjgH
         xQHIyN+iGZVgsA3kHc2iIkh8Ax1KZHTgk9b933Kz3qCmjeT3bPWe0GE4qFYFil1TD02F
         +haYMgIAvvp6SFc67LwoNOS5GULhMfw0S7dax5FpzX4Y5+gogNPCNA1rZvtekqiI1eHx
         4qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1UW2M1C9hDpYaRvQPh2fwqxnzSe1/OP+kNoX8i0cKL8=;
        b=hiFlHgeD05Pq0VrtnSfEXd757JfO89CfbonWlaqf9t8QxOXheYubGJ9antw2JsSYXf
         WmSLieLJUEvpFlk7WGHg7N31yvpzm87UUFOQdbD2gOhkGrhtFbaXVWHnBKGSxWy1XU5Y
         aFmcTVEaf1239x2TWBM6p2b07mFif/Vpr5hredUdOl4AlIAq3JKYXzsfMjZn0mZ8XykO
         LgEVgLlaNebDM74CmcVUoMtba2O/bdenVSCATndCU5YEUtFcMNsbwDi6mCyTERZoAfYS
         puq2DwPKNplrWKHLU4Wv4EvSob3UvKT/x4/SYxramyD28+iPDNJRXlR6bhjhrZM0uv28
         WZSw==
X-Gm-Message-State: AGi0PuZGxrh396IY6kzVLivVLFMFTChtqxiT8u+7WIH/6CDE2m//ObFu
	0R+TELButiC7DjRrJk8OdyH5j2aI
X-Google-Smtp-Source: APiQypJrjJ/XoSx6Wnuv/f6XMnOZOPxYmuQ2FS/wjju5caQDJ6Es/hKEDiZ37NwPifnBTmu1hc+5EA==
X-Received: by 2002:adf:df8c:: with SMTP id z12mr5554139wrl.116.1587651133465;
        Thu, 23 Apr 2020 07:12:13 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id a125sm3854726wme.3.2020.04.23.07.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:12:12 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/6] openssh: Move sshdgenkeys.service to sshd.socket
Date: Thu, 23 Apr 2020 15:12:04 +0100
Message-Id: <20200423141209.82595-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

sshd.socket launches the templated sshd@.service, so by moving the
sshdgenkeys.service to sshd.socket, key generation can start in advance
of a connection.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2: None

 meta/recipes-connectivity/openssh/openssh/sshd.socket   | 1 +
 meta/recipes-connectivity/openssh/openssh/sshd@.service | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/meta/recipes-connectivity/openssh/openssh/sshd.socket
index 12c39b26b59b..8d76d623097b 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
@@ -1,5 +1,6 @@
 [Unit]
 Conflicts=sshd.service
+Wants=sshdgenkeys.service
 
 [Socket]
 ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
index 9d83dfb2bb1c..422450c7a190 100644
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
2.17.1

