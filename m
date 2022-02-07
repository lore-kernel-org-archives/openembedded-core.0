Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9D7C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.16388.1644196120263347339
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=caIkZ9rO;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id s18so21961577wrv.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkk85XtmueyCAXODycOkf+OsxfLKnuKJOLiAwXfwhsA=;
        b=caIkZ9rOQ1o9iSG3I6/oxKgURteSl3gACMAcbBMwVZY8j9IQPZTx9cVrjzVxnm+UyD
         6oGheXNhG1V0bnhlaqYgKT5DSX0eSuDRjGakcZQSS5GqMCvtGoi0I48S5Nir22MXiX+O
         lnvdJmAxXNqR3OUyDx3poje8cfkEb3745SFIFEfVEfIcpcTTE/8eideIX8gT2cDoTs/y
         9pEtT//b3KUOltFoMEBEwY9xPY0S6BhxJZDzuxJNqOqrIArsOAuoYdQ5dOZY/pwv8NF5
         MawoP7K945ASE7hN2xbHeP/KFA3Vp+Bwo+StnXYNqhh8qISlElenmXLpthVuVgk6s3Xn
         CXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkk85XtmueyCAXODycOkf+OsxfLKnuKJOLiAwXfwhsA=;
        b=xzH/nSHQHkez5/e/NONDmUzTQsDWcfQIlu0oW4nOR706E9upc7l9NkDyT93wOONEOb
         rcUKYx4YmLCcF+voEANBSiouFuPX5C8l2I4Tvt0JSVtqSMBiCR1Wugzr+Xe/vf2tatx3
         7PqCD0fGdZvrbsQNFF7P3yMW9IK2IrCr8m+9GN5fe0lEkp/E+2nnh+hklgpUZgSPHWHS
         Yip2EBj3a41Ui0R1WOsSaIdS5eBtDdhHU4MVsOtPAYlX/TcYMoWo68Y36CdTqGGWYo+V
         suhYv+ZqRiPN1Nw/tcLXjHTRne6wVZ/tfHBu0uVwphB9yyxeq/wIuU3LG8kwv4NUkeiq
         XALg==
X-Gm-Message-State: AOAM532Y+gMDwD1n0BTnB5PSVbm/6d+yl1HNf0eHU/xK8pfttkUkMP3h
	y+fbh+Mwkgb1yG27+E8gaWTPzKepyHw=
X-Google-Smtp-Source: 
 ABdhPJyIigpgiwXrhe9iXoKtO7Zz5kZjk6+aakmJuL8lvl4AL9+x0lzDfJS/KzJ9TDnb5L+KsCfUuA==
X-Received: by 2002:a5d:4581:: with SMTP id p1mr7824630wrq.531.1644196118321;
        Sun, 06 Feb 2022 17:08:38 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:37 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 01/17] icecc.bbclass: replace deprecated bash command
 substitution
Date: Mon,  7 Feb 2022 01:08:07 +0000
Message-Id: <20220207010823.143664-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161421

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
2.35.1


