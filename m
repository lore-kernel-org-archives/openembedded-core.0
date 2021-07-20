Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.646.1626818257853685776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 14:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hH9Zx6xd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id o4so19193601pgs.6
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 14:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mvjsyeyMSjI33aLoRZW02nnZvqic24FWnvIsUwg/G14=;
        b=hH9Zx6xdpJ55zVOop2/a06V07g8Z3lYxMBN9TcGkBzTQEC7UgrsoulfKBo5055Rqbs
         hzzX/XMxG+pL2EhsyYq5d+TviCWz3vFVcPCBVUpjcn7LKu6Qhlk3nhZi2buJCG/d0z3a
         OVWVkb+ha3R6cl+E2QY1/lvSmYzK3t1yfdS6kfs41cItzdixH/3FAMN5D3KHcqqYSyfw
         g3FENjBZhQAQqmm1BuRxCVkrfTyIdFzEla8nJZtIAWIKe8r3qbaM8qjXOnPzdzz79vRb
         IiMzkbfCl8m9GQvq9Q+w8wct/Qvm8t50Dop3SCkWO4XALn3CSehfFFnayxHCYxsb2chm
         3dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mvjsyeyMSjI33aLoRZW02nnZvqic24FWnvIsUwg/G14=;
        b=I6pIm0TRu9uBz4MpZ+wAoRry6A5kzh/Jbms+m9T2ndY7S9a/jAqu+ALBwmpppWC4Et
         VdTl8IqE+jnTH38cM2Ra2WXhxB9u8tiEmnSERUOU59H5Hd3JYST1/8I2pGeRkAhRn+wa
         nrY0EMYUCV3RgP4yyfqS7v3NETTAsPNp4VImeHOJrt7RKq6aLHs9oOjL5yhIWJ7q8rua
         Zp4lz4cgnxcLV6DoMo3eLZuJfTqP1x13WCnFmo9IzlQQ0bSl3DKD47GfkOxLCzMbv/37
         /INg0XSLzQxA9WU/z91ixu6vFipvCW62JbKCZSXx++1e0RWNPM+I3HnHOqDAlLhjW3Xt
         PpcQ==
X-Gm-Message-State: AOAM532QXk9vqL8xPDJD2ohQsRasj23dEps45hiHtPnSTbVXcMaUU6NG
	ZdODdqacYQy6f0tdHDcnXVKlVCQtj6DO+ShK
X-Google-Smtp-Source: ABdhPJzxhTzOfHTLEeUvFlowYnnR4OTKdDajn7cPBtJksG7merwXdafVvjYtqiPfUfLZBR5MyXbatA==
X-Received: by 2002:aa7:8ec5:0:b029:33b:7b34:9cba with SMTP id b5-20020aa78ec50000b029033b7b349cbamr20853169pfr.35.1626818257024;
        Tue, 20 Jul 2021 14:57:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r7sm3556874pjl.16.2021.07.20.14.57.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 14:57:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] kernel-devsrc: fix 32bit ARM devsrc builds
Date: Tue, 20 Jul 2021 11:57:16 -1000
Message-Id: <9ae339ace9274be71bfd3b5e5da64dceac9fa963.1626818018.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626818018.git.steve@sakoman.com>
References: <cover.1626818018.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As a follow up to commit: 0fc66a0b64953 [kernel: provide module.lds
for out of tree builds in v5.10+], we must not only copy module.lds
from its new location, we have to not error when it isn't found in
the old location.

With this tweak, we have coverage on all supported arches for the
new location of module.lds, and backwards compatibility through
kernel versions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb940d8af359fa370254bd4c2b36ba26708bb54b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 951e7635cc..887e1e2430 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -177,7 +177,7 @@ do_install() {
 	        cp -a --parents $SYSCALL_TOOLS $kerneldir/build/
             fi
 
-            cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/
+            cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	if [ -d arch/${ARCH}/include ]; then
-- 
2.25.1

