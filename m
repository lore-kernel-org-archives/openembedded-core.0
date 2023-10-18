Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA43C46CA1
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:33:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.279467.1697628785475794327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 04:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlCotQjD;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so41389375e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697628784; x=1698233584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK2/vsydnnXM1YllBMxTfsg6z4Qv2+6G0scPhkQnGfM=;
        b=BlCotQjD+v5fiSDpFc6mEeuiu2ybehDQpB7wj0JUp5J6CQGIZ+MBiZQEhTbcaUpt/+
         BiCMf+bGFj7X660cKFaz5uhKRGre+pV4HTbYltRD6FVRC+DpevRBlA0D63L0zPZHCpt9
         Z/uEC0OFIKhOzT2aASmJkmxejLz/WSWtLGG96sGG03CVTbXTDNwIwL/XkVV6Pqe5sHD1
         2nHxq4mKvYQ5I4YjSIwaMYRX7F6UXnvH0CboH5/gvVgEyZkYhslG9W+zRhNdszcptjy2
         IC6D9CJEUsT+M2fr4xDTnNVkleTC8Majq3xAmtu2ecBbqDr/4o/F1C8JEH/AfIwwQJSL
         lNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628784; x=1698233584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eK2/vsydnnXM1YllBMxTfsg6z4Qv2+6G0scPhkQnGfM=;
        b=JL/jG10QuvkWW2a8v/fdGbOIlf0sbiP9GtNhWeWoaFzFk6vS0o0NmaBtkhkOhA14Lr
         KA0K/ZjnFM+EEtJdkQ5oiE4r3a2o7yO9+zppaSkOsE9lMymp9pZdm6flcpIgMa3Y0+bc
         GQUE6+pYsbWcwOVcLtW/aVzgjKnOarJVqV/r1bzozwSaRnuu4B4r7gt2ytNtcTr4kcj0
         d8y0Hg8QyQlijqQOLNt6C6g5FTmINpR6+71m8vEKsqbGdWzTuR8k1n5jJw69Rwh6QvSN
         NHTBWrfXjUDvo13/znInNeFQOwN68WVqft1B5vwiROUuqNN5hvMv6W9VDA47CXVwD2ib
         J1/w==
X-Gm-Message-State: AOJu0YxKgyp2qIpOkUKdKrVtvH53ZznftxWC5xiZrYqLsVYUALgWEWiN
	EyYPBMrh7NelvOteQ+e4Kw73+vRmXu9lnA==
X-Google-Smtp-Source: AGHT+IGvYX7WEUvMGR52c679tsavaof99GxY6/69UmJleXZRC81Mq9yt29uNbWlamhZ6kHedOPz4CQ==
X-Received: by 2002:a05:600c:5251:b0:406:411f:742e with SMTP id fc17-20020a05600c525100b00406411f742emr3880198wmb.34.1697628783393;
        Wed, 18 Oct 2023 04:33:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00403b63e87f2sm1465725wmq.32.2023.10.18.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 04:33:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 2/4] systemd: add systemd-crypt package
Date: Wed, 18 Oct 2023 12:32:53 +0100
Message-ID: <20231018113255.607577-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018113255.607577-1-jose.quaresma@foundries.io>
References: <20231018113255.607577-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 11:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189380

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: change nonarch_libdir to just

 meta/recipes-core/systemd/systemd_254.4.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index d24bf0cb06..c21f6b4962 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -387,6 +387,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-analyze \
     ${PN}-binfmt \
     ${PN}-container \
+    ${PN}-crypt \
     ${PN}-extra-utils \
     ${PN}-gui \
     ${PN}-initramfs \
@@ -446,6 +447,11 @@ USERADD_PARAM:${PN}-journal-upload = "--system -d / -M --shell /sbin/nologin sys
 
 FILES:${PN}-analyze = "${bindir}/systemd-analyze"
 
+FILES:${PN}-crypt = "${bindir}/systemd-cryptenroll \
+                     ${libdir}/cryptsetup \
+                    "
+RRECOMMENDS:${PN} += "${PN}-crypt"
+
 FILES:${PN}-initramfs = "/init"
 RDEPENDS:${PN}-initramfs = "${PN}"
 
@@ -552,7 +558,6 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
                         ${bindir}/systemd-creds \
-                        ${bindir}/systemd-cryptenroll \
                         ${bindir}/systemd-delta \
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
-- 
2.42.0


