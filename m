Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F11C636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 09:59:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.3417.1676627968561883380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 01:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a2t+qQ5w;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id n3so192709wri.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 01:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8m7jfUR8EtBImIS6IfkZhqvUcGbnbrA6Vr/PotJF9/c=;
        b=a2t+qQ5wFGgWCAtWW4osBY5jbMwacm+xsxbAi5lBFiFj8WvxOk+M8tKgN+aKsZp4uk
         yVUaty/DTo8Mwura2qGBQzVD68FlM2bQCB7+aspTRxxPMVaoAjo5hTUkJkWVE3I3X5YM
         JM5T+X4FGA3U3MF/ZzUex/wYweYwMcWVRxEthVeOLFYtDF5WSqsVVhCFvsABxNuIg7cg
         5rEmk8CGLgOHGPX64WMZBPxMSSzh1S/v4uRq64/yBM4oGl1BEgvXj5PdMNrdrBf/A+An
         BFg7gaPqFii3X6qQlIY9qp90/MSLE47dhMXP01i+LSoHdOPtfWS0yw6td+vKNx7vv/ED
         KnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8m7jfUR8EtBImIS6IfkZhqvUcGbnbrA6Vr/PotJF9/c=;
        b=0GgOecll5hI0B2Zup/+iDmTReAOyWt/UuMAPS8yQLcuwi9OWxzdopioO0IZmkmrMX7
         z5DuS8Si8VWB/oMyhe+KiwWAAMj2YJ4PhMLTZ8U1OrVmi7LUlbqoDf6jZhUMBAzdETCk
         t7My+1rR0fmeNvrxHvjRCmZpToLqz9QPsTYh/QOSBUfR4xi//Q3AGN7GJ3KMHbKLiPZ4
         Lhovty90e7dXCWBfCVR3iXxPChVFTxFSeH3DKGXd7Jy5ZH4Fi5/ThCOvfHGfCPps+/ah
         fA3YJENyrjR+hFdXPyhEcuaD7y8nV6VoXhBjWQRiJimqapbrjzGvnLWxLHnjtbBOCUk1
         G0qA==
X-Gm-Message-State: AO0yUKXE+CHN80PQdeapaDFuQm+RYvXm9m51Y4JBC+fyw28nZS1Se2oO
	dkVX5XUlOQZGvr/7QPM+NC1j3pxq2DFtFA==
X-Google-Smtp-Source: AK7set9rsqUEPnrie7HeDKL+H/RjLQr0iX6CkFWcVgZ4t1iJMSQbrae4nQJCME3OEhBO0LpK2ef6mA==
X-Received: by 2002:a5d:4b11:0:b0:2c3:f880:bb1f with SMTP id v17-20020a5d4b11000000b002c3f880bb1fmr347161wrq.14.1676627966559;
        Fri, 17 Feb 2023 01:59:26 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id k13-20020adfe3cd000000b002c54a2037d1sm3837287wrm.75.2023.02.17.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 01:59:25 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] icecc.bbclass: enable the network only when ICECC_DISABLED is not set
Date: Fri, 17 Feb 2023 09:58:55 +0000
Message-Id: <20230217095855.1932015-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 09:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177306

Enabling the network uncondictional is not need for some use cases.

Such use case is usefull to reuse the sstate-cache of the build
and it requires the icecc inherit in all of the builds.
The real control control of the icecc is in the variable ICECC_DISABLED
so this patch change the logic to enable the network when the icecc is in use.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/icecc.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 312e0f17b5..159cae20f8 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -428,22 +428,18 @@ set_icecc_env() {
     bbnote "Using icecc tarball: $ICECC_VERSION"
 }
 
-do_configure[network] = "1"
 do_configure:prepend() {
     set_icecc_env
 }
 
-do_compile[network] = "1"
 do_compile:prepend() {
     set_icecc_env
 }
 
-do_compile_kernelmodules[network] = "1"
 do_compile_kernelmodules:prepend() {
     set_icecc_env
 }
 
-do_install[network] = "1"
 do_install:prepend() {
     set_icecc_env
 }
@@ -457,3 +453,9 @@ ICECC_SDK_HOST_TASK:pn-uninative-tarball = ""
 
 # Add the toolchain scripts to the SDK
 TOOLCHAIN_HOST_TASK:append = " ${ICECC_SDK_HOST_TASK}"
+
+python () {
+    if d.getVar('ICECC_DISABLED') != "1":
+        for task in ['do_configure', 'do_compile', 'do_compile_kernelmodules', 'do_install']:
+                d.setVarFlag(task, 'network', '1')
+}
-- 
2.34.1


