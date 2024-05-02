Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236F9C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 04:46:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6024.1714625173225150155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 21:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9oNf8yM;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so58212055e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714625171; x=1715229971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scltLX1cl68MI2DpehzN+dgokDNklGOSHRvCs4vhbJE=;
        b=O9oNf8yMKmp8BFL2m5aRf3ed/tPdIpGfjtzS15S/nvWMUYb6/aiVVWfSW2nFAhyZuf
         Gc67bvcc19GWXqh0USt58oY+O7l5lGhU0NNHdqInJG6ADrWxvKS43I3naBZfBPGJgZMh
         USMI9rW3020lfVLDL0ommEoQt2bTmBvqXMVUuZ8inXEdZRtYzWsgOLOF0UOLmgoEAlwT
         qNFIHDneowJWpfTWbdzaswUj1CFnxk2JkBBrZpnf2BahfxsRbIbfvZN9yi7im6Mlmeo4
         sy0DAlUDw8UTsr6mW1fP8kKX35BW9ayT7UeK7oK6iOwVDR+8lOTE4PV4JZPxI/50ozpV
         fByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714625171; x=1715229971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scltLX1cl68MI2DpehzN+dgokDNklGOSHRvCs4vhbJE=;
        b=plfJEMSiDGCJapGoVqAJxw89C3RfojI9V4JdN9fTml27a/qndhLizwPyF9ZEpiX3Uj
         gqU+eio5/Qd6/8kFInQk7O8gURFH2SU/LcyBId3AasBTr9NhMoO+92KdT+YM3y1uJkJS
         syWneunY2XrzEV3c71PPFueNO15m8b8Ts7SSLy77/VKrAjffHI3KE9isc7hBrLOUh1n1
         M00tAmKGnnXYAXCYOYenTPqkjUdADW1mtu3UywP9BYIq6mgTeF4IGafQau277/a4+ssC
         5/hPy8IXaHIJ2MQmAIu4teiSZtbtW4K6WZHfRnLvc/UymDXs8Yqpjf58fdFVkNnjbD0X
         bWVQ==
X-Gm-Message-State: AOJu0YynfDKoS9f3rFv1SpDoKeOS5lXb7EzpE0NKPV0CzA2gJYxdDCq2
	oMHqkFPfgAfTGTGngxKIsRnGT4E0oiS37vgUKy3mp+ODplwiCvOXWEoHWkrt
X-Google-Smtp-Source: AGHT+IH6G2PcowYRri9vqR28bZ6Ik2cn3PvdgqldEvA4FKRmO51kOlpo7Itn2c7ERVUSvpexAEbvGQ==
X-Received: by 2002:a05:600c:4ecc:b0:41a:e995:b915 with SMTP id g12-20020a05600c4ecc00b0041ae995b915mr3169513wmq.1.1714625170869;
        Wed, 01 May 2024 21:46:10 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c190f00b0041bf512f85bsm4199414wmq.14.2024.05.01.21.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 21:46:10 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] cdrtools-native: Fix build with GCC 14
Date: Thu,  2 May 2024 06:46:00 +0200
Message-ID: <20240502044600.995807-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 04:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198899

Add a patch to fix do_configure with GCC 14.
Disable building cdda2wav because it doesn't build with GCC 14.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../cdrtools/cdrtools-native_3.01.bb                |  6 +++++-
 .../cdrtools/cdrtools/gcc14-fix.patch               | 13 +++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index bf8be1ad0c..b9cb59032a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -13,7 +13,8 @@ DEPENDS += "gnu-config-native"
 SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
-        file://riscv64-linux-gcc.rul \
+	file://riscv64-linux-gcc.rul \
+	file://gcc14-fix.patch \
 	"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
@@ -27,6 +28,9 @@ export ac_cv_prog_CC = "${CC}"
 inherit native
 
 do_configure() {
+        # cdda2wav does not build with GCC 14
+        rm -f ${S}/TARGETS/55cdda2wav
+
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/autoconf
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/autoconf
         install -m 0644 ${WORKDIR}/riscv64-linux-gcc.rul ${S}/RULES/
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch b/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
new file mode 100644
index 0000000000..ce02bb8bcf
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
@@ -0,0 +1,13 @@
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [native]
+--- cdrtools-3.01/autoconf/configure~	2015-07-06 23:41:27.000000000 +0200
++++ cdrtools-3.01/autoconf/configure	2024-05-01 09:37:40.897253690 +0200
+@@ -1205,7 +1205,7 @@
+ #line 1206 "configure"
+ #include "confdefs.h"
+ 
+-main(){return(0);}
++int main(){return(0);}
+ EOF
+ if { (eval echo configure:1211: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
-- 
2.44.0


