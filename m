Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D772C77B73
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.36192.1683386723233909020
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1Vpas1Oo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-643bb9cdd6eso455714b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386722; x=1685978722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvWusLfMZ2vLGUsGFKoj7rEkVNpMh48fjVR/eJPOW6Q=;
        b=1Vpas1Oo3Bwvj5u0M4+wwE5PKIY8KjKMBiFrhZbDtLo/Uxe8z98vEZwyV0NnQZ8hbe
         bkT9w/u9S/nNtEC8aUXtXsCEEcMa8BLTb+hPKnFUGdmZAL4VSgjXZow1p6Rl5McErDoW
         UOa8njzDSqUdt62JmLxhNkPwgKyUtZZRejz6GW0jf1d6CnxTj8z0PmR+mAGia9Xlkh/K
         hSRm3M+D7NiuXK2NFidW+oWO8PLf0WnCiNMgasgy1bthutYC0N72zKvL2R5UQZOTruMA
         Su3X2nLScgqngRtw8VkZF6021/y9ex0c0SGOFiZrH8F/O13OiMb7BAPdrUVHYi9YjSXv
         zl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386722; x=1685978722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvWusLfMZ2vLGUsGFKoj7rEkVNpMh48fjVR/eJPOW6Q=;
        b=WHhGXs4XXoxprvVgiZuCBih9d7w88rAMzfcCZwB6hWB3RuTxGZ3UnoeYO3wd+yEl9K
         22qgOLrHxlGsCCKalqsysUsTPbaVE8qfR+rBdkqpFqRvv9beJZQCHzTWG2uIWvOL/0+Y
         r0bkqASCuq3mGh1KtIei5FnZyhHaAlEADNPiWH7RLEyaeBKXnHQmB+83h295Sb5zpXnE
         b3z6HGJXtoyAYT/aBcPmZdPVXe5KSsBxrR+kmx38H0h4OgjvfCfWG1UEky8C/8cCSkTj
         HeAcK/hiqlMCZ2MJZIbBEFJ2lq0nkigRxvoiaJ0WC9lzVxk5mcC6wEQw9lGJYw/XUdU6
         cyog==
X-Gm-Message-State: AC+VfDy+rNZezTvRgw0rrVNjm5b0uOY1wrQu4Qn1K00xtJqf4Q0s1D9K
	IJVma4M51KvUpWWEZFWEwOJmWXwCvEo7oH0m400=
X-Google-Smtp-Source: ACHHUZ4p7HQrCyXKaIv0lgbaXq1OEY7K2zzD6z+VGccI/R4gU3UvA5v41IKFiioRAfkvSvZSV35khg==
X-Received: by 2002:a05:6a20:7f91:b0:ff:d488:297f with SMTP id d17-20020a056a207f9100b000ffd488297fmr928891pzj.43.1683386722340;
        Sat, 06 May 2023 08:25:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] run-postinsts: Set dependency for ldconfig to avoid boot issues
Date: Sat,  6 May 2023 05:24:45 -1000
Message-Id: <20d8c5d212f06e90d19abe05879ee40420758570.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180998

From: Arturo Buzarra <arturo.buzarra@digi.com>

If a package with a postsints script requires ldconfig, the package class adds
a ldconfig postinst fragment to initialize it before. Systemd has its own
ldconfig.service to initialize it and sometimes if both services are running
at the same time in the first boot, the first one will work, but the second
one will fail with the following error:

    ldconfig[141]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to /etc/ld.so.cache failed: No such file or directory

This commit adds a ordering dependency between them to make sure that only one
service is running at the same time.

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e9d812e127dc6743f52f4881e509e8e2e833afe)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index 7f72f3388a..b6b81d5c1a 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -1,7 +1,7 @@
 [Unit]
 Description=Run pending postinsts
 DefaultDependencies=no
-After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount ldconfig.service
 Before=sysinit.target
 
 [Service]
-- 
2.34.1


