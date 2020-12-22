Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.8343.1608619605400453292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 22:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oYgedDG0;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id q1so11106057ilt.6
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 22:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xNxMqzcfIHWSnQZLn6UPt/fb5mskWVjFzhSgXHM+2wI=;
        b=oYgedDG0dvCrnRFYT7zaxiyXohU9axPA4URiD2LBHMF+oFm/IqbgHUgwL8tzHUkwju
         F8I6dJ4FsC8ln62dZNsCWxwPyk8MTXsGUBNWJQgM7BxtVqBXfjRhSbCytEJNsTA5LaBU
         JIBtyLmHXpnJkDkFi/uW2k1+CkAanY8WFHJTw7ciEka8NnKnvbcffoeSDIo6zepwvKmX
         cySWWCcYk429dyWWcYwAzJJbVe5EfXGjAJYidNckokIiAG3W65nULMYHl3Ha/asY56XU
         z/Kb5ymwkLgIC2OhW7N+wioSgfYhGqF3m0Y4KNT0iHnqIri+okNu8+GZ1/pM/koudQ8Y
         7W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xNxMqzcfIHWSnQZLn6UPt/fb5mskWVjFzhSgXHM+2wI=;
        b=tphxCswsGKrucS9SVY1ZqPhE0vUrkpeBWEZvPK+nCGyqCdIzG0EnVwuzbeG+8jxcqG
         cmv2tiWIKvAZtZxnxe4SHhvG6Sszp21q9JEqvwM3w4q7RV2MpNFIvg6shy6l+v5igGWx
         Lne5/D6xWdEsF+vzBGlz3N1XPhOyUmyaviNKa/dUw9J5IsF8yD2aFAe5xyBKwVV7pDJz
         /YvD1wLNYvyqXGOyfzgJF0X2VI5LqHa0/xcT/rCtjhyNUTG0GRkt0SVyu7MOU/rjkFuv
         fkdo+A4+nEwZqFS491x2PDL8jglVAJF0d6gPd9NjKyPMKVHnIfaEoyZZ7Zx0+kSsaRzs
         Z02A==
X-Gm-Message-State: AOAM5319l/uyvuu7RFADF6326v3u7ZevQIhEYXZ0VGrtoXu5eUlSdJvA
	w+ZsZbENMudN3rpwQBs0fDB0F5L+smMOqg==
X-Google-Smtp-Source: ABdhPJxBpTGX976yhA7zpVhITTVtNiA8L+X5570gEEfLXzzPqQ4iTfjXEg01TBP0mA4ycVF9fz0Gbg==
X-Received: by 2002:a05:6e02:154c:: with SMTP id j12mr19870883ilu.33.1608619604531;
        Mon, 21 Dec 2020 22:46:44 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id l9sm14489188ilg.51.2020.12.21.22.46.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 22:46:43 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] run-postinsts: fix setting pi_dir
Date: Tue, 22 Dec 2020 01:46:40 -0500
Message-Id: <20201222064640.37970-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pi_dir variable isn't being set properly; it gets set to the value of the
*previous* package manager. Given the order of "rpm deb ipk", if the script
determines that the package manager is "ipk", pi_dir remains set at
SYSCONFDIR/deb-postinsts.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index f84a7e18c8..c10fd11e9d 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -20,14 +20,12 @@ for pm in $backend_list; do
 		"deb")
 			if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ]; then
 				pm_installed=true
-				break
 			fi
 			;;
 
 		"ipk")
 			if [ -s "#LOCALSTATEDIR#/lib/opkg/status" ]; then
 				pm_installed=true
-				break
 			fi
 			;;
 	esac
-- 
2.30.0.rc0

