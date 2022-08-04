Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C1DC19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:09:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.5158.1659622152514818953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=R8/CoUeF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id bh13so18051635pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RCpn7XTT7fprPmmJMxw7UYQsajxZ6b74p4I2t4B4RfE=;
        b=R8/CoUeF1sh7/gNGaeL/iRR3FDB5nKsyG5DyLohSWMNgNXv/BUbqQXcwAsCQOy11fR
         NVX0yUucfJDQ7FBhFdxZA/OYAM85KhyMqG3yyLwCrmIpFuMhp6h2hoB9eCD2tqIuDCow
         7amUovTZyZSMANdWXOJECvc6SyFwn+Q+CAED6TherYump644jtvgjKVmqijqlAX64iL2
         Bg/BYoDGFSPptWCdiB3wiZzc2SK97fY1oXWYUbDKc35i9VwLd3iJpdEKRMiBYRo6owGz
         ifuByR6O9EEERgnWe56WDLXgAn8UsAqRNyqjhqo+eiI6As+/zmZIKzD9eARxEFP61cfM
         frMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RCpn7XTT7fprPmmJMxw7UYQsajxZ6b74p4I2t4B4RfE=;
        b=gaFpxRH/7Q76V1aMdHjDh22D3J8o+YbKciD8DI8NG1/lgYDeGMnQt7hIKIIayAQejf
         2ed1Omz5pdLGqdU13sx3t6uyyHs3qNZmOnU7LgzgPfF4lRpELHkEVd/xknLUJx/CM0JK
         ASPTI+ttK6OY90lxtemG8y7IGWONHFH3XXGzeKnP9OQIQ2jIzNr0kzqQ5Lt9LUfigw6T
         nSUBvBdzKqpWsYDhhZ7pVGGQXhkvpKVB1sdKqMoAjB7KL2Ofg3DZymEb+Po84eH8J5S/
         Kbxsrc9M173VzvPgMow3JkKeu80ZMaIjEVp1cJsy5IsjZQmydTM18vDtK4DQWqhcyZxH
         MFPQ==
X-Gm-Message-State: ACgBeo2e8k8okXF2dI4nVeKU6A1d650N8CfJvLTEPYf8WMm7JXIU5mGZ
	rJoF6izeOa4L4qpifXkv2wjDcFYTg3tEVHgC
X-Google-Smtp-Source: 
 AA6agR7xbVLQQlE+oVv5JxX03/Taoxqta3kGepAvPMO1cCcbMhlBq28E3/f8VO+asqceceF94foYSg==
X-Received: by 2002:aa7:8b58:0:b0:52d:8816:a905 with SMTP id
 i24-20020aa78b58000000b0052d8816a905mr1961532pfd.74.1659622151406;
        Thu, 04 Aug 2022 07:09:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.09.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:09:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] linux-firwmare: restore WHENCE_CHKSUM
 variable
Date: Thu,  4 Aug 2022 04:06:07 -1000
Message-Id: 
 <10bc3153effd8c74c541daa00c9c21d0d67165d6.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:09:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168853

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Restore WHENCE_CHKSUM variable which is used to hold the WHENCE file
checksum. It is necessary to allow easily overriding it from local.conf
if the devupstream version is selected:

PREFERRED_VERSION_linux-firmware = "1:20220708+git%"
SRCREV:class-devupstream = "${AUTOREV}"
WHENCE_CHKSUM:class-devupstream:pn-linux-firmware = "abf1077491eeb261ecdcb680a34fc059"

Without the WHENCE_CHECKSUM one would need to manually patch the
LIC_FILES_CHKSUM variable to change the checksum of WHENC (e.g. using
the anonymous python function or remove expression).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 554be2af1e0a03a2d23032d48afbbe0913a45409)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20220708.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
index bde7178164..91c32e49d6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
@@ -128,8 +128,11 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=def08711eb23ba967fb7e1f8cff66178 \
+                    file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
+# WHENCE checksum is defined separately to ease overriding it if
+# class-devupstream is selected.
+WHENCE_CHKSUM  = "def08711eb23ba967fb7e1f8cff66178"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
-- 
2.25.1


