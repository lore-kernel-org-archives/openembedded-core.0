Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.57656.1595862654615928890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iKAMtsHn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id x9so8156513plr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wh5k9rt6gX+yZMTTjEKO9jHDub1TgIiB419oDa98Quo=;
        b=iKAMtsHnhMJ2Z3xz/j20uAtyMbGWGI7NJTEaC91hU31Mtliba3HOj1a27sripVf/oT
         gLk2GDQfa5G0v0jNgZxHK257iZGIw23aTQplH71Oyalwp/zh5U8uKgZkcodhX5wqslp9
         pAVsTGP097Q20A/BBJN0yASaY+MLLYb1OPjnLh0vpfaqDSHLBhnJcETHFd8NGH+fPeKA
         Mc7s27B9iBy4vGdw4gvkfH5xTU9A00HKKkQC248lvtBnfiLs6tkRp5uLCFWR25DTA6tp
         J4LQ08ICdKTfqBDYg+AOCgXWROT7QBXPEeC/eqFGzBHTt0peRKVUR4rZ7zLjNZdTc+h5
         BTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wh5k9rt6gX+yZMTTjEKO9jHDub1TgIiB419oDa98Quo=;
        b=pv/Gcupx0gw6vTNx+sN2XYGQxBZXUbcXU9UDk29EWnBFOGP5Fm9mNofcmnYNNGzVHL
         Uz/ItHXWpsiRqPRyJNIIUBvMB738bM3EyxKfRPZ+rp8Y+kZwHLt3VDjnkDLPHwL7c02x
         ZKW4izTFYV2TvPfJGz1npwuJTiqxdFHnucD49ybS1ig4FhSqogdWbjk4t8OB53cXPfwW
         FPAKNdopTAleFUBmlBfY6Pty3ovPp0erZjz9YZ9sL2lCHEt9NDkSharep9vYYg74xqqX
         aFZWYcESeXZrIQMRViWE//NvB2Yg59m2UK2K93hVHhSd/tWYR84apjA3Snvy5cbpsgyF
         jfpQ==
X-Gm-Message-State: AOAM532uKiy+SHiD6NSbauCaXc/nSIcxTPdROIH4u0vRfU5bfqfdFBXO
	WGKhTInQjvCOsZVkp2e0T2211jEiZks=
X-Google-Smtp-Source: ABdhPJyD0wrAz/fn4lCGXr8Crdo2S8i7P64jaiFumoLRPYrnn6IGL3Ch9W583zQUiAehv+RvL9V+Nw==
X-Received: by 2002:a17:90a:26c6:: with SMTP id m64mr18977420pje.215.1595862653697;
        Mon, 27 Jul 2020 08:10:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/18] gtk-immodules-cache.bbclass: fix post install scriptlet error
Date: Mon, 27 Jul 2020 05:09:55 -1000
Message-Id: <ee4cccc143f3413db20ad0bf8ebe88805810a717.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

package libgtk-3.0 don't install dir /usr/lib/gtk-3.0/3.0.0/ by default.
when install package gtk-immodule-xim, it is possible met below error:

/var/tmp/rpm-tmp.tlfoeo: line 17: /usr/lib/gtk-3.0/3.0.0/immodules.cache: No such file or directory
warning: %post(gtk-immodule-xim-2.24.32-r0.0.cortexa72) scriptlet failed, exit status 1

fix by create the dir when try to write to /usr/lib/gtk-3.0/3.0.0/immodules.cache

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c689e120961d9d20386c8b822d71d778d4e6df7b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gtk-immodules-cache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 9bb0af8b26..8e783fb493 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -22,6 +22,7 @@ else
         gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
     fi
     if [ ! -z `which gtk-query-immodules-3.0` ]; then
+        mkdir -p ${libdir}/gtk-3.0/3.0.0
         gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
     fi
 fi
-- 
2.17.1

