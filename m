Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A16C6FA94
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.895.1663362507530563184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MidPm6Eb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso556352wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=EohH46bHevYN558Uya5CLKpiBYHOsSsFPJMT6+44q6Y=;
        b=MidPm6EbcSq4bVk/ctYApew83KwYse1LRjY5+t8TST6OBSZXeuWp6QuHIcnwYNAx63
         z1afjkfbUs8a0ChYeV8lvmTrHGNMXQgwDHp2afP5eVHldw/gqG0cnza1XyUfR+bTQI3J
         /lAUrWgZQymXrzS+yN5kMqqoXM0c4yH1b0/ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EohH46bHevYN558Uya5CLKpiBYHOsSsFPJMT6+44q6Y=;
        b=W2Tq65tvAUayTXnAfu+L9I1lJtwXqsf20KTsIF56MWZhlJiya7S706TPrS9lcQmw0J
         30fTKBBF1MhfbkEjrFa/KFcuob0jvMS6jd6QQE/RnhIzPiOtm95xUYR3sz1hkzT8cFax
         GKs80TL1tnkkqL0LV4+O/h+M8o+E4Ul1bj/vwB6PJ2COaJFWwlht9Xm5/lpZC/idXtzV
         qdVcbeZwzXd4K632Xu889TTWHikPhRAuOUgoW8qhKbJfLL4ukHmwdbfuYerd/BweqW/2
         IenF4kBtpEklTa7NC2sJIULBQMu+KXC/EYdPQGufWB8aY2gSd/HT0G1ppjHEpH1la8y0
         kCtg==
X-Gm-Message-State: ACgBeo3q8wbKJSdtNv9tAEU5VN3JoJOxcE190oOrbDCNX/fssNakOFMy
	YWt71DP9XDjWnlOFkQe+8c3CrYYrSmH3/g==
X-Google-Smtp-Source: 
 AA6agR7N98NdbO0R1li1TW0Pk6ZK+qIZPlpQXn25uVEq+Pr2nTJmXznOIjLRSr3F5gRfQX57xppRyA==
X-Received: by 2002:a7b:c4c8:0:b0:3b4:76c8:da4f with SMTP id
 g8-20020a7bc4c8000000b003b476c8da4fmr11139626wmk.63.1663362505618;
        Fri, 16 Sep 2022 14:08:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/24] ell: upgrade 0.52 -> 0.53
Date: Fri, 16 Sep 2022 22:08:01 +0100
Message-Id: <20220916210818.1228761-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170805

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ell/{ell_0.52.bb => ell_0.53.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.52.bb => ell_0.53.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.52.bb b/meta/recipes-core/ell/ell_0.53.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.52.bb
rename to meta/recipes-core/ell/ell_0.53.bb
index b2af0d04f00..78174760306 100644
--- a/meta/recipes-core/ell/ell_0.52.bb
+++ b/meta/recipes-core/ell/ell_0.53.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "83099b14beda2b253a2c69460f9613c5e955b63349e3c00cf2fd506f5b3ba7d0"
+SRC_URI[sha256sum] = "a7d0df846af839bbea1b80f292166371070328854b3fa785b5c607fe600552ad"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


