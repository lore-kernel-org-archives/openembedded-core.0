Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79272C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.6937.1645799251450035242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YcgJnMCY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id bd1so4924414plb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qmm7xv46iSCaOORd7DaSRNIYPdt9jw0CL8Qfc2zJzuE=;
        b=YcgJnMCYZhkC1aRgGWvcyjb9JWDA/+nEwGwNW7kTB/CL0ctEAml4WaAHgO+f6m4+Zi
         3KIIl9jzMJ3tQUw3RNlf6pMjacSEQ8a765q0FiE39QGNyMuydNSeOwxF1wGd6CVU05pK
         XRB6sBFz4L4Iv9yqCGeVyME5dTFJVRypxVLX7ZFEuhyVCqaemHHwzV5MxkCnKJxJMDgN
         wS9v2dQdAyR9WkpkqFRqgJoqanUx/O92iOdAl8ivFoyycKfjEWv5EtFkUECyc9ILgYWo
         o+PzZkE1QHura+cPpCE+zz14ntFu1NT+/PCtug8tA2FMeIXXyKD/nFqwhpeeCnGbzHGy
         9SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qmm7xv46iSCaOORd7DaSRNIYPdt9jw0CL8Qfc2zJzuE=;
        b=r7lEua/+BgFDv21Km2Q9damhAkGh03wt8OBxWZI1Y+pxT9GGAqZlq4y/IDKR5c5/Kf
         vJakmodQJdUFMu44f3Fl9b+9I4TgJn31up4VcUGMkQnCB+V8KphZwWhEhRDH6iMZPPVQ
         2IYphfGmHzrgPQLJ9dGRMHJokXr3sq1SDpV3d5bukiXRa+bsPSCFslO3A/OLHyUiQ1QF
         /8YSUXosGSHFrGcSvuADsgMzZQqAwDB2Rep/itJ/gxY0FDXaWcL7g0YuXArhqO8oLuxG
         zHtfkx9oqDLeoi1ioR5eRk+r9hkvHXvCmQWYlE7oSQ+k68TlQDD7cd+AthGu1mpiuN8P
         MuMA==
X-Gm-Message-State: AOAM532xOmIMpVMVqCUaH4acQmsyOclic0mwiza6kOjwIaJWmiDXwZAD
	LXtlQ5n3H6+z4g6CrhOpKlqx2EmtV/svkosC
X-Google-Smtp-Source: 
 ABdhPJwnB82FnMsrBYXixxPbQnOw5tWVi4DKFnZd3FnjCC60a1yiPAL53mKKUKm7cEfWJdKKw9D6Xw==
X-Received: by 2002:a17:90a:c08a:b0:1bc:b573:2fe4 with SMTP id
 o10-20020a17090ac08a00b001bcb5732fe4mr3420339pjs.194.1645799250529;
        Fri, 25 Feb 2022 06:27:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/50] grub: add a missing NULL check
Date: Fri, 25 Feb 2022 04:25:59 -1000
Message-Id: 
 <c443bd15c975d05ca7afc44e81bda1e974833e36.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162365

From: Marta Rybczynska <rybczynska@gmail.com>

This fix adds a missing check for NULL pointer from an external source
in grub's kern/partition. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...heck-for-NULL-before-dereferencing-i.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch

diff --git a/meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch b/meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch
new file mode 100644
index 0000000000..af9fcd45cc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch
@@ -0,0 +1,43 @@
+From 0da8ef2e03a8591586b53a29af92d2ace76a04e3 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 23 Oct 2020 09:49:59 +0000
+Subject: [PATCH] kern/partition: Check for NULL before dereferencing input
+ string
+
+There is the possibility that the value of str comes from an external
+source and continuing to use it before ever checking its validity is
+wrong. So, needs fixing.
+
+Additionally, drop unneeded part initialization.
+
+Fixes: CID 292444
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=bc9c468a2ce84bc767234eec888b71f1bc744fff]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/partition.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/kern/partition.c b/grub-core/kern/partition.c
+index e499147..b10a184 100644
+--- a/grub-core/kern/partition.c
++++ b/grub-core/kern/partition.c
+@@ -109,11 +109,14 @@ grub_partition_map_probe (const grub_partition_map_t partmap,
+ grub_partition_t
+ grub_partition_probe (struct grub_disk *disk, const char *str)
+ {
+-  grub_partition_t part = 0;
++  grub_partition_t part;
+   grub_partition_t curpart = 0;
+   grub_partition_t tail;
+   const char *ptr;
+ 
++  if (str == NULL)
++    return 0;
++
+   part = tail = disk->partition;
+ 
+   for (ptr = str; *ptr;)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7cf4d64149..94b89aa643 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -61,6 +61,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
            file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
            file://0014-zstd-Initialize-seq_t-structure-fully.patch \
+           file://0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


