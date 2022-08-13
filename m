Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A7EC282E7
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:28:21 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.1925.1660364893145275671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BAGjMJmG;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id bh13so2330375pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BcitRYar5+tY/2Sc6Xt75JwBRqIv1MdNxlG6jsleDaw=;
        b=BAGjMJmGB1mq2P1UxBZ0V8d6Ys6EnTmmyidnc5gp7Mk66O66phD+9nTdMP0ygw95Yw
         N/CaapyLfULXfptobdufHsFwJk7nrMc3jaYlq7goP5jBI8V8/GwjyH/JQoIBz6IxhMWY
         TbUzYNrwzhRqDtrUqcb+GPUAg5vLTDWZ87scGRj4a82nCOK6iItXSA/gsU/yAuVSOsWm
         A17Ojs89r/uZTY6pG+h3MzapDVn0f6twW7MWOY14fCTxkUiPUxAAUvPbTBEIXV5Z9JXB
         U29OQ8jIYrbufNAnpmWYfnP/yopH8qkRjsZqCdHCiLt0F6cV8plP1vvLQryrzWXQdDu1
         FjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BcitRYar5+tY/2Sc6Xt75JwBRqIv1MdNxlG6jsleDaw=;
        b=uXTCljRfcPZZcdL/NVhqoQCNoYix9Tbb38HWO+BVqsNUQK50RdlnaPUWPFDcqW2Jol
         IK5g3R5XOVydRNkTugLk/EcGs3EZHvWUKusfSlogTEwatN2S3RdtSSa2SMRnw2rx0/vd
         AR0wbBqmnC3d+0zkog+xEaSNvQqJv3y/18zcLIA4saN8Ypx313uE93gl97YV6o0LhFyF
         J9aMuuK/K0hh7DcZhL2dMco0U8t9wHz3smEHIJzY8i7lFLo5+Zh82TnfWC460dXYb8W/
         Ozy/1tT+jy7NJntSsF0FRyvv0xyGaupKQCTWwQrD4dQZgTPTq8bYch0ailltVqGXoL3e
         RI5w==
X-Gm-Message-State: ACgBeo2L1NRb2W+JvEu3hICOlEXTtApoqkB5P2OZ2SFjVUsrEaXDI991
	qE0DherQFy/D3OCyIbBWxiiw18W7Nvk=
X-Google-Smtp-Source: 
 AA6agR7ZGLyQDS1rAJ10UZbdp0dk+Vqc4h/NRBUbA+TAisHD7DorBsin9F7Ab5o1EQT2ipfNisr16Q==
X-Received: by 2002:a63:450:0:b0:41e:1bbc:37b6 with SMTP id
 77-20020a630450000000b0041e1bbc37b6mr5538353pge.327.1660364892035;
        Fri, 12 Aug 2022 21:28:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h18-20020aa796d2000000b0052d4afc4302sm2536105pfq.175.2022.08.12.21.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:28:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] libmicrohttpd: Enable largefile support unconditionally
Date: Fri, 12 Aug 2022 21:28:04 -0700
Message-Id: <20220813042807.3533472-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813042807.3533472-1-raj.khem@gmail.com>
References: <20220813042807.3533472-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 04:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169297

the distro feature knob is deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
index 9c99af7c912..043fed367c6 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
@@ -13,13 +13,10 @@ inherit autotools lib_package pkgconfig gettext
 
 CFLAGS += "-pthread -D_REENTRANT"
 
-EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
+EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --enable-largefile"
 
 PACKAGECONFIG ?= "curl https"
-PACKAGECONFIG:append:class-target = "\
-        ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
-"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
 
-- 
2.37.1


