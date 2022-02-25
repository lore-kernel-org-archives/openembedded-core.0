Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDCBC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.6796.1645799277727009662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=n27W9H+M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id x18so4819260pfh.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=35w9N6PzfzO3X/ru84lKTxONi2CNnoFoRgWUrYeAR+E=;
        b=n27W9H+MEFZASLtbum1qpBlrT21sfns9yaEx2ud57eVnK8mVbKq9iHHMRCai2V9xEq
         dIe17jWSF8rvnSn2ecm+b1VEVsS56RS4EzcTfLccRLkdu/rvaN0dcKi4dW37hAD2Eh//
         O8t1KXB6hZJXkZbXqMcm9n3LoNUmslG3MQGt7Xnzi9HV2q/Q0GcH2ylG/MrlMCSVstvj
         AveSfZBGBmSP1xVXLiWES3Z8IragWHy02GyTt7irDNAnrNc1wL63/pLGWKGiM9QJvIDW
         gBXT6ix8e7np1hdGuqh37LNzxMbnS4yKCpqNneSDB/l2dy24rPHzBurKHBmxX1ekgZXa
         793w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=35w9N6PzfzO3X/ru84lKTxONi2CNnoFoRgWUrYeAR+E=;
        b=qcSq4yKWEgtKniCUWLUryVe4n5PLhW0a+LDCsbapKgotcIPBP1ubbmQEvoK17tKedQ
         ekd5be5bYc9nTKhCU9XdhJF6Zeb1dVVNrZGRre/AWOmqY8gTAjJ/VHmfT7knMWlo1/xd
         /2DXuVYXRRYfxGNTeS/Se0ekz62EbqjYIrBvQOwrn9W+vKW63ewMUP7Hq/EmdTX6EIuU
         y/PuwS1sIaPm/6k8l/btNEdfP11f0PwTKkbVNcEHou5BO/T2h6t704GEbG2MyS31Ie9L
         vVosLXvYqQLNOQ0CJl7ZBPPQrr0GS/i/BvEnYAn2kmodjbkGJHWIKIpExu77B8KQYqZd
         M7rw==
X-Gm-Message-State: AOAM532C7xHr00YBVs3wpkTwnty0OBgEVZGdD9hZT+/1wQw82rWuO1m0
	1U7I+AS/h6LBStx9fBa7F2WDnc+YBGAGlmLr
X-Google-Smtp-Source: 
 ABdhPJyxlPVnmqd5HwWCXYDgllSyWWzQA+tV8VJDqN9jDgB7XqFe1ne1vUP8VfJwQ+Bzc2e76iYa6w==
X-Received: by 2002:a05:6a00:3018:b0:4e1:de9a:a5a3 with SMTP id
 ay24-20020a056a00301800b004e1de9aa5a3mr8002832pfb.80.1645799276815;
        Fri, 25 Feb 2022 06:27:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/50] grub: add a fix for a possible unintended
 sign extension
Date: Fri, 25 Feb 2022 04:26:10 -1000
Message-Id: 
 <69f6ae604b857eea93022d73fad668df07a7a056.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162376

From: Marta Rybczynska <rybczynska@gmail.com>

This patch fixes a possible unintended sign extension in grub's
libgcrypt/mpi. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


