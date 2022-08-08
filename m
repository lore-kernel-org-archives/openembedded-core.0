Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F7BC2BB43
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.22577.1659940978600102682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fMXDsCdc;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id gk3so14780618ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G2nxR/iPQOBYbZ39TerB37jNUkTERsnyfaar03OWQmY=;
        b=fMXDsCdc72TVTwYopWSXlmNw4wRXMMxORzv9Q/GCRd87CpCQ2MljMjZqBT+asilZ/l
         6kwDzPIHza3dXInKG02OQj5RBGwWZb6PKczwwXUUxzWzPkxRjggUI9q8AmCkFhc5wRzZ
         iQI/FHlj3wE0wOd2ShhC4u8sfTEFg/p264jIY8mRM6KLhEt5XoliO13wQP2urbZsDE/+
         GKaTaCOJ2oWQ8wmwg4Bcmuen6h9lrevVPEVR7poazOWgEm7j3wEWALIMGY/8jm/D8dwf
         9s86P0cSAtw56GutcBDeYHH5K+vc/FiPnJMuMTcrAN60qVab7Kl8qciZ/+wH0EB1HN0C
         g2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2nxR/iPQOBYbZ39TerB37jNUkTERsnyfaar03OWQmY=;
        b=qYo3NW68Ssns7MAUwIgD60o9K9WaxxeOzzjHHR6dfZXZopl1c7/wFboLNWIhjeP/T0
         btGBXpsArT/4uM23+EBfjkll00442Dey9w14S+S2wszOksicvz7iHGscN8+uXM5+Icdr
         bYt69RPS+RRBA2Xy8OhfONxzEYjjKOwDUoKAk2VGETpdXpde7h/1smdnDAfNY12of4vV
         eHsrfENTjVZHtTnT3wg2H8ef6C2iad4fB5BLFs27gsqdvqs6LbvAWXLSOBZNtJujnja6
         U6PcZ2QqRLICKeupnvvuIruLMBOlUhgejq0rJF0p8nccFmBdl25Dqw8roaVJUPIMZG0p
         id0g==
X-Gm-Message-State: ACgBeo0y7N+MyBdRVbiPtKt2IozfqnfQtNxi6RNV5lENT1/1EBJyBwOb
	ftJ/k2Lx98jJxAcLxzG8wk0SqzbqDyk=
X-Google-Smtp-Source: 
 AA6agR6LRvOBPMYEpDKKiZ+6giclKZvfPt4GFf7lVh76oneXCyWCv3tN9ThiQ79xt2PSotnwJaez4g==
X-Received: by 2002:a17:906:ef90:b0:730:9cd8:56d7 with SMTP id
 ze16-20020a170906ef9000b007309cd856d7mr12183141ejb.94.1659940977167;
        Sun, 07 Aug 2022 23:42:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 18/44] gnutls: upgrade 3.7.6 -> 3.7.7
Date: Mon,  8 Aug 2022 08:42:11 +0200
Message-Id: <20220808064237.3975347-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169042

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-support/gnutls/{gnutls_3.7.6.bb => gnutls_3.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.6.bb => gnutls_3.7.7.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.6.bb b/meta/recipes-support/gnutls/gnutls_3.7.7.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.7.6.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.7.bb
index 6a0eb974dd..01fd4dba3d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.6.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.7.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
-SRC_URI[sha256sum] = "77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff"
+SRC_URI[sha256sum] = "be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.30.2


