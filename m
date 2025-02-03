Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2007C02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.92269.1738600872048670747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EPsmrG/l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2303523f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600870; x=1739205670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO/4PNyH/33fWvKgmoW7mACCjHekr2t4qrx6edMKZRM=;
        b=EPsmrG/lgQbAxZON8CvGDpbL5mdqI/bwDspHmc9WNOHxl3sof26Cfcxd/ZlVYSISsq
         cskfyy0aEx4KPzGe/6CVvVWWK4F9bgKa0l6FJuu/+WOfnP3EvLVL4rI5lvYzjpbpOGSy
         sirtmYHF+dvzEfPJ5t2V/KRJn27q/kuUZUpII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600870; x=1739205670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO/4PNyH/33fWvKgmoW7mACCjHekr2t4qrx6edMKZRM=;
        b=QRC08XNmGerjvgd+l5KNb0lwAAEpKIGhZ/WC+QkAuUOSKdeylficPRW+DgjhclQMkD
         i/XXYkaZn3rloVmQrddUDIaYspojEs/BXi5FAkAq4s4hKf8/SgvUYpFrVn6NEU2ov0Tj
         y6o7pH/jwV+uEA7cTf7OiGSWZ1PwU4e9+PvwcOybwn9sFB3/UeyrBOHzdLlgxnhqaY/p
         YLw2+gqjkPOQGPoVmvbhD0sSQfZJl+mDossFABl7wumUYxU7nUJuDt82U1KKqjv3W7I+
         0S2g6rshngrLg2ncA8CF6jROug1UV7bN8lljdGCx7vaXZ/jMf27bX5okgtR6h5dbUlXL
         BvCg==
X-Gm-Message-State: AOJu0YxVzNaJSe6cqW/IGRlCKtMQmxlI0X8hWzngAJPKn1+Ghewc08zX
	63upinOk5smCky9WFSm3+mVK4ajaHRAlwWxxB1BoChoq2MHv4aYCKl7rBcss9iaO1eV81r5joC0
	c
X-Gm-Gg: ASbGnct/XGXwdAjPbKIEiaPCO14Eqn1gwetll4LqZUEl+sMK2oVHbIdA4N/uEjC36O+
	lT+qIikp/wQLh+X1DkfEaSxrwizLkgrUvvtCKItqxFtv/235FDmz/c67flhER1dle6rGBTNGKai
	wbPpDS8jg2wNEiktrbDbnSI+t1qaMpXt5y+7hv3vAuleB580O3jfMVdPR3BuU8SYNqYUJiX/ZCK
	Ni+VgzRF5mKlfVredbg67LlHsIbV1PqvMdZXz+gQmzuULfqjV4SRXsSbsfD1CFCu+0EXTVhE/Cg
	ENI5mF279UXp/N/G6gAQoeDExTV41uwxtOFtNtz117yg
X-Google-Smtp-Source: AGHT+IFrvOA/ltKPXQjhFL89kzO3d1psEz3io4DjNkV2v3MGqRUEqYHUzm4f8jySFfdBZ7M+3qy9RA==
X-Received: by 2002:a05:6000:186f:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38c5195defbmr17367726f8f.17.1738600870055;
        Mon, 03 Feb 2025 08:41:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm13479806f8f.98.2025.02.03.08.41.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/47] epiphany: upgrade 47.2 -> 47.3.1
Date: Mon,  3 Feb 2025 16:40:22 +0000
Message-ID: <20250203164104.3403226-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
References: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210671

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../epiphany/{epiphany_47.2.bb => epiphany_47.3.1.bb}         | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_47.2.bb => epiphany_47.3.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_47.2.bb b/meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_47.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
index 3813054d6c1..d55369f12b2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_47.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.3.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "34dafd8363a098b44d476e2e9823b4cbea6e66afad33bba10ed7a13ff1a964f1"
+SRC_URI[archive.sha256sum] = "795d7b81f18b7487d9e9bfc0cb2d68a893d2200f45f9397cd42cb3392b2081a9"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e129d503e82..361d857120b 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 4ec86871f8c2a854aec9e6955566fa437fd5f09a Mon Sep 17 00:00:00 2001
+From 5377cbe00b82a873dfa623d2c2c539357b05a05d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index ba674e4aad8..cb930b4c85e 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 641c9d5fc0d9f16151a20a5df2f0b4059d1130a1 Mon Sep 17 00:00:00 2001
+From 47db432ad98d74ab61bdb0b1ff07fe0e17761020 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 2691828..c466af6 100644
+index 3c08643..0f465af 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 53837f448b2..d8399b90d54 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 2fcc2b3c3751b2fb63474ca78b24e4b6375d62a9 Mon Sep 17 00:00:00 2001
+From c6b3236266d2162912ca6e7a0916186f6f33e110 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue

