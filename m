Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2086.1587563541564941505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 06:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nNOyBjHR;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id x25so2436132wmc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Y/U/GzKwzZ6sRLbTirRWMIBn0j82QqVPjxYGnml7kmg=;
        b=nNOyBjHRA04xiRD5PX4fOiQobzVed9bvRVbseKA+jEnmeWiGng0sVJVPchSx40t+dR
         hyXLbjvAIdBy4bWBPx8kliJq49HR2tnJe3GpsilJmeUYjmeI3VNgI6aYXiFjebIR4ONG
         bbVmxdu2PXQJBKyHYu/hCB3aata/kqLMXiGFMzx1VUJXJ/uluxT23KUHNen01tSK+Byv
         pY1kCTDU4NN/svKGFqSOLcRdbV7+VOGQpzTONRN5XWRNDw4hASwJFC+rWJWDP4a2Kuuh
         YiuYNtBO5shhAO3r4lMDK7iGQPSh/YsOqyFYY+Ld84jOS0vgzgAPzZuXJmMkgHXD7VK/
         o4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Y/U/GzKwzZ6sRLbTirRWMIBn0j82QqVPjxYGnml7kmg=;
        b=PbEVfZSCnDSmjSdge1QcBQt1/iU3lMC8LXwjxg8DuTioZDgLHdzXHAYFoWOn71Mc3Z
         gHmTms6msKDLmLmS2LfZqAE5vCWBRt3cZLoEEbqOfDgCgFjQ9aOUuaJZtRvjH9Vy3gyT
         5NTWsFZG3EOHCe018aRb8GEIYtqBNCt599MfD79X+8mxxE1iXWAjvQ9hwMXP5mC20QSd
         wDL14TBvo51iDi3Qg7QVRq0UUpT9kzy2bLBrJvFHEumaoyY86HCQQpzowEfG87nh71Ma
         FJi3bb6oWwDdPkxRn3/9lzI89CL+JV3cz9LCuQnkhJdeRqi+762mremGYlsLA/9Idmn6
         Dq1w==
X-Gm-Message-State: AGi0PubFJlzjKn9QCJnt/YvDKr94XQnm/OZXZlgaEjmdzFEaCktTsowA
	FZoMZG35J7NNX8srtW0HBj+Hpvkc
X-Google-Smtp-Source: APiQypKCT17CooDzSX97CWay6iJdin0ZX/8P/NLnZRV0D/0Umo74wa5nZNiUw+wvbFwrjGBPb7NPww==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr10660849wmr.34.1587563539153;
        Wed, 22 Apr 2020 06:52:19 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id d7sm8155846wrn.78.2020.04.22.06.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 06:52:17 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
Date: Wed, 22 Apr 2020 14:52:06 +0100
Message-Id: <20200422135211.121292-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

sshd.socket launches the templated sshd@.service, so by moving the
sshdgenkeys.service to sshd.socket, key generation can start in advance
of a connection.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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

