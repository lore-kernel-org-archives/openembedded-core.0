Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1E8C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7068.1645799258038303979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Z77XP3Jr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id bd1so4924740plb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gbtQoLwzdjzGJl9NfehiaTdhD8sKcyw3PxN3k6xx56w=;
        b=Z77XP3Jr8CAyrXReJoN8zVGxvD7I4Nur7mZzKLRCrtREkGItTYBMIVlsHjhOKVlMpv
         7WNcc+RkmgRe2uWHWeT9h2EoDkmohSPRwOAL4OT7HmeCReez6r5FqMVlP/jmU61TqAIQ
         /kBUwNYrJ6m/nQyisW+jaBq4Aa+D9Ih40Ox4iRzABA3c63B6IdiIpnW5VS7hAM7chP7k
         RhomfODahRhqmz/GuWAyYZs5MGF0+Xz195kUBt8U+2tTiBjVo+mIuprWSIUQSifgKwFy
         5uGqocb6mCSWWgU6NkAUBQLx27jR3RgqKpoBC85rsnADOfaC7ok/M/7q3tjzBzd1FFbl
         LtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gbtQoLwzdjzGJl9NfehiaTdhD8sKcyw3PxN3k6xx56w=;
        b=X7xd4GWb289QZ320wPjp/yZHAPNBa9JbNe+6BHH6R+mtEmBBXKW9VI0FXgILyp5kv2
         iLxDhMzBO7YChItXcs1E6ZaHbkmHnCth1VzVvxEU6PEM7dvDLUlVUmGV77DK1ObC6UWs
         JAGU001wQ8KH+puJ1G430DMgAMPvEyxf9wYFkAvFOR32hxHkD+VlHsCriTBvbke/sZYP
         LwmEWgaRpwTKI/PvRRi7UY4OnOgzpy0IMF1CHdW6pl+44Y7XSSNG1JQaaWkNDBz5XRyk
         tDYa3btwfMvujshkaZGxKDIF0qQLBoENDHzaKR5a//sSfw7eLc7ndJr9NRZNr7OU4hMG
         UWbA==
X-Gm-Message-State: AOAM53384Rbq37XuR/TWvgh7YEtThOJGsuCrNp8Nb1bxg2fRVTayAfYF
	XqHD9qGbk9KBvYqGP4CMGlKdQip0lVjs35QN
X-Google-Smtp-Source: 
 ABdhPJwcPDxPlZG8WMLI6PYlOAGbR2ivh4uga/zklzqF5szJnlZMsQe46M+83N6H18mJbQBzBoGdKA==
X-Received: by 2002:a17:902:da88:b0:150:f47:24ac with SMTP id
 j8-20020a170902da8800b001500f4724acmr7647261plx.73.1645799256962;
        Fri, 25 Feb 2022 06:27:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/50] grub: fix a memory leak
Date: Fri, 25 Feb 2022 04:26:02 -1000
Message-Id: 
 <eb899a83bab5ab12143bd75a96427fa7615f2a6e.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162368

From: Marta Rybczynska <rybczynska@gmail.com>

Add a fix for a memory leak in grub'd disk/ldm. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ory-leak-on-uninserted-lv-references.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch

diff --git a/meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch b/meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
new file mode 100644
index 0000000000..26932f674c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
@@ -0,0 +1,50 @@
+From 3e1d2f1959acbe5152cdd5818d495f6455d1a158 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 10:00:51 +0000
+Subject: [PATCH] disk/ldm: Fix memory leak on uninserted lv references
+
+The problem here is that the memory allocated to the variable lv is not
+yet inserted into the list that is being processed at the label fail2.
+
+As we can already see at line 342, which correctly frees lv before going
+to fail2, we should also be doing that at these earlier jumps to fail2.
+
+Fixes: CID 73824
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=156c281a1625dc73fd350530630c6f2d5673d4f6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/disk/ldm.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
+index 54713f4..e82e989 100644
+--- a/grub-core/disk/ldm.c
++++ b/grub-core/disk/ldm.c
+@@ -321,7 +321,10 @@ make_vg (grub_disk_t disk,
+ 	  lv->visible = 1;
+ 	  lv->segments = grub_zalloc (sizeof (*lv->segments));
+ 	  if (!lv->segments)
+-	    goto fail2;
++	    {
++	      grub_free (lv);
++	      goto fail2;
++	    }
+ 	  lv->segments->start_extent = 0;
+ 	  lv->segments->type = GRUB_DISKFILTER_MIRROR;
+ 	  lv->segments->node_count = 0;
+@@ -329,7 +332,10 @@ make_vg (grub_disk_t disk,
+ 	  lv->segments->nodes = grub_calloc (lv->segments->node_alloc,
+ 					     sizeof (*lv->segments->nodes));
+ 	  if (!lv->segments->nodes)
+-	    goto fail2;
++	    {
++	      grub_free (lv);
++	      goto fail2;
++	    }
+ 	  ptr = vblk[i].dynamic;
+ 	  if (ptr + *ptr + 1 >= vblk[i].dynamic
+ 	      + sizeof (vblk[i].dynamic))
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a8ee0dd68a..2fccdc2d62 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -64,6 +64,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch \
            file://0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch \
            file://0017-disk-ldm-If-failed-then-free-vg-variable-too.patch \
+           file://0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


