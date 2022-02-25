Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C47DC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.6927.1645799282405963714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3JMX4qfQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id bx5so4902450pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w6JmQYre9/lrWXUqoX0HnjhrQqkbQ59kfkuwPElkG0w=;
        b=3JMX4qfQxsXc9XZull1tcrHvNOkLjVo7m27CQIFNWbl5VKdoSMKTtcYornsoHAUJh3
         Pwd7U2gMFxlihKjhwXsctN7Tk1i/SlnMfUt0G9VblSTg2bePdgffcTDiaftJtZ4WzLM0
         XoCdciYoDUh/Cm8dRi3dPhf+aXolCovuIuGBVXEeIj/gM1Y1v/dMcEvUWU84bwEagTnQ
         CpUoFZOoONvJH0PfpxT3O/H+lo85Ec3nZugMsoiznEqZVapT1jhxROIWMumNll+n2q0B
         Cl8RnzizfW0nAlJZZuvI2HyZmZnfyVZnBOj2qVrRRV/t8V2HSVjb0qCx1T304i6DQAvU
         7N4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w6JmQYre9/lrWXUqoX0HnjhrQqkbQ59kfkuwPElkG0w=;
        b=23bIzOzKwH9lT5kCng9DHzKmpPNo7ERpajLg4sf3kc2g/rT4UNxk/Ueoc9/QwAc29B
         rsGkUSNdC3ISoRZerFQ+wjZHrO3QNrwmH1RSwyINk5F8tsodFcRkBjzoWEVOMxeeU8Rd
         kWlENmdv82cgMGC2wBDmubtSGcKqb+/otCdthUoY/5np0tjGA7lAvUUBfIyEPyP10CbV
         QtdePlFk69r3C2+omG2kRsS2Ne6WjW/UZMs5q+YoNuwEIC9bORnTz05uiqxWCj9zsyat
         WWkK2C44plazIebcZ8GDPpD+yEIbJReYcYJ+xaEGQ+hNp5ARclS6hCFZjD67eiPjK11+
         28fQ==
X-Gm-Message-State: AOAM533xdxPHG6CWSTKKENonL9BEL7LlvXi7PpVYwYsMeSgMOli8NwLw
	AoKgO6VRRsrC9Epf7HM4V7MUv9ZgIr9Gi+GP
X-Google-Smtp-Source: 
 ABdhPJzhnjQ3jSSptMTa4qstvTCtzE/qjLpgkdtM90ZKwZbKVC6KjcQ1XlnDCX6C8sSHoGpxdc9rSw==
X-Received: by 2002:a17:90a:aa98:b0:1b8:5adb:e35f with SMTP id
 l24-20020a17090aaa9800b001b85adbe35fmr3405093pjq.192.1645799281437;
        Fri, 25 Feb 2022 06:28:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/50] grub: add a fix for a memory leak
Date: Fri, 25 Feb 2022 04:26:12 -1000
Message-Id: 
 <a9d0155842f0582a0d247c81bf972661f0a2cda8.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162378

From: Marta Rybczynska <rybczynska@gmail.com>

This patch fixes a memory leak in grub's syslinux parsing. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...slinux-Fix-memory-leak-while-parsing.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch

diff --git a/meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch b/meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch
new file mode 100644
index 0000000000..d8c21d88f7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch
@@ -0,0 +1,43 @@
+From ea12feb69b6af93c7e2fa03df7ac3bd1f4edd599 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 15:31:53 +0000
+Subject: [PATCH] syslinux: Fix memory leak while parsing
+
+In syslinux_parse_real() the 2 points where return is being called
+didn't release the memory stored in buf which is no longer required.
+
+Fixes: CID 176634
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=95bc016dba94cab3d398dd74160665915cd08ad6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/lib/syslinux_parse.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/lib/syslinux_parse.c b/grub-core/lib/syslinux_parse.c
+index 4afa992..3acc6b4 100644
+--- a/grub-core/lib/syslinux_parse.c
++++ b/grub-core/lib/syslinux_parse.c
+@@ -737,7 +737,10 @@ syslinux_parse_real (struct syslinux_menu *menu)
+ 		  && grub_strncasecmp ("help", ptr3, ptr4 - ptr3) == 0))
+ 	    {
+ 	      if (helptext (ptr5, file, menu))
+-		return 1;
++		{
++		  grub_free (buf);
++		  return 1;
++		}
+ 	      continue;
+ 	    }
+ 
+@@ -757,6 +760,7 @@ syslinux_parse_real (struct syslinux_menu *menu)
+     }
+  fail:
+   grub_file_close (file);
++  grub_free (buf);
+   return err;
+ }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ef409bdd6a..c965f0fd15 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -74,6 +74,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0025-affs-Fix-memory-leaks.patch \
            file://0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch \
            file://0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch \
+           file://0028-syslinux-Fix-memory-leak-while-parsing.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


