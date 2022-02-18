Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78635C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.9111.1645178805499788543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ParpQTve;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so6024851wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=walkTcrTgqRkne9zvhXa3s9am5tA6qXFUnkpBRN6bRk=;
        b=ParpQTve1445Dn6P6SrSz5uFHMj5NLmPLE797TkpU8JjMkEp5iE0oUI2BIj+YmBetD
         pAvj5aNWjaXoDZiRRFb83rB8HE54r/bl9yf1PljY+r0G+UKxCtFO+WgXB5uYOjfxC3QM
         MIj/xZuVNNtmFVVM0OlH37C/HFIV5UPW8fRMUKpfaHgd/x3KowGCg5XAr+rI05IXjFZJ
         cnq7w/9kIaBqGuUTfSbftEFW0ov5bU9ruXPLeCB9Rrvn8kHyPjVuiAmV47tUOEcUYgxr
         FgVbgeYGI1E+bSr57pv94AelMsTujAblnT4/s3dBnFR014OK0rjueVk+HC0o4dSMIOJy
         ZbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=walkTcrTgqRkne9zvhXa3s9am5tA6qXFUnkpBRN6bRk=;
        b=eUb09zCYqjtmlefmm352a03oVd8vM2MciC9aoE6FaCmkVVTUXifWVbpocv4Ddzk2Nf
         mAW01EQ/Rxgc0EaXK+l2x2OtgAKEw81vvwpTnb7FsdQMEyKV6n2EptV4sstWrv03gbYH
         o8qfScjoxH/ksZkoJdqQEJ2gBr3A2kvd6M5H8pU4hImhhmg4v4SGSDkRue2D1MsR1bx6
         pOmBUxcMxdqVTYV479qAx/dnigCuUgUt0LUU+dehy87NMkTG2OJy2rq+NAYqv5XRjMLQ
         SVhht13OkMacvzC7CGhN0ojxt5n/JGNyyG04qgJ43nUwk7YWn5kUSbbQFss8EJTcmK7A
         hxIg==
X-Gm-Message-State: AOAM5313oGUsf8FupiWfuMLfDWW7IemzkPMQr+lMdvRKRPFipFJ91dDZ
	gr/OBE1/MvepiITx6X1OmRgS8cfbneI=
X-Google-Smtp-Source: 
 ABdhPJzvdQqt6IGTwFL19+OvzW9VVSX9JQ6TC7QPC7mrbIc88ShsQoswDxO4f4hiLZwqcbjQRHIOYQ==
X-Received: by 2002:a05:600c:4e13:b0:37c:fd8e:28d7 with SMTP id
 b19-20020a05600c4e1300b0037cfd8e28d7mr9883075wmq.51.1645178804078;
        Fri, 18 Feb 2022 02:06:44 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:43 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 26/46][dunfell] grub: add a fix for a possible unintended sign
 extension
Date: Fri, 18 Feb 2022 11:05:34 +0100
Message-Id: <20220218100554.1315511-27-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161914

This patch fixes a possible unintended sign extension in grub's
libgcrypt/mpi. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...x-possible-unintended-sign-extension.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch

diff --git a/meta/recipes-bsp/grub/files/0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch b/meta/recipes-bsp/grub/files/0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch
new file mode 100644
index 0000000000..f500f1a296
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch
@@ -0,0 +1,36 @@
+From 9b16d7bcad1c7fea7f26eb2fb3af1a5ca70ba34e Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 3 Nov 2020 16:43:37 +0000
+Subject: [PATCH] libgcrypt/mpi: Fix possible unintended sign extension
+
+The array of unsigned char gets promoted to a signed 32-bit int before
+it is finally promoted to a size_t. There is the possibility that this
+may result in the signed-bit being set for the intermediate signed
+32-bit int. We should ensure that the promotion is to the correct type
+before we bitwise-OR the values.
+
+Fixes: CID 96697
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e8814c811132a70f9b55418f7567378a34ad3883]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+
+---
+ grub-core/lib/libgcrypt/mpi/mpicoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/lib/libgcrypt/mpi/mpicoder.c b/grub-core/lib/libgcrypt/mpi/mpicoder.c
+index a3435ed..7ecad27 100644
+--- a/grub-core/lib/libgcrypt/mpi/mpicoder.c
++++ b/grub-core/lib/libgcrypt/mpi/mpicoder.c
+@@ -458,7 +458,7 @@ gcry_mpi_scan (struct gcry_mpi **ret_mpi, enum gcry_mpi_format format,
+       if (len && len < 4)
+         return gcry_error (GPG_ERR_TOO_SHORT);
+ 
+-      n = (s[0] << 24 | s[1] << 16 | s[2] << 8 | s[3]);
++      n = ((size_t)s[0] << 24 | (size_t)s[1] << 16 | (size_t)s[2] << 8 | (size_t)s[3]);
+       s += 4;
+       if (len)
+         len -= 4;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 13e2b1600d..be35ac04ef 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -72,6 +72,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0023-zfs-Fix-possible-integer-overflows.patch \
            file://0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch \
            file://0025-affs-Fix-memory-leaks.patch \
+           file://0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


