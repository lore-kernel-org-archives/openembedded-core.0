Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.8924.1614344475216524701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gi9yWxsN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id 7so8516733wrz.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9NmN8SeubZc4lHBTOgcPzNhpDnzAyLf4Yox9pFPBRPE=;
        b=gi9yWxsN7jBpxS8MMsPYsr/qCRrS5rW6ilM3R9raz8Fo6vmnNrBR9Sbb8duG+O6AL1
         ByBl95rwg0MGmKI1odFX6EAuEjX9cDoeuE52PTgUu6VhAKiXaF//ge1rVhlfVKvA5xCz
         M1EJCpTmDSJ53+lXxzmeLm6JRioa8kunxuzpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NmN8SeubZc4lHBTOgcPzNhpDnzAyLf4Yox9pFPBRPE=;
        b=rMzOQ0G+WX1Di7X+vp2o3nr9omvmcPnYOei1lmqrDC0axa5QiDXDPlfnfY3Bomd1T8
         xGg7MP4NPd2vGoV4UQvYOSncaL7/a+B24V2utq8hugP5IwLwiGpSXamSV/lvcR57uJTS
         tf8BIm8d/jbczr7lH0e1bnAxrKXoEwxS2murv97Zfp15TqGg+U/JiV3K3pKGhdb/ExjF
         q+eM01x9zPeomb4FHgHzgOjDJb4tlnfItX/rR14hvSvQuz/uW7iRaIIATJBeJlUE1A4t
         r9zDBXn8Iay97T6orSrgjJATbfAGh1S3sfntzHbjWwp5+hEztNr1F41anWuDgVh2lawl
         ZT8g==
X-Gm-Message-State: AOAM530u43cb/q/Xe1fMORvPFlPuhQek3+I+jZsfQP6PzuN34qpwQeML
	O/GPygNs0++/9X8HsExB6Hq5f5CL6pzRTQ==
X-Google-Smtp-Source: ABdhPJxhR6rkg77hO5jT9Lr9MY5ZYxTRWYLyZUftBReQJSUgrD3zhdSA8k/Vxnn1yW2Q0L7Ps9RUEQ==
X-Received: by 2002:a05:6000:107:: with SMTP id o7mr3085063wrx.87.1614344471783;
        Fri, 26 Feb 2021 05:01:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/13] epiphany: Fix reproducibility issue
Date: Fri, 26 Feb 2021 13:00:57 +0000
Message-Id: <20210226130106.3925837-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't want to encide BUILD_ROOT into target packages. This is used
for build time tests but in our case those would be on target anyway
do use the target paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../recipes-gnome/epiphany/epiphany_3.38.2.bb |  1 +
 .../epiphany/files/migrator.patch             | 24 +++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/epiphany/files/migrator.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 9c24706c667..8af38151dd1 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -30,7 +30,6 @@ import datetime
 exclude_packages = [
 	'bootchart2-doc',
 	'efivar',
-	'epiphany',
 	'glide',
 	'go-dep',
 	'go-helloworld',
diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
index 70148c96d8b..a9440af35ef 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
@@ -13,6 +13,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://migrator.patch \
            "
 SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
 
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
new file mode 100644
index 00000000000..a9a650a64ad
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -0,0 +1,24 @@
+We don't want to encide BUILD_ROOT into target packages. This is used
+for build time tests but in our case those would be on target anyway
+do use the target paths.
+
+Upstream-Status: Pending
+RP 2021/2/25
+
+Index: epiphany-3.38.2/lib/ephy-profile-utils.c
+===================================================================
+--- epiphany-3.38.2.orig/lib/ephy-profile-utils.c
++++ epiphany-3.38.2/lib/ephy-profile-utils.c
+@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const c
+   argv[i++] = NULL;
+ 
+ #if DEVELOPER_MODE
+-  argv[0] = BUILD_ROOT "/src/" EPHY_PROFILE_MIGRATOR;
++  argv[0] = PKGLIBEXECDIR "/" EPHY_PROFILE_MIGRATOR;
+ #else
+   if (debug)
+-    argv[0] = BUILD_ROOT "/src/" EPHY_PROFILE_MIGRATOR;
++    argv[0] = PKGLIBEXECDIR "/" EPHY_PROFILE_MIGRATOR;
+ #endif
+ 
+   g_spawn_sync (NULL, (char **)argv, envp, G_SPAWN_SEARCH_PATH,
-- 
2.27.0

