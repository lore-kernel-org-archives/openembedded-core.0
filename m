Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.472.1606848756627013690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FdUHZ/H4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id x4so1642044pln.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wjZwqie3AMe+TkDGsW2kXOtOItoz2PmhARiZKvviduc=;
        b=FdUHZ/H4F2LuXrTovHP+CLgWDi1CYgY+uPvDW48EezMQKXLsHD/MIaLnp8U1Xd/W1D
         0RTY/a+rj1KFRGgR17gpwD+8XTgYcSxH7K77cK7OsL0kVpFvpegieiyAkDaOHl92OSbf
         G6m5cksWLjZ+KxapnYUlbpvxUcA1nKwA8nymySuqffuDXNxOyKQ4vNa5rFCx621MTk6r
         b/dgnoEg+kt8WHQ8CGk9iDqwR14jbxUXMh0w6owUafz26Y0NUAj+2B+0ivpYQZlGi0Ch
         aLHeObPORT521JAgTQ+KEdlQ4K3UAzg5RHpapt15TManI60ddDHshK7Wwmeb001TYiaq
         eldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wjZwqie3AMe+TkDGsW2kXOtOItoz2PmhARiZKvviduc=;
        b=dPtFgMus3elMoFxut2zWTkESI/AuVo/fTAr1AvJ3MYYDwM1++QaqttcC5l8qB6DkvI
         nAY74Ohba3I8ZWGw8j3xccUIw8WkojGT8S5M0ub0KwtBNQI3HiKRvO8WI4tRKIZpHynI
         t/7aL+Y4fcQhghozhg2FjHLx62TQ/FjrHHIA0xEH1y+owoZpYYc6e8WCeR7o6jhw9ujM
         RXUvMiGXM232Cq0UbtYc+tbGy3TBZVeyomlU5iTmU4Ekh876hr3yjvhKG0IKOr8FcWcU
         66NwvXeqYLLFOlgblkvLtw0fZYq7CCQU2XTLhk4vbRTSgVaRKWMdQ6x44risSGQg34gj
         VGHQ==
X-Gm-Message-State: AOAM531m+P2uOwmt7WRi9a4wasnqshcwpuICdSiLe68RoxhScTB/evp1
	7atVIeH64diol3UZ3PWTMX6GO1BA8PemLh9B
X-Google-Smtp-Source: ABdhPJw0VG0i0f2LYmW31mQhtVTdA0Hu9aMJTmsX/kgdRnJuFbZ55PkGNHwWT9cEW4I5ecjBnhufUA==
X-Received: by 2002:a17:90a:f48b:: with SMTP id bx11mr4209293pjb.48.1606848755637;
        Tue, 01 Dec 2020 10:52:35 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:34 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/16] license_image.bbclass: use canonical name for license files
Date: Tue,  1 Dec 2020 08:51:49 -1000
Message-Id: <d31fd6a2fc2334a20d4fd1bcfe5964c462d1bb98.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When copying license files to the image rootfs, i.e to
/usr/share/common-licenses, a canonical name of a license should be
used, otherwise duplicated files end up in common-licenses directory.

For example, GPL-2.0 license according to conf/license.conf can be
referenced in recipes as GPL-2, GPLv2, and GPLv2.0. If a license name is
used directly, we end up with three files in the rootfs with the same
content. If a canonical name used instead, then each license gets copied
only once.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 670fe71dd18ea675f35581db4a61fda137f8bf00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index a8c72da3cb..acd8126f68 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -125,7 +125,6 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
 
                 licenses = os.listdir(pkg_license_dir)
                 for lic in licenses:
-                    rootfs_license = os.path.join(rootfs_license_dir, lic)
                     pkg_license = os.path.join(pkg_license_dir, lic)
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
@@ -144,6 +143,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                 bad_licenses) == False:
                             continue
 
+                        # Make sure we use only canonical name for the license file
+                        rootfs_license = os.path.join(rootfs_license_dir, "generic_%s" % generic_lic)
                         if not os.path.exists(rootfs_license):
                             oe.path.copyhardlink(pkg_license, rootfs_license)
 
-- 
2.17.1

