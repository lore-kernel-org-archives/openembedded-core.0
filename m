Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6943C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 11:41:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.60127.1656848481370072949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 04:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kpOZfp6A;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id v14so9512359wra.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X2HYAcgvLJ2N+7II3RpghbloZHayIFax+Vb5ne9lZbg=;
        b=kpOZfp6AAp32DpCBmK/SUAiLghQ6FRWnyhDOWcqaFLtuVtirPfF9Yxeca+yyJiWWar
         JvDTP0YqPokFDlsBcystHFK0TmlhX5a4+ms5MQLFg2qCukBrTaOHsjysBIIyJznPiQxd
         QLjiVu36SN4d4Au8e8dDB2LIXzOG9xVC6hmWuF5GRweHru5lL8bmgD4aEySkpH/guTAj
         4s/venczlUTsNzte3EieRsa6KwETQTOiSYEUVYUT8KLumjLodpJyZ31+/Sd2mQlWSR3w
         idj239VpV5TznqGsmLUv1eCJUsH+JWc0D9fC0QCz60Re0wzCFWi2IFdiuGUNlObNWbjO
         Ecog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X2HYAcgvLJ2N+7II3RpghbloZHayIFax+Vb5ne9lZbg=;
        b=DO7CjCtj31LYR0gA1eDeIR/or/KMaQdcEflj2ClkDdRrJO4qwdvz5jfEgGEv0Ie2m1
         GNyEVbbC0iJrfnbiD3YUfX+Ffrc+1wM4rqOTSg693u45SbXLhZMe4kSZ6RmH88yV7PFM
         MNVzUuyqnq80cFXmaJjVw3HeUbyiIHg6MBOXtUl/8fNLCMCBRc0+CCyVa1y4mYyB2Pjv
         sCTnNuLL1lbjYHd9YdgV1WJNla9d4PcjU/A4+lIAp6hYRp+edKvF6Yh4qPMe4DACL+t0
         1vNKLrPwq7zt4XrgFqu0CZiUjkOYM3xp66FHRoA/i5C+OvC2FnhbksLVfRrxBJGSEKKv
         L6gw==
X-Gm-Message-State: AJIora+5JGfYHyUnB0bk7NY/2fyNU9nddKno0KDVvbGvyaCtaJgojIDO
	GERxKMIdME4vR4W2At9Hcv47LN5CH0UB
X-Google-Smtp-Source: 
 AGRyM1toRRdvR0GqIYgtpzVNCxH1nPip+93mtVTwcVx+YgeZXn7pQVk3jshQnGUe1IycCrpx3rkT5Q==
X-Received: by 2002:a5d:4e12:0:b0:21b:ae89:73e7 with SMTP id
 p18-20020a5d4e12000000b0021bae8973e7mr21795385wrt.386.1656848479798;
        Sun, 03 Jul 2022 04:41:19 -0700 (PDT)
Received: from localhost.localdomain (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 p28-20020a1c545c000000b003a02de5de80sm12413142wmi.4.2022.07.03.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 04:41:19 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 3/3] utils: create_cmdline_shebang_wrapper preserve permission
 and ownership
Date: Sun,  3 Jul 2022 13:41:14 +0200
Message-Id: <20220703114114.2313369-3-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220703114114.2313369-1-ptsneves@gmail.com>
References: <20220703114114.2313369-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 11:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167555

The .real command was not given the same permissions and ownership as
the original pre-wrap file and this is now fixed.

A situation where the original pre-wrap file did not have write
permissions would cause a failure in the wrapping is also fixed.

Test update also included.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 .../wrapper/cmdline-shebang-wrapper-test.bb           | 11 ++++++++++-
 meta/classes/utils.bbclass                            |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
index c4126a41fc..c3d3548d4a 100644
--- a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
+++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
@@ -8,7 +8,10 @@ SRC_URI += "file://test.awk"
 EXCLUDE_FROM_WORLD = "1"
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
+    # was not able to make ownership preservation check
+    install -m 0400 ${WORKDIR}/test.awk ${D}${bindir}/test
+
+    perm_old="$(stat --format='%a' ${D}${bindir}/test)"
     sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
     create_cmdline_shebang_wrapper ${D}${bindir}/test
     if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
@@ -16,6 +19,12 @@ do_install() {
     else
         bbnote "Wrapper is good"
     fi
+
+    perm_new="$(stat --format='%a' ${D}${bindir}/test.real)"
+
+    if [ "$perm_new" != "$perm_old" ]; then
+        bbfatal "Wrapper permissions for ${D}${bindir}/test.real not preserved. Found $perm_new but expected $perm_old"
+    fi
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index b58c22771f..e6f7f95d80 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -202,6 +202,9 @@ create_cmdline_shebang_wrapper () {
 	argument="$(sed -ne 's/^#! *//p;q' $cmd)"
 	# strip the shebang from the real script as we do not want it to be usable anyway
 	tail -n +2 $cmd > $cmd.real
+	chown --reference=$cmd $cmd.real
+	chmod --reference=$cmd $cmd.real
+	rm -f $cmd
 	cmdname=$(basename $cmd)
 	dirname=$(dirname $cmd)
 	cmdoptions=$@
-- 
2.25.1


