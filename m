Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF9AC9833F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:46 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39684.1790527602016096765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FWKn+CwV;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso21313095e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527600; x=1791132400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GZ3IzwfgrY3m+1qew5ercbe3GkuOGz9Q2SMWaCPJ6jw=;
        b=FWKn+CwVmT00DC+foHsUHWmCMMTUsR3XXq5ZdMmU9NDnWRsoNDDyjToMpPybIj9rHD
         mD2+rWp2hi0cACchxysHc8MLB0CnOsc38arE4eSylUNEBvl8kfRQSPW2g20f1oC3ZdTr
         e/xodc1IPq/eL8inE4Tlh2eyxzpcgCE6NfuOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527600; x=1791132400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GZ3IzwfgrY3m+1qew5ercbe3GkuOGz9Q2SMWaCPJ6jw=;
        b=MHTEDWMQazbTj3s+Xpc4gxHqxZAqkCExeKm9TpejH52XSj1Q1CjXTpBCuUzvVi/XKk
         RTszY2JRyWnntI4fePL2RJ2HgK7kv/I2dxFz/q2ZRdk9vo5EiNJ2hCPJx7oyNE6eIwL/
         ZN7XbQCml2sXnYffIdmQPksf5Tculbirm7OChqmZSDKVr25NxBxWndndgh6k4VWjRLN4
         3N/uiuKlJLxt4xS2ONBYSY/tZ+UKKjIZGDY6DfGhasLQ5zW9wkVhTt0ekLhGEGI2s9YZ
         3EWesfhDfMhYKNtk+SFUDl0WeSmaIoTx+m35zWfAuK5C0Vn9NqgweL0zPc5TmhfTwcIF
         EblA==
X-Gm-Message-State: AFuF++n080X1wdemUUsp+zbsaXgRkLshuHIweZZbnNXfXOMB0uemjuJU
	pDz3fNBAlJKo4T21lNoHBO/Xh947DS3RyrzDV060CZI0DKvBjdCWOYvUdFW0Ar+qLnCTjAxL4L+
	kJ5AknU0=
X-Gm-Gg: AYBFou1grqguCWoPw17iVt/cLEPTdyq1Bj3ET3fRD7A25rcRTeBhzludFAdUUjRF4u6
	1M3M+QhUL+strMipwE01OawemHkMk0kEYK9pWDXGnYtb0QlgtCEY1ySl7rmhQWzmkCXPw4NOFlg
	9+i3CKp6L8vO5A7b5kFfdME1oQPXU5jlnt3A8WleTlSiqCFOUrtgF/vaPxOVY0Sd5cwO0wnAGVf
	/yPXoVz5Ozzcpx9iwI0AWtpkk0i/YrtXZbIST+MzExIpqIkyyvKmkon7dZzs47wDuPjYpYbk2fs
	D4iBWIwQJqwWHo+y3a7zOStbA+8SF+a3lRlZH4zCiVa8oQaoAhnPVGzriVcGSlYKSCir6cgcXlM
	fmRZasAvey2uYKXvzRQ3DIT6Eop91fMX4gByXIuh8vYsv6tTi8DWQQzSEngr/sOusd/oJ8QDVce
	eGUNhALoIWCdIEF9EY/AOBS2Kzn+uR5cXMmLygb3X63wiMBwLOkONZs99Df5NHqwdGG2JLBdLgN
	YfE12FUHwHMJ4z4hsfUP2VoEKR38QsWIs8sfw==
X-Received: by 2002:a05:600c:1c13:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a0035c8ab4mr23713475e9.7.1790527600271;
        Sun, 27 Sep 2026 09:46:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] epiphany: upgrade 51.0 -> 51.1
Date: Sun, 27 Sep 2026 17:46:27 +0100
Message-ID: <20260927164631.2484854-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246694

Bugs fixed:

    #2883 Wrong position of the suggestion popover at the first time (John Cardullo)
    #2905 Refilter, do not clear SearchEntry when using the "Clear" action in History dialog (Arak)
    #2952 (CVE-2026-94291) Epiphany allows insecure iframe through view-source / ephy-reader scheme (Michael Catanzaro)
    #2958 Bookmark search does not work when a tag is viewed (Arak)
    !2215 Pantheon: Revive about menuitem for debugging information (Ryo Nakano)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../epiphany/{epiphany_51.0.bb => epiphany_51.1.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.0.bb => epiphany_51.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.0.bb b/meta/recipes-gnome/epiphany/epiphany_51.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_51.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.1.bb
index 63ec9bb1001..cf1f69dfd29 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.1.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "abaf33576462030c65bb963a56300a7786e7d75834f1c90a9dffda873835c33d"
+SRC_URI[archive.sha256sum] = "beb93b3b86b763092a1175b6e505789b7613071c0dc1ad56cac1979fe879e9dd"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index bdb06e407b8..b697b5f6400 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 2bb52be1e80d1f4693a383be8270e80ef1d9586a Mon Sep 17 00:00:00 2001
+From 20c45cb379ee910b89175019388df1a63b01c0d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 8677f1558c3..28a961323a0 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 2f52672597ab74cb17e41d308f8d9934c25d8fc0 Mon Sep 17 00:00:00 2001
+From 82196d415819d517d8cba2142600be279e499540 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 8aec3cf..4a06ab6 100644
+index 65324e5..2e70ef0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index dcc162040aa..491ff35ea28 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From e336c2dd1368aff496a6ba01e2ca9ca7e88860a2 Mon Sep 17 00:00:00 2001
+From 84c26f054ab3520d06febc2e8a99502d2cff98cf Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue

