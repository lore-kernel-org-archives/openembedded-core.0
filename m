Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3537C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 11:19:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.37226.1751282342271068558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 04:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GXuAAsNn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3380924f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751282340; x=1751887140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJfyUGOjueNrI3by0/bxrpPrOCThVYbQuYcWgSBOKT0=;
        b=GXuAAsNnLay+LZvc366T4wChr1boInMSv7jJJyd82yMc05IkUuNHRVwXx12LpamFaR
         BhqTcIaIf8tUHAQuLyyGKhJlp3eBVAqwFtDpZ05n2s5wbzqdsO18rO042s6Vy3JQz7So
         Qg5DsqSRPetvm2+7Qo19XCdq+QF72bBrodkSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282340; x=1751887140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJfyUGOjueNrI3by0/bxrpPrOCThVYbQuYcWgSBOKT0=;
        b=o9mUhiuafjb6ArAT4g/rJidgYejYPPLBeuSfHJGkQbZyhMILxxBd9e3TgR6ND4Ipr/
         XuMK3IMUg0KsYnHIiPVuEg9XJXzgQQB44wNmgzvNnZGdjcLxEfarrW8CcevCydb1+9IQ
         j1mkZRDyz9Jfw/whgCFrVUMKda8dwUQRHswfaVCZRL/jNLlCHxc2M0igSrQFFF/wNdnf
         LULTo+IiP90S2amt7koswhLfRbpgx8ADUEYsC2q0tENED1S3894A3m7ByduPkAb+WUCl
         wJDHb8A40pu3NWL58mtpkrYEKv5KxIQpO2estFvDXl+8tA+FXy5NK/HdE83JYJvX8eA3
         nPkg==
X-Gm-Message-State: AOJu0YzDzKC7HvwVMpMVuNZApig6R6LyO1mMAzIIviPNWnz8vPSr8ZZD
	+2Tr7qrHPK+1yf3EjH2TPk5N5sWV39mQNVIH4CWWFxWCbH1kbMPOfj9RhgtkqpT7kJ4Qk0KdaJe
	tWRCX
X-Gm-Gg: ASbGnctT2xGIfwLvTuxPT48c7wEhbkvP312kX6Re4VMWmyWeyFapN7ZhxWNgf4weHPV
	dyoLyxIdQpO85uCVPWTIbOpAIe4tVSisu43AL24t+hvKtpiQjtnJAXdYlVgWqwwuw68HAJv7zvj
	P4ezEbFm6UEX2JRPoKJH/2h+g5/LzgDm/vn3gL2Yi1UXmZ6jHC5mdX/9TAjvwj+TYKYjdBnJ9n1
	EayUsCDwGY5VWvfBOS4NUdt7Pnkdb8Se3ofUD/JOhruvfhXvakmJ0KsVRFehTzgoUE8+ZeWyz7Y
	ZhlFXUMXYsoOkMJ/752XP/UVHF36j8oBBoDjcIa5Y5s4+syLooDx2cvUyKHq6wjYaa6FV823MsJ
	DxtHdA2s0LsDTbtayEo6LCVwj4w==
X-Google-Smtp-Source: AGHT+IEuhdhR+b0OAnTfyzG20yT3DLrPG+8o7LvGAHwIxsV2DYdDa+bX2Krno2WzyXox7mS5vCPfbQ==
X-Received: by 2002:a05:6000:18a3:b0:3a4:edf5:8a41 with SMTP id ffacd0b85a97d-3a6f30fc2b2mr14893160f8f.4.1751282339414;
        Mon, 30 Jun 2025 04:18:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ea45:3640:e90f:2224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm134811505e9.39.2025.06.30.04.18.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:18:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] bitbake.conf/sstate: Introduce OE_SHARED_UMASK to standarise shared area umask
Date: Mon, 30 Jun 2025 12:18:56 +0100
Message-ID: <20250630111857.3425139-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 11:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219511

Currently, the "shared" directory permissions of sstate are hardcoded. Since
multiple areas of the code reference this, separate it out to a variable to
allow the behaviour to be configurable. Initially this applies to SSTATE_DIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 12 +++++++-----
 meta/conf/bitbake.conf             |  2 ++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2968cc4c2e7..53bc2e3940c 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -745,7 +745,7 @@ def pstaging_fetch(sstatefetch, d):
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
 
-    with bb.utils.umask(0o002):
+    with bb.utils.umask(bb.utils.to_filemode(d.getVar("OE_SHARED_UMASK"))):
         bb.utils.mkdirhier(dldir)
 
         for srcuri in uris:
@@ -776,9 +776,10 @@ sstate_task_prefunc[dirs] = "${WORKDIR}"
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
 
-    omask = os.umask(0o002)
-    if omask != 0o002:
-       bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
+    shared_umask = bb.utils.to_filemode(d.getVar("OE_SHARED_UMASK"))
+    omask = os.umask(shared_umask)
+    if omask != shared_umask:
+       bb.note("Using umask %0o (not %0o) for sstate packaging" % (shared_umask, omask))
     sstate_package(shared_state, d)
     os.umask(omask)
 
@@ -843,7 +844,8 @@ python sstate_create_and_sign_package () {
 
     # Create the required sstate directory if it is not present.
     if not sstate_pkg.parent.is_dir():
-        with bb.utils.umask(0o002):
+        shared_umask = bb.utils.to_filemode(d.getVar("OE_SHARED_UMASK"))
+        with bb.utils.umask(shared_umask):
             bb.utils.mkdirhier(str(sstate_pkg.parent))
 
     if sign_pkg:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a3300fc1727..b1f8ac5b117 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -944,6 +944,8 @@ TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
 
 # Set a default umask to use for tasks for determinism
 BB_DEFAULT_UMASK ??= "022"
+# The umask to use for shared files (e.g. DL_DIR and SSTATE_DIR)
+OE_SHARED_UMASK ??= "002"
 
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"

