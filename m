Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322ADC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 15:38:36 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.34337.1640273914829929283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DwqNfYjW;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id a37so9624815ljq.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RjBl9XJgykTBAGntdp8dzLyUaA5vErfwXfPqFD8aPUY=;
        b=DwqNfYjWjQ+0Jj2SnX0m+XkH6q03SQW2H/6bMez1Lhyq6c9Hyph5B6bZeR/fPwYZ2g
         10B8fMjQ2onkNxVj4jY9J+tAyMkBbb02mAY5SQPjyK4O+9lcCEz6ApQQYxD3W7o/cJi8
         qkkqhp8B2QLhr6gZ3iIfHq0W5cr0NmpkdZeMelk0TbYWHQ7IzrXRTY8w2ywWdpDBEt5M
         q1HFgTesecttga6fDEnGOZlf6K8jkw11lQln6NFsMdlNRgPsGkC0JYgKGza6J7Xrw5XM
         reDVtgC/IE4bW3WKLCHnE+RpT3X946UCQQiIkfSt+vUYRRhqbI9bWU4vNEErIg63i585
         550Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RjBl9XJgykTBAGntdp8dzLyUaA5vErfwXfPqFD8aPUY=;
        b=VB8ebTDUbLIqFN5D9o8LuW0OjYdDJZ0bkBEx890FKX824Z4vCnAjsQ9LK94SpueStP
         bDpZn2KqUxE1rab6SRu8bMd/fB73Hir5mMYf9iaOKPhf0uwmXUkQqeabXKIEjU/3CiRt
         e3yiMkq8pllX3AFMXGv8r7coj1pDmnsMdcBqFeiePlrS84vq3hf/B9hKYn6vznnudfjU
         QPkKeihQABhRSxnIYiMtLuSTJwzRI0I6xTKuQzKglmL7BAJeaK2ZK2wbtpQTacMHRk0o
         ACh0qVLGsuUWcVaXvxQC0+hOBzwwv5CKuoVuydgvOZPyRVYxUOUY7YxQhhMzkEbkRooR
         xn9g==
X-Gm-Message-State: AOAM533MkYvYyUET8cJDmU44kRvQJIfiWw5jVkZT18hfNIqJfbyPPECi
	o9wkcDLQo+Tq+3gxmxIiBGhX1KmFVL+sfA==
X-Google-Smtp-Source: 
 ABdhPJxeio+xxEUPjUQeUp4Ze5ywk5pdgE4rxUX6h/RCxvrYCRxyh1Yt5oS9dRopLJ5uj14g/7cbTQ==
X-Received: by 2002:a2e:7319:: with SMTP id o25mr2012860ljc.320.1640273912817;
        Thu, 23 Dec 2021 07:38:32 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 f19sm531212lfg.298.2021.12.23.07.38.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 07:38:32 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] no-static-libs.inc: Fixes
Date: Thu, 23 Dec 2021 16:38:07 +0100
Message-Id: <20211223153807.1528232-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 15:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159989

 * pciutils/libcap/libpcap all seem to build fine even with the flag set
 * Disable static libraries in libjpeg-turbo-native

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/conf/distro/include/no-static-libs.inc | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 7c6cf35934..ee67383460 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -5,14 +5,6 @@ DISABLE_STATIC:pn-qemu = ""
 DISABLE_STATIC:pn-qemu-native = ""
 DISABLE_STATIC:pn-nativesdk-qemu = ""
 DISABLE_STATIC:pn-qemu-system-native = ""
-# pciutils fails build
-DISABLE_STATIC:pn-pciutils = ""
-# libcap aborts on unrecognised option
-DISABLE_STATIC:pn-libcap = ""
-DISABLE_STATIC:pn-libcap-native = ""
-DISABLE_STATIC:pn-nativesdk-libcap = ""
-# libpcap aborts on unrecognised option
-DISABLE_STATIC:pn-libpcap = ""
 # needed by gdb
 DISABLE_STATIC:pn-readline = ""
 # openjade/sgml-common have build issues without static libs
@@ -31,6 +23,7 @@ EXTRA_OECONF:append = "${DISABLE_STATIC}"
 
 EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
 EXTRA_OECMAKE:append:pn-libjpeg-turbo = " -DENABLE_STATIC=False"
+EXTRA_OECMAKE:append:pn-libjpeg-turbo-native = " -DENABLE_STATIC=False"
 
 EXCONFIG_ARGS:append:pn-ncurses = " --without-normal"
 EXCONFIG_ARGS:append:pn-ncurses-native = " --without-normal"

