Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A109C64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:26 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.69587.1677430956817460407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DspKfX7s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso7733487pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OBXEO7V1nmKdV5zTFuJDeUaLqwk57LZzu4mfq8YEqM=;
        b=DspKfX7so0VC3vNXOjV3tcBmEKQcSNpUPzYLZhpwBTk2xYJ3MusLrIDkrg97KV54J+
         IQDq10Q85OG9nI58xT2JB0LB9NNPPYrFzevZxDBISdfj43cse5WFt42xIFTR5Li7x3S9
         +ZrEZ3f3Bi6VL6bYkRU8MzJlmhvHPlKd/6ufpmT7g4Wld/hHef+95q8+qmoJiyJqxS/s
         idDcxqTKgUJGU2nfPlHKT0nZ6NMPJbfWOHrhImUKFBaC7yzyojmjVX2N3Of4YiKf8UCs
         V2t8gzgoB7dIg+Wd9hkYE5uorv1FeVwkCWaidfuumYscEL9nKeXH5m058eIwkMyQv7nn
         unJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OBXEO7V1nmKdV5zTFuJDeUaLqwk57LZzu4mfq8YEqM=;
        b=RbidL3ACyrKsD3PPVSCy5FT33bfJsPAzuDbCJv7tSw+W2wRKx9cNA/sM07cRJiDxyM
         pRKjSX0qDjUHc50tVzlATfNYFKnGxS9PkGONYnhLn6DPmVMKGEaNTizU+MsuKe7ejnOp
         zjzqqC2BZIG/t2J/ObhZVejUTcebGyFx6jUX+5Se4dMjLehdrjzV+fBSpNjEBbMhvS+7
         oAUBocIFwS/2KUYlUbVoq/TgRRRO/0QuwqbBCEbS/QI2CefNcjP3U1kd/kuvcWoKPQOU
         on9mDc9KS7cMAu59kNd8CvEMKxm7eQCnFXiVZc6xs5tAxKykJlsDWEPVRDOaMQ3c9Kba
         wuvw==
X-Gm-Message-State: AO0yUKVRQdVK1L/NtAkA+xo/Qc2tjsgIO+gGP4Ye+n/FNrZUoHLIX9SR
	ISxlUt9IoP9XJvxuNrEbQqaI96bMT4rQlHyLJok=
X-Google-Smtp-Source: AK7set8r/I4zuYH58vYEuGsZ7Fjfjx1Nqwf99b1ehsU2COGxB8XIg0bKdJ6Fr/HUM6zRo5cWNepbFw==
X-Received: by 2002:a17:90b:2243:b0:233:c758:9a1c with SMTP id hk3-20020a17090b224300b00233c7589a1cmr22029911pjb.12.1677430997477;
        Sun, 26 Feb 2023 09:03:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/28] libseccomp: fix for the ptest result format
Date: Sun, 26 Feb 2023 07:02:22 -1000
Message-Id: <13a567a0bf191e9ad82ed93180d4b21bb2c5875a.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177764

From: Narpat Mali <narpat.mali@windriver.com>

The output of libseccomp ptest should follow a unified format as
per this https://wiki.yoctoproject.org/wiki/Ptest

Replaced the test results SUCCESS, FAILURE & SKIPPPED with PASS,
FAIL & SKIP and printing the ptest result with the below format
result: testname

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30d025a8641cfcce5412b5f021478777620b55f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libseccomp/files/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
index 54b4a63cd2..63c79f09c4 100644
--- a/meta/recipes-support/libseccomp/files/run-ptest
+++ b/meta/recipes-support/libseccomp/files/run-ptest
@@ -1,4 +1,7 @@
 #!/bin/sh
 
 cd tests
+sed -i 's/SUCCESS/PASS/g; s/FAILURE/FAIL/g; s/SKIPPED/SKIP/g' regression
+sed -i 's/"Test %s result:   %s\\n" "$1" "$2"/"%s: %s\\n" "$2" "$1"/g' regression
+sed -i 's/"Test %s result:   %s %s\\n" "$1" "$2" "$3"/"%s: %s %s\\n" "$2" "$1" "$3"/g' regression
 ./regression -a
-- 
2.34.1


