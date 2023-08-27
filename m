Return-Path: <sveyret@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230D4C83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 16:50:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.1338.1693155032613710159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 09:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Sbmk05hK;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: sveyret@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fefaf4e3c6so8382745e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693155031; x=1693759831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PhZq98xSL+bWCx1I+MiUASgk8FqAL4h0gVtXYMROP/4=;
        b=Sbmk05hKKa+2rhZUhi+CfUANcg4LmBy+e7YmuEnW/BSnMp03cuvHrFpcGMtpCEPci1
         ycZek3RnRIF0ZbHOMRZfAsmhbZiqR31M8WbDzvGht2h7YVpz5Goevm5UirsnIKERDa9l
         7Fh8B9d/n1g8LpzoX9uRzdt8t2u80YOnMyzpxFRWZZV1vPNgBcU8ZKDf8GTX5mPHnM/N
         Eg9SRV3X9neSqAQvZArZCuFjJs1wqVOnqhFF6r5uSI9/qSa0zIfXp3Ondeu/nh6rAZ3P
         lNkA6sT459QYb90h0osI6TJZ2A4ttuTiIRoAlA6ZI1RKka2e9SrTMaZaSz4XzyGhcnUx
         lggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693155031; x=1693759831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhZq98xSL+bWCx1I+MiUASgk8FqAL4h0gVtXYMROP/4=;
        b=J6WDPVqQdU8dC6YMToMeDuc2j+MXeDkQz15HolSx0Nv2Y4OLe4vVERsE3b7x1NhyJZ
         F9nDfsPuVVfobzDNf4smnmtzZJZmtoKZtGlqI6CCGx/0T2qxSvIHt8w5YWn3XqJcWE4l
         KWXcQqFmZMrg9aZElpI1qr7h+P9y5O/UXwruYp+qES7D6s/71jbOuIq3sGU6QPPHZ2Js
         VgGZJHFdgs0DjvOCki1WIqS0Xpqtws1BXBMJZ8Ngc8U5JuCYEfLAyYKeDLVEsuuqk3/T
         PNMFvp02W3Bn4C0MAFxgwQ7KzXLR7M0MAwkz3o/uzUgzTzZMYsCZAx/ST9Tli/70nN8M
         vASA==
X-Gm-Message-State: AOJu0YwB9JRTjebWgcL5U9wqKBGQOb0jU50l5xe6g9XLi1GFi+wV4pPK
	s8MkpaqnL9u4/g9BWsmmpgu/ueib4x0=
X-Google-Smtp-Source: AGHT+IHncA7MMsVclM6jgS8tWHcLVbfiq6nvjgg8YAVyBLm0/GcNLhFgMz1rqZ5HiLpluOx7gLpZWg==
X-Received: by 2002:a05:600c:21c9:b0:401:c392:d28d with SMTP id x9-20020a05600c21c900b00401c392d28dmr2851842wmj.2.1693155030915;
        Sun, 27 Aug 2023 09:50:30 -0700 (PDT)
Received: from buffy.int.neptura.org ([2a01:e0a:3ed:3de1:ef11:32d0:af22:f04f])
        by smtp.googlemail.com with ESMTPSA id t16-20020a7bc3d0000000b00401c9228bf7sm1786864wmj.18.2023.08.27.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 09:50:30 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Subject: [meta-oe][PATCH] volatile-binds: Calculate the name of the /var/lib service
Date: Sun, 27 Aug 2023 18:49:19 +0200
Message-ID: <20230827164918.24785-2-sveyret@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 16:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186779

By default, /var/lib is bind mounted on /var/volatile/lib. If this is
the case, the recipe adds conditions on systemd-random-seed in the
service file mounting it. But as the VOLATILE_BINDS may be modified,
/var/lib may be mounted elsewhere, for example in /persistent/var/lib.
In this case, the conditions are not set because the service file name
does not match expected one.
This patch automatically records the name of the service mounting
/var/lib, if any, in order to set the condition in the appropriate file.

Signed-off-by: Stéphane Veyret <sveyret@gmail.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 3fefa9abde..7a3f53c3ed 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -48,6 +48,7 @@ do_compile () {
 
         servicefile="${spec#/}"
         servicefile="$(echo "$servicefile" | tr / -).service"
+        [ "${mountpoint}" = /var/lib ] && var_lib_servicefile=$servicefile
         sed -e "s#@what@#$spec#g; s#@where@#$mountpoint#g" \
             -e "s#@whatparent@#${spec%/*}#g; s#@whereparent@#${mountpoint%/*}#g" \
             -e "s#@avoid_overlayfs@#${@d.getVar('AVOID_OVERLAYFS')}#g" \
@@ -56,12 +57,12 @@ do_compile () {
 ${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
 END
 
-    if [ -e var-volatile-lib.service ]; then
+    if [ -n ${var_lib_servicefile} ] && [ -e ${var_lib_servicefile} ]; then
         # As the seed is stored under /var/lib, ensure that this service runs
         # after the volatile /var/lib is mounted.
         sed -i -e "/^Before=/s/\$/ systemd-random-seed.service/" \
                -e "/^WantedBy=/s/\$/ systemd-random-seed.service/" \
-               var-volatile-lib.service
+               ${var_lib_servicefile}
     fi
 }
 do_compile[dirs] = "${WORKDIR}"
-- 
2.41.0


