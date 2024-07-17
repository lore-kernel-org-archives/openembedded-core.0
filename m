Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18899C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 11:01:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12571.1721214060590147234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 04:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8rm+lW9;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36785e72a48so3673296f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721214059; x=1721818859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1XS8Sl1ScEku0shoLXOjbjDyRiHwE+ZCxCsAN47vD4=;
        b=T8rm+lW96TBDt+FIwnOsD8qH8w7C/0Sp5mIK3wPA5vTR710zrz8IflgE6uJ+bWj2tb
         Ty8FKCZkoJWqKWW+CjXtaSe2KmTPVQ9sPdtARtYVJGLO6M38QyBwXyUDTP0GIgLqurCM
         DxJFGK11hzUdSL5kFpHG7RBtTtA5bTjWkJ0mEKJr0uv/zxdO0OcCdHf0nH7SRia1N5G7
         eQozp2sVb2UzQBjUHCsUs07naBOFRTUHvWlJY1hZe8mMWpSv6K7W2qt+k5VJeFTfelVs
         TV3RsXpX1Ci8AhEfLIAvK3wOakbGxZV2wUJ15mldF+Xxba1yDSOBM9cWEKDW7QTU3Rs1
         Ml3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214059; x=1721818859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1XS8Sl1ScEku0shoLXOjbjDyRiHwE+ZCxCsAN47vD4=;
        b=r5qgUquCtbWDUKOVw9fL8QEPyU6fHTXPSl4P3DzeAnsCHQLd/EeodiLjofwcjD1qdA
         Ov9Y/TeMGhhh6ZWGr44YgMNoqVuiHXoc7GF+riaSuOdhCJSoRvj9a2r8XdtdPUPgkLlq
         3Au1gQh/5jvkZ7Wr7S3XyimBZp1vpu4HJQV0Cz7+n9eO/jxRQB14TlRyT/X2LHiGLRK7
         GXu+cuczhwU6ZoBdOiMlMHdUzPpkAjgxGo12FUYz4dD3cjw/6RP0cKLWw15Hlq/9Tx/m
         JNz3ZWsnLlKlr+PmnY9M8YYZc9c3KA3JmcfbaRRdlPErDC4ytKwVAp3WjDCeqHJ+vkWv
         t63A==
X-Gm-Message-State: AOJu0Yz5gyii527GQhsXlAzS7nQp7OGe4wVbOLrbwftBM+kvLY8XVYJV
	bI+DDOahTbzgkEKAJ1GMzhYwFNoqx+pv6Mn7wTZxIRXwOxZhsC4+u7idr+JO
X-Google-Smtp-Source: AGHT+IGDg0dT+qZBOGYEFatEACcByxvtRtxAt3c0RyD/0T0+IPLzWNMwGhYMGpMnOGtxFnqx6VF/bw==
X-Received: by 2002:a05:6000:b05:b0:362:ebf5:3fd with SMTP id ffacd0b85a97d-3683160e590mr907242f8f.30.1721214058450;
        Wed, 17 Jul 2024 04:00:58 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef57aesm162470975e9.45.2024.07.17.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:00:58 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: alexis.lothore@bootlin.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] Revert "testimage: retrieve ptests directory when ptests fail"
Date: Wed, 17 Jul 2024 12:00:50 +0100
Message-ID: <20240717110050.2515243-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202155

This reverts commit d1ac9bb1bd2132cd121f0e80829302298d8a8a64.

The variable TESTIMAGE_FAILED_QA_ARTIFACTS is not parsed as expected [1]
and is making some noise on the testimage output log as can be seen bellow [2]:

[1]:

bitbake-getvar -r core-image-minimal TESTIMAGE_FAILED_QA_ARTIFACTS
TESTIMAGE_FAILED_QA_ARTIFACTS="    /var/log     /etc/version     /etc/os-release \${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '/usr/lib/\${MCNAME}/ptest', '', d)}"

[2]:

DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; for p in /etc/os-release; do if [ -e $p ]; then echo $p; fi; done
DEBUG: Waiting for process output: time: 1721210770.14278, endtime: 1721211070.142032
DEBUG: Data from SSH call:

DEBUG: [Command returned '0' after 0.36 seconds]
DEBUG: Command: for p in /etc/os-release; do if [ -e $p ]; then echo $p; fi; done
Status: 0 Output:

NOTE: No file/directory matching path /etc/os-release
DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; for p in ${@bb.utils.contains('DISTRO_FEATURES',; do if [ -e $p ]; then echo $p; fi; done
DEBUG: Waiting for process output: time: 1721212869.3242505, endtime: 1721213169.323435
DEBUG: Partial data from SSH call:
sh: syntax error: missing '}'

DEBUG: Waiting for process output: time: 1721212869.6859117, endtime: 1721213169.6859093
DEBUG: Data from SSH call:
sh: syntax error: missing '}'
DEBUG: [Command returned '2' after 0.56 seconds]
DEBUG: Command: for p in ${@bb.utils.contains('DISTRO_FEATURES',; do if [ -e $p ]; then echo $p; fi; done
Status: 2 Output:  sh: syntax error: missing '}'

NOTE: No file/directory matching path ${@bb.utils.contains('DISTRO_FEATURES',
DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; for p in 'ptest',; do if [ -e $p ]; then echo $p; fi; done
DEBUG: Waiting for process output: time: 1721212869.8884451, endtime: 1721213169.8876731
DEBUG: Data from SSH call:

DEBUG: [Command returned '0' after 0.37 seconds]
DEBUG: Command: for p in 'ptest',; do if [ -e $p ]; then echo $p; fi; done
Status: 0 Output:

NOTE: No file/directory matching path 'ptest',
DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; for p in '/usr/lib/${MCNAME}/ptest',; do if [ -e $p ]; then echo $p; fi; done
DEBUG: Waiting for process output: time: 1721212870.2542233, endtime: 1721213170.253479
DEBUG: Data from SSH call:

DEBUG: [Command returned '0' after 0.37 seconds]
DEBUG: Command: for p in '/usr/lib/${MCNAME}/ptest',; do if [ -e $p ]; then echo $p; fi; done
Status: 0 Output:

NOTE: No file/directory matching path '/usr/lib/${MCNAME}/ptest',
DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; for p in '',; do if [ -e $p ]; then echo $p; fi; done
DEBUG: Waiting for process output: time: 1721212870.6207979, endtime: 1721213170.62004
DEBUG: Data from SSH call:

DEBUG: [Command returned '0' after 0.37 seconds]
DEBUG: Command: for p in '',; do if [ -e $p ]; then echo $p; fi; done
Status: 0 Output:

NOTE: No file/directory matching path '',

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/testimage.bbclass        | 5 +----
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 72282ac362..47060c00bc 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -22,14 +22,11 @@ TESTIMAGE_AUTO ??= "0"
 # each entry in it, if artifact pointed by path description exists on target,
 # it will be retrieved onto host
 
-TESTIMAGE_FAILED_QA_ARTIFACTS = "\
+TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
     ${localstatedir}/log \
     ${sysconfdir}/version \
     ${sysconfdir}/os-release"
 
-# If some ptests are run and fail, retrieve corresponding directories
-TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
-
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 72081f938d..2b965c927b 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -42,3 +42,4 @@ python () {
     if not d.getVar("MCNAME"):
         raise bb.parse.SkipRecipe("No class extension set")
 }
+
-- 
2.45.2


