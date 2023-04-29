Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9F1C7EE23
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.51336.1682788869515764788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QhlFcFMO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1a66b9bd7dfso11070685ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788868; x=1685380868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2ZVzh66wkeAerV307cUkO3JQ+9iBkwqzSp2d3u2jiY=;
        b=QhlFcFMOzSERy2+Vrgjz3z0h/54DfbPAWhtsdzZYDE8JocK60POpjASYclPdkCch1C
         4W+okgbhJk+m+HGtek68dEowZECEd4nEPqYN07RVLf2FV05nG3GrYoI3KgPEn+TXlgjA
         dp+5KP8Ro5ZMIVzpiM4xpJoidR5JXC9qtDntAhFfdMiIZW/9KpuSxbQwt5Jykj81dTc+
         U18DvYAbi/zDFeSdj9BbgF/Eo8sh94yLCtTqGZTgwaN/JjITnwvwQoZOCntBIUglfKJF
         cULWnF/UMMW8OL3bc1mQ+EGFQAMOSxLzAEf6LjOcLMuBUm6lDWi5I/h93dJFwuHuVV8W
         W43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788868; x=1685380868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2ZVzh66wkeAerV307cUkO3JQ+9iBkwqzSp2d3u2jiY=;
        b=JccI6e7J7lH4kWMrWJWXvCLgNjY+vttpy632Q6CQ88GgliC7W7d7kPfpkxDm7v2OQG
         nrSKQobg06z4p3Vk7Y12lBZeOUEsg+PfJcpSmcqY1tJ0u0sUwb7zkBVbxGWAsoP8bu/j
         0qVQoFIhmqMHsSNln3InBmRds09aTx5qv/S4vtyrMtOuvWilP5lrQF9wW4QVtWnznVhB
         stRNVaJLu60nJdvXnuLE8HxoipvfZNNcBxAnBLuZ1AEuTVoqw6ad8kvlt37B4X1JWxVd
         sNzL/3lk7YuCLH9hpW6TqdVOPqaioMGTbfK/1ob0TizMz+PgOdahb6aCnAwnXwkZPk98
         LRMA==
X-Gm-Message-State: AC+VfDx1+b7Xhs3cR17BKQxMwTmGh9P9weL+vbFSH9ZcuVBoMEKaTBaW
	s9H/CkEUnRkN4zEBdrzufaR+Wn3CaJHhtsXMPuM=
X-Google-Smtp-Source: ACHHUZ6F6rZ9Y71RSdcQrkdpqhDOm+4/SE0GyivAMKM3376JOzaTC84uMXep5YLNTePn9QC2vBIsVQ==
X-Received: by 2002:a17:902:db09:b0:1a6:8405:f709 with SMTP id m9-20020a170902db0900b001a68405f709mr11431372plx.20.1682788868634;
        Sat, 29 Apr 2023 10:21:08 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:21:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] xorg-lib-common: Add variable to set tarball type
Date: Sat, 29 Apr 2023 07:20:29 -1000
Message-Id: <56ea2b625f81e397e911b3610130d3e838d10938.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180552

From: Yogita Urade <yogita.urade@windriver.com>

Upstream has switched some new releases from bz2 to xz compression. Add
an XORG_EXT variable so recipes can set the file name extension needed
for the compression type.

Following the approach in oe-core/master:
  6a8068e036b4b2a40b38896275b936916b4db76e  xorg-lib-common: Add variable to set tarball type
use a variable for the tarball suffix/compression format.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 60bc8c76fa..68137c4147 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -6,8 +6,9 @@ LICENSE = "MIT"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
+XORG_EXT ?= "tar.bz2"
 
-SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.34.1


