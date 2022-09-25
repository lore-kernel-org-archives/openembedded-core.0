Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F17BC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.20279.1664133520240652452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RxiGSPcb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so10523357pjm.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=xsPEzFNYESVwDfPwl+6Twqru+bls9APqMX3kPJ+mQg8=;
        b=RxiGSPcbEI8fw+b7WGC0vSEaiJMTFsOI87brtVkwM+2IAuvpMYmNkI5E0EppjID55v
         A0ranEc2oKDwBW0i8eTEK4y8ViyyisPiBOj6bdaI0H9KeZaQAAiyClwN8ZwMQDbnajsc
         0KEA9O0OOWZ/DJC2I80a9SQTwbBTzQWAoBfHxf+Dvwn5JUOsRfX5U/aH4+5slpb77Xbx
         m+zklgrp6D6AOsM1x+R7ptV1cSx7xaQahXYTIXSxgEcQmGUf2qB45jUQzCk+BDKuRmYl
         YB7tccFrf4THERUWX03aSJDQI1URKMtJ37I8BSfb5+7DaGXbWKnPGat8R+bHHZUKkv9e
         YLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xsPEzFNYESVwDfPwl+6Twqru+bls9APqMX3kPJ+mQg8=;
        b=bnsmZFDmcuKfn3d2ak3Vj4KA1rXkryjZrya5BiSL3C+Buqg66iZGmm0LpkTFgEyKrk
         7nUYwETsjY9HRFDxZly7BfsGmRuRYvaHvVFZVy0hu8bTHkN/gos4UwfDuRmXxzH7Di16
         wL/4K9aV24v9abmK3YGfIURqgqNk4R7H9vWdOClOcQp5oqu4ZsGtCtZKtB68NwOUZITF
         5PPaCyKdnNMi6E4II2cK+grSwqYs2TCrBveOJo8CRs9f+drJm2MoC5GZ/Ese3akyxMPP
         DqoBauvyKroPbiZdi0oeF2Y7q5u24WnzrQ5vatWYqoBP+LKnqhd9tEX06U9QB3tqM0L9
         paDg==
X-Gm-Message-State: ACrzQf0LGQGai5yO9T+gUXeLugFQZK5Yy2dCR5JDdgMAHs43wmu4TwvZ
	ysww1dbMwz4JL02i/euspaMXk+pupOGHEhAB
X-Google-Smtp-Source: 
 AMsMyM7Muw0MNMojh7XQjLOZ/mMz1bRkuNve8kJzovIb27Rt+khCoVPvk5/57oXKTK4ro8svHueWww==
X-Received: by 2002:a17:90b:4d05:b0:202:ec78:9d73 with SMTP id
 mw5-20020a17090b4d0500b00202ec789d73mr21306667pjb.103.1664133525433;
        Sun, 25 Sep 2022 12:18:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/33] go-native: switch from SRC_URI:append to
 SRC_URI +=
Date: Sun, 25 Sep 2022 09:17:35 -1000
Message-Id: 
 <905062ef53c016091c36690b36ed9ed5203175e5.1664133309.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/171038

From: Mikko Rapeli <mikko.rapeli@linaro.org>

The :append can not be removed if needed in other layers.

(From OE-Core rev: e129d2f7e3ba312ab5383397eeabf7273d23a529)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09ed655c2a8a0a246e7dcc745ec89f7a1d13813d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-native_1.17.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-native_1.17.13.bb b/meta/recipes-devtools/go/go-native_1.17.13.bb
index 76c0ab73a6..ddf25b2c9b 100644
--- a/meta/recipes-devtools/go/go-native_1.17.13.bb
+++ b/meta/recipes-devtools/go/go-native_1.17.13.bb
@@ -5,7 +5,7 @@ require go-${PV}.inc
 
 inherit native
 
-SRC_URI:append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI += "https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
 SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
 
 export GOOS = "${BUILD_GOOS}"
-- 
2.25.1


