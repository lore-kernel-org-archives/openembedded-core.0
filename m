Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEA4C6371D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.9999.1650472107946888366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor-com.20210112.gappssmtp.com header.s=20210112
 header.b=S+4wy0eh;
 spf=pass (domain: nikolamotor.com, ip: 209.85.215.178,
 mailfrom: russ.dill@nikolamotor.com)
Received: by mail-pg1-f178.google.com with SMTP id q12so2043438pgj.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikolamotor-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1RFXNf1O84zwbX37FOKPciseBIZbJNJwpQI965FMw3w=;
        b=S+4wy0ehMZZMo0igJwH4vueBkDxeAYRiZw/JU+YbtNieSpptNNH5tM65Nq3lNImail
         sALZBfPxb4NQ5urulxNR8WsQjXpVQ/T0llqHjhMICxK0QKi6EN0qbuf5MC7bOjwxgdoK
         7AJBPYt1F+8NFTiqMIxcam8Qnxpf/xqEChRqBFCi7oLoRQOxSp4Dhmw4FMWpI3zY5FKG
         1gr3RLGaZrc3mAmYmAq0eiTuI7lBPh4jJ+CaP/9BO2UmNQ2o9dSqGzUMmfe5sP1mDMPN
         5COlSUym2sk8ZZA7mXpwF7dp+WmDLnVlho31EV0pvIh1x+wxmDyod3sCloRu20A6/Ls1
         GdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1RFXNf1O84zwbX37FOKPciseBIZbJNJwpQI965FMw3w=;
        b=0pM2RhSiz0N4FRmsQaAH02DfT8ii+lrMJ5YVwSGdPyWIdrhBLu5XOG9KBkKZ7p5hQG
         er3vr2d5bI8HUJf5WDsIlpwlQruTWHrpwTAKoz3sVfDCoTuRXViMc4Kf3+YfzDz8h3mG
         30bz5kfwCoqHYXIUw/cc04TgCP5EVPeAEqrbZmbwohDHf4ZmkjVYkOtBzfQbktNjgY9O
         3Dnn5kKQ22rU3i3kr0FUyWGSJOPH6GG35tt0XaQSYp2v1xtk1Wg6mMxR8yYm88e/zB7N
         B0zZSMdVQZ4EH8DHQG7tAo2dtI7nFQtkm7gDcUkTzQCgwidszf0/lMG5iywd7yevgxiB
         vMcw==
X-Gm-Message-State: AOAM533DbmTlFA/vVHckw/a57fJjckv65Bmach7WvRsgBpEXx8EG5Utx
	12he0mfRywJ95L2dQ8EOivPPvfvK312yNl/yTv43d7+BHYTzetXUW1Sw3Hhs9lMWiGfJBsQDY9j
	6AEcsyI44Jn2fuCd7lG8H7PwpXKAxNakZxd4fKlL/o7demwommrqrEoM56+0kcKSDlKtLgnqFvR
	R7A/Ap7TJpGFucDgco9g97f9RLRM5VxlttyUxRVMCm3aXZ7F7qKlHvi2mQmWupnYmT79rm4VVM2
	zDCvb4=
X-Google-Smtp-Source: 
 ABdhPJyf3NuM0cxK2syG07UiKgyR+iZFCXPbpnpfsm2FeSWTxUXv4xGPHIKH+qNNaVVAeR62RB1guQ==
X-Received: by 2002:a05:6a00:4211:b0:506:5061:3e38 with SMTP id
 cd17-20020a056a00421100b0050650613e38mr24040675pfb.74.1650472106486;
        Wed, 20 Apr 2022 09:28:26 -0700 (PDT)
Received: from localadmin.local ([47.145.220.128])
        by smtp.gmail.com with ESMTPSA id
 ck14-20020a056a00328e00b0050a3c5f415csm18648321pfb.23.2022.04.20.09.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:28:26 -0700 (PDT)
From: Russ Dill <russ.dill@nikolamotor.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Russ Dill <russ.dill@nikolamotor.com>
Subject: [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck from source
 directory
Date: Wed, 20 Apr 2022 09:27:38 -0700
Message-Id: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CLOUD-SEC-AV-Info: nikolamotor2,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164716

do_kernel_configcheck utilizes pathnames relative to the sourcedir
but does not specify ${S} in [dirs]. tasks that do not specify
[dirs] default to the cwd of the bitbake parent process. This can be
seen by inspection of exec_func/exec_func_python of
bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
at the head of do_kernel_configcheck.

This is problematic if bitbake is run from a directory that
contains a meta/ subdirectory. In this case the code:

    kmeta = d.getVar("KMETA") or "meta"
    if not os.path.exists(kmeta):
        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()

Causes kmeta to be set to just "meta" if a meta directory exists
in the cwd of the bitbake parent process, or to the output of
kgit --meta if it does not.

Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1d5a8cdf29..c787b2a122 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -620,6 +620,7 @@ python do_kernel_configcheck() {
     if warnings_detected and kmeta_audit_werror:
         bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
 }
+do_kernel_configcheck[dirs] = "${S}"
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
 # their SRCREV values. If they are NOT on the right commits, the branches
-- 
2.25.1


