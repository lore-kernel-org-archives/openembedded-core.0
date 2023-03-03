Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8D2C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.27636.1677860298348936804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qvl74+/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id kb15so3053178pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OBXEO7V1nmKdV5zTFuJDeUaLqwk57LZzu4mfq8YEqM=;
        b=qvl74+/ypdV2Wu8dHQ+wrzVXyB47T0VkxFy9x/n9NVJrAEf2LFbPi/hR9y2l5PWJ1a
         jUlLa8OrGcEzkGomgD/cpJfGX9E6rXgmx7HKeRMaU4lxIFnyz/UsuYjFTj6NnczLRK0p
         PExtHffKGOPd8urj58ZLv7hSj1LOoSCeMthfzsHCCAMXQdb3jOXQ95rx0bFxb+UHLdbX
         i1kDWXxHLBazSIE7beRsStjfeSKd26bDna05Me9VXy/iXMYwIyQKB8w79LwLsNDIgqnG
         Vg5jc2k0zgwGyvd3uVYMZferloZp4jH/D4nX/qMsZoY94uB/fsg03had799s9rADSD2n
         PKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OBXEO7V1nmKdV5zTFuJDeUaLqwk57LZzu4mfq8YEqM=;
        b=jX/6lRsj+pckNIORATD2nafcVMRXoKC6ckULDm/njWNoTZuC1OLxkHzQiE+kDjncWY
         kilfYA8Ba8bVD49pUIx5ZuGz+8+rEmfGipYmE/UGpqwsMUVuMuqi7IL7wq2EIr8CUsVb
         qoNPnc3wM1923HvVgnOXh0oVljZh4nyMIYRyoI5v+Bk3tOCnA0lZpIj2Es7zT2mfsSfG
         jFDkpyeigMEBMR8GXAYBO3wDcI302fYeQKel6xJDnS5ia14BNN9VJ4+kX/8ZCPauBXC2
         5o0WN6zCsGTlY5ZtPpDKX0KTArOSH625iqE7IXNXgPln5W2K0QOKqHUanTSi91sI3XDu
         jarQ==
X-Gm-Message-State: AO0yUKWTBX7jFxnaSMD7bK73wDVJWRsziJbtSiA/VSxuGOi9aWxcBOe1
	c4YsgRtCemZxHvYRRpBpUHG2YHFM2+z/YtMi14Y=
X-Google-Smtp-Source: AK7set8aO8As4iOlBzvw3z3F5koVwkyBt7ujxn0vAXGxc0Hvh+yFR0p7zul3cUR0sPlfwnhC7NoXEw==
X-Received: by 2002:a17:903:2288:b0:19a:9dab:3438 with SMTP id b8-20020a170903228800b0019a9dab3438mr2327700plh.2.1677860297312;
        Fri, 03 Mar 2023 08:18:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/29] libseccomp: fix for the ptest result format
Date: Fri,  3 Mar 2023 06:17:24 -1000
Message-Id: <b9fe48f6705c31b29e4b9940c96026dad34f38ab.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178015

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


