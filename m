Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD888C0219A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.92290.1738600896326874260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AD6vHeeN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2786078f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600894; x=1739205694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO/4PNyH/33fWvKgmoW7mACCjHekr2t4qrx6edMKZRM=;
        b=AD6vHeeNLVRMgt74RNNnp3RGXizmVO1fMdP3v1YaeP8jfNpaNCmf4AkxZvFyfaGZ7o
         pCCTRabHeoWYG3XaNhdOJbHXGQEsFbFQOibjyA+RucYCeT7v55dPEss0uZsEEzsA6qAi
         oNIHAfFh10jjHw6VWxRcDBPqREgk4g+LnU72k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600894; x=1739205694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO/4PNyH/33fWvKgmoW7mACCjHekr2t4qrx6edMKZRM=;
        b=Vq3zeQoSWl8XYst56hsJ3yqojKBE8pJmrIrjwyUWiG0j5Rc1IKMj5r700D9atop71f
         oN49XWvu1xhB3kZawC0VmZehE6VNdHCvVLtSYkhFaD81MaWPaU0iqZz/maTHjGrszcKX
         wolNnaIdLZPrMjnKGpbVMROC3rL9UN+Hrxbtjlmy5Auh8fcFIkSM4c+UjHv9M3v0tLtb
         pxu9e+TE6iCYBx9nk0X0IjtJE0IFpenBhv3cj3xjUvrVUQcxEpm1WyniOiR3lAqw0+SP
         VOKfnkK7fTkD4ccOdEME9sy6ItCoprTb+UmULsuLpx667A9wqSdWk5Y5xQ+oj3Yw6Dim
         I5yw==
X-Gm-Message-State: AOJu0YwybPlEL/BRjQW/+4DAKWqOrhPSw145V6NxAk4q6aJSSoLqZsRP
	Z9LxLy9lOCvTX8RFI38qAE5deQzWTSJGOsDNTtTVtLqFduRyZsvSJzAWXziPK2Uwrvs+YbpbLSE
	W
X-Gm-Gg: ASbGncuwx4+gq/25FjClwak7nzw1GRFA5EaId9RjfrSaa/T0lE/2WHiJSJteRvFaToI
	2Zh5cjTJqakIDdVfb0p2UO9NMbpaXmXag6a4Ki0OmPJTjnS2nzvE6NE5n/mIwId2ymC1y/rwZRt
	C8WDBtviTST3lTFQACLZsnBfjro9w71iczBepVQt064KAGyMsleGLBFqxw7F/xC9gsXgSMubmno
	4ING3E8QMcSzYecPOkJB1r7e/DqSpsa6RkINZT2ZScph1fvRdqfO2kDgcMJ8W4BnoT+zeWcsm1s
	70Q7kXh0PTzGl7IyIC/IGtrr0bw6L9z9td2wqrzjrI6y
X-Google-Smtp-Source: AGHT+IGI/uZPEdhO//S6cg/0kTafywB+crJcRunP28ci9l4t7eFMjRNrtFd7TLonlzvVdnzHng9spQ==
X-Received: by 2002:a05:6000:188b:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-38c5195f498mr19869376f8f.27.1738600894397;
        Mon, 03 Feb 2025 08:41:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/46] epiphany: upgrade 47.2 -> 47.3.1
Date: Mon,  3 Feb 2025 16:40:48 +0000
Message-ID: <20250203164130.3403325-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210677

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

