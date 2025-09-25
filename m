Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2D0CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:20 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.12034.1758807671564404640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qIn7mszg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so799741a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807671; x=1759412471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCWVbaNx91T6OAeuCpid29qNlzbYUJT5wmG1eBSBgpc=;
        b=qIn7mszg0IwG3/EidB/K4NCfVdY/HsM+AQEXSlpoKMD2sk8TLPpr3MJCjQ6T0QtRsg
         Unp4XUL6K0Y7rs+WjIA1KJINQQyb5DTm2dyxBHKBObslux1U2f9jDcus+6WqOsJLRnMZ
         pWIsOW6P7SinHTpC4Wz5ItjFML7bp4G5S3Wki5Zcy3WNgxDBFvvmF40hQer96w7WlUhb
         RMvNuMk+YA77UPZXpYntA5a8i8EkQ6M9NVMttHywPC0nZAyn0kNCP0JaF5HHnYpPz67D
         po6YnYRQYq3X8P4GBmn+pVpgrypaJChFJvCBPv04MrzNyyZXi/183jLgvqauG6NPL+xH
         pJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807671; x=1759412471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCWVbaNx91T6OAeuCpid29qNlzbYUJT5wmG1eBSBgpc=;
        b=qbG/avn/lOXJjrdZ490oJYR/QlvZ5qkDOxaGyrhljAFEldEOjke3HjBNsCfxF94zzJ
         JUfHOsxP0Vt/ccqUoXV5pQHn77IfMkqrtzXnbrIprL6o52QQACj0PtgMzlyKnZsEW1GQ
         +2VXZDGz59WO4IWNL+Yu+rPZ154NNKsIuYRb68Yx+2Z2m5THc6zpLGAgR3i9+KuDu4zu
         foN3Qe9Oxk9lJ7upQjwDpZGjBIturzMy7JmKCn6tvPORWb8aDmanXelMicgAMKz0svPS
         BoByEKfZz1WSwleyIRNkU+qtM5a+i/QNPKD0yGxeTNV92AaOS/D1r/eiTM8AG8x7jloM
         UKxg==
X-Gm-Message-State: AOJu0YyFfdCU4fs83pLBuJHMJZif1sur/X5FIqqkOYBzfRoQtvZ7x7Di
	2deDXlEkHGl2ytrpQfe4b3pTgScOuZEZiAzbVhOOuP8sT5n+tKyBQIzF88u0NFm17l8kknrVCeH
	BtBme
X-Gm-Gg: ASbGncvZEFmAAlhEtDwVPVQR5NbTZz7kM1gOPDZJgmISGxrv5oEf4sxrGOk/r1IX4NK
	UgHL6DRHQ6/PYoLllnukzKVaxjNwU5RZ0nBqk+ZS86Egbm+fdqndF9WoJ24qxXQMTacLCoZ6lX/
	LfK0A2wYpsA4rRd9+rT6me29V6z8TKbsh0KsZwSa/Hba4c1hHL0HVYr1t0m66r/Ld+hKH1bw9+n
	7YffIIx8N3TO+KxcqNuCyJQjCqygCzUxWKvOw+/510q7AcDCppki2SA8PeF8rtqeHOqEaakW9EC
	StQRE2TxmRhkv3FS8zBz8jyeXQqtszV26u8akLA64eEBqL9373dUQRENlxI9Vr6o08gZH5NGb/9
	FqHzu5+lzWgoIBA==
X-Google-Smtp-Source: AGHT+IEDMRceACivECcsWWqBFWbaK9A+8icxc30AMfPiJ3aGRg8cmQ7w+y+/84uhOqebpiZ7lx1Y0Q==
X-Received: by 2002:a17:90b:1b4a:b0:330:72fb:ac13 with SMTP id 98e67ed59e1d1-3342a22cc80mr3543299a91.5.1758807670750;
        Thu, 25 Sep 2025 06:41:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/11] sanity.conf: Update minimum bitbake version to 2.8.1
Date: Thu, 25 Sep 2025 06:40:49 -0700
Message-ID: <95888aa944847cf6dbfac501997a3e2980344b66.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224023

From: Martin Jansa <martin.jansa@gmail.com>

Needed for multiprocessing module in bb used in the next commit.

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
which was backported to 2.8 branch and tagged as 2.8.1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index d2f56a3fb0..5f8d3b7619 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.7.3"
+BB_MIN_VERSION = "2.8.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.43.0


