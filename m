Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.8928.1614344476928896909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QKYJDUTh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id f12so4699418wrx.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B8AG7Uzc+yNyi3fbWRj/B57soWalxxKjJiUIjH8uHBs=;
        b=QKYJDUThOHQEKrXZ4igCGbFLJp0Q3TxX/Zf4piEzbdcm6fXhQFjBfeffZJ0NVSGiJ1
         L/hSL7yE77FX4VNrqhMrPvTexlfMIpeVfkNBnukg3+9Gkrfbr4gPYKU+e3xBMJNbCNRW
         F5v/xoEJL6P+QDVXxPHM+T1g7wxvGJ2cQ6RhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B8AG7Uzc+yNyi3fbWRj/B57soWalxxKjJiUIjH8uHBs=;
        b=hYs3d8J4urTVxW7kWIigZbPmxW5FT19NZYkWwVz+vkhjQ8pQPvouor6uRc0r/jVC4A
         WszKEPP8R4KSDWpuBUY8aCyjNQEDsg3Atd+RJEUSTm/akJR254BM6pmlWp3PSOx3KX48
         /k/GopTXY03Ovij7ho7PtAihNm4yC/B36fQxWrRP37rbAYXLANeCZKtcwX0udXz4RP+S
         wiFgj4OwP9JHkHVxdIbrd/xB8IQNrHub34AkQxbIT7bMyeJHXU9rClgYM6Ryl1crmqXb
         y/MbHvX637CUI+Enbp8obuGmR9ZhpvVF3MZlqDeEfbq3hfbZVEuEzWHDJo2faDMv9xky
         kNBA==
X-Gm-Message-State: AOAM5337hZ7iYjMN+RNSHFuPD0Apis4aWwrUp7tw2qegGBsCRBJIk2M1
	9a6GYOf90yFsBWFVMRKE+dxp/kxTJ+q8ww==
X-Google-Smtp-Source: ABdhPJwi18omAdIx1DVxM/4UNxjI1DWsoCMUnw4QpI7G5LFHAAf5JyEmOuyGv5UKpMSBH0k3aO4d7Q==
X-Received: by 2002:adf:90c2:: with SMTP id i60mr3105728wri.75.1614344472216;
        Fri, 26 Feb 2021 05:01:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/13] epiphany: Fix distributor contamination from /etc/os-release
Date: Fri, 26 Feb 2021 13:00:58 +0000
Message-Id: <20210226130106.3925837-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set our own distro string rather than using the value from
/etc/os-release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/epiphany/epiphany_3.38.2.bb  |  1 +
 .../epiphany/files/distributor.patch            | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/distributor.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
index a9440af35ef..71b4a8a162a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
@@ -14,6 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://migrator.patch \
+           file://distributor.patch \
            "
 SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
 
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
new file mode 100644
index 00000000000..b09c9b38d2e
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -0,0 +1,17 @@
+Don't encode the distro from /etc/os-release into the binaries.
+
+Upstream-Status: Pending
+RP 2021/2/26
+
+Index: epiphany-3.38.2/meson.build
+===================================================================
+--- epiphany-3.38.2.orig/meson.build
++++ epiphany-3.38.2/meson.build
+@@ -15,6 +15,7 @@ if r.returncode() == 0
+ else
+   distributor_name = 'GNOME Web'
+ endif
++distributor_name = 'OpenEmbedded'
+ 
+ prefix = get_option('prefix')
+ datadir = join_paths(prefix, get_option('datadir'))
-- 
2.27.0

