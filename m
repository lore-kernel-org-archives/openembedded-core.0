Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B988CCFA18
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:16:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12591.1762427812182780444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 03:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0DNgjhk;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29568d93e87so8373675ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 03:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427811; x=1763032611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf4BtcFw5Re9bZT9oHMmZGt6BKoLi3O+jeOhdxoBqMo=;
        b=R0DNgjhktB3xmKUB0qj6D81JgsitxQZ4c7sAdW2tUjl64Gql0iOoTrgbQ0CGRXn2iG
         kxgQcdCxUwLpcIuuXD/bHIn2t7Qcyc7JENkSLWkVvv1CPlbdmojSaIoboWcJu7AJ1nt/
         VMS+xlBTPpLZr93beyra+EmeZFFX9eWLF0aCHMCKmnZdPSjwDAdXQYBCY2ABff+7hj8T
         Y+XGliQ/rXOYMZHadMRKCRQilLICxc2qhJoDRxBOKSXM8ovsTXHlZhV0q2oNprqpXQbk
         4Dk2HeNRyT839VXBQKY+6s/nQi0ZX/tXGHkj2xZT1LBnapGuWJQ7SgKSQZuQuVdlbIYp
         W2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427811; x=1763032611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf4BtcFw5Re9bZT9oHMmZGt6BKoLi3O+jeOhdxoBqMo=;
        b=gUj2u5Wdq+OYw4Cz685Z5wZVSO0c3lvf1UaZTe5RUxpt13EOeTfBKmVVh0KuwQoKlN
         ZExmEzPeLuLwe08wRxIN0mmtM0BPYP14X+uUTWqdbxhX19weOu8Z2SuzCaHCjglORYJy
         g/loUvKMM1l0V94lWyAw76BuURC66EBiCbf9yiAWpEUpGkjHFeRNYtUIPl5ZyA802/1Z
         f22EZShj8kqGJxpvm3yuR7akDaz1g8wAE+0pLXdzIu3/SpvlRVCJXU3y/i7RDf+bx5aY
         8yKTHIQxI2z2x2RTEILgQMEpbU4Od2CUYWE5u77+8HxImT2hmCr6APN/e9k/g0ApWzPX
         qGjQ==
X-Gm-Message-State: AOJu0YylOEtWvEVJXC7qPdK2qJL71Vf0qR1XxH8j2DkgrwzAD8vRJFQ2
	pwYpUIC7wOxfMe31Vuzut4OpI17ur51CBXaO/5Btj5teTlX5BIJ7ihvIrHGDYA==
X-Gm-Gg: ASbGncuS39jc3TjE2/ZjxB6xKonLocAborApe+K+4NA6EEWpCR7ezqaWEKYV6XOSUJQ
	IMWwXR0AUZqGC/enBWQ3N7KzlAaw4VWnjC9cZg3G7XG62CTXQ1k7FL3DIvLpLDbQbdTrthoqRt8
	9QqpjrrezNQj3reuMLlVuZdSl3cmHntu2puQJVIPj6o44r/lgcYm3Q0wGyCSJDgLYdM8WbaI5VP
	mVEM9U5P1UrBd0I9+aeJT9ii3+6uDUu6aP+El3LwpT0Tp4j6wcOihQoMpcJK+Aut1zuaV6HeZaQ
	LgVys6+VnPzKjKxBKSrrqsuFweByfpCuQkIBfDQ4A4yiKsW7evkR6iq/5PQQW+DUEL1vqYtaKPD
	abfj9Dk/3vOUb8B7tTl5mkyKyz16lWkSIVP0lVrMQWlR0keVUcm3hU9XM0Tzeft4Nwfj+BEh+fA
	SyWaliD3eCY9eS8Q==
X-Google-Smtp-Source: AGHT+IGzVIN/lt4Gjr3/TJip0wvCvljztg6SeaxuBbkwYbGKT6XamqHTgCRAviOHSsOpQP3cKS5YxQ==
X-Received: by 2002:a17:903:2a90:b0:295:5da6:6011 with SMTP id d9443c01a7336-2962adb2b27mr92141095ad.11.1762427811418;
        Thu, 06 Nov 2025 03:16:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f201sm25235425ad.55.2025.11.06.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:16:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/5] usbutils: upgrade 018 -> 019
Date: Fri,  7 Nov 2025 00:16:26 +1300
Message-ID: <20251106111627.1264723-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
References: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225974

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/gregkh/usbutils/blob/v019/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-bsp/usbutils/{usbutils_018.bb => usbutils_019.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_018.bb => usbutils_019.bb} (93%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_018.bb b/meta/recipes-bsp/usbutils/usbutils_019.bb
similarity index 93%
rename from meta/recipes-bsp/usbutils/usbutils_018.bb
rename to meta/recipes-bsp/usbutils/usbutils_019.bb
index b96a1b4f19..6aa5c5f5c2 100644
--- a/meta/recipes-bsp/usbutils/usbutils_018.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_019.bb
@@ -15,7 +15,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "0048d2d8518fb0cc7c0516e16e52af023e52b55ddb3b2068a77041b5ef285768"
+SRC_URI[sha256sum] = "347c52b65a6aeb22cfe3af8382192004f99725850e1dc5f705336e54cf6d59fc"
 
 inherit meson pkgconfig update-alternatives
 

