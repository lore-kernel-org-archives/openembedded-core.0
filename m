Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4584FC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 23:07:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.4255.1642633642155841040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 15:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ExPaVkK+;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so9106646wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 15:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bCwf2JK0sNPkGja3X20oK8sn+p68Z+SxEQXL9ByC21g=;
        b=ExPaVkK+VKSQHUPBgSN38Pyo7e0wlAwMc/EcgMKV4p9bmjRN675nw/yyBcehi2R0tO
         ocdc65/SGne5qDT3/stjTlRMl8XZ2GxXcjQHDqZkjCBC8YgVD1dhpq5Tbsu2CfbO+/R3
         43qcTuFuLlwCqgajrASUkn1m/ZJZ24sv54KHRmZjvmCJNCdzY13x5ym1WW8j1C+7hjp2
         83rRA+gyDr01Wm4zXH6nT9ol+C4xKrWyNlaUrgTM2XG0/BWSsf+r588jbI+Yc59OaNar
         +BVhUz6a9/5pTons0geTCq8nFvplfBVGo4CvcNKQogoILO+gHUGKNX4W1i1GMdyOgnMJ
         EX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bCwf2JK0sNPkGja3X20oK8sn+p68Z+SxEQXL9ByC21g=;
        b=Kd4KTcBugPmEmC1abod2gRPswaMDFJLfH40iSf0yK/ZV4pCxc6kpZMHwVK0jTi8fgE
         hJaZ4cY6Cjfx/AxVEOl4xRlS5EADZAIzTmvpFtFUr520JEu3icp6VqUl2rfKS3D2IKaf
         0PWSVyTqBkHyTBEBLdp60sjUeqLhKjuFTLHlnmAV/7SNuD5JUYriTpAehGUrj4tSkYbO
         MEpUuLvzNRaIMRFU9ZY4YyrOSJvprsPLvjc3MboUlka/GzzRF13EevYfRG1Jr7t0t/td
         gmj8OQlci6wuZQEGDdDMI+IARU+yQDg8JrEXRc3MUgBIyvswb5PVupgL9ttIap7daNLC
         Y05A==
X-Gm-Message-State: AOAM531yYR+nD8DATfh+gbcfllkBJGT+V7U2FoXtUBe7hASW311odyZY
	tJbVzOX8zH5LMVMOITc5BbYfix2l41k=
X-Google-Smtp-Source: 
 ABdhPJzq8a7+7rMJTeQGAGiEbwfnRcgK23ZD4CY7S1+PEa8jj15aeOJ0JsHeIt0iWffN7HN32TvMow==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr5878442wmj.5.1642633640322;
        Wed, 19 Jan 2022 15:07:20 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f13sm1047500wrp.105.2022.01.19.15.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 15:07:19 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] icecc.bbclass: replace deprecated bash command substitution
Date: Wed, 19 Jan 2022 23:07:12 +0000
Message-Id: <20220119230712.1158697-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 23:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160744

- build some packages with icecc enabled is not supported
  because of the folling that disables the icecc:

  DEBUG: while parsing set_icecc_env, unable to handle non-literal command '$ICECC_CC'

- it can be replicated with:

 bitbake make && bitbake make -c cleansstate && bitbake make -DD
 grep ICECC_CC tmp/log/cooker/qemux86-64/console-latest.log

- bash command substitution backquote deprecated

 https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html
 https://mywiki.wooledge.org/BashFAQ/082

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/icecc.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 794e9930ad..3bbd2645af 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -309,7 +309,7 @@ wait_for_file() {
     local TIMEOUT=$2
     until [ -f "$FILE_TO_TEST" ]
     do
-        TIME_ELAPSED=`expr $TIME_ELAPSED + 1`
+        TIME_ELAPSED=$(expr $TIME_ELAPSED + 1)
         if [ $TIME_ELAPSED -gt $TIMEOUT ]
         then
             return 1
@@ -362,8 +362,8 @@ set_icecc_env() {
         return
     fi
 
-    ICE_VERSION=`$ICECC_CC -dumpversion`
-    ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
+    ICE_VERSION="$($ICECC_CC -dumpversion)"
+    ICECC_VERSION=$(echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g")
     if [ ! -x "${ICECC_ENV_EXEC}" ]
     then
         bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
@@ -390,18 +390,18 @@ set_icecc_env() {
         chmod 775 $ICE_PATH/$compiler
     done
 
-    ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
+    ICECC_AS="$(${ICECC_CC} -print-prog-name=as)"
     # for target recipes should return something like:
     # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
     # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
-    if [ "`dirname "${ICECC_AS}"`" = "." ]
+    if [ "$(dirname "${ICECC_AS}")" = "." ]
     then
         ICECC_AS="${ICECC_WHICH_AS}"
     fi
 
     if [ ! -f "${ICECC_VERSION}.done" ]
     then
-        mkdir -p "`dirname "${ICECC_VERSION}"`"
+        mkdir -p "$(dirname "${ICECC_VERSION}")"
 
         # the ICECC_VERSION generation step must be locked by a mutex
         # in order to prevent race conditions
-- 
2.34.1


