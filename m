Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E898EC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:20 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.24.1660081874655314530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yChvrXiD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id k14so9958629pfh.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K4fxfvAFco50H4TnoOSVb2Y09DO9a3fempK4hCr50D4=;
        b=yChvrXiDThoaccCQRifYJMosrfZYcuE742riOBOdwaHdyIawFR3WhtAjl8X+Ohu4Rr
         xUlEg69g+2bpZZd2s9dzYmVeEudgG6vmv/O4KZ8t4QAWlDtwgyZPDtdx7k09qubgqUpc
         SB87tMLyqiunV7rkvaX+dOKRP6ASsGo4XXDze8ht0OgoZTnmUYtZ+a7ex5CjMormamxb
         H8l3rHip9U/+/342x2N2eqrQv+KBQBuEBGKkHR8vSbVU1/JR9Gh6QGQQbJ0f0VXJOnMR
         u5jLv8fPpHb030/ndvMSQt6RzBxBXvcmW2BJ9rUGRc9R8KjchXtqbq1sHNCjQ7pPVVcQ
         z/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4fxfvAFco50H4TnoOSVb2Y09DO9a3fempK4hCr50D4=;
        b=20iMt5QC/VV9WkduTxTjMeHUe/MmxsmnoBnl4KHX4AFeC34znoLjmMMA5XvTF8U2Hy
         JTAKWHXSJiYAmghDfk2jp27PMX2fUwExe4ZVCa3Z86vw1sayfzbvkGLWyDn1/ANcpV+V
         0n569mhPbyw34QHYlRHno+yxSqbrZ95UjRwVM4h53zaRvRzCWrxOKVxACckaMVoZ5G1I
         xwZcNl58KXFW2j8A3BaWlqoW2wVYN1HKGHo75edkugrsLyLZnGYu36XrbhmpXnJ1JJEx
         8/wlHz0ICek2cYI5NWuAT2ig2U5YZVoE7wxCoBhlsOY+spKw5hZPAE39HlNAYwTJgvFY
         kwsA==
X-Gm-Message-State: ACgBeo3R/BEWSZDAEG7e8danjkwaNSrlPYHVJtunfLKh9qj3jFWdJpPm
	pUGXQlqk/K2btqNV7UzPYLiQkxfDrQHifqel
X-Google-Smtp-Source: 
 AA6agR5FC/m8YP8tS7Orj5EkaFUwCDKtPQn6Xbx0hJx7V2pfKgaemLKSWL6yQRVdj3xCa9R9+XubPA==
X-Received: by 2002:a05:6a00:1c4b:b0:52e:6c05:8f1f with SMTP id
 s11-20020a056a001c4b00b0052e6c058f1fmr25154587pfw.7.1660081875323;
        Tue, 09 Aug 2022 14:51:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:51:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] lttng-modules: Fix build failure for kernel
 v5.15.58
Date: Tue,  9 Aug 2022 11:50:39 -1000
Message-Id: 
 <455acda350dffb9d3e0ea0dabcaab1ec8d4ace86.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660081510.git.steve@sakoman.com>
References: <cover.1660081510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169181

From: He Zhe <zhe.he@windriver.com>

Backport from upstream d8254360c7f2ff9b3f945e9668d89c0b56b9bd91
("fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)")

tmp-glibc/work/qemuarm-wrs-linux-gnueabi/lttng-modules/2.13.3-r0/
lttng-modules-2.13.3/src/probes/../../include/lttng/
tracepoint-event-impl.h:133:6:
error: conflicting types for 'trace_kfree_skb'; have 'void(struct sk_buff *, void *)'
  133 | void trace_##_name(_proto);
      |      ^~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit c6f49f42bb6ffe53c56ef1710e3ea90d8a18fe9d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch | 53 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
new file mode 100644
index 0000000000..ca6abea9c0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
@@ -0,0 +1,53 @@
+From d8254360c7f2ff9b3f945e9668d89c0b56b9bd91 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Fri, 29 Jul 2022 15:37:43 -0400
+Subject: [PATCH] fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
+
+See upstream commit :
+
+  commit c504e5c2f9648a1e5c2be01e8c3f59d394192bd3
+  Author: Menglong Dong <imagedong@tencent.com>
+  Date:   Sun Jan 9 14:36:26 2022 +0800
+
+    net: skb: introduce kfree_skb_reason()
+
+    Introduce the interface kfree_skb_reason(), which is able to pass
+    the reason why the skb is dropped to 'kfree_skb' tracepoint.
+
+    Add the 'reason' field to 'trace_kfree_skb', therefor user can get
+    more detail information about abnormal skb with 'drop_monitor' or
+    eBPF.
+
+    All drop reasons are defined in the enum 'skb_drop_reason', and
+    they will be print as string in 'kfree_skb' tracepoint in format
+    of 'reason: XXX'.
+
+    ( Maybe the reasons should be defined in a uapi header file, so that
+    user space can use them? )
+
+Upstream-Status: Backport
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ib3c039207739dad10f097cf76474e0822e351273
+---
+ include/instrumentation/events/skb.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
+index 237e54ad..186732ea 100644
+--- a/include/instrumentation/events/skb.h
++++ b/include/instrumentation/events/skb.h
+@@ -13,7 +13,9 @@
+ /*
+  * Tracepoint for free an sk_buff:
+  */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
++	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0))
++
+ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
+ 	TP_ENUM_VALUES(
+ 		ctf_enum_value("NOT_SPECIFIED",	SKB_DROP_REASON_NOT_SPECIFIED)
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index 90d48e5867..bee2204b42 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -11,6 +11,7 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


