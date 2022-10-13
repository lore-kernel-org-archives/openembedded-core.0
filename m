Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE101C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:37 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.87.1665679048953606531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5QwGHMBm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id bh13so2015187pgb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bj/rwof5eVqhhCFdwG+vXFMcLMTHMCRmQJbZDzoqR2g=;
        b=5QwGHMBmncNm3OoxYK6zvOOJBiimXxySBYlCgOiMBE6dMshG7JUskkDZfakyaBZ5yz
         ijBhF8vXlo7DEO93gwOXzHw/Dzt2KTPDiFQiqnYCF12kTqzZWWUqcyUBEnUf+B34d2ev
         aiZMRrVKeoEibaGA4U170TFwrUpGFRHRQLc8RmV+a/hBlfdsiMGhMRjO00cxPzdjeamz
         KhoFDtHIB+9KGVBRRkkXRR7RuKVFoEDhYzf/c1XJ7ynttiQDCyEgXUuq6um3QtrPiaGZ
         Z0YKE+qSlbKcA8LKRpJQpKJtut74qTAFi9KTLwz/jzN4OXxgP1DggK7uz7t6ZobUSUiX
         zemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj/rwof5eVqhhCFdwG+vXFMcLMTHMCRmQJbZDzoqR2g=;
        b=s3jLlV0UWPVStYUG6vz+k66CUo6PGn+Q4RGR9tpVe5qHX/xxMSf2K3SWZUszryoR4J
         Ah936br1qcopeQBSXsirP9ZszPhqhQstBQ9Z3K29Cw7W9ZsvKiPfRLc4EPsgA3HE5Zri
         sVM/PzWT4MxJlBNumX+Z1eXVmg+pHvSSEgvQsULFSIXp4tpTdxviSo6gobQOU5/la+xp
         Psj06L6f4I9Qxcpwk5Jl87vL1vK3QS+Q25OZ+MKcDF8M5FdWUM3Dpnjtf3c+uY5L5wAz
         ArqzX8kbQSIDci06u/ZgPrQR7OVm1/7Bu1FqBQd8ky4JYCsZPX9JZj4HpjtsBE3/u358
         E3Gg==
X-Gm-Message-State: ACrzQf3aPlxM3w4nf4NJRta6nzhxUfH3QGhSkpZ+V774HvL74fvoeLO3
	X4O9zndziov95fol7vbOQtRBCcFAz4MZaQEC
X-Google-Smtp-Source: AMsMyM4fdGLXhREuMOF4SmU4we/FkUUvVYkej5amoq+GuBHTex6RgoGqa9cxKJ+JAJo3gHrSCzYF9g==
X-Received: by 2002:a05:6a00:1d26:b0:54e:8c81:9f64 with SMTP id a38-20020a056a001d2600b0054e8c819f64mr385220pfx.58.1665679047996;
        Thu, 13 Oct 2022 09:37:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] qemu: Avoid accidental librdmacm linkage
Date: Thu, 13 Oct 2022 06:36:56 -1000
Message-Id: <aa9d0c2b777c10bb6c68b0232d54cbcd1af1493f.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171717

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid accidentally linking to the rdma library from the host by
adding a PACKAGECONFIG for the option. This was found on new
Fedora 36 autobuilder workers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a0f3cb225e4d5471155abbcd05d09bd6bf1620f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d85db8f800..28caefef07 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -277,6 +277,7 @@ PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd"
+PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1


