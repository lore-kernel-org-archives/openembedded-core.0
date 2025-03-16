Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AAAC35FFA
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.31703.1742141538177756610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iczGRnEd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so6878475e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141536; x=1742746336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLjP/wv1O4UIMi+ncvt5aRHXPV7ShZpLoufo1QKcq5o=;
        b=iczGRnEdByuCLy9OU6lvn0LB1L6uYnSVn+3HrQxayIZUwgLh0vGWEFQBD1cOL0MsSF
         uGyTl2VLKhiE7vy0bOGfMYM+UW6RNEw2GvmoOnEp7TJN5TigCkAjYNnzyqpluCQnvY4A
         NHfhZqPHwsf2WlzLghjC2jMCxjvd20IZHFa/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141536; x=1742746336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLjP/wv1O4UIMi+ncvt5aRHXPV7ShZpLoufo1QKcq5o=;
        b=dKf4504eJaAkWA075u4mKXduAP2Q1fxZ11f3HrC6B2yp1j2TgrEKmfIBoGao94r660
         fjzcjgVl5Y0MY7rHoLOsUbkgFq3WmmJsbQo2WY9DSyesWBTb7QhdgRi2PHUV3zf0exLw
         TUHSfO8+6xoy+GAhFtm+XBtnHNxpntTweREE4H7Ck6nCn0n/G9Nll9Z0W1vumMRdEDmR
         /hJSccK1IVgHc+UibyO2EEemwlFYal3LoNZ86t/po8kQu2m315Giaqq7M/k68cNIMlvP
         CNWED5/jHwKeryVwxrqEaMiwXsUDiVZUtLRzpPOH0ixjxGZ/tqfvFPbsWKQCLxp10Bb0
         SZeA==
X-Gm-Message-State: AOJu0Yxln/cmq1Fk8+QzqKXpaplO6IkxOPBTsbwT5MyRRNBKPNABSDz1
	hoZXeDGQLycOKdYrNbYx9DcPpWYzLWdizO2SqXxEpaCDrU2/R16QGPxwKullUyPOesUs80K/bRV
	7
X-Gm-Gg: ASbGnctad6KF3nAvPUxJFoTU4NqU5kdJc0sX7QdUSIOJYT4IcdBmWFrPf6PInc2tuIx
	JBC6kdz5wxDHtEwHA07SKHHGmJDZXuZ+eWMTV/mO5wPv2QwihX2HZn+X4tfRK0k86utmxOyDvDW
	Vev1z50Rtlhjv+6tIOHaE3FfFtSEUl2PFTopvz7OiPQMd9gi7HGfM0evCJ/Y5+88eikJb5pOrJc
	Spb3+NE6l2bEiPXH6+JB4Zy1TdybLaATlMuK878xhhaE/a0WTuKYzjjSd3odouO30kOfmJhW2+L
	/2DZ2425+D9Fcqo9cNOQsyPbs1tlEPOBuHbRTzGd7vjsOMvGNqCgZZuhqdZIm/Ybc4ejrkE0/Q=
	=
X-Google-Smtp-Source: AGHT+IGgAmTaObYzz5Q1jXME6r43t1+JIpvT3ek+ELJfEcikAR0tiwgMlgvg2T0tX5Pv9zky4LUYqg==
X-Received: by 2002:a05:600c:46c4:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43d1ecd10fbmr99313645e9.28.1742141536050;
        Sun, 16 Mar 2025 09:12:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/43] epiphany: upgrade 47.3.1 -> 48.0
Date: Sun, 16 Mar 2025 16:11:31 +0000
Message-ID: <20250316161209.3629986-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213008

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../epiphany/{epiphany_47.3.1.bb => epiphany_48.0.bb}         | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_47.3.1.bb => epiphany_48.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_47.3.1.bb b/meta/recipes-gnome/epiphany/epiphany_48.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.0.bb
index d55369f12b2..9eff56df3af 100644
--- a/meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.0.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "795d7b81f18b7487d9e9bfc0cb2d68a893d2200f45f9397cd42cb3392b2081a9"
+SRC_URI[archive.sha256sum] = "c9d1f6dffbad03b0916436901c770da302879ca60a636d2b72b25b142ec05f80"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 361d857120b..929e33b0150 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 5377cbe00b82a873dfa623d2c2c539357b05a05d Mon Sep 17 00:00:00 2001
+From 165ef2bf636c170d81576f7d3e6348fc3d781821 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index cb930b4c85e..dac4855750d 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 47db432ad98d74ab61bdb0b1ff07fe0e17761020 Mon Sep 17 00:00:00 2001
+From c43bbbb4154bb9686756297a7e2eecaa72bb1e9f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 3c08643..0f465af 100644
+index 96554b7..f5c9727 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index d8399b90d54..5407d893d64 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From c6b3236266d2162912ca6e7a0916186f6f33e110 Mon Sep 17 00:00:00 2001
+From 4c5f6b0b44b959f0156cb74f76b2db46a0042c4a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue

