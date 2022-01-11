Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BDCC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:23:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.9791.1641918223908775053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gdKmWyHi;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id k30so16394202wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=3kF90c7WSmadAaC0XJd05UU6ZY/63eHt+FWqYuAXwe4=;
        b=gdKmWyHiETHvEXg6qO8Gi4kVfNeec1iDBInXpxrVSkpEJVPYhrvW4p1pTZRW3butbQ
         DtbyK9LSBYMp2GBoCjBZkn2Gswj5RtIFd5gKoXUT53EXHCcFvwi0Jzswp9RJI3ePd6sk
         0lCYKF4cKnNlnwExN7dSXv+w2HQJF6uOrvuknKoa3TqNLQwQc58+kUzAYHC0U2cqU92K
         RAYdfxNvM3eJmPEe7owCaGI3ofKqZfTcStHt0xiGXfZj9oWsbyEOcQbYrFUvP1EeEvuy
         XAuY02trY1OHI988mDbCgZRWkmsImso6eaKOaAi96sxX4xfVzRfS1jEn6otiJHzk7qV7
         t1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3kF90c7WSmadAaC0XJd05UU6ZY/63eHt+FWqYuAXwe4=;
        b=bUPidJCHzUDxTLQUQNH13eAlVciInq2HNMupf4tdeCSsg5CqAdyHUuipM0yeyVBnvZ
         AhRvgGQuqVD6JPiMFnkPRUjWLIZmwb+nC2gPG2SKZlJC7ERnWMJRVItKmnQDR7g9AN86
         DCUfjtYpqQqFHS3DmV/mo0zEPg0bAgVsI0T/LeL/I6/2xw53VBQaNtA6IOSkBCKstPq2
         TTHMhd+Xsq+TnevUCqKZ6phfMaB/moLkCkgUEoyWBzIis8t+9vkhPt7jioFtfPhNxi4Z
         8GNDyCrUO7H6wFMXa1CfFUXoC/VO3/KbCnwjnHOEsbA8o21Bjg0igxOY6ooVxGU68Evp
         qDrQ==
X-Gm-Message-State: AOAM532Qf+wHyLniofkv6MqujXNjDiq/jMy4VzTJ8OKiNF6KDV9/Rigu
	wFvbhGHtrMfA60truOy1osNkScJ3uf4Y7w==
X-Google-Smtp-Source: 
 ABdhPJwqvAGMDeLZ+Zx6B6j7qtxNtLvEHcItu+wQuhJ3JKvBo5hCep9+Wr2H0LrsNC7MzBxeECqEvw==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr4505067wrc.262.1641918222452;
        Tue, 11 Jan 2022 08:23:42 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 r19sm2058963wmh.42.2022.01.11.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:23:42 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nishaparrakat@gmail.com
Subject: [meta-oe][master][PATCH] nodejs_16.11.1.bb: only handle npm if
 configured
Date: Tue, 11 Jan 2022 17:23:27 +0100
Message-Id: <20220111162327.33864-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 16:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160418

npm-cli.js should be symlinked only when the file is present
the file may not be available if the configure option is --without-npm

Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index 11034420a..c8d942538 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -175,8 +175,9 @@ do_install:append:class-native() {
     # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
     # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
     # npm-cli.js continues to use old shebang
-    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-
+    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
+        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
     # Install the native binaries to provide it within sysroot for the target compilation
     install -d ${D}${bindir}
     install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
@@ -189,7 +190,9 @@ do_install:append:class-native() {
 }
 
 do_install:append:class-target() {
-    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
+        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
 }
 
 PACKAGES =+ "${PN}-npm"
-- 
2.17.1


