Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2301AC6FA82
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:52 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.20504.1664133528154743258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tndH8cZ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id f193so4835572pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=3Srwv/FreB9dwVOUe0Rd6HCQR+QY+xbtzyp8gbMOhW0=;
        b=tndH8cZ2FSL/TAcWGuUHP07jFDUy6uM0uboOVXLazgMUM3U+gtz8VrmoA4NscyPn2z
         8x5khq0LpBt+7g9/rmBYMiQrkeaM21sXyM6nRZAHNZZshpEkRIHGExnm2O5vg5BHNQzG
         JK/GXkiKg9VX3m7eNYIloaw5u9YajttlS4gRdsGyyLnOZQWzhRqCtHeYW9p0t4QKVmNZ
         UshWAo7Y1gWfci43jr46NeyKuqTpqrVHPSpKIg6oDMvK3OZJKAp3JaHZ4tghv++9/gXy
         Np4raJcDCFMM+EaQxdrLergHzmwizFdAfoUEGF+uzyomQIY8Eg5y8RDFPBAGBCK24/Q2
         Z1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3Srwv/FreB9dwVOUe0Rd6HCQR+QY+xbtzyp8gbMOhW0=;
        b=RXQyNWlblLyuA535g9R0YULH+pBXIq+LIfpiOk+S1tuGnAs8p99cndJxvkZK+7WLpt
         +bO7m1X72DrnLA0l8xD8GT3NBKwldiEE77wiLOT5cAScWpPK9SBMRcosmdOoxvEFqupv
         dl6CeteFYmYznL4LKlkdi3DbioVnmwLvE2FbsJgggwuSdCO7rE9eX7zxoz0aMpi6rdcw
         h/SMrhE+ldkAHsRx+taaPhXFcQB7exeqWixHeFtEua7RszB4UjfnQ1JOsqC2NPKN7Bu4
         JIiZZmijtxwkuRX1Hl7k9iezmorS1UYii/J+mrRFC342LHJWv0LwrZRdnYdce/iBOsur
         U6Gg==
X-Gm-Message-State: ACrzQf1oDW4EzIovY0k39uGNZR01GZlnBPBmVBsn2m2otgeoS5OhNnZ6
	HEEb88kRdcjOZqyc+jonob+3qAMwv2oBQhSr
X-Google-Smtp-Source: 
 AMsMyM7rln2dkN0dv93+qGrQJs1SgnmrjbUt/faHrVOllU1irVyfUU1ocwlHiSaXHrzB9ZaR1ogAHQ==
X-Received: by 2002:a63:4d5b:0:b0:42c:299e:eecc with SMTP id
 n27-20020a634d5b000000b0042c299eeeccmr16563071pgl.41.1664133527247;
        Sun, 25 Sep 2022 12:18:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/33] python3-rfc3986-validator: switch from
 SRC_URI:append to SRC_URI +=
Date: Sun, 25 Sep 2022 09:17:36 -1000
Message-Id: 
 <15ac2f4f2873a3c7b9f5bd0385d570e7b64fc643.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171039

From: Mikko Rapeli <mikko.rapeli@linaro.org>

The :append can not be removed via bbappends if needed. Thus it's better
for open source layers to use += append if possible.

(From OE-Core rev: 1e09be9455fb054b3f74f088b355116828cb4626)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4546b5186e5aa2808be6c1616eca15219c4fcb5d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
index 4abd181acf..e374979cb4 100644
--- a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -13,7 +13,7 @@ UPSTREAM_CHECK_REGEX = "/rfc3986-validator/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit pypi setuptools3
 
-SRC_URI:append = " \
+SRC_URI += "\
     file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
 "
 
-- 
2.25.1


