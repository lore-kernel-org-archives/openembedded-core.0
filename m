Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A681AECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9415.1662016909379968059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lF45iI5N;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso806019wmh.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=s6gRX0u2GVY3gIGI/WySSgAP+acOqcWzS2YhRa1mm08=;
        b=lF45iI5N6qPP4MjoPRDHhvAk2GRH23cem69BJLGoHNcXMJ1b+H9Grdrr+7GhP9XgqI
         9cm4LK659i0ggyy7kSYb4gCkIP8Xb5mu72Vk/CbFW6d7mMMm8JMdt+IMOMg39Z7Ug2x3
         dpgMu6jxMUZrP8bV41/3h+gCCQYlrFTyFY5Krl+Tc20pwohWsIIfBbcsIp6ip3xwmmJe
         lpRhrk3PAz7dGsxCZEXYIe7TboV4PeqRAT9Yl8aobQ8+0YXBwjIR5/kBfv0hKUGX2S7H
         XgvuzjyvVANLQoNtTCPOlmhIPbaxp1MvkOJxTxrdTatG66gZbdlZwSOrilPuC6r1KQJB
         xd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=s6gRX0u2GVY3gIGI/WySSgAP+acOqcWzS2YhRa1mm08=;
        b=FfbEovJ9C7Md+1G6LGQequz71wgK1sk7v/jt51o0rUjA3YenqyCorIyNXQYwk0qbVM
         hDqnHfwpfrD+aJukK+BwvwGtPn4518Vg1Tj6G0yXiPIa2wQNc7tl8/Ibjij5uhUkKJ44
         Kk6iE23uxN4KHsrnfk2uDg9UE66Ckl1G3J7IUqW5TEIu3LC3yVtGVcwErDlPzJULNlkD
         UgWeROpEm5sYQpFywwoK8PFvFzfnf304FtMapcjQNZuMe8hvnBD9wV2qqO2EmEwIJ1bJ
         IDctrZoDs6yZuSE6VEk1XdP+vX89u3FSDAIlCAAxcsrwnBzuDDwtszQRA3lHDfJz0Czq
         qsvw==
X-Gm-Message-State: ACgBeo2RTtvr1m44cvY18Jb4VUqKqlMZt27u0I4Y5pOBiC7CoZ35wIWO
	FDR7ytImT8eSu6ZtxmyUcuUbUtBAiBk=
X-Google-Smtp-Source: 
 AA6agR7H/BkCP2DpYvH9KsygPhRttGb3aRLoK/F1fAae6mufFJzbqSvm1mCpGi+9DhApDg7lxmvUUQ==
X-Received: by 2002:a05:600c:1e1c:b0:3a5:b668:4e2 with SMTP id
 ay28-20020a05600c1e1c00b003a5b66804e2mr4180870wmb.112.1662016907816;
        Thu, 01 Sep 2022 00:21:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/14] libsdl2: follow upstream version is even rule
Date: Thu,  1 Sep 2022 09:21:23 +0200
Message-Id: <20220901072125.3366367-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170154

As announced here:
https://github.com/libsdl-org/SDL/releases/tag/release-2.24.0

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
index 8519e7f732..ff3e162c49 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -30,7 +30,7 @@ S = "${WORKDIR}/SDL2-${PV}"
 
 SRC_URI[sha256sum] = "fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852ab9dd87960697f2e"
 
-inherit cmake lib_package binconfig-disabled pkgconfig
+inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
 BINCONFIG = "${bindir}/sdl2-config"
 
-- 
2.30.2


