Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223E1C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16025.1678375217289833752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HyXSiL7C;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l1so2214394wry.12
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1c+OfWBDaTZ6DZA2wTlmWWcoB6GBYxuluApzsTkJMNI=;
        b=HyXSiL7C783kFNj+6fyNqYQewcuPn9SCkv6uxhDFEF+cF3243F7E8+mZwi/jsaEdOu
         RFoDOPpVcdu5rti6Wh36G/9L6S1l8Hs8BbnIzwdRh0MH0IANwSAlCMLcZGvcsqaroTy+
         0irlVQWxADyK6JWjsElb2YfaIN35pjSXld8mGbSlL/vIV17nXWsYdh/a3PhHtMDqyqz8
         zGXaDQNwzAFSF4Oa0/DeTupFG7J3Kjl+vbNLKjBwCuvFXloTBKZfh6okrkl/pUQK7XF9
         g2/twUl/aPBj6PSwfIU6yfiThgNlKBMlm8Dqq5KaXvZtxxpqe2gsjX7NBRYNKDR78v9T
         bUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1c+OfWBDaTZ6DZA2wTlmWWcoB6GBYxuluApzsTkJMNI=;
        b=G541VJKglxr6lLIccFz9dQ9WoOrC245AFIetRZqDsnXF8lj/6761+X+xP4WpfoaU0c
         YdoAHm4iE/bA6dpxnGob5munwYCqYRqJoVacbyGlAQ+F4M+xxBQ8vTqD5HQQhWccvN7X
         GjPK1mf+ml1krgPXVXSdGkl2Gm53V8QIpDftO6wm1ymmpRzOeM3WlPN8GoDe4rHpzzGQ
         jxbFSIW1eIdUvBnNpsxShCeTByAOV+pSJr3iUqIsX+Hy3jJL7Go4E3leX1aaDACFhjZY
         VXjso7zz5pQQRcby2zTXYtQhQ7bS3JqsFggRvhUo3ZHlxtWvlGr5Tm62JUFf1J6dBxg7
         4A0A==
X-Gm-Message-State: AO0yUKXaEix1TC3yvUBmVqEXYqwtcvfo9EVLxkPmefaU6rZdpFVRihuK
	5L55Gnd6yDCfIgPoQPhMO1tx/ZV3Bss=
X-Google-Smtp-Source: AK7set94h/9SYBQvNynTUDUO6nBQt6uRtbqA4ZX2iTaJAHJM8U5+Grz5MrVtbWyMNJfRkOTnKALScQ==
X-Received: by 2002:adf:ecc9:0:b0:2ce:3d1d:808a with SMTP id s9-20020adfecc9000000b002ce3d1d808amr14775729wro.62.1678375215733;
        Thu, 09 Mar 2023 07:20:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/26] iproute2: upgrade 6.1.0 -> 6.2.0
Date: Thu,  9 Mar 2023 16:19:54 +0100
Message-Id: <20230309151958.3619193-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178247

License-Update: copyright snippet has been dropped from ip.c

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../iproute2/{iproute2_6.1.0.bb => iproute2_6.2.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.1.0.bb => iproute2_6.2.0.bb} (94%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb
similarity index 94%
rename from meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb
index 7272e8f147..65ddfa8223 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/ipr
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
+                    "
 
 DEPENDS = "flex-native bison-native iptables libcap"
 
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "5ce12a0fec6b212725ef218735941b2dab76244db7e72646a76021b0537b43ab"
+SRC_URI[sha256sum] = "4d72730200ec5b2aabaa1a2f20553c6748292f065d9a154c7d5e22559df9fd62"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.30.2


