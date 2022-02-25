Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD0C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.6925.1645799231909151257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=szbo+D9y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso8587331pjk.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GN9wqylD1az1CyDatjUZLDGS7AxIOgQBN01aRcrbLzA=;
        b=szbo+D9yfkxA/xIU2f7/XJib8FcaooObrdqIBOrR7wzMscR33NTdoBBdKivM8To85I
         O8tqgUy+aZwFScncetKlISxUjdaYCRqndmgyGgA6e395DYEGuXwoKQJM94/rTadjCXGZ
         c6WRa56Npuby6McuP+VfOKpjFUR/Ze3DEwKJUnfjfprs8YtJhSbsJCE7gHUGFvQ0BoRD
         EmJxblylbwdJ2g/LPaH3su6Ng1dQ+xKkcM5P8O3sqUnEWRMQf+ja1ZsukPU24+Q0RYpg
         jePIrXHqap5l7nMpjTE4d7cZk/4wyOGiZq/+TlqmpQWEw1F2fuYYuTQDHZ8jHtsydM6J
         X3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GN9wqylD1az1CyDatjUZLDGS7AxIOgQBN01aRcrbLzA=;
        b=HsfYkd9rIIGE2wdi533RneOp2OWcvNBZzpy15ptbXGGcGSWSYfHCA1UNafZebyDLDr
         Ac6gpmXKUGX8PkAi+yZPNuVPoccGYNvCF1zbwHGh8b5jBXUlwfs/8rGYArHQn668y2DU
         Pcv2qcty8CWAvldJpR9rDyhuKJ2FKzwp0+Mqj9tE9WTsXpNHNyJjB4Xb5MNQvdLljL/o
         kOymNGMBzHRv7+hOw90p0RuXy0xrXhznXc2GXsQeaPU/24wKiFaSLI4Rfct4mBHyvQtH
         HyTO3Rv4fbxVkCHgrB5Mr/1qjFvA1UqgLfbMmEMkTSWCdKs7gpB3RzoPGZbvBbQTbNgI
         ikig==
X-Gm-Message-State: AOAM531MxAWj8jYUlWW0hjnNcEm3rhetVBDXRPkSKZnhHze/kRsFhHd2
	D38iHqnbaAIj5KqSZ8nvfirvfJOeUMTxkWaX
X-Google-Smtp-Source: 
 ABdhPJwTvKC8iLbr76E+Km7czR88dA50eZxzPE2AXqika+ketynqUMq13tj1IDYtgD0s1XLq/BH2og==
X-Received: by 2002:a17:903:291:b0:14d:522c:fe3d with SMTP id
 j17-20020a170903029100b0014d522cfe3dmr7718933plr.100.1645799230939;
        Fri, 25 Feb 2022 06:27:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/50] grub: fix memory leak at error in
 grub_efi_get_filename()
Date: Fri, 25 Feb 2022 04:25:50 -1000
Message-Id: 
 <1b192247fa913c29f5cdf22abe4e71a509b3861e.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162356

From: Marta Rybczynska <rybczynska@gmail.com>

This change fixes a memory leak on error in grub_efi_get_filename().
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-kern-efi-Fix-memory-leak-on-failure.patch | 30 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch

diff --git a/meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch b/meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch
new file mode 100644
index 0000000000..9d7327cee6
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch
@@ -0,0 +1,30 @@
+From d4fd0243920b71cc6e03cc0cadf23b4fe03c352f Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 10:15:25 +0000
+Subject: [PATCH] kern/efi: Fix memory leak on failure
+
+Free the memory allocated to name before returning on failure.
+
+Fixes: CID 296222
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ed286ceba6015d37a9304f04602451c47bf195d7]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/efi/efi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
+index 6a38080..baeeef0 100644
+--- a/grub-core/kern/efi/efi.c
++++ b/grub-core/kern/efi/efi.c
+@@ -415,6 +415,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+ 	    {
+ 	      grub_error (GRUB_ERR_OUT_OF_RANGE,
+ 			  "malformed EFI Device Path node has length=%d", len);
++	      grub_free (name);
+ 	      return NULL;
+ 	    }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f7f2aa892f..04ed8b7b23 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -52,6 +52,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0003-net-tftp-Fix-dangling-memory-pointer.patch \
            file://0004-kern-parser-Fix-resource-leak-if-argc-0.patch \
            file://0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch \
+           file://0006-kern-efi-Fix-memory-leak-on-failure.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


