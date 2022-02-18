Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75566C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.9109.1645178795609315077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dKejATwU;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id v12so13678211wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXh9zbe9r5LGbTTseJpas6s6nKZI99kgm4W8pbG7540=;
        b=dKejATwUgpPemdhZM4kAxcobhldKebEKZHc1wEj68LjWxbCtrkBh88GP/7YBX9R8Gk
         VzcRBnL5fBR5cRAkmZKEs98VULWwiFZtGYXX2/SdzQL6sdivuBOU33yTiX5xWPm4rBiK
         vbhO/7YbfpguVkqnlHipb86QCcUMloJDWcZXRv1n99ql8P8Ih4GAYVuWJm/zjGzkzc0t
         UhYQX/9LlpFkkGkA8KK3zAFx3gjewwxqQhQ2CmCGjiC446VslSQEdJOn6gxBzF3R0u3v
         Vx4bPiL1i+SAyiyJuxsMcBzb1TU/WFyVgoq0yV4hN3yGhk2ItC0XGxiSFtgV7iBDUuNs
         y2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXh9zbe9r5LGbTTseJpas6s6nKZI99kgm4W8pbG7540=;
        b=wKQOXD4QoITeWUY2ZqQgl10kOiHiKWaUpNJDlHMEE4stANmDHIhMWj5KerIF6E99Ei
         g09ss0Htii6SLBpyz4W02cjzxZB2/rvurIZ4YSbuWW2cIu7LyZmNEmWFslS1JDGgb5i/
         8wvC855Ik6Xgwl+f8oSz7AZu16LiJa41XbQj7sSR4X/pviVJA+HIrpBwFPtHP4M1FnFH
         dHvwtw3nNismW/4SNvqs7Y0GswjdIdy8aYO019MzNURfLyaRLroZkS0qdfO6DdE5MHnn
         EYNrlFzqcVAaZmpSxZeUyTaxvAiJqra4MZm9g7GHU1Cb6Qwk4dw1vX8M5KESZBnP49Vb
         JvFA==
X-Gm-Message-State: AOAM532zf56OBYdFrFCLCH2rVVo36kKzEzQlr5iX6cKyYxeH5m6u7m4q
	ZDpyOSZPhybNsEvFQgTzHeU=
X-Google-Smtp-Source: 
 ABdhPJz2VhoKnQ97XTtE4gG18l8Z46u9TldWGpz3NXXgNzm5sazxNbP3Nm7d6QR4L1/M1drkLv7tIw==
X-Received: by 2002:a5d:470c:0:b0:1e3:2b64:2ba9 with SMTP id
 y12-20020a5d470c000000b001e32b642ba9mr5259874wrq.576.1645178794172;
        Fri, 18 Feb 2022 02:06:34 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:33 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 17/46][dunfell] grub: fix a memory leak
Date: Fri, 18 Feb 2022 11:05:25 +0100
Message-Id: <20220218100554.1315511-18-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161905

This patch adds a fix for a memory leak in grub's disk/ldm.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


