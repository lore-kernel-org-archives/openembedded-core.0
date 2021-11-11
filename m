Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65695C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 17:14:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.2603.1636650878136472289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DmULpPSr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id s13so10993112wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2QPj1lGqVl4ayQqR/zOsossaEWP8IY0D7OcwKfd270=;
        b=DmULpPSrOdjheuj7DEoaNJs4Nt91zNHrc4AX+WUL55LrwTKOdjx76UIAufaxb+gg1C
         lOq2dw0VQ3OLGXzH1LTC4V1jAdm31KnsVmkT1vfRsCxBFxdXiKlN/U6/rnmN5PGKRvVP
         CSfpTfT7WWwbwIfCm2hEtZvoEJXQU0djPufa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2QPj1lGqVl4ayQqR/zOsossaEWP8IY0D7OcwKfd270=;
        b=OZbJDqB+KlLSI1dlp/JNSxXFFY9nOxldeSy5gkXvFs9WOrlC9gxrnrW7xIMtU85e6P
         OIUbuvoRNyZ50rGInxl/qOy5mnflnjch9U9866ok8oqOGcHTT/26Oi8V4dT33HX90MC9
         i6I3AJGRdlJyBJ5Af4ckges/WaMS4Xu7k92Y4eCW89QlPcDyFnpjrSixvuzXDpNZRMHp
         wAxMgfJfcPWeyerbViyR46ovJ8YV19/EtG3uEGwRT1XJtJv5A9ZxAmDqzDVVCrNwjvJT
         BTSUoFgNhwePbm9balh+f3MlBd8zBArFlfw3gMFN7k9b2I8coN9T9C8iywL1dYGPYI3f
         I4Vg==
X-Gm-Message-State: AOAM530Rd64czTMqd1eJFrKxxM9TcLgUhBdhV1P3tgSnHk4bxhYBHpdh
	b6Z1GM/doEow3IcIJkm1B9gpTlhf36Srpw==
X-Google-Smtp-Source: 
 ABdhPJwzvP4gKRN4atEJEa6TmPxyIEo5fBVS+Dc4fh5ZegFijTFrbv/MaM8DhOb4qUIusHrfkcvO5g==
X-Received: by 2002:a5d:6c6b:: with SMTP id
 r11mr10608692wrz.231.1636650876209;
        Thu, 11 Nov 2021 09:14:36 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 w15sm3435873wrk.77.2021.11.11.09.14.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 09:14:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wpa-supplicant: Match package override to PACKAGES for
 pkg_postinst
Date: Thu, 11 Nov 2021 17:14:35 +0000
Message-Id: <20211111171435.3868188-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 17:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158194

In PACKAGES, ${PN} is used so it makes sense for the pkg_postinst variable
override to match that else it causes user confusion.

[YOCTO #14616]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 33b1495bb20..25cd8ef82ca 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -108,7 +108,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
 
-pkg_postinst:wpa-supplicant () {
+pkg_postinst:${PN} () {
 	# If we're offline, we don't need to do this.
 	if [ "x$D" = "x" ]; then
 		killall -q -HUP dbus-daemon || true
-- 
2.32.0


