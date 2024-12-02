Return-Path: <ghislain.mange@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9A4D78303
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:18:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.171205.1733134733792076706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KuJBbPZO;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: ghislain.mange@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so28869105e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733134732; x=1733739532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdhb9tFv382+pi/aAG8ebNQ2Wf5MY/SyQzD5+yqwdI8=;
        b=KuJBbPZO2WN3Lrg5tSds+VLqECAkVE6syNVmkTHUNtRfL3YBg5q2MSlGFkb8idrYr1
         nNJC+qvUgQ6V57ay6tEYkDtrhaM+ua5ruNT2hs0i5MQLJT3XMpFPgYgUEzQJRaKmJVuB
         QKzc9UDd9G7Jbt/rJwZiOyyza/7z1rRnfwxjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134732; x=1733739532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdhb9tFv382+pi/aAG8ebNQ2Wf5MY/SyQzD5+yqwdI8=;
        b=g5QZzB9aROxNJVw9dMlUhW0pD9XPq7FXknEtJA3ivHvdtUxTxOvZRx5yy6oJtvryrU
         SP0Xt58Lzyi2boAfeyFqUmkjzg3BFLo/rjQwvoQdua+j/mWmaLKftTxZdsK0U2niwZOb
         nZ90XvU/d7D5QvYHlVUSEAPN3vBWX1DFQCQuhd9v/JkhPxgOaDi5vP0DlJX2gtjpJafg
         FVg4hupqqDzHxR/CvSbJgsnw2sQ74G/NJawR8+8yJ9JOTjDoZ2eYDdm7S3ybaHkFI6R+
         rPKNSTXVE7IuyUJmwUGbVHe2ry9Nwu14PbpdNgXCKbafbU+prCCcePkpOrL+PosY9gmG
         ztZQ==
X-Gm-Message-State: AOJu0YzwOtoXBVh6qVM/pz+7uWTc/KB8mAcCVd+OaNP2DfmnzxqoZRpE
	s8MY+iHOAwcsz+B1CB/l8kF1Ttpc3QHkQ9nAzgiY1uaWrgRCmEVBRm0F80Xn/Hmrj5FDECZJJwo
	n
X-Gm-Gg: ASbGncuoN7ebijtiquX+VS9/ngvP35wyEEgK+7jY2poMkUIljCjLLPZj1KA+f1N66V9
	i6nnpatbN3mwPXf17vS7UvzevMqbs5o8SdziaSkqUBtCAhpDLP5FHhJI7dl7Jv7kV7E/hCrCj7U
	cyFL+MEtBW95ip4+fH81qme7YJ+6ddebIXwaGPSquO3/4ZvISdomXFVHqBRCuJ9Iuhi7wvG0DDB
	Toen2DYIRSTsCMMl7YBwWUwWxAZ7CQDT6Tc5ajhBMZO89QGLrvSRPPQ7tQiRSoq5ZnEJ31s7Hhz
	6QqxQikzZm0QTTxP6SMtCBukf1+2RQ7DQ9vE1/GkAuckwIoOlAp1OWT/qQ==
X-Google-Smtp-Source: AGHT+IFlA+uV39z86q3wcDmp2pKEz+BZice9/ydsMhdOhosckt4S9m/yqHGA8fHWH1STnhf5cscBOA==
X-Received: by 2002:a05:600c:3589:b0:434:a4d3:31f0 with SMTP id 5b1f17b1804b1-434afb9533fmr153915725e9.3.1733134732251;
        Mon, 02 Dec 2024 02:18:52 -0800 (PST)
Received: from FRSMI24-FULL.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63b6sm146367425e9.22.2024.12.02.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:18:52 -0800 (PST)
From: ghislain.mange@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/2] wireshark: use inherit_defer for conditional cases
Date: Mon,  2 Dec 2024 11:18:30 +0100
Message-Id: <20241202101830.3490907-2-ghislain.mange@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202101830.3490907-1-ghislain.mange@smile.fr>
References: <20241202101830.3490907-1-ghislain.mange@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208132

From: Ghislain Mangé <ghislain.mange@smile.fr>

Conditionnal inherit may be missed when PACKAGECONFIG qt5 is activated
after this inherit, eg in .bbappend. see patch [0]

[0]: https://lists.openembedded.org/g/bitbake-devel/message/16815

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index be342c73b..0109fe6d2 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 # these next two options require addional layers
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON -DUSE_qt6=OFF, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
-- 
2.34.1


