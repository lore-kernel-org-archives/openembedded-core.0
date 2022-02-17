Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE232C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1772.1645114212041571413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SNO8wH3t;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id s24so4118276edr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pt4T5EFc2LXmIuwo0OZE5tnuuRP/V7nxzS4gGd74a9o=;
        b=SNO8wH3tAgmfz4snOvNl1l3VTiK9XiygWIZaJHcy2P413bui46O3k51r9qJd2wPTxB
         +3gsRJ882NPmH2NS6Abg1xWDYUrzEVv3xqPO5zVl+MJnJtaKyc/hArEpk6qfSAZhmNv0
         8qZI6Z/PiynCXN0TKqdNdo4Vs6XyWtFEMURznKtnK4Ll6rLu03WRcZLID9zZs/6Yhqdx
         UMM5ogNi0ELz8GxRFcgQt5aY9F6lpNCbzhhQVc6boxcAHe33fURTBkVJmgFatMUVre4k
         E9UF3mjU5oDL8sf0h3hPZCj8HL9EYfoYMf3JS7opVhyJUx1r5dzxHouaQvc7PzNiCQCQ
         777A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pt4T5EFc2LXmIuwo0OZE5tnuuRP/V7nxzS4gGd74a9o=;
        b=zYrLiJPuK//HMYUpQiDzKx7Hv4oGyIGIqhhAtXh3IwKS0jZtPq1+L9TqQm89jytyCm
         dI4w+QAzr9QtZcmiTu/0fP2b3G+jN5/nhUWoePgW2cvUeL07QiVl5zVPz+3VQqRC5H23
         M1VDq2l0PbvRO+yaxcI02gUZ5BW71O3xfJGE5o38SpjDpMVHSvDTuSpq5p2hiOEkCKTu
         D0XnJQUe4JPZBT0kERqvHYjbFrOwHzPKd9d9bCIhFjp985ZHYXwzBEBFyyfhxQKtUNmD
         A8xtMSWlwTdUuYD3NF6KgyAe21zKNZZYj3jnabMZQk3Xj1TTAJjXk4RqfylW7UjCTzZD
         WgNA==
X-Gm-Message-State: AOAM531mESJGH4xDpZV45GPVANeEqcqZ3l2KBAmzFTiGApe66RA/KPFb
	pFa9CF3Qk0g6LooxTCrz3bFrZhFPsro=
X-Google-Smtp-Source: 
 ABdhPJx9t4UfAKRrD3HMi6Xu5WcUKoAkZi30QZykijJyQ4aKVfxtYdOyrjuVgLRInVOpcJFlb3KKwA==
X-Received: by 2002:a05:6402:294e:b0:40f:905b:dab5 with SMTP id
 ed14-20020a056402294e00b0040f905bdab5mr3360120edb.103.1645114210604;
        Thu, 17 Feb 2022 08:10:10 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/28] pango: upgrade 1.48.10 -> 1.50.4
Date: Thu, 17 Feb 2022 17:09:34 +0100
Message-Id: <20220217160939.1424397-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161840

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/pango/pango/run-ptest                    | 3 +++
 .../pango/{pango_1.48.10.bb => pango_1.50.4.bb}                | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.4.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango/run-ptest b/meta/recipes-graphics/pango/pango/run-ptest
index fa87a75779..e1fab050ef 100644
--- a/meta/recipes-graphics/pango/pango/run-ptest
+++ b/meta/recipes-graphics/pango/pango/run-ptest
@@ -1,3 +1,6 @@
 #! /bin/sh
 
+# workaround for https://gitlab.gnome.org/GNOME/pango/-/issues/668
+mkdir -p /usr/share/fonts/pango-private
+cp -rf /usr/libexec/installed-tests/pango/fonts/* /usr/share/fonts/pango-private
 gnome-desktop-testing-runner pango
diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb b/meta/recipes-graphics/pango/pango_1.50.4.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.10.bb
rename to meta/recipes-graphics/pango/pango_1.50.4.bb
index 40df7042e6..c1e9be2f97 100644
--- a/meta/recipes-graphics/pango/pango_1.48.10.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.4.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
+SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.20.1


