Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.5880.1609856707715770146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tUUetaeI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id n25so21390386pgb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kpx9TrZqTeg8/mjbSGObWC6LdeFVmk737DnXVeQ6LVI=;
        b=tUUetaeI0L91gqvgmKASerJnhtLS+ruyNFJcleYMqHww2qLmb1ecNdYwEHKbXaaFNb
         WRqODC0FjzZTRCqxFQEyGTCeYZLE6kv6kzBFLHQifmc1HJIG6f+09DeWH7PWekzZVeBS
         TCbz37yvE3eZ7gwi51h3oLiYNWK3O/xWQPXg9c2yGe6Hpo/LDEEk/2t0IZq8hbOiOWyk
         tVL54Mp0b+zGZVBYE0VSMEReDUZpgpeFRGPL7b6G6M+wHEQa29hwKzeyacsqSxSDlGtS
         EfY4ZuQ+ed3ou07gbIg5Uhucfe3dDwCBvBDdjCpX8rckox3luw4WC2DowVRiF5CELI1c
         zXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kpx9TrZqTeg8/mjbSGObWC6LdeFVmk737DnXVeQ6LVI=;
        b=TctEIo4Lo2yTOIg+aBsAGi6CDrKteko+S2Gsz7uiLDujAs+1OsSSu1Mb/H45TOjm80
         X1oejO8TOad6R1MXYZBOAMUkq0dDV+nzcQuxKUsw61mtFmB+rUNLoZJdlKFVMHg0IgDZ
         x0lznKHUw3WufG4Iudq8hlJ1ySS9+DDxsI7Vevw18KnQNKbgSAlspOYTFAOI8EjW+U80
         xSgUEeXPCAlAQcFGhApbOK0ecagO/w/2TIIdZLu0gShWZdVNpgR7e3UqPyX9sJhcs+Cn
         obCeOYNtQtOou3ZKd5uGCi3zK5Q0A97tlcYmu9qtjcBGe67qVnVOEkqVfn4W7mxe9Qs5
         zJrg==
X-Gm-Message-State: AOAM533cFRy6idFKut3TON1dMoMxqeDaumjPdIk2yBWRjFG7k63L15Bn
	tNum52oCYot5CB6D5Y9sXgC1XDQGZFHt0MXqXbI=
X-Google-Smtp-Source: ABdhPJxHrbirU+2GNuToWCnj6E+Ree3wlQh9N2W3PyJu6+ROtoZGxyqAoBPcdiQA4j4aGR4w/ZJc1Q==
X-Received: by 2002:a05:6a00:148d:b029:19d:9622:bf7 with SMTP id v13-20020a056a00148db029019d96220bf7mr70566658pfu.11.1609856706868;
        Tue, 05 Jan 2021 06:25:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/30] uboot-extlinux-config: exclude OVERRIDES from do_create_extlinux_config vardeps
Date: Tue,  5 Jan 2021 04:23:36 -1000
Message-Id: <4e95f91f4a65cb97b37529e49d18279772858308.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Christopher Larson <chris_larson@mentor.com>

This function is primarily *appending* configuration entries to the
overrides, it only gets it to ensure it's set at all, so doesn't belong
in the vardeps. Having a dependency on OVERRIDES means you cannot use a
bbclass like distrooverrides without changing the signatures of recipes
using this class.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fef74d3651d432977caef8fea54fc54bf2784a74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index f4bf94be04..be285daa01 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -153,5 +153,6 @@ python do_create_extlinux_config() {
 }
 UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
 do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
+do_create_extlinux_config[vardepsexclude] += "OVERRIDES"
 
 addtask create_extlinux_config before do_install do_deploy after do_compile
-- 
2.17.1

