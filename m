Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2074CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:11:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.49427.1710951070504541476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ndks5JIv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e01c38f98cso24293895ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951070; x=1711555870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UB3DwW3fugGItE3KzVSjqyZ3fHkqSVvhANQK6yjimJQ=;
        b=Ndks5JIvlToJ+OXUi18Mj+uigUQy3SoGb5ykecUC8QV2Mb9Efjyk7muP+g2WGKjczg
         fvpDF8iHxl0tbzUQRqAU3Ugb0Tm8TVnq1hcf6s60gKKzDrG8Kq/VL4/2YXqDCj5BNe1K
         Y2cqfDjFEdxqHecppG0NLXX7iNM7MVlaBGk/t5Sd2fPgDDSgzKYlVuDi7bzVGR2BGRTr
         b45MN4gScaHZBUrOOInrwWn4PZ7IvRkvqn8mNp94lfhePqFxJLav6kqUiKzsRONBLbB9
         JctKgdBiOjRpGJrW22+B9255p+7sCu5toYaLyl9LN6NJqFRXD8VcyVcHtlYBO4VEu65V
         XAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951070; x=1711555870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB3DwW3fugGItE3KzVSjqyZ3fHkqSVvhANQK6yjimJQ=;
        b=aFqg0Up20BeebyNbN8u3NCS2C7WZwRBO9WeWAGLLZjqwBWcQwp/mO9xhiCaNaKCg6O
         p754Qup97P/+4aTlwY5OsrY+SCSQW1KNToa/inRqHl4DR7G8HSQ5EKHwl2HoFThChuXF
         EfsiwlWEJEAipVaHpST+X69W/VhUJ2MeVfcxsPeNpwnX4kclBLBb5DRreAEjjvdKGqTy
         wTw8kmCJlIIu+RDasCPD9df+3ZNtucF49SwggUMt2JpbeOSQZjYle8kR4MfEN2nx6I1/
         R4AoTh53qs5fT5dtSToVcv2r9eq8l77kU0+EvBhK88YsRq+aeTfBEcq+04M+VtEFjfaJ
         6q6w==
X-Gm-Message-State: AOJu0YzevYHSQaOS4ico71cNKTTrYd8KVABDVBs+b0ODx8vleSzQiaWY
	rgL/AvBhGcIvTA/dQC3ED71OKAWST1y0PalbQ78c33stNL9EMQ7EnMjDgo2Pe7VV8d0gP+SViMu
	zUiM=
X-Google-Smtp-Source: AGHT+IFac711nD39CK+8AhGQTMKnUgYGUlTl0ro7YP07HFE6MCf7csvz20V9bOcdSquFvnH4vQgbPA==
X-Received: by 2002:a17:903:41cb:b0:1e0:25f:acfe with SMTP id u11-20020a17090341cb00b001e0025facfemr12258995ple.42.1710951069728;
        Wed, 20 Mar 2024 09:11:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.11.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:11:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] stress-ng: avoid calling sync during do_compile
Date: Wed, 20 Mar 2024 06:09:52 -1000
Message-Id: <b2de7d75692fd4c9e0a6f46a099b89089edb10d4.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197385

From: Martin Jansa <martin.jansa@gmail.com>

calling 'sync' from do_compile in the middle of big OE world
build harms the build time.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Makefile-avoid-calling-sync.patch    | 35 +++++++++++++++++++
 .../stress-ng/stress-ng_0.13.12.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
new file mode 100644
index 0000000000..fec8c524eb
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
@@ -0,0 +1,35 @@
+From 1d1801902a4944c6f5fa521c19b32fbac7342a0c Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.i.king@gmail.com>
+Date: Sat, 6 Aug 2022 13:05:59 +0000
+Subject: [PATCH] Makefile: avoid calling sync
+
+Original commit message:
+Makefile: use ld-gold if it is available
+
+Speed up linking by using ld-gold if is available. Add build
+time detection to see if compiler allows it
+
+MJ: backported only the "sync" removal from Makefile as calling
+    it from do_compile in the middle of big OE world build harms
+    the build time.
+
+Upstream-Status: Backport [V0.14.04 c10e5c3f9f5560a085279f4c4b399c2f34cb897d]
+
+Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f8f71c54b..23db4c612 100644
+--- a/Makefile
++++ b/Makefile
+@@ -425,7 +425,6 @@ OBJS += $(CONFIG_OBJS)
+ stress-ng: $(OBJS)
+ 	$(Q)echo "LD $@"
+ 	$(V)$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -o $@
+-	$(V)sync
+ 
+ config.h:
+ 	+$(MAKE) -f Makefile.config STATIC=$(STATIC) -j
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
index 807ecd3466..72dafddaf8 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch \
+           file://0001-Makefile-avoid-calling-sync.patch \
           "
 SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
 S = "${WORKDIR}/git"
-- 
2.34.1


