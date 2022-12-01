Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69213C4708D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.44793.1669904885227545146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=s7GsIzEu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so5374083pje.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVcBAZu2fw/QbTT2JR15Tb71TBZDs9x9YxqyL7S1kCg=;
        b=s7GsIzEucWVcQQzDUkwPye3FMnk0pCKTNBjS83IDxjz1KKzHNAPC6eWPhxoT70Yxyp
         yQ1et4S0Ww7e9NkzNDN5MH5XOWtYQRG++OIBbaoUwn4NtDdq8yK9d2R8jtLtexQB1P1y
         kfPyHsFjz68tGpHhgbdKjiGewjtTRlmx/JNWEupp0T46XvUYpKnVBqNQMgd/HtS/QGA9
         TtLFtcPgJ2klamKn4Bc97/SfOm44QQnfgwx4qi2DB/h9/KCPU+U6xfXvkWq1SSg6pvGr
         p612hO0XeGUAQX/N9ouvkycMRboxoUHdN7CXv6JRvTYg8z+Z3Utfpulqj3ZiFdTXPNf9
         oxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVcBAZu2fw/QbTT2JR15Tb71TBZDs9x9YxqyL7S1kCg=;
        b=l35QN/fEfyo0atqqcIuQDFDF6YvV46kR4uXVtMpq/VwwCw00/Y+Zxs+Q35PMYZlpvH
         PrnloCiDHPNOD7NMubpMXQUo3NsIxNn7NAVHvImsLol4UsWxyg0oyMY+uc1ctUBMZ0uR
         34mp2AYjOrwtxnmKXtxETF0ufBK3RP2/lxzF2BVHj4nUhmJsoe8UI+KuxP1aF0mH4UuP
         F6wX6rvi3USZzq5c95YSs5eFFWOd4vzF0UxtDOFqAVfxLyzqWoGWzwdOyaSxLxvTd+3Z
         yhDOcoB0+alqQGgw1VZqMBMO5WE1zflbxQJ21EqLBRfuDegFjeWbqmRSUx/4DE5FDZlN
         vhcg==
X-Gm-Message-State: ANoB5pnnQwchdPeLSPo4wLSTlRtmykVTHuROFPj4pDhMmnyjWBBRLjhR
	MV1EH3ZgCEd5zv49fzm28lAFpBHCVnmDlzUTU9Y=
X-Google-Smtp-Source: AA0mqf4fFRKaoNXODQZhCx0NEELZ0vPs+GX8B9pY9aL7DrX5YyhTgNsozy2VmO4v9dlZeKrSpoUqpA==
X-Received: by 2002:a17:902:be06:b0:189:26bb:3bad with SMTP id r6-20020a170902be0600b0018926bb3badmr50317457pls.92.1669904884091;
        Thu, 01 Dec 2022 06:28:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.28.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:28:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/23] linux-firmware: upgrade 20221012 -> 20221109
Date: Thu,  1 Dec 2022 04:27:12 -1000
Message-Id: <ce3381ea0db213b4bf13d2593d3d0ed7a7219f4d.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174104

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6940f297243a66bd58d6adee7d690bcee9b9ccb2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20221012.bb => linux-firmware_20221109.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221012.bb => linux-firmware_20221109.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
index c7ecee0d9a..dc977c2bb7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "d6d9d74a344a78028e6b0f1df80db14b"
+WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5"
+SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
 
 inherit allarch
 
-- 
2.25.1


