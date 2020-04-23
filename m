Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.6943.1587651140406512505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s2emwLsg;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 188so6591647wmc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cOMgxaGAB8XSnhvaZWkk5Rs2ngZmQ6En3zIRQqUzHeU=;
        b=s2emwLsgfhN+smmPo7LcD9Y0imIrjgcRgxXGYTuez6ehjEGO0baoEPpctZoiyccpqc
         WaBUm/PCi+CnrJKYMc1OASmLeBKEUBqLzyJnhlScBged7F85BLZICFqJHNo0CpmN/XqZ
         h3kg8lgdWNUX95l3J32nUP/fR3Gdvo4fFBGo7yXj+vTZDx343zeT7uncTI0ZLcOpVdGp
         Jqg5LkoITykV1Wxm4b2AbSf+2qgtkpNmuzZbyonMCVz/DqRUWbNWM0M1UJ02suylJH/i
         HxAruoOQothgWUKJJEgnfuFJyowUZIz5dJGffdJhWyrTViKA08BBUD40dH5GOaPoDPqv
         akVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cOMgxaGAB8XSnhvaZWkk5Rs2ngZmQ6En3zIRQqUzHeU=;
        b=gFDqP+8yryz8Kww4GTzqIgB2T3qle6x9u6SOm7j/YjxxPEuYZbQsE6FihMIFxk6pPX
         CK8dFjUTB9qjuiKy0mx2d/etJIPEOvxQAz6MhoFg9J+9Ou8fiZc+ZigLvPSTKq+0s0B+
         WjqNr2FY1e3aDf+xgDscVA6xzPBjeRhU+XJxtCAjWTLwymx55KOG/W1k4Fk2MnN5R0AQ
         gTITcNG9SjREW59xmAI72RLra2AmzTDZBWxsCAuu/U+dV/hs5GicLnixNnH4KLgbUqWa
         hCT2+3LqGoIe6upKau5BQyBFhuKWqB2GnQCEClZuCx2xd7fRDrs/ARVRm7P4/HQ300Gj
         cCbA==
X-Gm-Message-State: AGi0PuYsdK9+joMYuaT830RIVCn4g4YulT6YKNcxAWvU5ZzokYMt+sSI
	gKpKGueo8j2nqVEnL/Ty2xbTepUH
X-Google-Smtp-Source: APiQypIiXXMkR1MnC8vCk4K6AP8t+nCquqoD3o7FZdcC2VKjvMbEpplmckxTog6KA7vhopzgk7oJrQ==
X-Received: by 2002:a1c:492:: with SMTP id 140mr4583248wme.9.1587651137471;
        Thu, 23 Apr 2020 07:12:17 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id a125sm3854726wme.3.2020.04.23.07.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:12:16 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Ross Burton <ross.burton@intel.com>
Subject: [OE-Core][PATCH v2 4/6] run-postinsts: Set RemainAfterExit on systemd unit
Date: Thu, 23 Apr 2020 15:12:07 +0100
Message-Id: <20200423141209.82595-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423141209.82595-1-alex.kiernan@gmail.com>
References: <20200423141209.82595-1-alex.kiernan@gmail.com>

run-postinsts is only expected to run once, but during startup, but if
any dependency is pulled into a transaction, even once it has been
marked disabled, then it can be restarted.

This leads to occasional failures during QA if an ssh session starts
whilst the existing transaction is still running:

  Finished Run pending postinsts.
  run-postinsts.service: Succeeded.
  Condition check resulted in Commit a transient machine-id on disk being skipped.
  Condition check resulted in Bind mount volatile /srv being skipped.
  Condition check resulted in Bind mount volatile /var/spool being skipped.
  Condition check resulted in Bind mount volatile /var/lib being skipped.
  Condition check resulted in Bind mount volatile /var/cache being skipped.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Condition check resulted in Rebuild Hardware Database being skipped.
  Starting Run pending postinsts...
  Condition check resulted in Kernel Configuration File System being skipped.
  Condition check resulted in FUSE Control File System being skipped.
  Condition check resulted in Load Kernel Modules being skipped.
  Condition check resulted in File System Check on Root Device being skipped.
  Condition check resulted in Huge Pages File System being skipped.
  Condition check resulted in Journal Audit Socket being skipped.
  dropbear@125-192.168.7.2:22-192.168.7.1:44226.service: Succeeded.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Started SSH Per-Connection Server (192.168.7.1:44226).
  dropbear@124-192.168.7.2:22-192.168.7.1:44224.service: Succeeded.
  Started SSH Per-Connection Server (192.168.7.1:44224).
  Condition check resulted in Commit a transient machine-id on disk being skipped.
  Condition check resulted in Bind mount volatile /srv being skipped.
  Condition check resulted in Bind mount volatile /var/spool being skipped.
  Condition check resulted in Bind mount volatile /var/lib being skipped.
  Condition check resulted in Bind mount volatile /var/cache being skipped.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Condition check resulted in Rebuild Hardware Database being skipped.
  Failed to start Run pending postinsts.
  run-postinsts.service: Failed with result 'start-limit-hit'.
  run-postinsts.service: Start request repeated too quickly.

Setting RemainAfterExit ensures that the unit remains active and is not
gratuitously restarted, unless done so explicitly using systemctl
restart.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2: None

 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index d42addf510ce..7f72f3388afb 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -8,7 +8,7 @@ Before=sysinit.target
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
 ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
-RemainAfterExit=No
+RemainAfterExit=yes
 TimeoutSec=0
 
 [Install]
-- 
2.17.1

