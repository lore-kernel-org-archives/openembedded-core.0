Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ADCC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:16:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.5409.1652426177930143472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 00:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=olhX298A;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id m20so14428135ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DYRiBy/mbR11f+vRyl/Gwl8cSPinPc23UyNSY+tbvho=;
        b=olhX298Agk0np9JMn/RPl8yoVV82vwAI5x/N9PNM0JW7ripSNkTDzEEDgi6aEKUJI8
         ss5hFKVDoAF4Td8J4rfIXNJzMaHCftemrR7Mu+ctmiDrUgqqsqHPZSFRFyE7cCS8t+ga
         id3XOhJGVftgIYK8S57XGWk6Sm4B3ABMk91skQR/w5tl3NTYW9YCThCVpzLvBj+I8Y2G
         YenKvu4HGtlfXlaMptrWPXEQ3rh+uvTiBV72Hi78Tk4FSDWyEItIs+c3IoiVO1cuSWIp
         AnaCF+qmU4e5fGqng6YKEICO2mQPp5ZKCuc+XkwhSDs7IHo2MuSbl1UTNM6xYEIYvb0S
         CSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DYRiBy/mbR11f+vRyl/Gwl8cSPinPc23UyNSY+tbvho=;
        b=WR3FX6catnMxnXF6XFB9CxGyQlD8j65nbZS/GtiN7Sn8Kwe6Vg+1uIYLGP+4XxUvE/
         GfnZxQgB9aE9ReU2WxLpWJ8wrVXcDF2u1KXsbEQfL2Sx30DFMv2jGCpkUTzy/uh2jube
         u4SlQQcv1MV0fUhcEWGQ/2sio8eKWa2O78akOaHJEpS57xlJtNN5Xj3vk2dJmG2m5f3H
         UdbO5lJLfi5wAoki0H9sGR/FFR+ijlY8tpXuYoed+CmHHRCZnjaLsMdI030HRBIUIRmm
         QHFHqY1wugM9qbA4FTI6qiBjdXojgHsOZ+qed1PS+pKGhiLujNB5p5+uHt9HgLjPfoLo
         CiNg==
X-Gm-Message-State: AOAM531Pf56q87Fufasw+G8GE2//rA+3vS5jMC6mfFZJpyTqvaICIoPI
	MWLycqfiTjTp+is0fSTtSo4hoHtHChGQDA==
X-Google-Smtp-Source: 
 ABdhPJxdHKYo5vSlFgXBrP0PbXhs0YyYoYp3dNLDHquwznPQ+anrZM5GUkAZXvRwmxm5g/MRoU8TQQ==
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr3088168ejc.721.1652426175722;
        Fri, 13 May 2022 00:16:15 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 hz15-20020a1709072cef00b006f3ef214e11sm467062ejc.119.2022.05.13.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 00:16:15 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH] base-passwd: Disable shell for default users
Date: Fri, 13 May 2022 09:15:02 +0200
Message-Id: <20220513071500.103568-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 07:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165545

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

Change the shell of all global static users other than root (which
retains /bin/sh) and sync (as /bin/sync is rather harmless) to
/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Master reference: ba3bc4d7a0a39a96f6e8d340e1b2654d47475f07

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
new file mode 100644
index 00000000000..dddc93ca353
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
index 9a27ad3ab5a..ef7792ae49c 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://input.patch \
            file://disable-docs.patch \
            file://kvm.patch \
+           file://disable-shell.patch \
            "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"

