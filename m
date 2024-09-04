Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD743CD4F40
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.62095.1725485600438001404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xat3ZAs7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2daaa9706a9so26676a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485600; x=1726090400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTSCfR+aP4j9O2Z44/u4qgkBBxuc8D5O8THrdI+G4aE=;
        b=Xat3ZAs7zt3Ech55i9KbIyZwlxBv0bgv4ZYxlm4QNwsNL85Nq/Q/pSeyYKgGaIyZFt
         xOkpFAS3m7PGs6/z4mv7xf3sLyuWg0NNSu9zZN1cPzyBMNUYmssRLygSBPNUn21gZ1oa
         wYSHhBZEZIh1oWDciC2ogTLvMKKnLP+htYP7QvmIJ0+Ji8Zim1u6RC/RrSlQqL8podzy
         YHQe5ID1V5ziWfRIRBQz3J2T6rT9m7B8X5S/MLf0jdAtbGxGXnB0d+X4B7lR8TdrDYi5
         XGReo5kwetDTi/+tHX+qHXuZgN7WNs0Ieq4bkmFaHwzNSXkMsm66bwW2Js/k2OKfeKzZ
         RiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485600; x=1726090400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTSCfR+aP4j9O2Z44/u4qgkBBxuc8D5O8THrdI+G4aE=;
        b=pXYXl6GbLecCR4h2jWY5Qo09YYFn4c4zR/f2vXjwpekeFhbrpV2SVS+1o8GfX71guu
         0C2Z7EukYA41ZRHvJjCvQLiblMo505kqF1N1df1L21439T46ND9G/0486hgDMnsgAEyP
         XS4xvQWcE02x6NFutkPkE03n7ulizz1SH+UDiXYA+dO6AsscBN02KeAYCnHUslRxc1l1
         Jd62RdiXlnUJgpYkMY1UEtGYUSWIMzp9Y8HqO2UShdzvd5/LUGBWnDYUDkJ4Novcj8kE
         /g91kgiHcgvHJC5YGZdqZ2AsfRMvecxRYCtzDv3/c/CFQ1L0gmQQOrUP+vzDAG4snL+Y
         vikw==
X-Gm-Message-State: AOJu0Yw1++bvbyUnehyzDKuQEP9ls3SB+A7mX71Hd0siDKKS+8zs0CYf
	TUJMJWD4bSEZUFdUiiYlOKhYXBThr1OVkZBTAuc1qR+y00AOOHEog9R5/HhFNtJ6T+pOk+/WVhL
	LwgE=
X-Google-Smtp-Source: AGHT+IG1yiRewVTjp76il+ujk59MrZ9vlMkukTvxegm+dQ02ndvw0GVrx953TSussnQAmpDZ+pihXQ==
X-Received: by 2002:a17:90a:6fc5:b0:2d3:c638:ec67 with SMTP id 98e67ed59e1d1-2da62031ae7mr8489855a91.0.1725485599644;
        Wed, 04 Sep 2024 14:33:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/14] libadwaita: upgrade 1.5.1 -> 1.5.2
Date: Wed,  4 Sep 2024 14:32:50 -0700
Message-Id: <5cc094b5ba1a6e685b01ff35130c4e69fdc7e0ec.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204220

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- AdwAlertDialog
  - Fix unmatched va_start()
  - Fix setting default widget when removing a response
- AdwBreakpointCondition
  - Fix leaks when parsing
- AdwBreakpointBin
  - Fix a leak
- AdwDialog
  - Fix toggling presentation mode
  - Fix close button ignoring :can-close
  - Fix ::close-attempt not emitting in some cases
  - Fix swipe area for bottom sheets
  - Leak fixes
- AdwHeaderBar
  - Fix initial focus for the back button
  - Fix split view links in docs
- AdwMessageDialog
  - Fix unmatched va_start()
- AdwSpinRow
  - Fix ::input handling
- AdwTabButton
  - Fix needs-attention badge on RTL
- AdwTabView
  - Accessibility fixes
- AdwViewStack
  - Accessibility fixes
- Translation updates
  - Nepali

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 25b8f5059061bf52257117ba7d54031a31388fb1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libadwaita/{libadwaita_1.5.1.bb => libadwaita_1.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.1.bb => libadwaita_1.5.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
index 6cb67c0db0..078f81c677 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "7f144c5887d6dd2d99517c00fd42395ee20abc13ce55958a4fda64e6d7e473f8"
+SRC_URI[archive.sha256sum] = "c9faee005cb4912bce34f69f1af26b01a364534e12ede5d9bac44d8226d72c16"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


