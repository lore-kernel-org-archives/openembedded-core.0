Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE321C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 20:47:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2835.1651697232747280815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 13:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DFfOcSA+;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id v11so2047095pff.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GOtyHMsb68W3szKMrHRPfgM2oO5++9vQwIzj2rrMY9I=;
        b=DFfOcSA+0MNL1YvFKDZCc6kgmLnXDIcnBEzUT+YnhrS2UWGx3sZnF4I8SwvoS9uwnA
         Z1MiTLbpqOpKSbTkXmJYGMsIIr2B82TJtHwysdLjeunuFqzUdtyMBEXdZ8HNjoafm222
         GVedIPpqy+e5raYa3ktG60GPh7+7/CbyeJSDP93LM7AwSgUBrhcO5tksB/4Vej1kz9cp
         GiKUp96VvurzaJ+LpzJoc+fzXpHNG1spwGGfNVl8jIH4/m10GTOAZb31+dIT16tL7cda
         oGXSU6/2ymHkybLPYN/0r1n1Foe1Af/XeJp4Moe6kwkn/fnorlDR73MQpIMD4s67ooa8
         HWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GOtyHMsb68W3szKMrHRPfgM2oO5++9vQwIzj2rrMY9I=;
        b=Hy+gBewuMbu5Xlw4Aayy3rQ8wgWdG8bSLK/97KVFMJrknex2iNliDlJe+VZBDsdF+I
         fh4w27HY6oKQBJ8OeHyHS4S0QUt+F6nHZw0sx0zfKVU0wjNQtWpLpw1Gw1Vv6Q8SYSZg
         3j8Slf1NYpO0A1G7/IabM+N3BjR51cwwru2to+UdIgAjGSde0eFkBblwfkYmvizn3J1b
         zZKKmiv8hFKrrKM4wbz+WrH6pmidvumPWFz/tKB7CaSjwgWT57Fhvka5JNMcj6bWSfqT
         YwmBhNRjVCSBi9YtClKUyh6p5S31zvWh2pp2u1VaBSbOW6HHmlC84IPxnIakP58PMkb2
         pb0A==
X-Gm-Message-State: AOAM532tVQmjHuXTZ2NB6T/cPHfCjQRs1FoGI9Qun2+Z3KTTY4totoRF
	HAUxZXLfvrMfL80sr4m2yCY5FlnMcuFfJw==
X-Google-Smtp-Source: 
 ABdhPJzKbQFx9WFOAfMvd4eIbnl9JfK6qqCOsUKQOgUv7x7/GvlYudcWTX/fC3WA0/2alX+/9P121Q==
X-Received: by 2002:a65:6544:0:b0:3c1:afab:dba3 with SMTP id
 a4-20020a656544000000b003c1afabdba3mr19189062pgw.557.1651697231631;
        Wed, 04 May 2022 13:47:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a17090a7d0500b001d7faf357b7sm3792038pjl.4.2022.05.04.13.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 13:47:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Upgrade to tip of trunk
Date: Wed,  4 May 2022 13:47:09 -0700
Message-Id: <20220504204709.2705089-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 20:47:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165226

brings in pre-work for submitting rv32 port

* 6e9d2370 use __fstat instead of __fstatat with AT_EMPTY_PATH in __map_file
* 05a55868 provide an internal namespace-safe __fstat
* fb10dc28 only use fstatat and others legacy stat syscalls if they exist
* 2b754a54 drop direct use of stat syscalls in internal __map_file
* c9ba0769 provide an internal namespace-safe __fstatat
* 7edbcbeb drop direct use of stat syscalls in fchmodat
* 9a937495 drop use of stat operation in temporary file name generation
* 12a757b3 only fallback to gettimeofday/settimeofday syscalls if they exist
* 41149ea8 only use getrlimit/setrlimit syscalls if they exist
* 8910efd0 don't remap internal-use syscall macros to nonexistent time32 syscalls
* 03f71251 remove ARMSUBARCH relic from configure
* 55b727d7 add missing POSIX confstr keys for pthread CFLAGS/LDFLAGS
* 8cf87b30 fix incorrect parameter name in internal netlink.h RTA_OK macro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4b854013608..fde5fc0ccec 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "7a43f6fea9081bdd53d8a11cef9e9fab0348c53d"
+SRCREV = "6e9d2370c7559af80b32a91f20898f41597e093b"
 
 BASEVER = "1.2.3"
 
-- 
2.36.0


