Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28522CCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45191.1762770140665975969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCeiSD3c;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-343684a06b2so1762786a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770140; x=1763374940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc3bbpE3UGszUcIXyQoVz4pl3GoUY9hzvslfIE9o7dg=;
        b=BCeiSD3cY98iUKovMMEnNJyig9wTLRFQ7ZlTS5d15NCfkQBDF4LxWmWNmB/sdAoKvn
         uFTohUi5mTgZ2dfFSMNvT8tGWd2kWsAI/Mm6/dfdKj3rV8O7zLsGjyh1ch/wy17HcTqq
         DxPSaYhAXd9EPgJEMvN43nw6r+znq+LzF+S8ldaC3kK8Q/xQXNma86hNYpcfSskLOySJ
         Q0UMVU/Az5CXFJk43XhgXIeB285VhC8UL45kpZFODwyDs98oPPs1LCRKIFObxr7Af/Gr
         0uwphk6Nl3MzQQE1mra72uQfiqzfPbPnkxMhCiJcnqedtTFHlv36PiuJWKe51GjRA9YC
         j3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770140; x=1763374940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wc3bbpE3UGszUcIXyQoVz4pl3GoUY9hzvslfIE9o7dg=;
        b=i2bGBPD0HRTgD1AeJro3ezV1aB8dZCUja5kTjP1yPCmNArKtX28BxtogvpuHg4AG4N
         A2RoCzTDSzAbTKcpZHHg+edBR4hoDUyBHP1J/gMk0Kabj5hYigqY7eUj47vSB+WnBOTH
         EZ5WvaHFqPkB/4FgK1o5JrCqoOAUfbQz8eZ0zlBSpllgbzXSW5XhB8JTK2P0RwH9TqzX
         jJ8BamEpnGahb9YYaupDIE5RU48XQo6UaLcMwQl/TFSiKvWKe/11jeMDa9IODDy8UYuF
         mZnsq8PJViA71dL2xLlYW3gqa7hxVHSB1YTpj7bQy2Bb9zIvWSfM5mNXRGG4zuGPegWw
         /qYw==
X-Gm-Message-State: AOJu0YzUlKNXUFvLkLVDnq1+8/DDLUrS/28VeFGE+kqj6OCSwUhKBwlX
	1MCLFG9x6xQQ+bKNBJZLOuiuZlprTAHKCjq4Y2OUe9tBDNwsHfFQhK93bHgbQw==
X-Gm-Gg: ASbGncvP+/MOkKulaEuLlddZsOmAU4Z+yuLCkGNwsXvyjgk4QF8LVvnHxOm1PTByMQF
	CtXqDGJayeJR64SuinaON//fmvSxRiv/d3b9yjgViKlvuNpYPFxXVhLUC+zWeG4+LHBvT+i1Awt
	mx3SwyUSxUQDrfeACF5UEVA20UKGJMRNCqB4gaDmw7/PdZ6tCaq0ZNBILLOmeNm9P25mx+efZwt
	2sbzN4AfuNwU8Gi/0HPC1FNK07uO1GdZQkK4wrxS335mA7c9wjOwZHmTaDTOjLUfrBqMqBxKEzW
	/G+XLbu6LIGqaRRKoPgAmVFoKDgol47npgu/HMB5/jqFuAYkURrIK38NxXSUKFL7haHJZYDA1lS
	VjeX8g0iL0zVunOcq3Z6BhgJF/uLL61sAZBfrh+TsEK3OxR32zmv0I8rbaA7WZNFqFlnfj7uJIZ
	M2oXkYxCC2CcMatbmZi+3nKyASIyLouo29Bxg=
X-Google-Smtp-Source: AGHT+IGZBjeCh3ou3lECLbWIgK7GttayMwRInUQ0JnQVmgP9lmEDQtS+Ub9ToIfgw9Q2sqCO5zHvPA==
X-Received: by 2002:a17:90b:3bc6:b0:336:b563:993a with SMTP id 98e67ed59e1d1-3436cbf7f73mr9545460a91.23.1762770139919;
        Mon, 10 Nov 2025 02:22:19 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:22:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	WXbet <Wxbet@proton.me>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 9/9] ca-certificates: fix on-target postinstall script
Date: Mon, 10 Nov 2025 23:21:47 +1300
Message-ID: <20251110102149.2915435-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
References: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226112

From: Gyorgy Sarvari <skandigraun@gmail.com>

When the package is installed directly on the machine (instead of
installing it in the rootfs directly), the postinstall script fails with
the following error:

/usr/sbin/update-ca-certificates: line 75: shift: shift count out of range

The reason is that the "update-ca-certificates" script is executed with
the "--sysroot" argument, and as the sysroot $D is passed. However on the
target system this variable doesn't exist, so the argument is passed without
this mandatory value, and the execution fails.

To avoid this error, check if the $D variable exists, and pass the --sysroot
argument only when it does.

Reported-by: WXbet <Wxbet@proton.me>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf39461e97098a1b28693299677888ba7e8bfccf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ca-certificates/ca-certificates_20250419.bb                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index f06a30bd6d..01f594095e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -60,7 +60,8 @@ do_install:append:class-target () {
 }
 
 pkg_postinst:${PN}:class-target () {
-    $D${sbindir}/update-ca-certificates --sysroot $D
+    [ -n "$D" ] && sysroot_args="--sysroot $D"
+    $D${sbindir}/update-ca-certificates $sysroot_args
 }
 
 CONFFILES:${PN} += "${sysconfdir}/ca-certificates.conf"

