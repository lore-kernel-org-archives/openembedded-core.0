Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B397C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:40 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5363.1663078716861945180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t8px7vhM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id a80so3327168pfa.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=YEfK4/1AF2kQB39M7YS5gLK9lg7pJQ4+C4sfJRniFyM=;
        b=t8px7vhMEu6cAqPN83qhwY/MGUDOlR7Ngo8LYgmI3QwpB2UpPqXYKdQOuOvl7CUH6c
         V4QyD5YndWXt+qZvrbrJPE911MWUf8W+eAeHHZy2oMwzc3eBWbqaThWeukWeGQhNYPFA
         flR8bxwmidu0m52pzVqy33sYPshXR8+kyWH6xFO4OBrLHDWddL3QAdUUM2pYdURj2rr4
         NHoEHXzV8YLQsoslUOms89V/CevhXDnuU0iMvkvT1qr2PdwAuteSNxpC1ApCWzH8HrOm
         KubdMy8giAH5tbHqDjJXLsznGMoMhZQjWik8Cc0onNPBszYxgFshUt48PQqGbKJcsJ/p
         vr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YEfK4/1AF2kQB39M7YS5gLK9lg7pJQ4+C4sfJRniFyM=;
        b=oUWFtCQL29xUJoD3LAm1kfglMxZktAI0QNM+1DJH/sAmEuMdO6x2LEOTf/G8d0ngVg
         Y36E1OTd7ybxh7NsiNtpztluT+yX3Imw4MlCik7oyQp+49zuRVK+B6D+ZAAWzsoKA0S4
         y7OKw7CeIqbworUV0fsvCRFVF7yFy1pJ3Jxcmspp6Zgx4FNLiwOMdy9NqXexDpicre/B
         50n5hPWIr66yjmMZ8D4HRM35zKmupa4SA3IPe/FIHAXuU+aTF7CZ2Qn2C5kjosxC6Jaf
         696TEWRAmgPNZ9zcdeJkRWd3zzccPEKjvKKHOmU5TqCEZKndC2c/kpAfYJ53Ryd5FY8Y
         8icA==
X-Gm-Message-State: ACgBeo0dTMs4WNu6adEoguw0Tg2jLGZMZVIXmRa9tP/KyLI5s/fbOMJ7
	m4NQKKQqiHDl1rpM6+x+UCn1o0b13zPLwTiX
X-Google-Smtp-Source: 
 AA6agR7vTIQl06h1hZYnwEr4ORvyHJeg/9vJDj0pQ8OuKwiqASNGotJ/V4GY6qdSLNdwjPN7n1gNGA==
X-Received: by 2002:a05:6a00:134d:b0:545:4d30:eebf with SMTP id
 k13-20020a056a00134d00b005454d30eebfmr6198461pfu.32.1663078715825;
        Tue, 13 Sep 2022 07:18:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] core-image.bbclass: Exclude openssh
 complementary packages
Date: Tue, 13 Sep 2022 04:17:51 -1000
Message-Id: 
 <a09725442d4b53bb9d417ef9f43b12db2545aa54.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170589

From: Pavel Zhukov <pavel@zhukoff.net>

Openssh (main) package may be marked for installation via complementary
packages mechanism if sftp-server is installed
and this causes conflict with dropbear [Yocto #14858] [1].
Excluding openssh complementary packages if packagegroup-core-ssh-dropbear
is in PACKAGE_INSTALL fixes this issue.
To install openssh complementary packages in the images with
ssh-server-dropbear they may be added manually into the list because
they will be excluded from the installation even if corresonding class
(dev-pkg or dbg-pkgs) inherited.

[1]
Error:
 Problem: problem with installed package dropbear-2020.81-r0.core2_64
  - package dropbear-2020.81-r0.core2_64 conflicts with openssh provided by openssh-8.9p1-r0.core2_64
  - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided by dropbear-2020.81-r0.core2_64
  - package openssh-ptest-8.9p1-r0.core2_64 requires openssh, but none of the providers can be installed
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa08030b32c2bf77889c23f964892f46e84994a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/core-image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 84fd3eeb38..740a6c1d3d 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -59,6 +59,10 @@ FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 # IMAGE_FEATURES_REPLACES_foo = 'bar1 bar2'
 # Including image feature foo would replace the image features bar1 and bar2
 IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
+# Do not install openssh complementary packages if either packagegroup-core-ssh-dropbear or dropbear
+# is installed # to avoid openssh-dropbear conflict
+# see [Yocto #14858] for more information
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', 'openssh', '' , d)}"
 
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
-- 
2.25.1


