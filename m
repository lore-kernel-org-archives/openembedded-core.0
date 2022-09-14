Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA4BECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 10:00:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.4285.1663149596522244929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 02:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=NK2PCAxR;
 spf=pass (domain: snapchat.com, ip: 209.85.215.174,
 mailfrom: ecordonnier@snapchat.com)
Received: by mail-pg1-f174.google.com with SMTP id r23so5266235pgr.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7Uv5o02V1TWm83HUixCPS6CmdcZfZ4gUF09Jd3x2DpY=;
        b=NK2PCAxR3e0bIp78Jh2iTJn2ZcFbEo2qHabIfbXDOIYUk5Y8Z6yZnTXhot/P91RwBh
         YeyiZrarA5X7zlnhAxqhymm8uuXOF6ojlQGss7gU4/+gUwEXgtTVXydKwK+U3AbYgygr
         cPPW2CDmtzp9T51+Juz3mExf3GXg/hR+oD8Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7Uv5o02V1TWm83HUixCPS6CmdcZfZ4gUF09Jd3x2DpY=;
        b=ydxt91VWjNR51PFeuku3pYXJHbWSSx1qDUj1SyITX1HG6LWCcRIK6Z+5LyJMqzqTFt
         E9U4i/lxoa4A+9bjeToGFwDGLJVXINWJrufSX+QzMEybvPZ6TD35hJm4Sx4sryIC6l0K
         DAt/rmFgDI5vr01XGRWGP2OAe9pSdfPCVFjPAygezbBOhbEQO+NVTaL8YOcJViFd6bMn
         V0o5I9I+2PfdMsUKSNKoFDu2ymDmZqBcegoFkQTTzMH+MqoHQTKTtimTFXdiE3H0Hky2
         UXFC6pnRTzHDA8sMICMWW9mXGM4XuOxTxBjBVSUDAYxFh2dNvHeynk025Y7dAuLA9LUO
         tOUw==
X-Gm-Message-State: ACgBeo3OizSjXBrmIuPhXtqbBxSm75DHcHTbzNRnWC7VrBAZUgFBBjsZ
	ow1rae6UIL71zGJt9rs9KIj9nORLF5Jvngai4k0=
X-Google-Smtp-Source: 
 AA6agR7TDvv7LsYUZj9uqDy4Hvw5IiEpDSTxZ4d76twjFFyzbOtdGt+Gda6a04Uyn+TBbUtMy91PZg==
X-Received: by 2002:a65:6b83:0:b0:433:959f:7037 with SMTP id
 d3-20020a656b83000000b00433959f7037mr30997064pgw.224.1663149595654;
        Wed, 14 Sep 2022 02:59:55 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.86.25.14])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b001728ac8af94sm10339995pla.248.2022.09.14.02.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 02:59:55 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
X-Google-Original-From: Etienne Cordonnier <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Alex Feinman <afeinman@snap.com>
Subject: [PATCH v2] opkg: add option for zstd support
Date: Wed, 14 Sep 2022 11:59:45 +0200
Message-Id: <20220914095945.2046769-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 10:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170651

This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
OPKGBUILDCMD = "opkg-build -Z zstd"

Signed-off-by: Alex Feinman <afeinman@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/opkg_0.6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
index 7b351e8123..4cd589cd29 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
+PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
 EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
-- 
2.36.1.vfs.0.0


