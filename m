Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4210C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.3668.1657094859340373421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fwgb7Sha;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id u12so25625790eja.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2WT6UGj4v+golCOHBWlPBG0mnf1L4Ow639Llb7TNwY=;
        b=fwgb7Sha+VaOdDUuv1xsUPnhpL7hZEmbwvJTzfyRsRpkhpHgRl2WllVyA2hFANNdxn
         HJwMBVobIwvjdqgzlqivVIMu5O1MWcz2UnKf0FvXAvSC/US8KPJgz8I9y05S/xZn2xlz
         kg937HBIi06APBbTWguEP3E44x/gpfIdOXM1gjcDuku36A9OdLPzI/vMx7FMEOl2Qh+o
         9PMulnBI923biguZqzdxMOyzDwY9/XLGimzKUxZ9Y+DPIDRoik7FSy+4ADxdeH9wqWJ8
         56vXYKiEcvvs6JeBt0Sz3mohFrRgIh7LbVEVpqZ/8460FiXAtS8HaZGcS+NFyqa7iS3z
         9MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2WT6UGj4v+golCOHBWlPBG0mnf1L4Ow639Llb7TNwY=;
        b=WdWUgwoqL1c4nvCnLMjsEi9YVnWspiQhkvPW0zKFgHL1ktpzd09HnioK0kXpwUaktZ
         7saovSa/OVARKC4kocYasH1S8aqy8zn3prj+csSPi3El3r370SCFD/TBgBi+CEvOuCEB
         3ETgeQUfzbHLIPrOlh3w2t4p4w1Y2zhtcozkME4zwS0AWM/I0FITn5b0BU5V5sLmCAwX
         lsCBBI4o+lOjgL9bzmYzlCIM3spKYWFJQBO0irQdZu5ekJ9DtwusnXgPpUdnmKVvWx2P
         BKxo1zWmC6tXMRlXy7w+jNFaB1PdAZ3xm/s3kjhfBFiY2YvhtWTVkYogBZNgLFVhInGz
         pVlg==
X-Gm-Message-State: AJIora/dn0tzS+32YHn5mriXgxQhZAK/Ncp8unmB9xL0K/3oo9zYdftT
	C5NknliRJe6yb45diIn+nlyJo0lahtcYdw==
X-Google-Smtp-Source: 
 AGRyM1vo3tIzhbrZZT7pRAz78To1ghNlMKVvv7O/ZPJC3dJ3naAEfHkyem/sj4FJ6nN8nNIYJ82chA==
X-Received: by 2002:a17:907:6289:b0:6e0:eb0c:8ee7 with SMTP id
 nd9-20020a170907628900b006e0eb0c8ee7mr37104504ejc.245.1657094857772;
        Wed, 06 Jul 2022 01:07:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/27] pulseaudio: upgrade 16.0 -> 16.1
Date: Wed,  6 Jul 2022 10:07:07 +0200
Message-Id: <20220706080721.3072553-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167700

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pulseaudio/{pulseaudio_16.0.bb => pulseaudio_16.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_16.0.bb => pulseaudio_16.1.bb} (84%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
similarity index 84%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
index f9940d4c85..64002cd1cc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
-SRC_URI[sha256sum] = "b4ec6271910a1a86803f165056547f700dfabaf8d5c6c69736f706b5bb889f47"
+SRC_URI[sha256sum] = "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.30.2


