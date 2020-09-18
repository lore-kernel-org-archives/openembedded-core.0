Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.391.1600445735940353594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nSWGxmCv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d19so3253992pld.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7bBSlBZpBKBb24m22A0jiTas67RGvd6Utokt/2qQm+0=;
        b=nSWGxmCvYXVGzJBDZ38DDKiUvIXm3aMH7j26dzMdKTbC9+WYJo9U7fHJTHhyjaKHU/
         XfwhGWOtvZX4Peit8bUZ0cjZshUN/x0bCXo/HtOxXPTePcg08RJFSkro5cAlyP3rJpUH
         1dwN1jAt9umU5Rcel2nSVtf51lQKM8/nm4HX++8ucGzrzWD74c36+bUzyLUUOD893mGe
         SFWDlSO+LJ4eokcVMCWy5uvlSd/YQ4ZdGscLYSHqabKEb7yI8/U/z6nqt+zVIAvY0sNR
         AuyeMDCsVDmTVUgszv1s/hwp5tCXBQXXzVTFqGFrdFx6OIf49NCGkohnvuozXNVx5xkO
         9mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7bBSlBZpBKBb24m22A0jiTas67RGvd6Utokt/2qQm+0=;
        b=kWfyJxrgHl4vGHznG4osPu//ERS7dy8VI8kaa/0ytn3hA76dCGaSrj+rqeJvK2fVRb
         z0vEM2SaoQyEuPN1tO6BhpYZZsM0wSflLjvzSUa48WA3ybYYenj1ZYQOjFxN9nqZUtQR
         /Dz/Cq4ZevIyo405ck87cnIatlu9/2YVX220LAqIeOeuxEmEKR91AfcaYx1MpDtywGG2
         SClnrf2vcOkJaPJVOPa4H73eoHXXZmNJzX26CH3CtxrE1Un0UTYb8WXpSjtSRQF7WB4B
         YVdnpv9A29jVAakISeGbS7sgG4kdVhV5P8+uE01zH6QrovPtMD8HpinC00xL0JO9mIgu
         E2xw==
X-Gm-Message-State: AOAM533zrLr8bjQbRQZmSJRrQUQhoD7fX0/tzNx40qdOQvsaYtaHO4+m
	21F+2yKAWPL+zTR6+cmNBXG+silLLm1fVFuoaCc=
X-Google-Smtp-Source: ABdhPJz06ZX0uagooBjplmSrescqcrcDCJY4XLTLfq3uFStYvTDPW0WMZKsl+9vBDmo6a6VlXoR8VQ==
X-Received: by 2002:a17:902:d913:b029:d0:cbe1:e712 with SMTP id c19-20020a170902d913b02900d0cbe1e712mr34672330plz.32.1600445735004;
        Fri, 18 Sep 2020 09:15:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] initramfs-framework: support kernel cmdline with double quotes
Date: Fri, 18 Sep 2020 06:15:11 -1000
Message-Id: <16bad6260a6a25b2ec25c7eb0dfe526db56f166e.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

From: Christophe GUIBOUT <christophe.guibout@st.com>

It avoids init to crash when kernel cmdline contains a string with
spaces inside, like that:
dyndbg="file drivers/usb/core/hub.c +pltf"

Signed-off-by: Christophe Guibout <christophe.guibout@st.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 88b8b94bd2d052bca29d27bd5cd00eddb0f5999d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initrdscripts/initramfs-framework/init          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index c71ce0ce8c..567694aff7 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -88,12 +88,25 @@ fi
 
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
+	if [ -n "$quoted" ]; then
+		value="$value $p"
+		if [ "`echo $p | sed -e 's/\"$//'`" != "$p" ]; then
+			eval "bootparam_${quoted}=${value}"
+			unset quoted
+		fi
+		continue
+	fi
+
 	opt=`echo $p | cut -d'=' -f1`
 	opt=`echo $opt | sed -e 'y/.-/__/'`
 	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
 		eval "bootparam_${opt}=true"
 	else
 		value="`echo $p | cut -d'=' -f2-`"
+		if [ "`echo $value | sed -e 's/^\"//'`" != "$value" ]; then
+			quoted=${opt}
+			continue
+		fi
 		eval "bootparam_${opt}=\"${value}\""
 	fi
 done
-- 
2.17.1

