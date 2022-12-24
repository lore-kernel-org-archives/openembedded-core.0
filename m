Return-Path: <luis.pinto.martins@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFC0C4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 01:49:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.88539.1671846553783929384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Dec 2022 17:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OC6nd3zT;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: luis.pinto.martins@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id ay40so4629089wmb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 17:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko/UcvwA6301I2qw7M8J/38j5jXZlBnhPKkf94gO9dA=;
        b=OC6nd3zT/dVl0xgndxlorZlY9goLa2Xcxzvs7+mrK3UD+gegEC8UI7yE7a+oGcaOGg
         Eb4OFZqnYc2dfUtP5bdKjYKyaI+4XFMA9YNNI857kd61hxzYcpw+PIsayEKwP0tgqnlE
         4R2pqoBtx2TnafzP4AE8aCfzeQ31iZ4fEkbyFd/KIfEOARXHR0/8Wq9sW6qRGyofRIHd
         KTiwIElt5DG33FkQGMur086rdjLvfEot/FfiFiKkX9HE/eJqsFfeAeHzVt4dUxO7LFRm
         nfVdw2QuYlvHeEhoAq2FcZs7k/onN17AOdc272L0pXjLVEL2+3dR+ljG/khVk/dvcdxC
         +N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ko/UcvwA6301I2qw7M8J/38j5jXZlBnhPKkf94gO9dA=;
        b=B6lpQmL4XzOrzCOyb+WjuYtCbThV4DTwsgeX2q0nvwP2YoQEY9rHiSBd5HUoBrHKLD
         Z0EooZJMutqq9dqCebUQXQV3nJe1XZ4YLbfDJ/Ak7vnbNgmcOK7ZL5ocrQx4YLbPj3oj
         cA+rVxOeBS7E5ri9lCJFMC5DB28c+EVm+wPTTiIkykxrNw8p2zWu4z21lYsLk8+rliAD
         LqxlTesXWMI7Vkbt6XBAEGr3gmcOlHfKK8BOTKd1XvR/iHRU/4u5ketpyPlF3vYvSJLm
         NguE3pVBVzXDr94AU4oh8A1VujtDaT6ylnVjcOh4gdysXVqJk+vFGXmyaP1AChSpH5GG
         3qVQ==
X-Gm-Message-State: AFqh2krcDZ9JHq5Y9Z0b0SRiPu89YviUTLgmn6SL/9JhdyjCuEXjauI+
	zB3AGpGT8EPXGPxQA20i5vbiGw3steAw0Q==
X-Google-Smtp-Source: AMrXdXv7GU8xQ+4pB/mtJHZgtgNoEybOOH2NAJVKzYLlHaz9VS0MFw6M+8k7vgu7pqtHbcbCZ0Bi4w==
X-Received: by 2002:a05:600c:4da0:b0:3d3:5027:4cce with SMTP id v32-20020a05600c4da000b003d350274ccemr8764454wmp.10.1671846551684;
        Fri, 23 Dec 2022 17:49:11 -0800 (PST)
Received: from ctw-bre-001.bmw.criticaltechworks.com ([213.205.68.220])
        by smtp.googlemail.com with ESMTPSA id z10-20020a05600c0a0a00b003d96efd09b7sm4056675wmp.19.2022.12.23.17.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 17:49:11 -0800 (PST)
From: Luis Martins <luis.pinto.martins@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Luis Martins <luis.pinto.martins@gmail.com>
Subject: [PATCH] rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively
Date: Sat, 24 Dec 2022 01:49:46 +0000
Message-Id: <20221224014946.2644943-1-luis.pinto.martins@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 01:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174980

The do_rm_work() task is using the first available 'rm' binary
available in PATH to remove files and folders.
However, depending on the PATH setup and RECIPE_SYSROOT_NATIVE
contents, the function can be using the 'rm' binary available
in RECIPE_SYSROOT_NATIVE, a folder that will get removed.
This causes a sporadic race-condition when trying to access the
'rm' binary of a folder already deleted.
Solve this by exclusively using the HOSTTOOLS 'rm' binary, as
this folder will not get removed.

Signed-off-by: Luis Martins <luis.pinto.martins@gmail.com>
---
 meta/classes/rm_work.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 1f28bc7187..8b5fe1b808 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -33,6 +33,13 @@ BB_SCHEDULER ?= "completion"
 BB_TASK_IONICE_LEVEL:task-rm_work = "3.0"
 
 do_rm_work () {
+    # Force using the HOSTTOOLS 'rm' - otherwise the SYSROOT_NATIVE 'rm' can be selected depending on PATH
+    # Avoids race-condition accessing 'rm' when deleting WORKDIR folders at the end of this function
+    RM_BIN="$(PATH=${HOSTTOOLS_DIR} command -v rm)"
+    if [ -z "${RM_BIN}" ]; then
+        bbfatal "Binary 'rm' not found in HOSTTOOLS_DIR, cannot remove WORKDIR data."
+    fi
+
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
     for p in ${RM_WORK_EXCLUDE}; do
         if [ "$p" = "${PN}" ]; then
@@ -79,7 +86,7 @@ do_rm_work () {
             # sstate version since otherwise we'd need to leave 'plaindirs' around
             # such as 'packages' and 'packages-split' and these can be large. No end
             # of chain tasks depend directly on do_package anymore.
-            rm -f -- $i;
+            "${RM_BIN}" -f -- $i;
             ;;
         *_setscene*)
             # Skip stamps which are already setscene versions
@@ -96,7 +103,7 @@ do_rm_work () {
                     ;;
                 esac
             done
-            rm -f -- $i
+            "${RM_BIN}" -f -- $i
         esac
     done
 
@@ -106,9 +113,9 @@ do_rm_work () {
         # Retain only logs and other files in temp, safely ignore
         # failures of removing pseudo folers on NFS2/3 server.
         if [ $dir = 'pseudo' ]; then
-            rm -rf -- $dir 2> /dev/null || true
+            "${RM_BIN}" -rf -- $dir 2> /dev/null || true
         elif ! echo "$excludes" | grep -q -w "$dir"; then
-            rm -rf -- $dir
+            "${RM_BIN}" -rf -- $dir
         fi
     done
 }
-- 
2.25.1


