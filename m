Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D158C6FA90
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:37:59 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.2077.1663727872216919118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GE+L3UDY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id c7so4545102pgt.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=TUedF0tnbzha/u2NqWWR97z1Im2BYdIhE9xLJm1v9GQ=;
        b=GE+L3UDYXhXMV0BV9Da7TmhTAv7l16jy7MMzErGFsBmZHEdwmQwjO9MgkI+UNP0YuY
         zex9k6DPZMXGS6016AjoVP9t436nOxeEcwo1qtZGZq3RbjzSYBRGLawIPgv13Vn+Ki34
         /LnNps85bgEwmszvBbOui5tBxm4GEQOCOsIFSKgEUDPlYtPUDD5kpPDAcxdZdKAbhm/g
         mnZrpUwHNi6YidIi8/oyCpsykEP4AIixy1jlajqudmgGKMXO/7FSYEIhZIqvtAXQJyXh
         AGCFVsDsaX7Nod2qziFRpjLXvm+uuCjUHg94Sa8Kxq2n+VbESGyBcJvQOII3bqmXhD2K
         NNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TUedF0tnbzha/u2NqWWR97z1Im2BYdIhE9xLJm1v9GQ=;
        b=PuXChRVH4Md0icSuz8jKsyr0l0sPMku9OFj/huXqa1Cc48t1EMP9nUmJQUV4LwJTAY
         UepkLdmiEYqmd6gaiu6RwWy8xochJY/Dzj93F0TeSe7MxxFl73wzXcwtu1GZC1ol4Hs2
         Lq/k4lo+JXmB9DwfrTo3qb6QkwKenmZyBP8DlxZb6j7ADMavFIHOGdFUDxryrr13Xi16
         NJP6o8Mjq4bnWNJ/h5KqmaRjuzsx3R2qpAtJvOfVaWlTt8jay89goRGzaVw8GFGjlDLY
         2wpHOQD9JiWaif9rW5I+nKP8zl/ORreQRxwIIBo6sUxGsmxTCD3J7YQ0tSrdD/y/S5nn
         lNvQ==
X-Gm-Message-State: ACrzQf3JxxgfjhmNxAFO6F2ZuPq6cDcJV5EGbjv5M9zqiekN131RNBtD
	0fXEq/xCwRSg41GdjCWQ/MCLDvTqaRCR9VyG
X-Google-Smtp-Source: 
 AMsMyM6K90uaW864Tjrt5k8c8FGw6jqO+iQ+mrsFsCSwnBtmR7Yb5cHtDK1PIx7uv9+ExuMEH7VFaw==
X-Received: by 2002:aa7:91da:0:b0:552:8d8b:d275 with SMTP id
 z26-20020aa791da000000b005528d8bd275mr2561124pfa.30.1663727871239;
        Tue, 20 Sep 2022 19:37:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6215d8000000b00537a6b81bb7sm670154pfv.148.2022.09.20.19.37.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:37:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] qemu: Define libnfs PACKAGECONFIG
Date: Tue, 20 Sep 2022 16:37:16 -1000
Message-Id: 
 <9badcf0261f6b735d65a5498bb8fbb9979d7a07f.1663727733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663727733.git.steve@sakoman.com>
References: <cover.1663727733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170925

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The upstream qemu recipe uses host's pkg-config files as a solution to
detecting host's SDL. This has a side effect of using other host
libraries that are later queried by the configure script. This can get
into a situation when the host provides libnfs (for example) and because
later this dependency is not in place anymore, qemu will fail at
runtime.

This change adds a PACKAGECONFIG definition for libnfs that is disabled
by default, in turn disabling the pkgconfig autodetection in configure.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42b364a25fdbc987c85dd46b8427045033924d99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c1db723e90..b432b01224 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -271,6 +271,8 @@ PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
 PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
+# libnfs is currently provided by meta-kodi
+PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1


