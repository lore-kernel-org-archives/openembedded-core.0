Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7980DE95A73
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:32 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.27924.1696717528819242642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rb+e/WDG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-690bd8f89baso2612206b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717528; x=1697322328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF3cZpSFb0IfZtwQ+IBI2rtDetmNWsuaUSjEYXOZ+yc=;
        b=rb+e/WDGaEjNp+dCuBForDnBXK2JnWvH5LmXo43uigoGGnnLkfJHXm3FJqwVezFomT
         DEiVcPYjzwqe3ufgMAk7yfoF6pRyuuBT5C5YK5et3eX3jcHTKFKC10rl7JhS/lBvPQO3
         4hAo8KcaqUs7Ex2AhpE7GA5ig41Q4XCKEPqVJlGxvAG3BmwV3XaIbAxMGcjxlnCjvFxw
         oIZTaXoEoU7Poj0mf35VA4oYIVLoc/KTV4uXZ+w4tpr/dONasWUmPQuXVHUs8I0A2eF8
         BtTdmk6oFYcsdKdxYpX3wLuhPYG+CdwY3otYgl5Gu2b9PRwG5EUYTxH/yHeVDno9QZM6
         vFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717528; x=1697322328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oF3cZpSFb0IfZtwQ+IBI2rtDetmNWsuaUSjEYXOZ+yc=;
        b=cJ//0zx2o2chSXwk3wkiWhGvH1o2Ql36rshMLtF8mW6IjOjkzb/k/u76UtqkwElaDO
         UrVnX09Oyui4RxXkJxef4K5M51U93sLITZhTWpB+YkGxmaAsMWVozia73eXWHOBFPVkb
         dUX4fIq9Mhz7vtkaFm3Xt7ws25k5vxn7pfV6XzqmM+pnoNet9jmgGoZajtGxzhPr/on8
         2Z6uTqzqGcjNOG383rUSkpKPYPMXw/m29MvrCA7Df8i8EZf1BAY+agarO6M7Y1/2C7RP
         XaBwNzk6rTHhUh818uAufTFeSUSbnYTpLV1dZfGO2D2puLYeqT3GVc6sb7cPA4CSz639
         M6sA==
X-Gm-Message-State: AOJu0Yxt6guGjVfznF/1/SyirXQV8z/ev23+ZCt2ioYdOrw1AMH7xZOk
	DwwHMB7G7sU9x/XfgJSu50Dn5pYLHC9LdDrjJuY=
X-Google-Smtp-Source: AGHT+IGzFbpvVRgejEMF9QyovLxlMpUUoNzrPjS7F+b+bR0dfNvgvIG3k7/kDEy3Ccu3DlZGYmGFmw==
X-Received: by 2002:a05:6a21:81a0:b0:165:a34a:ce20 with SMTP id pd32-20020a056a2181a000b00165a34ace20mr11130091pzb.29.1696717527675;
        Sat, 07 Oct 2023 15:25:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/19] ell: upgrade 0.57 -> 0.58
Date: Sat,  7 Oct 2023 12:24:59 -1000
Message-Id: <b9dfc608c0db72edfa62c56a064d8bc45cfc14b1.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188804

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for handling sysctl settings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 76d0d0d18498c95945e9a4334de7d44d1024e2d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.57.bb => ell_0.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.57.bb => ell_0.58.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.57.bb b/meta/recipes-core/ell/ell_0.58.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.57.bb
rename to meta/recipes-core/ell/ell_0.58.bb
index 09a0831fbe..04e8566305 100644
--- a/meta/recipes-core/ell/ell_0.57.bb
+++ b/meta/recipes-core/ell/ell_0.58.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7603928ee584b758ca27c67e4dc513049a09b038d7d28459a9440f8443c91018"
+SRC_URI[sha256sum] = "531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


