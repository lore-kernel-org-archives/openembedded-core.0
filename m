Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788F8C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.9112.1645178806679543652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ehG2HWbp;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d27so13657078wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ll/n0CqAy52XTPPZ01U0wy//jTdAPdZsfez4jhJGPA=;
        b=ehG2HWbpaV75f/v7Opb9nb/eju954MGcbe3kxZTS94fxvPOEUX8+Bj/c3LE+Dg46gA
         CszbaCKsHKUHedz2gKi8F1TCmIP6CLgcjIjsFo2bWZZYRBYGkVrD8Q0UHZ8XhzTUzDen
         e8jeGiWTg/+1lnXpdQoJtfRtYK1YWLD0Xh3WagvcA8erwQu/rYD9D6I1pzMuAMOv3LZ/
         JWewmIuxyu0qAo3P+LOnyGu2qlAxz1NRpPWMn4fy6niwhXXuTgeHE5s005X7OK2J5ila
         PEcpB/y4SLKNbvIfKRU6InIRRn2/W7IB0OQjbsLgNcklF9Izr0DgtnxKtXHVwJq+0lQV
         Gfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ll/n0CqAy52XTPPZ01U0wy//jTdAPdZsfez4jhJGPA=;
        b=aZWwoL22x98TXVi1QLjz94UKnFYNV6l6aQk9wz/s1OL1ACdzaLdke1bk1sOjDmPmWm
         FWAxyn1bWHHKo/6eCCn5jL5FsjEWmqQ6kYr+GFnod+SGR1yCqd+pNK/krAP+yNDjbbRi
         7/2tDlDonqINz1YOAxFvNeKLHIp9WleHCnjeNnQ0FeecosEkQgOb9MRdl4/nyLb10Q5G
         PFgkZ8NTF+EF2yQ6KEqDVYZfTtby7EZVS8TP1tA8QENSkqa2MoRerZFKXGyp+Ey6XDs6
         uMbt7vI99+OKiSn0D0yXZxagFannZegRr9YQTkuTGN5cIjGr7Zan81RiT6s/0Haxb6UI
         N4eQ==
X-Gm-Message-State: AOAM533l81Hx2uv3JLckv5iBctkgSvI8UswxTp+48pyvk8qxdgjn6p6h
	rn7gCOtHCtcgXCBkac3B5GU=
X-Google-Smtp-Source: 
 ABdhPJy+gEl3VZHOlh6r2JCy/jZcp9fo7zpvHLDAkCPLv6G7Cp4J2KcMESfQXYTUgqHAsfwDhpbwjg==
X-Received: by 2002:a05:6000:2aa:b0:1e3:d43:f5c with SMTP id
 l10-20020a05600002aa00b001e30d430f5cmr5389134wry.178.1645178805267;
        Fri, 18 Feb 2022 02:06:45 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:44 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 27/46][dunfell] grub: add a fix for a possible NULL
 dereference
Date: Fri, 18 Feb 2022 11:05:35 +0100
Message-Id: <20220218100554.1315511-28-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161915

This patch adds a fix for a possible NULL dereference in grub's
libgcrypt/mpi. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...pt-mpi-Fix-possible-NULL-dereference.patch | 33 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch

diff --git a/meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch b/meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
new file mode 100644
index 0000000000..08299d021e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
@@ -0,0 +1,33 @@
+From d26c8771293637b0465f2cb67d97cb58bacc62da Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 10:41:54 +0000
+Subject: [PATCH] libgcrypt/mpi: Fix possible NULL dereference
+
+The code in gcry_mpi_scan() assumes that buffer is not NULL, but there
+is no explicit check for that, so we add one.
+
+Fixes: CID 73757
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ae0f3fabeba7b393113d5dc185b6aff9b728136d]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/lib/libgcrypt/mpi/mpicoder.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/grub-core/lib/libgcrypt/mpi/mpicoder.c b/grub-core/lib/libgcrypt/mpi/mpicoder.c
+index 7ecad27..6fe3891 100644
+--- a/grub-core/lib/libgcrypt/mpi/mpicoder.c
++++ b/grub-core/lib/libgcrypt/mpi/mpicoder.c
+@@ -379,6 +379,9 @@ gcry_mpi_scan (struct gcry_mpi **ret_mpi, enum gcry_mpi_format format,
+   unsigned int len;
+   int secure = (buffer && gcry_is_secure (buffer));
+ 
++  if (!buffer)
++    return gcry_error (GPG_ERR_INV_ARG);
++
+   if (format == GCRYMPI_FMT_SSH)
+     len = 0;
+   else
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index be35ac04ef..ef409bdd6a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -73,6 +73,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch \
            file://0025-affs-Fix-memory-leaks.patch \
            file://0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch \
+           file://0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


