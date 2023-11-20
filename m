Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C123C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:03 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.598.1700498339414262879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W7EDon/4;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b512dd7d5bso3312213b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498338; x=1701103138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s27ZfjLXWtiyoysZrVfLglopkmUCsaE8tmyvVR1MQmw=;
        b=W7EDon/4vDHFF2/xnIPOSqYZIVoT8UpQfMa6sYPuN7xDEymWxaqLLqDSvNZzeuoc6K
         0OLlzdmZ7yyPaECtaV9qYmF3CpXfKRb29IPRKtGLQS3BksovzX/2ixBWTajZCzmfL5Su
         AdBx+L+mxdo+j55mTHInieHmarQswh+LVFPQrZKNK4mC1pN528yB6SrQMH8UQMkDcWWu
         isq/+S4L3ELa0OZi6PtMVtkcViNMO/VYnVQ/7ho5ir6X9wPL5VhIPktdJr9WytlrSJ0z
         3mQlrDw4XBNBjyZFGp/P7YmOGpPYs4MBrwzWnW6/fdmLlRQKa1oBJ9vXrtbJDKT3xnB0
         zJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498338; x=1701103138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s27ZfjLXWtiyoysZrVfLglopkmUCsaE8tmyvVR1MQmw=;
        b=lFBakOdPgQ8CuCtfFSBT33fvzg/Ws9VD+kuh/vO90MElLEFDut4JJSujtLgb1mtu/T
         BKQ67mB6FF28BwpJyQRRM8/HBo4jlMU92ngImGVnEfWgqRLzMVUkCpo+FQBlCB2p0ObN
         MUPCa8InAwdmQoxP6CBNFHaO7+V5S6ZMOq626s6zGXgtdphVM8dy94R8Wp+m3Xfq9epa
         zdMena0vyZbU4nfbTL1pynaQXyurAtcWH2sVHjkizAuatMcajwVRZIOg58ioY3s5nvOw
         Zg6V+9Ca7FreZYc3zsafNxoMn00apaXmBMUu6A4R2sy8757uveF8tO+xUPm5AszbafHD
         y9kA==
X-Gm-Message-State: AOJu0YwmAqJj6slWXnO5ABYOTiXiRa5HiXSuT9bkzujQsMwEp2f6dzP2
	7Dn7HUSN+I7TEaeRKvuhBw/2ZetZjcqbY9NDIvr+ow==
X-Google-Smtp-Source: AGHT+IFxGnNVPCx/ej+vbKb28jxDGumDiCyyz7UhTNYN7X2fE7Z9SK82N9yR+lwxk7PZRpMA1x9Zfg==
X-Received: by 2002:a05:6808:1201:b0:3b2:dd87:fc with SMTP id a1-20020a056808120100b003b2dd8700fcmr9834706oil.2.1700498338096;
        Mon, 20 Nov 2023 08:38:58 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.38.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:38:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/33] ell: upgrade 0.58 -> 0.59
Date: Mon, 20 Nov 2023 06:38:16 -1000
Message-Id: <daebf66af566e56bb9f4cb6c0e23330221e3ebbc.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190891

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue with symbol visibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 14eba663b56f8f3b9c3aff5661cbe2aa7befe86e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.58.bb b/meta/recipes-core/ell/ell_0.59.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.58.bb
rename to meta/recipes-core/ell/ell_0.59.bb
index 04e8566305..0483dbe582 100644
--- a/meta/recipes-core/ell/ell_0.58.bb
+++ b/meta/recipes-core/ell/ell_0.59.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b"
+SRC_URI[sha256sum] = "370dc2b7c73cd57856017180a2a70a15ca1b0183bfd453b3cffe2d707c37da3d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


