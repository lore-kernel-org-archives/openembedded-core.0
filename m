Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8809DC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.11020.1645452880066286939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jGhA3Ze4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id qe15so15361639pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H6CBtZd2em99wgE5kzaCl2Xbn3fti1xbebqxgEoK3Ic=;
        b=jGhA3Ze458ohNE4Bg/ckznLT6nHi4NW2ZdDN68kRBdZyT6W9K1i5v6wUFpOlxCkIp0
         OpAlQpZ1IpZEHQiQxqHoXYB9n5IcJGSIU+r5L5hpo9CyDBAXjXUb+/r68wAU8I1AI6HQ
         HDs1pyWwj1qqzOBzuvY3pPhTBtL1xwV+DF1XJBpV6o5vhbSxzT58L81LjqT/TVTlZQ3b
         Cn/dKK14TuEfix6tw9QFY5awHZNeRA60g+TQIfOPkPUrR8OtaaqxjFesGPF3OrAMC8uc
         RnkVEmqUmg9VHwMRdD2lnigQrTcaDTrJ1rhrdTlZldUtWGGEHcg1zbnvQ7T3VbPDMYvJ
         f8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H6CBtZd2em99wgE5kzaCl2Xbn3fti1xbebqxgEoK3Ic=;
        b=HLD3wigYPTEuSagFgkJQQNgQ6KmOZ/VEVtC9oPLTK55rsAPORUtwtK65oo1HLoAx+u
         zfHPaUhnLMg0AiDTMQNqk0SqAIGt8ejBpwEejGpj3/97ibH7at8QGewzgH74kZLxIXN6
         YHR+w/nU+fpjS+QHXNuDUt55f3HHCTdRbi7OZ5+8Tq2jKs7qC6ZhrPzX6FiXaF2u9K1k
         DFHvM+L51V3/budlxfcg5GjhJgS5eBlb7qC8NUNggSRm+RzNd/f5z7rkar5CuqGFOphT
         9nZDbCOGDSMOTq87+0zhAmLDneXMcwn5grzgym0zwJ7gZePXouk0st2srCVGcbN4iQLd
         DD0w==
X-Gm-Message-State: AOAM5322efKk4B+IUNHNjv4sig0Lp6wxRSDddtT+i1Cb6vytB7XDKJaI
	svMorZrxJZmdkwj//zE/gVc43B5iwqfiuK2S
X-Google-Smtp-Source: 
 ABdhPJwE5Jv2xQXKjiGjpetM2D7U1O13Qs1sYY6Z+XNbgu9tKPuyiuvTALM8gItsHrsTQrQpwmSQCg==
X-Received: by 2002:a17:903:124c:b0:14b:2d82:c074 with SMTP id
 u12-20020a170903124c00b0014b2d82c074mr19244652plh.13.1645452878985;
        Mon, 21 Feb 2022 06:14:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/20] connman: fix CVE-2022-23098
Date: Mon, 21 Feb 2022 04:14:01 -1000
Message-Id: 
 <af56acf66b4196c961a20ec59faa580cc3e3ee23.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162031

An issue was discovered in the DNS proxy in Connman through 1.40.
The TCP server reply implementation has an infinite loop if no
data is received.

Backport patch from:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d8708b85c1e8fe25af7803e8a20cf20e7201d8a4

CVE: CVE-2022-23098

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2022-23098.patch      | 50 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-23098.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-23098.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-23098.patch
new file mode 100644
index 0000000000..a40c9f583f
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-23098.patch
@@ -0,0 +1,50 @@
+From d8708b85c1e8fe25af7803e8a20cf20e7201d8a4 Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <mgerstner@suse.de>
+Date: Tue, 25 Jan 2022 10:00:25 +0100
+Subject: dnsproxy: Avoid 100 % busy loop in TCP server case
+
+Once the TCP socket is connected and until the remote server is
+responding (if ever) ConnMan executes a 100 % CPU loop, since
+the connected socket will always be writable (G_IO_OUT).
+
+To fix this, modify the watch after the connection is established to
+remove the G_IO_OUT from the callback conditions.
+
+Fixes: CVE-2022-23098
+
+Upstream-Status: Backport
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d8708b85c1e8fe25af7803e8a20cf20e7201d8a4
+
+CVE: CVE-2022-23098
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ src/dnsproxy.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index c027bcb9..1ccf36a9 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -2360,6 +2360,18 @@ hangup:
+ 			}
+ 		}
+ 
++		/*
++		 * Remove the G_IO_OUT flag from the watch, otherwise we end
++		 * up in a busy loop, because the socket is constantly writable.
++		 *
++		 * There seems to be no better way in g_io to do that than
++		 * re-adding the watch.
++		 */
++		g_source_remove(server->watch);
++		server->watch = g_io_add_watch(server->channel,
++			G_IO_IN | G_IO_HUP | G_IO_NVAL | G_IO_ERR,
++			tcp_server_event, server);
++
+ 		server->connected = true;
+ 		server_list = g_slist_append(server_list, server);
+ 
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index e3ea3cd065..096981364f 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -10,6 +10,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2021-26676-0001.patch \
             file://CVE-2021-26676-0002.patch \
             file://CVE-2022-23096-7.patch \
+            file://CVE-2022-23098.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


