Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C114C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 11:57:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.13065.1706529437253736442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 03:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNSXSYas;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a359446b57dso124849166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 03:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706529435; x=1707134235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qk9HRZtawmf/wwHHdJEhZzn62ultFWz7/xtohjcIymA=;
        b=jNSXSYas6Xzbr5xU6uciZRmwH3mLXKH9EtTPrkvvFEGu5xr9vVYHUy+A4viqTjc2Ww
         A5QAroBzhYLSn0rGvT12R37YanwP9wqi82Bh4jGuGpkQlCEK/mKn/Fo0bqqQ63qhgT0O
         G3RG4Pi9YsU7/9//JPAgQw8RO5D9ImZS26zlU6aETDwL6cp4APFllwlTyDe+MIKTm02K
         M6P47/VEItXoUG7CGq60gkV6R8Z002y61LeW56p+BsxJBQAXwrtKEp+ZIJTs/JZHxk++
         S+8nX/4bzc9AtVoY2nKoruMbrAommWBQkb5BZV7w97n82EoY8OhLr5zRIR1M5v0W4zJn
         Y8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529435; x=1707134235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qk9HRZtawmf/wwHHdJEhZzn62ultFWz7/xtohjcIymA=;
        b=PTrc+fkVxsFm8AK+DUFeGpceykuk5uJ+fjG4hdmwu9qqkE3hhl+14N9y3ONoQCWU8o
         AZiPEbr1pd2NtYrmJ3po+YThZza/I6tWOaKnfw9uHKnXRb2lhd+ZolIPlWkPJXQjHXr5
         ZGA3ZBzT6IeGrVr/lRQwOPoINN7EuHkoW5HecaoGZmmYHUTbzhlxh4c2HF/6b/Y6k1bx
         c8OmtPZUfGr/0/RXLF3wJ+DedWrZQOuO2mLP0pEMhrBeIt5KAh81zsxeiw655H4Clnex
         K5iZ+2dOdyW0Z1DHbabRZ3thdrCvykerloHp0JPDETPJco4Pkwqc6effj1KRzC+EB5Gr
         jVNw==
X-Gm-Message-State: AOJu0YwLnW6dpfe5/lPCiKaMT29awK03T/90BOsJwKVYKL3ulP1g30Ej
	LJGVNrh0IS9M36QxCf838HZ8A7NswrliIChPd4qXPwXRRjGXojI0rPrtaJB4
X-Google-Smtp-Source: AGHT+IFUzXO1W9APk1nmhv9L7YOdvQxQC+whQbKRcm3kLXMxef0mzs0BgF7e2Vo47lLDmP4T/nCgSQ==
X-Received: by 2002:a17:906:1912:b0:a35:a71d:81fe with SMTP id a18-20020a170906191200b00a35a71d81femr1994620eje.43.1706529435250;
        Mon, 29 Jan 2024 03:57:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id gx28-20020a1709068a5c00b00a349463a4e9sm3826695ejc.187.2024.01.29.03.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:57:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] classes/package_rpm: do not mangle filenames with % in them
Date: Mon, 29 Jan 2024 12:57:09 +0100
Message-Id: <20240129115709.3517246-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 11:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194456

This causes problems in rpm 4.19 packaging of recipes such as nodejs,
and isn't actually necessary anymore (was added many years ago
against rpm 5.x fork).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index e0f4de42a15..767f1e21b6e 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -219,7 +219,6 @@ python write_specfile () {
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
-            path = path.replace("%", "%%%%%%%%")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -238,7 +237,6 @@ python write_specfile () {
                 for dir in dirs:
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
-                    dir = dir.replace("%", "%%%%%%%%")
                     p = path + '/' + dir
                     # All packages own the directories their files are in...
                     target.append(get_attr(dir) + '%dir "' + p + '"')
@@ -254,7 +252,6 @@ python write_specfile () {
             for file in files:
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
-                file = file.replace("%", "%%%%%%%%")
                 attr = get_attr(file)
                 p = path + '/' + file
                 if conffiles.count(p):
-- 
2.39.2


