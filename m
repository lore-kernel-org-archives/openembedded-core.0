Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691D4C43217
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:38 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.12450.1664898693854145693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g61DkpSw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id s206so13051779pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=8VMq7mC/odYFCpoeAP2f6e8nx45asinhDCD8F+47VXo=;
        b=g61DkpSw+yIA7nV7TzLeYotFEtL7GzbVvG5EDGlrGT6bFQiNIyVNMqxuF3dmPzkhwV
         WlK5Rvpai8hh/rkeD90I6NMWR9PxvQUP3Vj9OOYGkOltqqEAEua7HOoSjfWWGVpL5YW2
         uUkEuywcqCjvrtU8qeD1DxMejZdxtvYnlS0xZP58z+TE8iYEgmPVdlL4+c30QWZytzUO
         1WeclRPeqd9rdoKHRc79kurtSSM61vkNgSTDNMwTEwAptqhXkSNehO3zKTsGyWzxYVT3
         4IehpjlgZ05KF/TZ/vVaDI8f/tC7l79UeFClPXAEIxaHlJ4zVN+bYoNaBk9sTlOmfcSr
         rY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8VMq7mC/odYFCpoeAP2f6e8nx45asinhDCD8F+47VXo=;
        b=5Rpg9srRjsUyZWlPKCU0QiT/WEFjQk0KPuev2H6IUO0w6UfyjllEGeUG/tZtJOopXF
         re5IgpNi3k0GJmZ42f+CXrS4vn38QGCPQuVvgsKNNvR8Vus255F92cGJh5l88AbIQtI/
         m+Yd3QcXrdQzruDPqye0fG8pNn2zIdMT9XSPyyrk3p+I2oYfBhG+Fe7oO5xs8AEm/fCE
         eM0fhnpmHG0eShJMJ+kklqyQkEU2AMDqe02h1LlPbtTW4V0vptr+0v4PCiV5wTXx2Wbt
         v8Tb8TIdnMU0JD02bw1aZXQHQw36dK/8W5ucARN+0DvohzmwC8iTnbOKUiSKUSpCpw5J
         TiUA==
X-Gm-Message-State: ACrzQf1/didISRDfjp1+sK36hUyrtWD5kXB0EVVQDcyttfbGp6I1rma+
	eLm0SxR8aEu+ocyt73hesc/xdv5PCnCJL8Ro
X-Google-Smtp-Source: 
 AMsMyM7kwwMQz2lyOkLS/oe/dXkEiCvRqfWOcYsIVf2r+SClxiFn8URaROFB6ouli/mTInR0BFmM6Q==
X-Received: by 2002:a65:6e82:0:b0:41a:9b73:f0e6 with SMTP id
 bm2-20020a656e82000000b0041a9b73f0e6mr24407245pgb.371.1664898692812;
        Tue, 04 Oct 2022 08:51:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/18] lttng-tools: Disable on qemuriscv32
Date: Tue,  4 Oct 2022 05:50:41 -1000
Message-Id: 
 <035fddfa35ccf17d3f1636f6410e626240fe527d.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171419

From: He Zhe <zhe.he@windriver.com>

lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on
riscv32. This has been confirmed by lttng-tools upstream.
https://github.com/lttng/lttng-tools/pull/162

It's also turned off for riscv32 in meta-riscv.
https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68b07bb7f0f01925f9da1cb966239ee49d5c84e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/lttng-platforms.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
index 933c65d85d..98b13b194c 100644
--- a/meta/recipes-kernel/lttng/lttng-platforms.inc
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -15,3 +15,7 @@ LTTNGUST:arc = ""
 
 COMPATIBLE_HOST:arc:pn-lttng-ust = "null"
 
+# Whether the platform supports lttng-tools
+# lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on riscv32.
+# It's also turned off for riscv32 in meta-riscv. See https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf
+COMPATIBLE_HOST:qemuriscv32:pn-lttng-tools = "null"
-- 
2.25.1


