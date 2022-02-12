Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCB6C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 06:33:11 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.6531.1644647590391662322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 22:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jcq5yEF8;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id y22so15009741eju.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 22:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jtRpnHOmSxA/hvF0vEzrJx2w4Ngn1NXGz8NXjzlazRM=;
        b=jcq5yEF8/CT9+l6hXoScnOSkKv+Lp+ouToSc/fEx4WcNVz5stiaVZOl7Q7cuprCRpr
         XGqEj42LqqEUWQ2Et/0X+u4y/wQOLXsVlzsFOb9wza1kN5GiOnWrSbeAqab0MWtSYOnY
         yraOXjpKDXMsZSbKgmxDN+Lg78ehqpHc8FS2utVWZNGEhFML9DUpCLRzFFkFB/+XGpyl
         QqaNsANknVrpDjPtsiQ4DN+Ud6xCrPCo0ZqzWwwhUBrqRDPGifo7m4xpyaPak5KPZxAS
         aSqn/Z9EaJeID4r6VdYz9qGQ5SyStpig61+qamaUq87VMmKVcsDenD5KLeDNgCO3WKcZ
         GkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jtRpnHOmSxA/hvF0vEzrJx2w4Ngn1NXGz8NXjzlazRM=;
        b=uAehYJN7J5xK8lZ12SzumA4xNjwI3tD3uok9XgW45u0dvwHM1hbf97Jg9RqRv06cg2
         w4kDk9s2g5kpYy19AWEggybHxbPWaXS95DyD/NccTDoU2sV+9ib4GZwXOyLpPw/H6eiN
         XvFxm3YhGFi3mX6bJt9B/nRCcGWrYKLiiTSU4Lt3N25J+xcNZDadpD7wdDH5UiCCIwJR
         NUuGL503feyiiEuvGslFagh/xUhZnKSSRtNULrkGvv6BCROazosd6O/yDMJyK9rtMkng
         2H5IILRsmJ/Kx5+dOs7VjMpcx0DVXlHB6BPNkIMuREO4m+cBP0tbKkMqWtg212X8Ol79
         HBdg==
X-Gm-Message-State: AOAM533A6gSrsDMcXR11AcAE0EKrfvFhslZFPw4anN5srCyVobhq72bZ
	ZIhRcUjlxQnkuIngW4pYn0h1pLWFHRw=
X-Google-Smtp-Source: 
 ABdhPJwJW012am5parNYfIPk+iSMIySPvU5DMP4CMFWLZOVVtQO3siHBjESN93AUxp4z0ykIpxUTrQ==
X-Received: by 2002:a17:907:3f88:: with SMTP id
 hr8mr4008421ejc.600.1644647588764;
        Fri, 11 Feb 2022 22:33:08 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 x12sm11636223edv.57.2022.02.11.22.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 22:33:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ruby: correctly set native/target dependencies
Date: Sat, 12 Feb 2022 07:32:50 +0100
Message-Id: <20220212063250.840181-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 06:33:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161666

In particular libffi was missing from native, which
led to linking with host libffi instead.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 20ae15bd7a..7cb2181c33 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://LEGAL;md5=f260190bc1e92e363f0ee3c0463d4c7c \
                     "
 
-DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
-DEPENDS:class-native = "openssl-native libyaml-native readline-native zlib-native"
+DEPENDS = "zlib openssl libyaml gdbm readline libffi"
+DEPENDS:class-target:append = " ruby-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-- 
2.20.1


