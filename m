Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB84C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.45241.1673490814240706503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4jXn7XEP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id y1so18813571plb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWoQ7ZdID0852oC1UT3BKqalSRewBsNwDifkjs3CYPA=;
        b=4jXn7XEP3RRQAdFCHtTMPxH3NtErxMapVzTOHMjjXubsbADNTQXFmfCq7XdPJi9kxC
         5n7J8uUvIrjFI43TcTApWP2oCnhrPivDzbdQzAxLP6zwu5Am5da2373lk1DWmRYk0H3w
         Q+oZr3fZvQaMdL5zVMExUlDdMJZgnjHer4O3VrFUau8mrvMWWRiL916OFTfZGuI66fSK
         HawpMjyIhB6msK0D9xziAJsy3MP70auqpnv00STPUt0btp8wOykIb7c4wR208tnbTErN
         lqfY1bbtQVWg2YSrlpnRbm26DCBNEDM+9OekrPtfmP/L+ba4oGjZaSJEd3RWR5z2Ost1
         Y8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWoQ7ZdID0852oC1UT3BKqalSRewBsNwDifkjs3CYPA=;
        b=775mokco1m9s3jrGZXAgryvzQXb3qsSuGQTpRXkixSn0f7CzWVYn/ZSh6Fxgr4Socb
         ymWByxgrb1PpUYF2Ggp+cFGegzU4mX4lmEFuPRGYF/8wy5Od2s1/0+1Q6XIyEaVUalZ6
         ugwPbZok4HATpKwIkS9I8r3NyV68aSBmdPIZubyV0Z1ktgzKUrWf659XP0+H5q+Tq7ee
         TK0lmuG5p8CjXhzGJXcgaq1JqI6fJMUZRfQmiizeQbbQjt9vg8dGYECwUt0scZJyNmAF
         6Ny7gxmai2rRcWa5rKrEJ/0wzxXM6C7illMaCcym8QuMvSsovuDeUjTUIB168r490i3n
         WeXw==
X-Gm-Message-State: AFqh2koIKG+Q3BxVzn3VC/jyI33X95MH4rjgXZadifYAivuzoY26nETP
	TPZ+ohIuz+nPNiZ4rjzAFxJQtYqHoPhVSbIba9c=
X-Google-Smtp-Source: AMrXdXsVVMrqEdADaw3OaX6ularg9cm2OWqist58AcgVU81iFKntauQ98DTo3JF/9yqghiRqiJl00A==
X-Received: by 2002:a17:902:b085:b0:192:d5dc:c84b with SMTP id p5-20020a170902b08500b00192d5dcc84bmr31543755plr.50.1673490815135;
        Wed, 11 Jan 2023 18:33:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/11] rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively
Date: Wed, 11 Jan 2023 16:33:08 -1000
Message-Id: <a3f26247aede1595b15a126322cadd584102f0c6.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175780

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
index 8979714e62..f7ededff26 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -27,6 +27,13 @@ BB_SCHEDULER ?= "completion"
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


