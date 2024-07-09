Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F216C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.4645.1720553410376633760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jGFaIQhN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7594c490b04so3805539a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553409; x=1721158209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za+OXcOLUquw5Ndo5AkywInwn3j7QxXkfO6T9dI8l/I=;
        b=jGFaIQhNtcBjeCsgJD5C++IaM3lRYJLdFzrtPLxsK9SIGIZdrVPqX0HeOm1yZF5zpy
         3EV789aupTs+F8Qc3iat3HkiYr9fAKMc06TQ3xEotI/vHUKz1CEdAti64ZVyc2hsP5J8
         8xEavZS2lnSI280IIR3en8dIf+d6E3FOmNTYF4FwzflAqIVqX6T/nrYCydRtG7+kRp+A
         0kabssZaEwmq7nb2zVJiF9ar7lReaYk9snXJTHTLsKoak+wtmKl4aGlt0igjYcNKvMAO
         0vJdQqGULLdnKqBPnmyYDhiXfxIg1+lr8bNSwcQVlGYsv43ZoGX59UVxAwcKv+4U/xzB
         MsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553409; x=1721158209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za+OXcOLUquw5Ndo5AkywInwn3j7QxXkfO6T9dI8l/I=;
        b=MBmuKr45WAFy45/DQVpPKyj8tPBQOEFFn2iKXc4CSDazbKBxDFbYy43M3RAg+vjmoZ
         ACX7VZKvUYW44FpclLzFIIe0MUiZ1M4D+S1s19YouDvDSV2Ng4oYXOY3e5Cw5HqTKl6t
         e1FzD3VFsjEBocEUyRvq939JqXRGEC9pRejBf93Aar4Mr0TpjeHbda2IfQhEgq6z97MQ
         /z9D/ZOiU9ti5po5+NpgLpyZbuR5X2Ie1+JdmjryFE4UvzoYS1bEfriWR+yzN8zWzWJM
         RRU2FtyD3vDuEkWIPsH0NnzaQvzhuJCJiL4voHnWm+g76BDWFYfVIYAcC2yNH4UFbIC5
         lBtw==
X-Gm-Message-State: AOJu0YyfrkucAfomCY8UVbLBP8aXshfaPWB3YiRPBinXetCXq/wpUNBt
	oT+CUHm4Y1jopZzwxwxE1S92M6RsecnpNt6drMD76fDLlxSY1COhy+BBeFaXjw2dCxXn7JWYRlZ
	Q
X-Google-Smtp-Source: AGHT+IFNoAhjUugjfr2KBnLA+YoTI9WOMfyTmVfUPQuwraC1UcZHg1DiLng3af1Cvf+dNpvQPd4BhQ==
X-Received: by 2002:a05:6a20:914a:b0:1c2:8e11:5ad0 with SMTP id adf61e73a8af0-1c29821db7dmr3988250637.25.1720553409563;
        Tue, 09 Jul 2024 12:30:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/7] apt-native: don't let dpkg overwrite files by default
Date: Tue,  9 Jul 2024 12:29:56 -0700
Message-Id: <30cc69f094729e3d11dc6021daf77f5038c4de61.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720553275.git.steve@sakoman.com>
References: <cover.1720553275.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201676

From: Changqing Li <changqing.li@windriver.com>

With --force-overwrite (implied by --force-all), dpkg will not abort
when a package overwrites files from different packages. As this can
also lead to "The following package disappeared from your system as
all files have been overwritten by other packages: <package>" and
subsequently broken dependencies, this makes the simple case of
conflicting files hard to debug.

Instead of finding all possibly required force options, only disable
overwrite for now.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Take back from https://git.openembedded.org/openembedded-core/commit/?id=4292387ef6c4e80428bad6a07c844a288b27d9a1
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index fb4ff899d2..e688d30cae 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -111,7 +111,7 @@ Acquire
   AllowInsecureRepositories "true";
 };
 
-DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
+DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-force-overwrite";"--no-debsig"};
 DPkg::Path "";
 EOF
 }
-- 
2.34.1


