Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AFAC54F51
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25489.1785134522419580308
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=THvDBOMg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49558ce01afso17219645e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134520; x=1785739320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GW+crXIHj2mEz9BvH9GpshS+qT7oS8BcmeHI828T1cY=;
        b=THvDBOMgneJw9743F5FSJZ/UihGI3XAQKeP5JHz8b+mOTivBKpx0OL25VPH0bXcmE9
         lP8h8qKJEWrXlAR52khzAb3OWzS4Z66dYDois7XZPggdrn3xEgpH8eaFtemrAp2wuHFU
         FuWbCXPWMpTFUBb8v5A43NJ/Gjfauh3ysBuCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134520; x=1785739320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GW+crXIHj2mEz9BvH9GpshS+qT7oS8BcmeHI828T1cY=;
        b=jiT2nCqR1EwRGlCKXbqDdneEP+khAdVI5sdFqJpQaeIDeEe7upOT+TxNMIm63t3STv
         z1hhhN4u01SkuFUtXnFjO+Miu0VdcxW9nazHqvr1XXmTN+hKdHEtJAT2PvkCo6SewNVh
         P5ATkK5fhWWpUhkcwFzH2lKdmZxsIVXC0nfZnm2eaa6Ahuh1UdgEDyzExbg6xR9mz/pQ
         DoempKztxlziTVcqrYZjHMf2WzbqmB8JdM9p2a16TGbf7AoKbRhWEQ+xwxDKLE/prRsI
         ZZRYpCtXtrGmiCbz1SrOZRG19zMwskABUB5Gr8NYmPN1Mizm70U0z32xeq+aynu2obEQ
         n4GA==
X-Gm-Message-State: AOJu0YxLzF27NzOAv10m+d079OADvsuRyP7ggubhR0UB2f5UgFqtfCet
	7gmumxt+39qj+1ARCSEH4kvIEB4W7f6WG7r/vy5r+LRrO9g72XNOsHrwA3eABXBvRG/ADl6+44n
	Hm5/7Flc=
X-Gm-Gg: AR+sD10X3qIKSKSGAcJdM3LREG8H7Ydk5nFF76DgOlrh9L/2jJcCywpeJVZ3+N+Cmme
	q16HNeGYYiJ0G9PTKxgME13hFiNZQ28ZIIxqOxBLm/PzVlh/o5rpzoQH2TDEldpnLrvCz+1HmQ1
	jArS/k+28fpGnqlzhDOs/2UMptNg3RBotuDoUXDacH6DIxc5kBaPrBshQtMANErWAKuVuA+nUbV
	oQuaTuSvsz/lBTFLm9L3z9++k9do2mti+L6iJla2t7XmJXHI+h6j+t8SJgu6Wvh9pb1uL4l/tfh
	iuUbXnHokM02FRE1Z0ERzyKExtRg/yhTS0qelcVcrcCySiuoUQkAl2dHeYsmCirIJzO3x21+Wq+
	LCCStg12qL7y/za5TwRoAkqCw7G36zYGYzgjugtuC/lYU4R7jYHgjRvCXJPSeExbFjvn9HuT8sj
	PNWx3QRB03nF7XZWey9WVLQ+XktriZlw==
X-Received: by 2002:a05:600c:1d07:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-496b57258b8mr101940265e9.26.1785134520386;
        Sun, 26 Jul 2026 23:42:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.41.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:41:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] libical: upgrade 4.0.3 -> 4.0.4
Date: Mon, 27 Jul 2026 07:41:49 +0100
Message-ID: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242038

This is a patch release and is fully source and binary compatible with version 4.0.0.

- Fix an uninitialized memory issue reading zoneinfo geo coordinates.

Please see the [CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libical/{libical_4.0.3.bb => libical_4.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.3.bb => libical_4.0.4.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.3.bb b/meta/recipes-support/libical/libical_4.0.4.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.3.bb
rename to meta/recipes-support/libical/libical_4.0.4.bb
index dff79bcc4f1..516c7a95b01 100644
--- a/meta/recipes-support/libical/libical_4.0.3.bb
+++ b/meta/recipes-support/libical/libical_4.0.4.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://flags.patch \
            "
-SRC_URI[sha256sum] = "86f29029d0ec9fa30c9001de16c0859a3816ae154ff5b097392b014e21a3d254"
+SRC_URI[sha256sum] = "c851cdb46da5e6397881dafaa592c5516fb49da05dd1bb095f711a6d20eac422"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 

