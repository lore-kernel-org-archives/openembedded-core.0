Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15F6C0502A
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:11 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.26480.1661956810463277146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YNg9H9fA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x19so12753991pfr.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=UToVXHSVP5ukXAx9Qpyu9m1KHvxhDXzrICc0HDt107s=;
        b=YNg9H9fABjW76cxu8AidOsGZj8QDYH7s1WT76CruiytmlD3fapsyGCLPMTDF89RLc4
         2cf9tJizZZato7gMuJYikAZnaARkO9u6eBUrL32u7I+79wmijDTrWRqIF6OMjuz0cPly
         UdS4opRB9ZmnzKwNtlj+UgmlFy1X7N5k13aqpvuD5gS76hHFFRsD1n73dFTKH1ocxowt
         rKwGhh6OY1zWmuYJ4d0hMucgNDUmcT2L2HKz4uNbH5fQqlO1VQZNkVz8GbQNRAgVr7w5
         o4L6yJlvTylJ4kQhack/CZXJt6Eiop5aYYWQOS8XgNFwEyGWfdpnKCvbJZ0SE5J/z945
         ErNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=UToVXHSVP5ukXAx9Qpyu9m1KHvxhDXzrICc0HDt107s=;
        b=dwxkPsauYM40c5ZojGfEFH2Q1gAQDIpW6yONnWB92UrDo7vKlvxJA+YZXnT7XIpWBC
         x2JDz5rojH1+sgQC6YabitkBUJNbc/z6Tb3SvzF3VG6uiKEBLyfwqCXUpl3S31Wr1E5r
         zstmUeV33cu69xJbmkDmMipcqmC/01MsSIWz0l6+6aitPcksgQgx4FXPCDmgRU/3xgbU
         q/9YlCNMXRs+ativUtWqhP+viN8PoTYwORRjH6Mk7n9Vhm57ErlrQegQAlLvURlmto+Z
         jaCTSTcoXwGSJXLqLBcidtdOfaRFmXDEUDhZNs2jqDgAH8z0uCaUdOPJYpLLCjBcOsUg
         fh7g==
X-Gm-Message-State: ACgBeo0K+7zfVJlnh8imzD8Qt57/pg+RC0gNF7V+WZOnC1oAcQL+KVWz
	laEyAw3qVVowRS37WbA2tkUFaed/5307aOjy
X-Google-Smtp-Source: 
 AA6agR6o1SPG+RjHt3Z8Bg4gSuCLrIq9im0kY6ALtigEy2/qyGzMPHHHrgULqqWHak0wCSg5O8uNsA==
X-Received: by 2002:a05:6a00:26e0:b0:537:e561:baba with SMTP id
 p32-20020a056a0026e000b00537e561babamr22110760pfw.34.1661956809448;
        Wed, 31 Aug 2022 07:40:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] lttng-modules: fix build for kernel
 5.10.137
Date: Wed, 31 Aug 2022 04:39:28 -1000
Message-Id: 
 <cb51e97f66285d64d188379aff6282ba597c49e9.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170119

Backport patch from upstream "fix: adjust range v5.10.137 in block probe":

https://github.com/lttng/lttng-modules/commit/5dab3d515b6f5c5ac80c8e7674628495e3bf4ac6

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...djust-range-v5.10.137-in-block-probe.patch | 92 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
new file mode 100644
index 0000000000..1c3918be5c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-adjust-range-v5.10.137-in-block-probe.patch
@@ -0,0 +1,92 @@
+From 5dab3d515b6f5c5ac80c8e7674628495e3bf4ac6 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Aug 2022 14:16:27 -0400
+Subject: [PATCH] fix: adjust range v5.10.137 in block probe
+
+See upstream commit, backported in v5.10.137 :
+
+commit 1cb3032406423b25aa984854b4d78e0100d292dd
+Author: Christoph Hellwig <hch@lst.de>
+Date:   Thu Dec 3 17:21:39 2020 +0100
+
+    block: remove the request_queue to argument request based tracepoints
+
+    [ Upstream commit a54895fa057c67700270777f7661d8d3c7fda88a ]
+
+    The request_queue can trivially be derived from the request.
+
+Change-Id: I01f96a437641421faf993b4b031171c372bd0374
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/5dab3d515b6f5c5ac80c8e7674628495e3bf4ac6]
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ include/instrumentation/events/block.h | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
+index 882e6e08..d4821c12 100644
+--- a/include/instrumentation/events/block.h
++++ b/include/instrumentation/events/block.h
+@@ -366,7 +366,8 @@ LTTNG_TRACEPOINT_EVENT(block_rq_requeue,
+ 			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
+ 	)
+ )
+-#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
+ /**
+  * block_rq_requeue - place block IO request back on a queue
+  * @rq: block IO operation request
+@@ -611,7 +612,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(block_rq,
+ 		ctf_array_text(char, comm, current->comm, TASK_COMM_LEN)
+ 	)
+ )
+-#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(block_rq,
+ 
+ 	TP_PROTO(struct request *rq),
+@@ -746,7 +748,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS_CODE(block_rq,
+ )
+ #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0)) */
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
+ /**
+  * block_rq_insert - insert block operation request into queue
+  * @rq: block IO operation request
+@@ -781,7 +784,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq, block_rq_insert,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
+ /**
+  * block_rq_issue - issue pending block IO request operation to device driver
+  * @rq: block IO operation operation request
+@@ -812,7 +816,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(block_rq, block_rq_issue,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
+ /**
+  * block_rq_merge - merge request with another one in the elevator
+  * @rq: block IO operation operation request
+@@ -1632,7 +1637,8 @@ LTTNG_TRACEPOINT_EVENT(block_rq_remap,
+ 			lttng_req_op(rq), lttng_req_rw(rq), blk_rq_bytes(rq))
+ 	)
+ )
+-#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,137, 5,11,0))
+ /**
+  * block_rq_remap - map request for a block operation request
+  * @rq: block IO operation request
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index f60ab3b5f5..80b9ceec3f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
            file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
            file://0001-fix-compaction.patch \
+           file://0001-fix-adjust-range-v5.10.137-in-block-probe.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


