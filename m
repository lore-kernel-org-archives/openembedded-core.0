Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D210CC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:30:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.5539.1652427014509802551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 00:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DM+6PN6C;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id dk23so14510333ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u4tOs1GD++TK3WcfZBcvokirCwZLVV4KvVlRD61q+1c=;
        b=DM+6PN6Cww/80A1QqXgJ/FUEs4yvs1jNHwMWPMPv2uNBd6qzAsFyDxbRqJkCiLavtK
         1J13tC3vfBSG37f2ABEYTXffSS16jd1mzKyIpw4iloWNfU9Ja/+Q0OVrawzHu5ZHoPJc
         vT47X5CMo61lbNuJngNCff59IWP6U/EVtTGJ+gyann1+a1GbPFaXHk+gkDFEgbaUCzDz
         /u3KrYxmlJJRBDTX42AJFz1xh72w4yUmXlV11IE9mQVF13GJH/42h0Uj+a18x85grdgO
         Lf/s0RzIQ64j3S3cpFGyeWCF9gAAdAUHocnr9gl9uY10PVRw9I6XzFFpb9smW+6og/B6
         xGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u4tOs1GD++TK3WcfZBcvokirCwZLVV4KvVlRD61q+1c=;
        b=3FCfC3tt6KTLJrnLDNXYCO4VDy4JAqEsrsPs1nw/wFh61bfvOPEbZjwHlPyrLfnB+h
         h2OQGxRb2uTch4nrJyfnqNhK5Qo+4LjHJiV/nJppbcVoPGnq/+Xr51iyjqcOFWEMKSXU
         CEXJ9fg33byy/GW9UKm0HFMwLO9LpkZMvRG44jZxuYS0j+lTLCLLvRoUr7NBWxy1XHN6
         QcsDfX2Vp+ZU2tHFSL6ks4eYR7n4fr81VSkQCsLLvegn2o25961cd3koJhv07LnWikqc
         J7An0cXhtjZ/jb6YAbuvhjVhr9CTh4Xd08KpxSJHzFmJtH2m/mRMbs0FDHL8d9f+2re/
         XosQ==
X-Gm-Message-State: AOAM531afXFaUfz6qQqBEnTCSsf43acZWrq8IZF6qv5qTBFCyuywf/hN
	4FSUGu0mkPTQTVLi6gY1MXBnsQt9hHWvRQ==
X-Google-Smtp-Source: 
 ABdhPJzUhxA/bnfyYblxUsbwxNKDu1z0mLqR4OZzfrjnA/3P4hHziRmmS92HxMquuu/ZA4TIbxB38w==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr3060081ejd.567.1652427012392;
        Fri, 13 May 2022 00:30:12 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 b18-20020a056402279200b0042617ba63b1sm596607ede.59.2022.05.13.00.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 00:30:11 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>,
	Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v2] base-passwd: Disable shell for default users
Date: Fri, 13 May 2022 09:29:47 +0200
Message-Id: <20220513072946.105109-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 07:30:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165546

Change the shell of all global static users other than root (which
retains /bin/sh) and sync (as /bin/sync is rather harmless) to
/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Master reference: ba3bc4d7a0a39a96f6e8d340e1b2654d47475f07

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    - v2: fix commit message

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
2.32.0

