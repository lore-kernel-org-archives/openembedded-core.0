Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74E0C46CA2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 20:34:16 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.76397.1702672452862445994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 12:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEfKfyBl;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ba31cc0d77so836898b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702672451; x=1703277251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNevGlrBIGKYU2Zujkcf47Qjs5MNZlNCX9Y5WrIpmgg=;
        b=TEfKfyBlq3n9MUBibqSdXaucbpgDhBGMuvkk6OKMzHFSq1fgchKpGgHqdcP/7Ziw/F
         gL2lZebGX2A7JHhPEabu+AmGAHRmTR1WmarOtksiv0TeeqssSke/Ab9VNoCOzerwt9vS
         66vyxxCRU53e7oab4B0G7pw/JSuPDsW489D7+zcWXSAp7CnU5jgwnQX/8ku5UBmApJe5
         cd57fAMUistBdoT0/b9hpaElWqyole5pDFi+AAHTUDMNNaL6LFzr6Lc4rZZKHy4MaZxU
         TCR+snyoqkK/1esgNa5g+MFxSReBfddl3I/LnIShnIBBN9/ZSQu2p94qvBp5tAhEvatt
         PpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702672451; x=1703277251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNevGlrBIGKYU2Zujkcf47Qjs5MNZlNCX9Y5WrIpmgg=;
        b=Bc8a2aJZP7aalZPE2gtji6SpNh/Xai9qK1SQZKlE2Ayxc5KDyozcBn0a7FmWWtF+bq
         CgwH6Jg4OKU4yXk/IsyJPPu+jQousO5VrvS+KsHYKUZ3QG2IsB+XvcvIEzSZuY6C+8Rc
         DZ2T4jLveFt4BiZ5BlvTrWx9mvpW7zhMByH6xF9UveFVv5y2xpGYbCyoMvHPz0aOxOAR
         ocrQTEkqPRQpO5tS4Q3dMZirid3uii30Wd64V+wsVEggoQJOjdPeKMSdqg9CrP9oqvBx
         0IT0hRgS02Sjy6j0CJ7r+2uwQXyZAt0+YjKLgD4OQS9ihAyBU/nagEaTBYbp9W60oe1O
         VjAQ==
X-Gm-Message-State: AOJu0Ywaw8li7gz5jfZ/TmQKJe91nwxTIiPJ/wDK+ZLA4WnsIM/hiNeT
	Xz0i9TcWmo56VGd7wImLZcvIou+/DjM=
X-Google-Smtp-Source: AGHT+IGc9Lb4KY1LW4irEEA7BXPpE125W9pmIB3gOkOGnzl6jug/PQohlk0XBxck+N4jnrU7VVXF5g==
X-Received: by 2002:a05:6808:ec7:b0:3b8:b063:825f with SMTP id q7-20020a0568080ec700b003b8b063825fmr13967184oiv.97.1702672451142;
        Fri, 15 Dec 2023 12:34:11 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id bj14-20020a056808198e00b003b88c211777sm3846860oib.24.2023.12.15.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 12:34:10 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] bitbake.conf: Add runtimedir
Date: Fri, 15 Dec 2023 13:34:03 -0700
Message-Id: <20231215203404.2913433-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 20:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192544

Adds the path to the runtime state directory (/run). In particular,
systemd units need to have the correct path to the runtime directory
because RequiresMountsFor doesn't follow symbolic links. This means that
if a unit calls out a directory in /var/run (a symbolic link to /run),
it may actually start before /run is mounted. The fix is to have the
unit specify a directory in /run instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7826e7af96..55166d01784 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -31,6 +31,7 @@ export sysconfdir = "${base_prefix}/etc"
 export servicedir = "${base_prefix}/srv"
 export sharedstatedir = "${base_prefix}/com"
 export localstatedir = "${base_prefix}/var"
+export runtimedir = "${base_prefix}/run"
 export datadir = "${prefix}/share"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
-- 
2.34.1


