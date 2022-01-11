Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D8CC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:18:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9835.1641917920802720204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ETnlgw0J;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id q8so33840647wra.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1x5qAt6zQhOIGIgEVJiyh0sgyprqIhbEFVJfltY2uaw=;
        b=ETnlgw0J4040V0fB4Zxqchyc8AqKGnohJbVM2Dzt+63xw+MEfs7SglDpB9Zgr5WPO0
         KTiFLV2PNR1bl+IPP3HDxhJTMfQywwMRp5dz1iMeOohxYyNoRbRJAXtngJF+Mx+HrEmQ
         qzKg7ctwbPNaSX6KmOqAzAu5UAUN9McHH3Wy2J2nyYvPBdcr86POnZyjSnFw54y6ehzm
         B1y47q+OfbsMEn1pPWniExKbl1W3I5jRcg3jzgFZ93sEHMEtu4WsEGDtH5Km8ZR5B2KN
         zGCK3aC6nV6ZvTl3UBgFgKKBsC92OtOk1REzRBg0LoWHKzveWXA6QOeFcwLrD0dFeS34
         UWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1x5qAt6zQhOIGIgEVJiyh0sgyprqIhbEFVJfltY2uaw=;
        b=u1+8vjvC6JEId7UyPgNrO3p+jNZ5F+iapzt0Y1+GoP9mz347lbzhEoclbXZitbbc9x
         Z8uLP3gWpYoNpzLk61ofdBOR6fLHo+lcjEPiWpD7Ot1GJTo7Et0Hq6DtLRNvqPbE2g42
         92SW9xJkolDFlzNCrHDheDc6XxlqTedFtXkBNi4fi6Tut6/fuD6JwAIwMTj7jmYa1rCc
         13/lBymW2B4DXlQ2BvdPvYPZAPOHT7qm+koaeXVu2TirvMrDfrT0A50NlUYJpIX7HGbb
         7j8I/PeF+lQnV/NgEZKQ6rBZQJV/Pw2Mo/MxZKsKpHWNBuS+ILvxhDN1Z6zpwfAcSEFU
         1h3w==
X-Gm-Message-State: AOAM5324uo07ugDAHwtujtRUXSvs8ziOJbXIufcULDSDC2sFbWqNvDis
	LjRIUikVGSCnZX3XXFV9HTZ9tP3RgqCEkg==
X-Google-Smtp-Source: 
 ABdhPJyODLQqFUxLcyS+6zl6wFOBfHv21EjZ6oVQXx6coI1cNif8x454Y8ndwCSUiXlIYYVGGz72jw==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr4405419wrm.368.1641917919282;
        Tue, 11 Jan 2022 08:18:39 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 bg12sm3085282wmb.5.2022.01.11.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:18:39 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nishaparrakat@gmail.com
Subject: [meta-oe][master][PATCH] nodejs_16.11.1.bb: only handle npm if
 configured
Date: Tue, 11 Jan 2022 17:18:26 +0100
Message-Id: <20220111161826.33713-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 16:18:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160416

npm-cli.js should be symlinked only when the file is present
the file may not be available if the configure option is --without-npm

Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index 11034420a..187a53b43 100644
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
+       sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
 }
 
 PACKAGES =+ "${PN}-npm"
-- 
2.17.1


