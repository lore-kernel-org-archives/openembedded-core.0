Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F34EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.61464.1688484586933588552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iVrQrGgX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-55ba895d457so1068704a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484586; x=1691076586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEma7shBOqWSbEhWAkwBCV5UOfz/UbWcXjw/I0oOHdY=;
        b=iVrQrGgX3BgQPabfH/WauVqBPlU7I+wuBkLC/pDMG2YQX4KJ/k8tuHxnrPceyqV8sY
         BIJpSPksrZnDVU3hKcfOtM41MctJeSt4PdApCtN/IFyYzWyBI8WBn49CwhvDE2k14oRb
         h61SI1Vo+GQdJbMc4N6tNFH54LGJ69EcC8Leo/GL6cvw4Fw31NosKoHbDrsyu9fWZcTT
         Yv5oWq6t9E5bisAAxwbNZI5aigGVSIZrKKQIN+Yne7H7NlvRGCDFChOy1C3+waSRwbM2
         5WDfyH9lcaC3IcbpHiEATQ3U9TeVsETtbEfxLanGL/f6eGvx/lOu0ib6H4+5JdJfc0A3
         ZhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484586; x=1691076586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEma7shBOqWSbEhWAkwBCV5UOfz/UbWcXjw/I0oOHdY=;
        b=TPwkf5iLrVRDclUQ0u6+pgOgouRr5QtmqVKVIbKizIGTsNL0jaAYDVS6NZbhapi5gy
         KOoPBI0I8qDc429NoAhHzqInTEiyxZSa5o2wSp8iMKGMZiTKs/9RL7WUXH6tG5r5XaDG
         GZRp8WEYPTSCrzIsFsI/qbBRIL/nFGgGsGjsuMR2cRlV4PXG1pn4pFGUYr1rngkEhy8E
         I1qSjvFhfCn+I//jwADnDo4Pv2lp6kkS/Ocs5YitSeJHVNICjcLWm81u2YJRf/mORokC
         wIryHFg5+dfyTSuSjrPDPrDPpShVKwU1+9EcFZFycyRvUzuVxKfyg8oYageSy+bAxtBR
         a8VA==
X-Gm-Message-State: AC+VfDwX0PUsMZHrTu6zkci+fi+8cnGoSocycbT4Fl8awkZh/kKXeKxV
	lqwto05ry5qizUtiQkNsm35lqwHAoRTQ3hTtLH6/9A==
X-Google-Smtp-Source: ACHHUZ43CRPwsTETJF97yqm1Mb0SPLm34eXpdVg2zLe84j4SlMN+c8DmjDR/d52rxlRrK4rGPSPcQg==
X-Received: by 2002:a05:6a20:8e14:b0:12b:5cc3:13c6 with SMTP id y20-20020a056a208e1400b0012b5cc313c6mr14707416pzj.19.1688484585935;
        Tue, 04 Jul 2023 08:29:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/30] gnupg: upgrade 2.4.0 -> 2.4.2
Date: Tue,  4 Jul 2023 05:29:05 -1000
Message-Id: <d4ab498958db518a7c67b8cc1f9c15d6ee253097.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183838

From: Alexander Kanavin <alex.kanavin@gmail.com>

Stable version update

Noteworthy changes in version 2.4.2
===================================

  * gpg: Print a warning if no more encryption subkeys are left over
    after changing the expiration date.  [rGef2c3d50fa]

  * gpg: Fix searching for the ADSK key when adding an ADSK.  [T6504]

  * gpgsm: Speed up key listings on Windows.  [rG08ff55bd44]

  * gpgsm: Reduce the number of "failed to open policy file"
    diagnostics.  [rG68613a6a9d]

  * agent: Make updating of private key files more robust and track
    display S/N.  [T6135]

  * keyboxd: Avoid longish delays on Windows when listing keys.
    [rG6944aefa3c]

  * gpgtar: Emit extra status lines to help GPGME.  [T6497]

  * w32: Avoid using the VirtualStore.  [T6403]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9eddfded59819a2a375b6f5518bf2c3184237d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.4.0.bb => gnupg_2.4.2.bb}   |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.0.bb => gnupg_2.4.2.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 0cd4c45907..81aeaf5d3a 100644
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
index 071dd93ff5..f7dd12fbcc 100644
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
index 900aa8ad73..580782037e 100644
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
2.34.1


