Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85204C61DF6
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.18519.1700657111504735903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LWWsirwV;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9fcfd2a069aso500952166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657110; x=1701261910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+/Cjvxf54NUl3zLrG33cM+CDDJTLdZbgDH2N9Nv/2Y=;
        b=LWWsirwVh/XHnTBAgWnoSHWfaGMkGv3fE/ZEmrBUDJhrpxd/sbkK//ltPHhZjH4kKq
         x+aq3ndSzpJdeXCfVLzSR6RyWOGDKWGdEcU6yBuYdXgrgxgQqV75o4/jCEw75AvxudVZ
         OWUR14bdS49GT4N9PPDn2wT7JMeUxXpKnK98yIIRG+ogubMAM0M6NOmIMai7E+LWwQ/O
         BaaletPrHjhqu/hn3buHWk8jioLW42B0Jxti8fa/+rWk4drELmb+sti8KlBGvLxXR47M
         JFev3ZD14FqRNF7utk0Yk5/KBxaAIp+vNmKkdsixg4vlD6KJJYe4r4YfHjh/NOHYhCYJ
         kOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657110; x=1701261910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+/Cjvxf54NUl3zLrG33cM+CDDJTLdZbgDH2N9Nv/2Y=;
        b=HCzoxHdugUn3f8Bi6dT8zmtIFhYXuEZoJFHIBBCpllczHBYC4vHcSG2JRBKSpLj+b4
         hJSTZjMSnhoEY3KiuWgu0THccq40RPDMWc4yIfmJlS7GEaTBz/oxaumqT8FRjJ9VRrSD
         SHkW0vK497qPXbWHp0BCemjmFtl+3fp4vMXwNp3cts3jTeSMHOu8oJIb628rcOQLILmC
         mokKukSkHssZmlZ5m0moqzoHMGOM8fEfiHYSoCspzFTRUU6vzKpYiXUfqXMFEB7AXZj/
         EmSuY1xuTT3Wjt9wKq9W6ZqgX7WJCGAZeBpgBJofKliRrJXw4yEWgp/kIi77BmhudqE9
         8t6Q==
X-Gm-Message-State: AOJu0Yw6Eykl9eMJIXLp5ubavvG8W0CCvCHQhOgO61uo0N3m8jEfBAZ3
	Lv6uw5NK/R/xy8Re2Zl07RPUYI+uHPU=
X-Google-Smtp-Source: AGHT+IGgQH/ZunSONNdZRlWcZrZGLZo5t4lVwGXUGIMQhNbHRjbwGozmj0GC6V82o0i/ayM/MdBSOw==
X-Received: by 2002:a17:906:260e:b0:9ff:ca67:789d with SMTP id h14-20020a170906260e00b009ffca67789dmr1888146ejc.31.1700657109849;
        Wed, 22 Nov 2023 04:45:09 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090648c700b00a0353fd24a5sm1381680ejt.184.2023.11.22.04.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/21] create-spdx-2.2.bbclass: use hardlink as well
Date: Wed, 22 Nov 2023 13:44:32 +0100
Message-ID: <b3a6626a8d7a5b20bcb78093cfe4d64ed7c7b30c.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191079

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index b0aef80db1..8c77f6b886 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -967,7 +967,7 @@ python image_combine_spdx() {
         if image_link_name:
             link = imgdeploydir / (image_link_name + suffix)
             if link != target_path:
-                link.symlink_to(os.path.relpath(target_path, link.parent))
+                os.link(target_path, link)
 
     spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
     make_image_link(spdx_tar_path, ".spdx.tar.zst")
-- 
2.43.0


