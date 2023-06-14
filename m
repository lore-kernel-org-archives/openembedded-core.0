Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C234C001DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7357.1686734979896314184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ye3y8nqL;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-97668583210so73276566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734978; x=1689326978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWySy0zEqgyO5dw46m2aUE+P6wemR09onmNw/9TdNMo=;
        b=Ye3y8nqLHTJAHC6hmNSJk9V7AOCHi+h/VCS6Dm8LRpEKOH5Ent7418E+eL35ZRCpBO
         voCnYI9PW1K/LOSQgkT5CVjDTcjGdMWhb+NxgozAsvork6Gorxxb4taVhaZHA1ahHNZy
         FSY9iGdl32eXnUgGRgSTJMNcEUrNgEk8/nPYGX6MeKODXo4KneddFOXFMxTV6eglbb08
         at9UqrBtO2Sr/KMI9QadxAbFaQ4556/f2eyyr8pvdw8VOfTS8fNgtJ2yJOaE1FMkMNXv
         3UNHXXbtjw2LabHyzF9usAprU8AdXe/oqB2/63TPaoLPCrz1kB4r2TolCa8SdwlyEqQh
         +3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734978; x=1689326978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWySy0zEqgyO5dw46m2aUE+P6wemR09onmNw/9TdNMo=;
        b=c1xphppbIP6ilwNsfv3hCjpXUlf758nZ0l+zBwMWgZ9Oubw355/iBW5d/m7OG2ktUf
         AAvxivMXTNZFyczwcMvdH3ONT1Vs+eBmco4qr6BRjepNXh6ayPGId5CbZUDTDjuwM4FB
         0dDtN8bfq2X5pkRs4z12suTDuKJtZdEens7EfLb/DmGgdE7dxDp78imdCTzdcHTHm8Kz
         CxBNUc7rWr2bFAZCBKarp55RgPGksLLjEzw8/vQGZ8vrh7HRRMikKRphVTxMchbA8exB
         NsQfyS75wmstp9HkwLr/xqQHCEmSRFx3NHrWtFfiqJg5JCf4tFX9T9He0y+YlhFAky64
         QddQ==
X-Gm-Message-State: AC+VfDydQtMa+LpXQBGWnDZ2vCoHbWHiKYTKdn/gTVaU0122+V0wQSY3
	qXtyfm3CT4nnVsALCWtBNSlF9DDcKfA=
X-Google-Smtp-Source: ACHHUZ7vval492OUo/zRW1T+1Gmwe+lsHeH3rZPxikY4csKLZMRut3wo6TbBRNZzigEyk1BxzBx/5g==
X-Received: by 2002:a17:906:58ce:b0:965:8edf:8028 with SMTP id e14-20020a17090658ce00b009658edf8028mr15828846ejs.42.1686734978243;
        Wed, 14 Jun 2023 02:29:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/55] gnupg: upgrade 2.4.0 -> 2.4.2
Date: Wed, 14 Jun 2023 11:28:43 +0200
Message-Id: <20230614092918.4065570-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182765

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.4.0.bb => gnupg_2.4.2.bb}   |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.0.bb => gnupg_2.4.2.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 0cd4c459070..81aeaf5d3a6 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 346a6b17a07b658954db65f814461b59824d9fcd Mon Sep 17 00:00:00 2001
+From 8b9e3d286e87bc978ec6bb9cfd790d8d253b79c3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 099c6a8..e8cf408 100644
+index a547401..60bc2c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1935,7 +1935,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1922,7 +1922,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 071dd93ff55..f7dd12fbcc1 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From b1117adeb476304ce2792814516a5b7cd44d0d38 Mon Sep 17 00:00:00 2001
+From c4ddea8e6070d1df51058aac08088e27c37e7e73 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 67bbde8..7f360ba 100644
+index 286685f..212a945 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1171,7 +1171,7 @@ gnupg_socketdir (void)
+@@ -1213,7 +1213,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 67bbde8..7f360ba 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1203,7 +1203,7 @@ gnupg_sysconfdir (void)
+@@ -1245,7 +1245,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 67bbde8..7f360ba 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1239,7 +1239,7 @@ gnupg_bindir (void)
+@@ -1281,7 +1281,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 67bbde8..7f360ba 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1266,7 +1266,7 @@ gnupg_libexecdir (void)
+@@ -1308,7 +1308,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 67bbde8..7f360ba 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1296,7 +1296,7 @@ gnupg_libdir (void)
+@@ -1338,7 +1338,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 67bbde8..7f360ba 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1327,7 +1327,7 @@ gnupg_datadir (void)
+@@ -1369,7 +1369,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 67bbde8..7f360ba 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1359,7 +1359,7 @@ gnupg_localedir (void)
+@@ -1401,7 +1401,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.0.bb b/meta/recipes-support/gnupg/gnupg_2.4.2.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.0.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.2.bb
index 900aa8ad736..580782037e4 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.2.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483"
+SRC_URI[sha256sum] = "97eb47df8ae5a3ff744f868005a090da5ab45cb48ee9836dbf5ee739a4e5cf49"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.30.2


