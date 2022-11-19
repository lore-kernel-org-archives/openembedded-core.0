Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A20DC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.26316.1668880099409590250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ABf70Np2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso10955400pjg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmyVFVGUnfxF2rKgfyiXMLlQ/e8kPCvyeinQ/5NJoOE=;
        b=ABf70Np2YRau/AMjp3oMXfItDzUyErJwxmfiNmKHnNGOaXIQAih2akJZZz+TGBd0bj
         ks/O8VaXtWMpdkpgW9gNG5Kxrbfj7rcWIIwy1k1XgTGwM3HbOxS5ndw2kb5W4FgnLzGP
         MoGT94Xj+SAdkyjuehnj9LtdgnvKGowfOur0tcv/gw1M9HhfWYmIAKeem9AWpY6/ov4e
         TNd2Az8EXlykBsLnbk4pDGkRboCFo/r0i/dJRJNr6Xic3fovqCv+iYN08fPSh52IF2mv
         lqFi+UT5O4tDAY8nq2Rb9pSdVLB90iTDk7p56D8+m5LUrRaV6RoJ9EztRYg9al3/z+xW
         L0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmyVFVGUnfxF2rKgfyiXMLlQ/e8kPCvyeinQ/5NJoOE=;
        b=t4/CnIhTudrxAx1bIzj9u3XDySnk0vVFFLpstTVzD2WxTTLzcflyG384o5wi8T4zFg
         hJ343hYxkmYOavD37uEEV0HpgRhoe6Rgh5WUGGpNCgDtrt1oOJ/4YccfHbXVlmneyijV
         dG9gJz0scm4BYl7ShyKSCV17i/AkdCkGD5lK4FcVq8ehax6jPMJ97tglOFKkfkV2o/Tv
         lGPngQgd9jZYvVT162zyYf1HvBEYmHMSZpy+QcpPeZa93sEBJL0cGesvtZZElkC22P9o
         HavkQR9uNG7D45n58uTpoMS1FoheFKMGLVaiv6TGtOIycWR3PfiaCYG+6YvThN329Lkf
         ToTA==
X-Gm-Message-State: ANoB5plLAa9hu7wJICUmu4gKTLkhIrVK/sBxj3Lr7vfWxGHyic3nDmG1
	hMd9h8bmzQAaanZbMxlzuONrsG3aupefeT7Tkok=
X-Google-Smtp-Source: AA0mqf7fGFm8LjBI1GPd4n3pFE7YSnUjv/pj55kz+qjkQ7b8ygNnxd+O47eWJzSJCKej2G430HeraQ==
X-Received: by 2002:a17:902:eb42:b0:189:1368:de88 with SMTP id i2-20020a170902eb4200b001891368de88mr1683200pli.67.1668880115828;
        Sat, 19 Nov 2022 09:48:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/21] sstate: Account for reserved characters when shortening sstate filenames
Date: Sat, 19 Nov 2022 07:47:49 -1000
Message-Id: <e7b826395d59eec6b58cb3d0698caaf3e609a35e.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173539

From: Manuel Leonhardt <mleonhardt@arri.de>

Previously, when shortening sstate filenames, the reserved
characters for .siginfo were not considered, when siginfo=False,
resulting in differently shortend filenames for the sstate and siginfo
files. With this change, the filenames of the truncated sstate and
siginfo files have the same basename, just as is already the case for
untruncated filenames.

Making sure that the .siginfo files always have the filename of the
corresponding sstate file plus its .siginfo suffix, also when being
truncated, makes it easier to manage the sstate cache and an sstate
mirror outside of Bitbake/Yocto.

Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2e0e43b7123cf5149833e0072c8edaea3629112)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3d6fb84d63..1058778980 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -20,7 +20,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
         components = spec.split(":")
         # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information
         # 7 is for the separators
-        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) // 3
+        avail = (limit - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) // 3
         components[2] = components[2][:avail]
         components[3] = components[3][:avail]
         components[4] = components[4][:avail]
-- 
2.25.1


