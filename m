Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E11CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9364.1777739396999285770
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DiSH3iWv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44509921fbcso1472705f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739395; x=1778344195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/unL8dfv+5kz/9JpxMyivsxJZFEfNroIBxmE7BujHs=;
        b=DiSH3iWv7W5iUJBWV3/GHlwRiErCkC5M9n32kLpxOIuUC3XyykSpQXxj90To30/G80
         t7UewtMLemdD1kM2AZU4WgqU3DKKzKULnU70edbkpOXvbSfGimN25KdHdaWptSgXQZUs
         Qh5JDx5hkQgiSP2KndnGCsksaBy5QoDrZVfUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739395; x=1778344195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R/unL8dfv+5kz/9JpxMyivsxJZFEfNroIBxmE7BujHs=;
        b=pgNqzvWiu3eWCGWgTBT6gHmQtORl/W+Gafr9Z6ynOEVcT7+wSZ1dSoArpKWoKdRIvv
         aTssWiuqSskBG9aOfznox043jx/1pDTy1ygc9MZwdJ7bsSmu8fPBVRcjMhqZ+SssmKK6
         qkTQlXwaIIWUjMbeRlmwTkmj+5QDI52W6PVeFrXOykK+t7JnqfztFlBKVcmG2yF/tF3I
         G2Z9+mZU5ho56iZbNGn59w7kf5l1etqqyCsMU8EBBlZ90kNcpBcaUa7AActPlrE2UlEO
         MBhf5RI6Zqg7rxwphkDCePhld3gTdlWFnURx/kdNdavaYLIas1jU4RQtizYdR/E873Hj
         YIzQ==
X-Gm-Message-State: AOJu0Ywc7zKvD8T7daq4aiTojfZiCNmx30aq2pvOSv77QhYt1tl7BmN4
	mvhah0/rUqGTQV9yNNaHwOpi4RJMTzLnVqlMrdhMSc2KK4auyeHJR1mHf34m+Gxzzlx5Cxf8zih
	OgqnS2TgvkVYfZhLJs3DtlCOHN3xXHU0fgopLTFu9UtVg/XBQ2kn/usZk9zcT8BUtjbaAg7BDSd
	95k26K7PQjMWPOEyE=
X-Gm-Gg: AeBDiesngrvirdABYwfPxvibSGFWADPHwpC9OLIDX5MPIlI2zz9vKa6bMdqj4JRDw87
	VeQ6JXPxPn7I4DBwpLBOv0jygwidhJSGfLS1p4BbmLwRnK/VQ1uxHaom5Q3roSNvBJR9qa4w1rh
	c2MOe6vP7lhb7/iABLejCeN7OVELjNsO2qYGdLa3Pyu0NSg3xFOWbjskQLke9y93CSRdcKH4wQ5
	erorTqNukMyyAm7TqfD9Hx8mrRD90Ncm7msufXCTHkPA2A0Binr6BTPH0S2JVnj7q56Gn/lpPRz
	Zc07Ppu7BrmWtWNTS0zKAPBR3BYq3SVAdCRI74AontPL/DnjZyPRQFb1Bl1hktiDO6QeNeRCtc5
	xft3g3wZG/E6PRaubEKktHfRZJe9YbDodUiyzFUrYF0zjujEZAED/37G4/F+Wdx0l4OSZ0Ld7Ma
	u9ogvwxMU4M4OPC5nzC5dJfkIJmzAUluoOrIsh4YqWME6Vt/W/BQI1//7mSvae+LU=
X-Received: by 2002:a05:6000:290f:b0:44d:1338:46c1 with SMTP id ffacd0b85a97d-44d1338472amr299421f8f.5.1777739394612;
        Sat, 02 May 2026 09:29:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/62] iproute2: upgrade 6.19.0 -> 7.0.0
Date: Sat,  2 May 2026 17:28:34 +0100
Message-ID: <20260502162929.1377831-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236323

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...lude-libnetlink.h-add-missing-include-for-htobe64.patch | 4 ++--
 ...002-include-color.h-add-missing-include-for-types.patch | 7 ++-----
 .../iproute2/{iproute2_6.19.0.bb => iproute2_7.0.0.bb}     | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.19.0.bb => iproute2_7.0.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 614cd004994..efca33b6cf4 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 228a051a53a4e6b1ca2640932cb78a23e44454a8 Mon Sep 17 00:00:00 2001
+From c32fe3424c067baebbf6c263886e04bb99a5af77 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/include/libnetlink.h b/include/libnetlink.h
-index 7074e91..3dbfa42 100644
+index e91505d..938bb40 100644
 --- a/include/libnetlink.h
 +++ b/include/libnetlink.h
 @@ -13,6 +13,7 @@
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
index 146f2f42a9b..c5c7254c618 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -1,4 +1,4 @@
-From 1bcc784f5c2406eb1898f1b935ad0f534cc281ad Mon Sep 17 00:00:00 2001
+From 2289366b53c5bdc117907e88578d24d2007fd035 Mon Sep 17 00:00:00 2001
 From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
 Date: Thu, 5 Mar 2026 08:06:54 +0100
 Subject: [PATCH] include/color.h: add missing include for types
@@ -12,7 +12,7 @@ Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/include/color.h b/include/color.h
-index b543c267..3794a2aa 100644
+index b543c26..3794a2a 100644
 --- a/include/color.h
 +++ b/include/color.h
 @@ -3,6 +3,7 @@
@@ -23,6 +23,3 @@ index b543c267..3794a2aa 100644
  
  enum color_attr {
  	COLOR_IFNAME,
--- 
-2.47.3
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
index 28ed1093abe..15f626de3e3 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "9332213d35480b647086a70c302de8568de83455a98774d35de216c4ce191006"
+SRC_URI[sha256sum] = "e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e"
 
 inherit update-alternatives bash-completion pkgconfig
 

