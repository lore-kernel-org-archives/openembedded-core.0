Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79383C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:08:00 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9131.1635325679382860463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qzXeguQj;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id e4so2871841wrc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Y8xcfqs7JAi3FPJhewfChTzBxssLeQKIKKxgXQcN0U=;
        b=qzXeguQjCGTB7aSW12BMFERJqjc/C/elG78sdgtUnOr1lRE1maKfdpOMQqAlMAgmQj
         4eaV1q+gCuDcGk0Rtnao2e1O+0CGrS9qSiHgsa9jsC2TSPvHHGfkP5XSRhCVKztdKUf2
         Z8uet0F1etjyMIRUpmBQmqjz2rDFS+PE1sAXFUOAjK5x2AkOKvACBI9RMx7YV7as4IqU
         dK9ITK+sSCv9OLTpjTi+oHxhLPioVjLrbjBPf2jlNizatHHvRu6oZLbHv5qq3bTzbcUu
         J5uu5bEe/ihp86xGrHdZw260RBa0NTG/bvexFOTNYvzCMrEjGeMK1Jb1129Gc1dg1ptE
         bS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Y8xcfqs7JAi3FPJhewfChTzBxssLeQKIKKxgXQcN0U=;
        b=w3Y3ELW4R0w/pQRrZq6tCgbzMQG3kbAsaobeyFqPHiFpgjaFzRl55pQxMDsTnEM4mJ
         C2Q38sWkosYKEXHMlutVNLAuVXw0BUmwfcMVuoSh/mUshyvVJg2dkHQhKmnIt22PwemE
         Q3YGuFRWqsPKCpolpB2M5IjLadURf0GYqUAQXwcm8XMi18qBUJVlRyK3sVLcdRKt+Q+M
         SXrgUIPIumDRKiBiGvELJPOlQnNkmx3O7OIPb5szV/UIzzfMVH4lwmefYyXIDSNzd8YZ
         uFUGvicGQ9FiNqcIHbirSdXdpkX9+Dr3g5ZYtGKWwR8wUjYoSTYc7o4GY4AqcfFZm9Ey
         JJXA==
X-Gm-Message-State: AOAM530ayUxhOcKQlDEcg3FOMJW+e6kdSnMK2/sAP8Ngdyiz9PyQNKa2
	JVUQCPsGicOg0JQ3GwVlgCc5IatA/d4=
X-Google-Smtp-Source: 
 ABdhPJwN/99IduWOYwB1xdvwVhqPC9esQSu8Jg6wDKHAIpx+vsypFpXrt6AqMtgBa+Gg9Ct0Z0Mrkw==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr38315450wrs.110.1635325677996;
        Wed, 27 Oct 2021 02:07:57 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/30] gstreamer1.0-python: do not supply unknown g-i options
Date: Wed, 27 Oct 2021 11:07:35 +0200
Message-Id: <20211027090736.2546759-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:08:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157505

meson 0.60 turns unknown options into them hard errors, so instead of relying on g-i class
(where the options are mandatory) add g-i dependencies explicitly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gstreamer/gstreamer1.0-python_1.18.5.bb          | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index 74dd15b3eb..a32805d129 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -21,6 +21,14 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
 
-inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
+inherit meson pkgconfig distutils3-base upstream-version-is-even features_check
+
+# Generating introspection data depends on a combination of native and target
+# introspection tools, and qemu to run the target tools.
+DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
+
+# Even though introspection is disabled on -native, gobject-introspection package is still
+# needed for m4 macros.
+DEPENDS:append:class-native = " gobject-introspection-native"
+DEPENDS:append:class-nativesdk = " gobject-introspection-native"
-- 
2.20.1


