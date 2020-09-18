Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.395.1600445744034211989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tJVeUv7B;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id l126so3753319pfd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0X5kIVcKrZp10X25CBaVRZFEZ562YKh8adX3gGyP/mI=;
        b=tJVeUv7BXA911n26ItnN0wIDxMIeiWPKiBTwHH2XdstfKiz+M9LuQ4v/zfcFcA4no7
         +H5KM50KZZc3J2hMru6M9Q6zjEcS6twNzYq/d31sDWj4K37B7ojgENfDsdDAAxvZUNh6
         30oH6EEXAdusTRgGBzGiaIxuop6yL9nUSXw6R1E4RMX4cu1myhsok5lbVWWkLGRlk6rR
         ewsiPUQYh6REX8WiowkUC8a5xUSw4Xb/Mjr5Yl0XCsuOyswvVLQbUPZx8+BwfPJNspsk
         lFjL6crVRJgSmozpdqvzUVddtN4zyxBhSu4H/PR+6Lnv1H/9Eab1zzVJ1tM+qAnv5gQo
         qjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0X5kIVcKrZp10X25CBaVRZFEZ562YKh8adX3gGyP/mI=;
        b=HISQRxsG15KjPcBvEDYyVjsr5NJsjDl9+0ASt0OuIneYYOe9mbKX+uvtj45/NM70AE
         43PEfsn8IUUVbPSRCGh9Ftnvu2jR7k3MZu6vsITFAGnJaOuJOLqz3A2kIvlqJUkJdc1q
         b5Akt8h1aDPEqvoLFjJJkKduR3GiiJwz9n3ZPUs9UjKR2K4VxludkIe9HIpNVG+fN7Dt
         YlhQFsdUP5v4hyw7WW8+2nPD1uJo5wRlvUSfORttlhHpj9HLYW0kRIz5UMS3aQOW1v/g
         Mr9/hHzGo0yaxe4RIYbfAY1UMRI+FnE65WMJcZASR0rAGttRy1CuQlR5HOhuGnlOr7aq
         aDlg==
X-Gm-Message-State: AOAM532sFJo2J07l1DwIIVCTBMV9uG0M+ouujbQJdgNjU6itWVy0/XoZ
	rmmUtwBKBnVanH/Lh0q425MVfB6GGedAdxDcXz0=
X-Google-Smtp-Source: ABdhPJyD9xTtV23UBO4G9I2XOVDA8jL2sLU1976ZyB5Zm0NIEfXZloTfELopUTKAHZyedYlbHNwreg==
X-Received: by 2002:a65:6707:: with SMTP id u7mr26823239pgf.449.1600445743143;
        Fri, 18 Sep 2020 09:15:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] populate_sdk_ext: Do not assume local.conf will always exist
Date: Fri, 18 Sep 2020 06:15:14 -1000
Message-Id: <554dba802108c91b79acf81c046e6a47815404fb.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Some distros may not have local.conf, and use auto.conf or site.conf
alone to describe distro config metadata, therefore make code robust
to not fail eSDK builds for such setups

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6379f951ba92b2b86a55de5fc267bacf8c6095d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fd0da16e7e..71686bc993 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -310,8 +310,9 @@ python copy_buildsystem () {
         if os.path.exists(builddir + '/conf/auto.conf'):
             with open(builddir + '/conf/auto.conf', 'r') as f:
                 oldlines += f.readlines()
-        with open(builddir + '/conf/local.conf', 'r') as f:
-            oldlines += f.readlines()
+        if os.path.exists(builddir + '/conf/local.conf'):
+            with open(builddir + '/conf/local.conf', 'r') as f:
+                oldlines += f.readlines()
         (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
 
         with open(baseoutpath + '/conf/local.conf', 'w') as f:
-- 
2.17.1

