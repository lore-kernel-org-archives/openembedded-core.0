Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BB1C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1104.1652811956813727261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MuGnXhll;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso3282400pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/Jp4mWP6qvgn9kLtuMmMaGSAQ8uUeEbBme2YK5ER/9M=;
        b=MuGnXhll+2NfBa9GI/MabV8JYNhWPalzJ0yIOphRoKWMsyMZ9naI68Drmw8HMprdUC
         n54yEmFVYs0M7HK89lbduakIe32ldxtmaWWuSpsoKjSzqfaGjI9kNNqmCHEXEW9MODll
         IntrswN0IwU2l+JpBTHbUjdxbF/g2i6pTOFzwiH6YHx1NwzbXvOdZfPP/QbNbweSVzC6
         db+6Bubf+X1x9ovLcHD7vHimF3RBobdC3vvoee4lWuTaCzN83rsnHDF3vP5iOiQ4knXC
         Fp9wa7FQmmO8Yjxgg4ul810ByaeplqAsYfGZysA7P5vOE4EBBQHmP3bSPBeaoxJDdDwj
         5PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Jp4mWP6qvgn9kLtuMmMaGSAQ8uUeEbBme2YK5ER/9M=;
        b=PWSluOnv8G7gwdciCqBw4mon5qkBgTh3Q4d2Kw2PyPs6Xn+8ik+XMJ4k47i4GY5laH
         s5nZxQFoU3tuimSQymSIufjvVxmYmjYnhNBqE3XP49Asm77Qg3BqKwqB8Lw/TMUWNvfr
         OSAJX3OvA8/MdwUpjYJSmZc/ZzeKNBifzmhPwNcDIkIp8Wf8EEq9byQxk7rxKqnrcGQi
         PIfcnipwIR3+nncSpLFQwKL/9duJWGLl7fK536toPMTNOD+Zzw5gGhJYbzGhSZ59FHn4
         1LOYxxbTUhudFRlSwA34bKk4tvn9cs+z9h13G1w7KWqvzQ3bJSvhvlr+sN/CNrlIDsS5
         dyIQ==
X-Gm-Message-State: AOAM533eauLd5HB8ExG5D5OBCs6OG7E/MHCOA/jmPW1sH3Ds+cf52DWN
	OjsKQ1JH0/irePrs6+6p/BaDQuGgWiP5FCzx
X-Google-Smtp-Source: 
 ABdhPJxQgOl4dcFT7MtrugVEL9HNCB/tZtrnRleATWErGWLYfsKLrWYa/pDi8bnEDZbjY/PgdKo7wQ==
X-Received: by 2002:a17:902:d485:b0:161:b4bd:a43 with SMTP id
 c5-20020a170902d48500b00161b4bd0a43mr2547494plg.77.1652811955517;
        Tue, 17 May 2022 11:25:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/31] base-passwd: Disable shell for default
 users
Date: Tue, 17 May 2022 08:24:17 -1000
Message-Id: 
 <ec9e9497730f0a9c8ad3d696c8cdcec06267aacf.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165775

From: Davide Gardenal <davidegarde2000@gmail.com>

Change the shell of all global static users other than root (which
retains /bin/sh) and sync (as /bin/sync is rather harmless) to
/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3bc4d7a0a39a96f6e8d340e1b2654d47475f07)
Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
new file mode 100644
index 0000000000..bfaa786018
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
@@ -0,0 +1,57 @@
+From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
+From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+Date: Mon, 18 Apr 2022 11:22:43 +0800
+Subject: [PATCH] Disable shell for default users
+
+Change the shell of all global static users other than root (which
+retains /bin/sh) and sync (as /bin/sync is rather harmless) to
+/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+---
+ passwd.master | 32 ++++++++++++++++----------------
+ 1 file changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/passwd.master b/passwd.master
+index e1c32ff..0cd5ffd 100644
+--- a/passwd.master
++++ b/passwd.master
+@@ -1,18 +1,18 @@
+ root::0:0:root:/root:/bin/sh
+-daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+-bin:*:2:2:bin:/bin:/bin/sh
+-sys:*:3:3:sys:/dev:/bin/sh
++daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
++bin:*:2:2:bin:/bin:/sbin/nologin
++sys:*:3:3:sys:/dev:/sbin/nologin
+ sync:*:4:65534:sync:/bin:/bin/sync
+-games:*:5:60:games:/usr/games:/bin/sh
+-man:*:6:12:man:/var/cache/man:/bin/sh
+-lp:*:7:7:lp:/var/spool/lpd:/bin/sh
+-mail:*:8:8:mail:/var/mail:/bin/sh
+-news:*:9:9:news:/var/spool/news:/bin/sh
+-uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
+-proxy:*:13:13:proxy:/bin:/bin/sh
+-www-data:*:33:33:www-data:/var/www:/bin/sh
+-backup:*:34:34:backup:/var/backups:/bin/sh
+-list:*:38:38:Mailing List Manager:/var/list:/bin/sh
+-irc:*:39:39:ircd:/var/run/ircd:/bin/sh
+-gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
+-nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
++games:*:5:60:games:/usr/games:/sbin/nologin
++man:*:6:12:man:/var/cache/man:/sbin/nologin
++lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
++mail:*:8:8:mail:/var/mail:/sbin/nologin
++news:*:9:9:news:/var/spool/news:/sbin/nologin
++uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
++proxy:*:13:13:proxy:/bin:/sbin/nologin
++www-data:*:33:33:www-data:/var/www:/sbin/nologin
++backup:*:34:34:backup:/var/backups:/sbin/nologin
++list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
++irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
++gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nologin
++nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
+--
+2.32.0
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 9a27ad3ab5..ef7792ae49 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://input.patch \
            file://disable-docs.patch \
            file://kvm.patch \
+           file://disable-shell.patch \
            "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
-- 
2.25.1


