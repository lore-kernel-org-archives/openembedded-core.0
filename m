Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE3DC3DA40
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.359.1688831791741337778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XIxnt9Fd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b8bd586086so21377165ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831791; x=1691423791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T234txAC8RE23tO9kmy88RMKVpMZ/yaU+MlDZDS0wQI=;
        b=XIxnt9Fd/wX0wkACP31Z5eu13F/X2K7apoXHDBD2809B1YXzjvbGQqWrHfhOsdA3+4
         T1xe78Y+HmJKdTcuBixuKCjt7ZRib+ETeiN7J7JWf8+Dfqv1hSX2fUMU6Qo3BUKHZebo
         GmUQTD3XOqaoTLEOzotBXpujzeOUj1LKZt/KdXIpy0IhKlJ9a+zg+NtYPhs1kbOkM3Vt
         9KstWmVerve9AodAsH3rRjL+odF1XEZzaUGwXs6NIJdvCByGe8al59qjJHDbGgzQWOgw
         uNEQx4EHD0u5X0qnmMrLIm1OAX1PX43panbV7cxhbggGjBJyg5agwr+ljwGdbelFfkhe
         ACDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831791; x=1691423791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T234txAC8RE23tO9kmy88RMKVpMZ/yaU+MlDZDS0wQI=;
        b=ix6as7GrmXbpauRMXRP6jfr14gyKxDln1Wj2Lz2Mh/96QCMhm+RIxwfxR9wrBiTJTQ
         FRliHDudFhLzcjIJZlMBJSZYt0hfq9XmpkuoFObWX/pMIBUyKKn9z+A9fBHBf9Qme0iY
         E06duKoYQObhAUVeQ+x4zBZA4rMtu7bsye8f1XKU0NWXuQmfdMbWbXAzITsrVQK0ZRJ5
         iD43OtUijyYOp0qNJdSEgw8hAz8lbiON5kM2+YYbIiJhI0+cv5q5d/PnE4l9QLw83bIk
         kRRu7sqFlImtUQzpYuZEMtWimboYl4f94VNMFPsyPcjmQ9DtH4Al4D0ds/e6A3sfGmaS
         JP9w==
X-Gm-Message-State: ABy/qLZ5v7Zqg4uBH1Zc6QIQdkGxHQR1JdiFmqfhacscPDvgykUkioD/
	RVaX5SpvdZ0MMtRp/foVmjsM58cfkl5cHHc54FY=
X-Google-Smtp-Source: APBJJlF9dV7X8ejx7971iVSvwF0XIcwgygvks4Dcztt3yXaz5Mnywehb9pHfxefxGggJVNOd+KLMQA==
X-Received: by 2002:a17:902:e5cd:b0:1b9:cc6b:4093 with SMTP id u13-20020a170902e5cd00b001b9cc6b4093mr3657350plf.19.1688831790858;
        Sat, 08 Jul 2023 08:56:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/17] grub: submit determinism.patch upstream
Date: Sat,  8 Jul 2023 05:55:51 -1000
Message-Id: <1fe434d42a3365f232b07864638128b7ac70f627.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184037

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61947762e410c685f667e0af6440fb8a33cd6777)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index 3c1f562c71..bd4e7188ec 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -11,7 +11,7 @@ missing sorting of the list used to generate it. Add such a sort.
 Also ensure the generated unidata.c file is deterministic by sorting the
 keys of the dict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-06/index.html]
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: grub-2.04/grub-core/genmoddep.awk
-- 
2.34.1


