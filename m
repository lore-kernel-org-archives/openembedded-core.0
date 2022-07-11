Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7981EC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 12:24:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.27661.1657542250178472776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 05:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R+9UMqFn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id b26so6783991wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxoPKrh5FjwOu17j4iOY6iCXQqQBGYm7f2K0GEQ9+/0=;
        b=R+9UMqFntJGkn94YIVCVK3SDpLUgWgElvuNXJhNVdHhHrgGtGdEn//RWGt0bsUHj3/
         fF6zBNQTjX/x9saVC3khxkSqHYfBaRncQoQzi3B9LYzKiUo2LyFKgQ6kCJjiCDX5wiB9
         Ce5zqYe018J79ts3gwuMLVIoa1Ild/DN2xl6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxoPKrh5FjwOu17j4iOY6iCXQqQBGYm7f2K0GEQ9+/0=;
        b=forE1RgFIBpq6jOTqNx3ly6bEV8VK8eQcqP4YeF1rkCTY87hTktzgHxCVH9OWaiCK3
         AL+s6OPiAdq84nC+/21v10WED65C8XSFJtSLjCWPENqDT+QnuwNJlWAQ+tFy13H/8lna
         yWnzFhbLqOtAMfRbL3C9EDiTEjarSYbOBNFd+MrSe2aKVoYGEFBhuzJzqrWZK4veR1mt
         QvDSEtVuo+EQ0DHVifXHIjLFa44ubnBg+s0V8wioDqz8ouXAhg3cIT+y5aH0drQRJTaL
         HWGO0jlOLioM8TWzMNKNHMdXFOaU7YRyCvt1hOHX/iVsgyYTloF+hHaTBb6tufva1vCL
         TswQ==
X-Gm-Message-State: AJIora9rYuBR8TUJAgQF+cPW6CQ2iBMD30HH+pXJxWuEvFx+ncvPCZ+x
	hzIRiqZ+cefL6W7Z86gWqPyrB4Z4p02NTA==
X-Google-Smtp-Source: 
 AGRyM1s0RpD0qpmFNDyetQA9IWvAu+q40yGYpjrfHdiQZN+CPuJWgexQmjWPD0qU+SuY9mglBU2OGQ==
X-Received: by 2002:a05:6000:1861:b0:21b:b56f:3fb5 with SMTP id
 d1-20020a056000186100b0021bb56f3fb5mr16987794wri.698.1657542248145;
        Mon, 11 Jul 2022 05:24:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f9ee:ac79:b0a:1aa9])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a1c3b08000000b003942a244f40sm10186349wma.25.2022.07.11.05.24.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 05:24:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Avoid accidental librdmacm linkage
Date: Mon, 11 Jul 2022 13:24:06 +0100
Message-Id: <20220711122406.79439-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 12:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167867

Avoid accidentally linking to the rdma library from the host by
adding a PACKAGECONFIG for the option. This was found on new
Fedora 36 autobuilder workers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ef4e949805b..e9095fd750f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -186,6 +186,7 @@ PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
+PACKAGECONFIG[rdma] = "--enable-dma,--disable-rdma"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.34.1


