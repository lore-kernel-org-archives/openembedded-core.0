Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF8BC678D5
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:34:50 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.25135.1673447689505116491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6etnRIsg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id g68so9553969pgc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/oY9w/8bEMBsicRL8GiUKpYdrbXFWq5J1yMuZbPbmY=;
        b=6etnRIsgum625kF1ur/FJ2oOga+KNwgrySMIc+IGhD0rPsrzslCvfgXel60UnRqHlK
         lAOutZurXMHWqMFO+eSv/d13L55KadvKvUDn+E1kjBVtIUdi7sKmh4N12esF5Pyuoh3V
         b0S41wGXDyEiH0J+SINrraHXaNRyMKgkjzN93WrjsCwfdYnAFOKaZaLwHWqaT1C7Flmn
         luWEYS6SYZYucbGfCggKjjL7nHGA9EILfLcwo64dcVF/GFGvgxzw325ucy8S2LqpWHSV
         YYKOPnGDtWh4NfX+SicJ8DBYg+21qlz2vZ9PWPHv+YXmiMdFl7SpTM8/3tagFQUeYNsW
         71gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/oY9w/8bEMBsicRL8GiUKpYdrbXFWq5J1yMuZbPbmY=;
        b=Hq/ZnEhYPcfrpnnl2FVvs4Vn2l1wgglgyzc+vg/iJ7VVALfEd+7/lsYKjA9FPx+hLP
         r5f1o6+OHyF5r7iP5EVSp1Fn7zlqjPsiaKjp/KFSp7eGVj5uadydBOUvnecmi0WCNPYF
         azIvxdC7wDasMxDrJHbSRBKLgH4x6zdpC4pxffCpGla8Hy/zMjsBTWW9dv/uF1J/QLJs
         cZvrBKMc/Urd0mxmeY+k0qKN/uELPtSRALCowkBfZJCeCJINci3K0rlAfI80oyGc7VPp
         eQbmEJpmJIWyIHP9R9z5RilTE88MOirYVvfEtnmuVVak0+perlERbfvE0/Bs7JgKvhFq
         yrEw==
X-Gm-Message-State: AFqh2kpKzUD7oUFeW/A7un73fy47Qby1nTsy9HGn+UZqhWnMG+ryJAC2
	YtRkvEWktwdLxzWA+9/v+EBkPyYxti6LcRaLXrE=
X-Google-Smtp-Source: AMrXdXtPqSa0GKm4nq8nARF6ekI0b3NOTc1xZpNrZ0aua0ffaPcdEm012gO9iH2b2Uvfl1RkO0xDgw==
X-Received: by 2002:aa7:8eda:0:b0:58b:7db6:da48 with SMTP id b26-20020aa78eda000000b0058b7db6da48mr2529874pfr.20.1673447688340;
        Wed, 11 Jan 2023 06:34:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively
Date: Wed, 11 Jan 2023 04:34:26 -1000
Message-Id: <75b7e86c9d9931c9e4e114af026b51710f1920a2.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175745

From: Luis <luis.pinto.martins@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edcd9ad333bc4e504594e8af83e8cb7007d2e35c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rm_work.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 2d5a56c238..24051aa378 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -27,6 +27,13 @@ BB_SCHEDULER ?= "completion"
 BB_TASK_IONICE_LEVEL_task-rm_work = "3.0"
 
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
@@ -73,7 +80,7 @@ do_rm_work () {
             # sstate version since otherwise we'd need to leave 'plaindirs' around
             # such as 'packages' and 'packages-split' and these can be large. No end
             # of chain tasks depend directly on do_package anymore.
-            rm -f -- $i;
+            "${RM_BIN}" -f -- $i;
             ;;
         *_setscene*)
             # Skip stamps which are already setscene versions
@@ -90,7 +97,7 @@ do_rm_work () {
                     ;;
                 esac
             done
-            rm -f -- $i
+            "${RM_BIN}" -f -- $i
         esac
     done
 
@@ -100,9 +107,9 @@ do_rm_work () {
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


