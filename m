Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F591C54E67
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.14870.1709739734462924984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+JLGaRG;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso569183866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739733; x=1710344533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfLRFb6yNuQFieDLsWCjKmojufJJVJDzrcTK773yWIs=;
        b=L+JLGaRGblAR4wevNIVa7vKfdVNfnaEe9gQghUFKQGbTEnI0KZrdH8JeMnoLQMKjHL
         Oh/TgV1OxFCd5D9HRaZgpCHnnrspTZ6RiP0mBQkyMIZmvZcumOiI29MeI4VW4lGFwPK1
         X5tBqYTJQkvD8sSBXlz0JTPfn+rf0x9OmnQpY9U7k3i5zq79sMqgVE/gZHE4njGvdsmb
         3ZAuChg5RS9d+xxPronE6IPur/WVcPZyyrmxifJVtdI8YGV/PCqjMO7PYlCzbvUyuUDq
         xtfHqhG+7Nm6uSb8as08KqShXtfuUeIzi3B6IwO6aIqjeiWqOt20G1S1JkOyxhI3yow2
         /Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739733; x=1710344533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfLRFb6yNuQFieDLsWCjKmojufJJVJDzrcTK773yWIs=;
        b=pWSAh69NXAKkeQ9hbWP3+Fuk8FmdbkhTS2cAEYiDaPbI526Fhv23hy2AEM21U3gyia
         DR7qmvTwlWLLuen4J+4dEPOTWlypAXbKxDBZVEYVyxpUSaF0axjwIEKmpyP2iIV+HT2X
         GxwDy5tjFnKbPzxJVdYdwxKKFbS+Pmmy2eA6zEF9CEM25bR44L2PrSV4amOFKmGh9xIR
         ZcPQ44QNwX8mlKlQcB61zzL3/kFO/2h5tH80N05kSqf17XILllMn7Ov1gY48UGDF0hOj
         QexHrMLE1zA1mjDdP/RQTOquRhzJ5UDGx5jOKyYLIowciY3nb6+gyPvOQsnL80bydoy/
         SpVA==
X-Gm-Message-State: AOJu0Yy7GSGdf101dRaWZKcpw8HgbkAnarG+munnKa/FblHg1+43ZrjH
	0S9huZOICDbY8vaks9c+8Ysn4Mt/y7vkwtvsThKVXRwepq6BAmChVgkAwHQ6
X-Google-Smtp-Source: AGHT+IGe/VN/1QSd2PLFZODdfKFNo01mR8E23KiMpfIu9uLpfr78Z2hU94GGOFkjXM1sOEGjWvk7Tw==
X-Received: by 2002:a17:906:6813:b0:a43:49ca:2473 with SMTP id k19-20020a170906681300b00a4349ca2473mr10776172ejr.0.1709739732876;
        Wed, 06 Mar 2024 07:42:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/47] linux-firmware: upgrade 20231211 -> 20240220
Date: Wed,  6 Mar 2024 16:41:27 +0100
Message-Id: <20240306154151.3741709-23-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196706

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...inux-firmware_20231211.bb => linux-firmware_20240220.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb => linux-firmware_20240220.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
index 3a3690bdc1b..1fd44f4d530 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
@@ -93,7 +93,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
-                    file://LICENSE.cirrus;md5=bb18d943382abf8e8232a9407bfdafe0 \
+                    file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
                     file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
@@ -155,7 +155,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
+WHENCE_CHKSUM  = "a344e6c28970fc7daafa81c10247aeb6"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -243,7 +243,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
+SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
 
 inherit allarch
 
-- 
2.39.2


