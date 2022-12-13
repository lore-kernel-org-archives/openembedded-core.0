Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E784CC4708D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70918.1670929888100924406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TFfXJ+HN;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id o5so15237704wrm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Yh0fh48xXBpouUL9Ne6fWU5v4oCokp7YRWdzoeR/Fs=;
        b=TFfXJ+HNvEsf0lukMJiJVQkb/IqwdPdjg7AlktLwiyLpqI5Kw2LeWX4ea9OdEhN3V3
         JUM0Q+os5hwi9OwGyy4NJN0V0vxo4wfgveoEf/PatKsIo9TsBl4t/UXCHPMS6Lbyfcvn
         CS7Nv3my8lcxKuSzABT00sxRxtim2pxRDYYI3AJQj9m9rMsQOMIrJw4wQGHTk86sWbX+
         tj+7jOMGaBMeDc+jOo4pdiJ2lcUtLpQ9mp4z5yIeTjpSVvjUxqAdRlMNx2eLuhJEY2Qz
         7BZPluytVydf72bhCEYRu3G7CQnz2aUNlmb9/0QAuI3hHapbOfdbAdLdrNY+GEK8z6gH
         xhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yh0fh48xXBpouUL9Ne6fWU5v4oCokp7YRWdzoeR/Fs=;
        b=WacRM146bDCdFfQdEJcOjWstuT48c8Z8GLqalSzS9z8wZQBWxuHr5KpOOkh+juxmkf
         929OTDU9iP0aqtFe8EzIusI6BRvn5Aq680oVKomr/VPdKJJ4LRYlLeZB5MFX++X3+KmO
         8bKfSofskCF3mpCtI7WbQNq5dugePNcN9XApPU51h//dym7MMnyRiI1IRtFPn1tnjIpv
         EkNwjt79iZV1e8BxEkolTnCWSPGSQnOX0tH7mMK3pgODH/RU7+KpIomNPSKCwFEqr1+S
         gOH2onNjmfP855vQQoRZirDL4Oc1b+Ljh+j3JcP8rf6ckmHCrLXh/VFPm90wT9JYQoVv
         8zfQ==
X-Gm-Message-State: ANoB5plNqaQuxrBBwd5wc5yMKRIzwT17vWLX51HbHwOsMkzHV/5m9Q0+
	5U3LyujH6V4wBIre9OFxWk9uxS4Xz5k=
X-Google-Smtp-Source: AA0mqf57LRJPndE1zJaqb3aR2iGzvTvS3yW+p2NyuRgdboK1v8Giz6sImf2Q1YZskSZ+yTx30tlCZA==
X-Received: by 2002:a5d:4492:0:b0:242:3600:d221 with SMTP id j18-20020a5d4492000000b002423600d221mr12811335wrq.55.1670929900870;
        Tue, 13 Dec 2022 03:11:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/24] gnupg: upgrade 2.3.7 -> 2.3.8
Date: Tue, 13 Dec 2022 12:11:18 +0100
Message-Id: <20221213111118.149697-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174534

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-custom-value-for-the-location-of-.patch |  4 +--
 .../gnupg/gnupg/fix-ldap.patch                | 35 +++++++++++++++++++
 .../gnupg/gnupg/relocate.patch                | 18 +++++-----
 .../gnupg/{gnupg_2.3.7.bb => gnupg_2.3.8.bb}  |  3 +-
 4 files changed, 48 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/fix-ldap.patch
 rename meta/recipes-support/gnupg/{gnupg_2.3.7.bb => gnupg_2.3.8.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index c4ede9ea5e..eb2e47f035 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 89b98553084fbefe1ef2c7cbff9e72cf43144c49 Mon Sep 17 00:00:00 2001
+From b0c42c8273c5fa1e31094567122be24ba28a965d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index d86c60e..65c22b2 100644
+index b043386..dd839d0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1955,7 +1955,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/fix-ldap.patch b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
new file mode 100644
index 0000000000..24299e16fb
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/fix-ldap.patch
@@ -0,0 +1,35 @@
+From 7011286ce6e1fb56c2989fdafbd11b931c489faa Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 14 Oct 2022 09:58:41 +0900
+Subject: [PATCH] dirmngr: Fix build with no LDAP support.
+
+* dirmngr/server.c [USE_LDAP] (start_command_handler): Conditionalize.
+
+--
+
+GnuPG-bug-id: 6239
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=patch;h=7011286ce6e1fb56c2989fdafbd11b931c489faa]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ dirmngr/server.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/dirmngr/server.c b/dirmngr/server.c
+index 04ebfd317..98f354300 100644
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
+                ctrl->refcount);
+   else
+     {
++#if USE_LDAP
+       ks_ldap_free_state (ctrl->ks_get_state);
+       ctrl->ks_get_state = NULL;
++#endif
+       release_ctrl_ocsp_certs (ctrl);
+       xfree (ctrl->server_local);
+       dirmngr_deinit_default_ctrl (ctrl);
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 43999b8a6d..ca0e46141d 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 89ae4f03307104689e1857d9857d452af6b35ac4 Mon Sep 17 00:00:00 2001
+From 7c6f9724f53ed2c5237dad4e3f4ec44091ac683d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 260aeb2..1aeb08d 100644
+index 67bbde8..7f360ba 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1143,7 +1143,7 @@ gnupg_socketdir (void)
+@@ -1171,7 +1171,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 260aeb2..1aeb08d 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1175,7 +1175,7 @@ gnupg_sysconfdir (void)
+@@ -1203,7 +1203,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 260aeb2..1aeb08d 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1211,7 +1211,7 @@ gnupg_bindir (void)
+@@ -1239,7 +1239,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 260aeb2..1aeb08d 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1238,7 +1238,7 @@ gnupg_libexecdir (void)
+@@ -1266,7 +1266,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 260aeb2..1aeb08d 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1268,7 +1268,7 @@ gnupg_libdir (void)
+@@ -1296,7 +1296,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 260aeb2..1aeb08d 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1299,7 +1299,7 @@ gnupg_datadir (void)
+@@ -1327,7 +1327,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 260aeb2..1aeb08d 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1331,7 +1331,7 @@ gnupg_localedir (void)
+@@ -1359,7 +1359,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.8.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.3.7.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.8.bb
index da2b1c4deb..aaa8d8fe99 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.8.bb
@@ -18,12 +18,13 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://fix-ldap.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669"
+SRC_URI[sha256sum] = "540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.30.2


