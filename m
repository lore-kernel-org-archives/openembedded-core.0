Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C08C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:28:25 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.378.1660080502197379434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0zq/w15d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 130so11896535pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K4fxfvAFco50H4TnoOSVb2Y09DO9a3fempK4hCr50D4=;
        b=0zq/w15dQ0jw/mBktx0/M96X37OCCfleSPRY+nqZD3bEqd14aVaIxyvZBKxkB+nEoJ
         pNGxZOJcMB8o7eQbAdDBPdbjP4q/LnALWRNQfhiqGtauqN5GhBCERms4bm/lV8brGm/b
         yO6JwF3/nRqVNdlAhi4memHj+tSJQnqlBnkZyWee0KXpfXtAjkvfwzLCHaFnZBUH+dlW
         YSWtyWgn0Fa0dN2iwa8Z5OhISVjiSl6mqUZJW3275CZom9GlX0w5o9MubTzWytYY5i4j
         Y5ma4bwbLmJkvxc1BD8iKak7nhTrRX19clMYSTMPmrclHD32GFFZf8MJQGQdqyasHl8Y
         UW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4fxfvAFco50H4TnoOSVb2Y09DO9a3fempK4hCr50D4=;
        b=JshY0xA7TJiFKTtZqdNpuEK2R2PE+X0nqmvqQNnWgWI2nKifNz+sJIG7NfPj2NVBN4
         bKyw5NiPbgg7iDd2Lgxp6/K628rHu7HR1MQqM/C+EsdiW33+mP+VqDkyd5WUS6qzaOYQ
         QeIqz8nqJefEbplF2Icq3WqJZ5daJvvKWrz91MddlQCFS8R5Q3aDKE3CRQe7AEfQScq6
         XAFA2FAHGOl19me29UkTXjgiDnM3oe6rfv3fmFfBDR+WjucPWLhXhkXdxWnzVBmVsH59
         bHFxc/daWZfOfTlrl5cGDrFX/bpoDouM+XkdgbbOZYuxjIMl27wKEGRKT8APwVsfU2PD
         n1NA==
X-Gm-Message-State: ACgBeo1qXmPn/QsYFDg2Ja+JcLjBK50QEKWuzY5WWtG2ZiQ5MskJ46RH
	yeAMXidSoUDpbX0YQwlROAdsn9tOlgijL+kI
X-Google-Smtp-Source: 
 AA6agR7I+FUzdocKRVDVA+H5bfhYjokkyu/CXIxS4rXxjXlQvgPIpd+WmdBvx+IVv87CAFI+PwsgIQ==
X-Received: by 2002:a05:6a00:2449:b0:528:3a29:e79d with SMTP id
 d9-20020a056a00244900b005283a29e79dmr25174419pfj.39.1660080501163;
        Tue, 09 Aug 2022 14:28:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a17090a4b0c00b001f4d711e165sm62273pjh.11.2022.08.09.14.28.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:28:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] lttng-modules: Fix build failure for kernel
 v5.15.58
Date: Tue,  9 Aug 2022 11:27:42 -1000
Message-Id: 
 <41142e60df5ef38d03a7ee73d9fac491c9e711eb.1660080350.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660080350.git.steve@sakoman.com>
References: <cover.1660080350.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169171

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


