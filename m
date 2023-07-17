Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E478EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 14:36:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9928.1689604587734852652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 07:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=MAbygxHh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbf1b82de7so28403115e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689604586; x=1692196586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IA3uRKGHEm8dZpcG65hDzh0+2niy4PLx0iw6TzX9LJs=;
        b=MAbygxHh1vP0KSh2DrR+bmtjFZtc2xxFj26TegNClNJJ/S2iQoifijbAQb57GXMv1+
         dr6K/TiyyajLuu1JAIV+luSftLjzhsDTK3Fl/eGXyTHuKCbe8nLKvqD5mO/lDEYFuHev
         ix4tZnIscOAvKbkGcjN1GQ+Ud1eXew8ymjjVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689604586; x=1692196586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IA3uRKGHEm8dZpcG65hDzh0+2niy4PLx0iw6TzX9LJs=;
        b=CqvDBahY5heX06V+boevlKTaTRoKZ4UYa/xRm8Y0Doj367V/Xb5cI4+fKkqfNv3e77
         dIB6ooN6r8gDMln6MxKxOZdhIM4QZqr5ZHjMSWhfjNSZHV16yXHX1E/AKZb51VLrnGdb
         WXbObbaObkLppsSa6ONmYLJpPiUvteDlxmN5AsWSQ8uPq+pfTEBs0/3ITasTfzA9hA/f
         j+C1WUydwb9sd//S/7IzA+AwjaGG8BZ4K8ZYUbf046DkKucYwZrpxm8TDtuJurYuNssM
         bnoLT9lLli0jiMrytNFNfrubYtYGgQeZcgc1EARY1bsK1tkko0cQOXQ0kpz3QMwcbKXU
         fIbQ==
X-Gm-Message-State: ABy/qLaRJFcOZLB7NZqMBrULjkc3N3EXH+u33vUE+jq82NeowEjwrcxY
	Fe+F4wUaHQ7Vt3oK8pRtJCCKRNmnGfLrlc9iaC4=
X-Google-Smtp-Source: APBJJlHh3H6uebFtBlgE+cOJyKisp/Q+dXdsz4EwvRwE6CWia9jGd9Iyfd3lVFbetShW8WkECT3Puw==
X-Received: by 2002:a05:600c:3105:b0:3fa:9996:8e03 with SMTP id g5-20020a05600c310500b003fa99968e03mr8094169wmo.10.1689604585733;
        Mon, 17 Jul 2023 07:36:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6671:c2e1:78e1:cf2a])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d4dc4000000b0031424f4ef1dsm19424468wru.19.2023.07.17.07.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 07:36:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-runner: Pull in parallel test fixes
Date: Mon, 17 Jul 2023 15:36:24 +0100
Message-Id: <20230717143624.437293-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 14:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184473

Pull in the commits:

    Change test timeout to be total elapsed time
    Report if child dies from a signal
    Recreate pipe for each test
    Revert "runner: Correctly handle running parallel tests"
    runner: Correctly handle running parallel tests

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 6f3104499f2..77e2b94f376 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8259375d306a8129f6c5d8528314496fc6ae1ca3"
+SRCREV = "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.39.2


