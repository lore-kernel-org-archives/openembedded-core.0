Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.10575.1628177800351791191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PolTOao8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id r16-20020a0568304190b02904f26cead745so5182017otu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E23GT3v7v9rRCbyx2ytj1HuX3CYGJ1qySaPJv/8+9SU=;
        b=PolTOao8sI1HQ1f/Sak2JKblf0zuYHlWqOTJ0ATtGf6+PVbQTLGb+aHkIyNrDZUJv0
         pf3j7YkfyJe8UqJjpx9rmzZUmfPHpMA9vynd+QFIcfSHjqmPoS8eIx3ZVvt8KvEt05Pg
         x2bkilvmOEk5EgMmCazrWROnIY6QMa8Mk34MnaH0AaeVaqNXM8jf3b93JoHztGXoqQRh
         bhaPRPf88W8jUS2PCZJQw5K+5Z6Y4BCPUuZeaRL9MC4Vz6mj3/XLtLp42U3BjJVYqhqK
         oyZbFH2+LE/SL8HjKRIld0+mdkvgbvr0gLmxBW8MIrfT/ACco/7fSFsKc0eFS64nltcA
         wgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E23GT3v7v9rRCbyx2ytj1HuX3CYGJ1qySaPJv/8+9SU=;
        b=gUQptVvRtEJh4pLDnQabrPLkvqaYPybld5SkHLcp+uV5ojicKedjEfJy1aYc2/sn+C
         6DfdYDIcskwiH3YTRc01F+EsfszJXAHm36UoM9muLyvpmiyvu0yqCZSAIdNUAeKpHXvT
         WdWpa1OCWzFIU8Caf3yUHDXI6V5kf7gTIBPEGc3UUdzROm4h9zcGg21VZwjTz4P/0onX
         FTgE3Rn4yHO8WCdsJQszXDZu9G9ouiUpLxcCR1moLJH61709u0GWqgNXEkwB0crnvNmS
         2byEntaB0C91/lmucyjGZH9Tp6mNr10GWItRJJSIUd65P14XeCfzEl5z7XvNBnEyfNeZ
         go8g==
X-Gm-Message-State: AOAM531NOvyuAQBriLQ5g5M4TN4CId0/OQ21ZIUfWdJBGlaRM513flvU
	XpNUPBACbP3F76Dcim2Z61wLxHjBYJmjV1eP
X-Google-Smtp-Source: ABdhPJxEmzAYBXAR7ZhU6pmamp+e4DwRGPRH/T8BKT1g+PsbcBa/lZ/U35OUms5fpPIUg+SKDJW/aQ==
X-Received: by 2002:a9d:30d:: with SMTP id 13mr4274716otv.66.1628177799281;
        Thu, 05 Aug 2021 08:36:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/33] qemu.inc: Add seccomp PACKAGECONFIG option
Date: Thu,  5 Aug 2021 05:33:54 -1000
Message-Id: <80d79ca651b03a3a7d65d25065af3fa5d85925b3.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

Add the seccomp PACKAGECONFIG option to allow building seccomp features
in QEMU. The libseccomp library is available in additional layers (e.g.
meta-security).

Additionally this serves as a way to disable seccomp by default to avoid
the configure of QEMU automatically finding it (via pkg-config) on the
build host when building qemu-system-native and auto enabling the
feature.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ruslan Babayev <fib@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8f927bdf54..e25c2524aa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -210,6 +210,7 @@ PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
 PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1

