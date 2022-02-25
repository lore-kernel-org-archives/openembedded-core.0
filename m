Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782A6C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.6789.1645799255818207572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7xLlR0aE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id o23so4768447pgk.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PE1DK3ihqqy59je06Pqm+YFKqGLn12qn3Ws2xH/fezk=;
        b=7xLlR0aEoOVw0C15erF7zQDtjUMO33qmTEeCFh9X53hLuqKyPPNd2UZoWonRKS2cKJ
         ZmZs41gn2kqpSfEdyQZ7AtbFWVXnXVfnhvVGbF+5T2gtOyjGSy7QHlMLUIZ6x5ZnU5ql
         A/2M4z7yi2fgaA4C9zTWH8ARIHnwv7xXBpf//JV72x1tkIjzoz3OMlr+bQED+Z8nIkYd
         AUr/c+UAONI6VaCTYlBB2N8+0dKL8sx3c8M3A/poqtI2LZ5Jqh/a5DVpOJ4IwFRs0/8c
         3UwMsi0J3LKxiTG3v9kSbOPSPNrQ02mXZbss8kEXVNeTfNhrg68BI7REdjLB9rhSPZmq
         dtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PE1DK3ihqqy59je06Pqm+YFKqGLn12qn3Ws2xH/fezk=;
        b=GfWLsDXXivRuFPFGhG9irUMqim/7mmAsu+WfjUyVgxkayo/+7c6yP6kDksuPYdx6Bq
         NXA4OowETPtJ2zNw0YGntN4KZYeYKNE+MTLnESQMxjxSxj1XPWD7zsGW1f2UgYfMDLit
         yJBpkP0BsZIbJM/T1e1lgjRJM76UTdr4tYIXAAKTFseoH5AxWe0CTnObUtgpRCAySjye
         YgFWrG3J9aVWVLVU+krqT5JwY+qM9Hc0yzQNq8LQYujXyoNAJ3ImQRiXPxqi2CEVLXMd
         4RblpZSeVKlN2bIDWiJ32qwO66I3QO/HiIcFkNLJnEWOcveqUTlNo+sdVEOgaLpb/fAz
         m17Q==
X-Gm-Message-State: AOAM530h51MJR5mYT0C9TRh0Ygk8gmMIa+e3h/j79h+ZWJLjm2kZM6Ck
	vWs3PovtxIRswpSmER/PVXLfBZLb5iuVo+gA
X-Google-Smtp-Source: 
 ABdhPJxnQiJg3/pJOnDYTsjhnOwaV6nZe/kLzorJHEUetsNCWCZ5clC0CpIYZXzEoI0xsoYFwgmxgg==
X-Received: by 2002:a65:4144:0:b0:374:315a:7dff with SMTP id
 x4-20020a654144000000b00374315a7dffmr6413524pgp.506.1645799254895;
        Fri, 25 Feb 2022 06:27:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/50] grub: fix a memory leak
Date: Fri, 25 Feb 2022 04:26:01 -1000
Message-Id: 
 <444a690c28fa78147273213f2ae19b1a67027a71.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162367

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a memory leak in grub's disk/ldm.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-If-failed-then-free-vg-variable-too.patch | 28 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0017-disk-ldm-If-failed-then-free-vg-variable-too.patch

diff --git a/meta/recipes-bsp/grub/files/0017-disk-ldm-If-failed-then-free-vg-variable-too.patch b/meta/recipes-bsp/grub/files/0017-disk-ldm-If-failed-then-free-vg-variable-too.patch
new file mode 100644
index 0000000000..ecdb230f76
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0017-disk-ldm-If-failed-then-free-vg-variable-too.patch
@@ -0,0 +1,28 @@
+From 253485e8df3c9dedac848567e638157530184295 Mon Sep 17 00:00:00 2001
+From: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Date: Mon, 7 Dec 2020 10:07:47 -0300
+Subject: [PATCH] disk/ldm: If failed then free vg variable too
+
+Fixes: CID 73809
+
+Signed-off-by: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e0b83df5da538d2a38f770e60817b3a4b9d5b4d7]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/disk/ldm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
+index 428415f..54713f4 100644
+--- a/grub-core/disk/ldm.c
++++ b/grub-core/disk/ldm.c
+@@ -199,6 +199,7 @@ make_vg (grub_disk_t disk,
+     {
+       grub_free (vg->uuid);
+       grub_free (vg->name);
++      grub_free (vg);
+       return NULL;
+     }
+   grub_memcpy (vg->uuid, label->group_guid, LDM_GUID_STRLEN);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 479e2f71f2..a8ee0dd68a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -63,6 +63,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0014-zstd-Initialize-seq_t-structure-fully.patch \
            file://0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch \
            file://0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch \
+           file://0017-disk-ldm-If-failed-then-free-vg-variable-too.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


