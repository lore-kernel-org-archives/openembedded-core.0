Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60629C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.28308.1673454111734448976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=W5rKX9q2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id n12so16393353pjp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoAMgxg4gcFuXn8m/y5JMxZ68fYW6kPcyHjcVPMgEWg=;
        b=W5rKX9q2WfUheNYn2Cn2Obl6cgF5vmeMWCm+giPzgrSGpE4/Ep00eAb7QcRl/GrxJE
         aoRydMs2MfGGTtjGHzEn8OtFasPfvhgGSKiFvoqSOUkzxySr7X+OtCik7eCo0NKRcNg1
         hdDSpKlSJIuEY8kJ3j73a0Pw5bWgVXLwRSq5iAwKEpgNjIEA2Do2l8OP1RYR8wDSUj4I
         Y7kwYfr0aXE4IH/OVu/p5hjMrmH3ecRkzVeHoDKh/D6BD2xMrpmg6cCjuL4/lhpWuXbX
         gAkDLUNf5TgjbdhZFUapbCTU06beGdoYz7s7Q6H8+uDrjYYsixd2p3NdfsMrnvJOBeEq
         sV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoAMgxg4gcFuXn8m/y5JMxZ68fYW6kPcyHjcVPMgEWg=;
        b=4NieXjjl+PmbA7H3isXFhx4/sviP4Oj2tgbriG0fzsez28GqG8y8Wvtv95OBcxHCZ9
         biyGaa/Rvyn+V6sCyZwjz4WEhtTPOQKfb3XyyAqojjGJkLTItUnkmhK5sHiz/R/bIN5t
         Oh3+xyarw1QbRH37uuFv253t6XMPXwKZYifCv0yw6VuSDWoCT9epRmjNGq5Gn0xMFNyf
         yzV/yWcWZQxKWy+gAW1y1eT8dY3B6Cd4xMTyxzyTC/XU2ds+haUnj7GhdkTwB7E7oPNq
         l+Ebcdxs+XsOAjYXRAIiu559bMDC9HjBUOZO7vjpQNZmMT3+U9uNfn2fuuxmdTVfip+2
         SrPg==
X-Gm-Message-State: AFqh2kom5jsdLpB2lb+OYZuvNmX+fH8yepZzDQMzwz0Ne60zj2+bqBCT
	b9FjxVGVI0rje0Cb+4Wrni6EwppSNP3OSr9f0cU=
X-Google-Smtp-Source: AMrXdXv1fhJQ9bsWz1B1aMmFjJFruqmAX5SomvpB/b+cnimrHj80XGXjootgBxxv4alX6Igqxl6H8g==
X-Received: by 2002:a17:90a:7101:b0:21f:e5c:9852 with SMTP id h1-20020a17090a710100b0021f0e5c9852mr74094675pjk.1.1673454114294;
        Wed, 11 Jan 2023 08:21:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/11] rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively
Date: Wed, 11 Jan 2023 06:21:32 -1000
Message-Id: <bfa7e82d0b53644293173571c4e149717a015eb3.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175762

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


