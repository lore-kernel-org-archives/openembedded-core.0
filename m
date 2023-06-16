Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DC1EB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.208.1686926251518737798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Jw6Yv9h+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b517ee9157so5365805ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926250; x=1689518250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdEIwbP/46gPl3KySD6tJ2i+qiCiK6uB4GXojrXLh7U=;
        b=Jw6Yv9h+KEx8znq+ntPBja8g59y/F3AZhSmmhar1+wgoc4qYRnpZuNGnrvxSvYWIVV
         4uIFL/+4UXmN9/+3vQ05QaW+jKyMUqLqrcA9eOI0Dkg1xV+SZlCDv+d+G138HKVmIAz9
         DiM6chlAY29XnOenKjPDM0agHhpAy4cwGmgrkMHP0uLNeHP+NDuQEfmUnLt8Qj+t6142
         G3X9xX9u+bS/a2Nw7iJ4WjzvK6cBfOy3R6vhlJzqlthY5hSALS+v46UsRi3fS1rOIynL
         vEznNx6X5aEL4gPKMNgdWAk+yFQG+un0OCrEFBdMFblqSuHmZTpRhku/m5sVq0/FAz07
         AiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926250; x=1689518250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdEIwbP/46gPl3KySD6tJ2i+qiCiK6uB4GXojrXLh7U=;
        b=ezD2MMzr9WcZTRnJcAGIvrvqEqCkIvtTbjgtzAtQe+esrFDH/zBnNhpGAP5vtv5RdO
         MYO3TNhlgCfTC0PPqCCXpEyTel7gA9NIP19qxyZSmXFaOHyNdAo+EKXS03LhuDA25wF3
         +bgaMEn8JZqwKkKhRpSlbzqlNjoqdyY8P3e02FkuYpey8bSAMM3/TrA6IYwDSQnWOKlk
         Jrl5C2R1kneNC7LwMkrUVXRdjQ+6r7v5W8CdgrHoMCRWDf950UlROMmh1fIa+M7f4+/K
         lqDtUSfMN1yXNDkjI4FVpG0APBwVd/kQiLBdei3E2kphyXXp9FweRnTwgK0uPRFfGLAq
         4x4Q==
X-Gm-Message-State: AC+VfDwMPN7ShbNcSb/le0QRYVKx9FURCbA5ZKFYxdgrG/R1db5B8t3F
	0zIzJx2fL7dcArtcDLqqfux4WgrUpaNYwoPKgjA=
X-Google-Smtp-Source: ACHHUZ5JiKrvt+Ka7rdPONXwEDtLj4dY4h4Ly4HQky9HZj49b8o29terobpwCRktXgEae6i1nKVUVA==
X-Received: by 2002:a17:902:d2c7:b0:1af:9c06:22e5 with SMTP id n7-20020a170902d2c700b001af9c0622e5mr1732153plc.69.1686926250409;
        Fri, 16 Jun 2023 07:37:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/24] bind: upgrade 9.18.13 -> 9.18.14
Date: Fri, 16 Jun 2023 04:36:56 -1000
Message-Id: <046e4dcebb7e098374f0d81db79bf247c81ec977.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183026

From: Trevor Gamblin <tgamblin@baylibre.com>

Stable branch update

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43c97c6e64c554f41a3a45241a7547bce21533e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/bind9                   | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/conf.patch              | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.13 => bind-9.18.14}/named.service           | 0
 .../bind/{bind_9.18.13.bb => bind_9.18.14.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.13 => bind-9.18.14}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.13.bb => bind_9.18.14.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.14/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.14/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.14/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/bind9 b/meta/recipes-connectivity/bind/bind-9.18.14/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.14/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.14/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.14/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.14/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.14/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.14/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.14/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.13/named.service b/meta/recipes-connectivity/bind/bind-9.18.14/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.13/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.14/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.13.bb b/meta/recipes-connectivity/bind/bind_9.18.14.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.13.bb
rename to meta/recipes-connectivity/bind/bind_9.18.14.bb
index 8617137e87..c513cbc8b6 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.14.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3b06b6390c1012dd3956b1479c73b2097c0b22207817e2e8aae352fd20e578c7"
+SRC_URI[sha256sum] = "9ae12edf6ac3c430b33ecd1a7c0c0c60875d255185eb87850fa9a5e794a64a09"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


