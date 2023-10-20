Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B22CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.58048.1697817132842106936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vYl9NSZK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cac925732fso5889205ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817132; x=1698421932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSvsmW1Tw3PgeE+9dWvG04pq2sLjCCmJf4u4CLV9c3E=;
        b=vYl9NSZK9nRB2oLin4cVWxtbLAn2KkpMZzY/7ZNPMHHz0/xLAJiPZPby7h3ye4nRVO
         1FbPbf8aLOVoIUO5APszo5TnU6eNnzTPZzJRY3kv6Mgs6HahH+vPoWJNAmdzbNHQ5++7
         dtl5XMIqNBZFVY3IgSkkQ3G8WyKIYRbWNV6LcONiMTD/bfx0hnArk5pYGBItlhpQAqMp
         olxE2YQijGskJY76+Sdc2OWGMWcSnIqxVmLDyOrJdpXoUIEA0+L0z+bng0xDu2s8YIDY
         jvH1GMYbslQ64lHenQ4bAgOhF4OWA6cnzh2wsjdpZl/gLRq5mYemSh60FM4wQPyP3zOA
         Sw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817132; x=1698421932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSvsmW1Tw3PgeE+9dWvG04pq2sLjCCmJf4u4CLV9c3E=;
        b=RA8ExK+T0PB3Zk4ztUusPS14s5GXKrWozoN3/hs8Of6CnA2ob9JlVQFMSqFGj+13rY
         nEpXfJioGxkBEL8r2jXR8aL+qtPrO/XSnBy4G0J7Sp8CudvxIFYzkqZBI0kXEsThm0wf
         ALs+/47aapLCsXMbjqolkxPGexmvSj5qmu8TJPCYjewvKNUflG97RFZSjEy1pmUj8he1
         qX6CwQ9AEY/4s4YhVIPYnyxueNnj1drOaobM3it/vFfB6Y2fdCsVn9SXk2+5XGLzeiXg
         xYSzLUKfOvSpUfzEr7zgy20jjVRj+s5jMqY7If2j9NrATsioAGe7ldUshK0qbvZMO1qV
         XvQw==
X-Gm-Message-State: AOJu0YwI7Rn6hVHLA5vtzAfowKdhcf9qsxHqAXTI+SWYFI+psblXZMsn
	QnnZ7Mwqe1G692/HFe3PxS1+kWLgMZuys2CbQA0=
X-Google-Smtp-Source: AGHT+IGYq4FNs2fwKQaPOz0DtTKaVFo+b4lbaIMaZ5N3G+/mhAvAo1JXG1NrOX55Ir3UFnTeBXIsxw==
X-Received: by 2002:a17:902:e889:b0:1ca:478a:4a38 with SMTP id w9-20020a170902e88900b001ca478a4a38mr1849172plg.47.1697817131970;
        Fri, 20 Oct 2023 08:52:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/24] wic: bootimg-partition: Fix file name in debug message
Date: Fri, 20 Oct 2023 05:51:23 -1000
Message-Id: <bb063e8b461b8c3c0b5b6965f26a555781dc94b7.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189566

From: Daniel Semkowicz <dse@thaumatec.com>

Debug message about using custom configuration file includes file name
with incorrect extension. Correct file name to "extlinux.conf".

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd63e1520454b2d53a48b72eaae126059af9809b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 8956162205..58f6da72c3 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -112,7 +112,7 @@ class BootimgPartitionPlugin(SourcePlugin):
                 # Use a custom configuration for extlinux.conf
                 extlinux_conf = custom_cfg
                 logger.debug("Using custom configuration file "
-                             "%s for extlinux.cfg", configfile)
+                             "%s for extlinux.conf", configfile)
             else:
                 raise WicError("configfile is specified but failed to "
                                "get it from %s." % configfile)
-- 
2.34.1


