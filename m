Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1657C3DA40
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:24 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.3843.1688092158968491463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gufjrtCE;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-39ea511930eso967566b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092158; x=1690684158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07+jqxCP//rcA/Ti6/axORx1gne4LcmUZ3XmFoF/bHY=;
        b=gufjrtCEFOO8SKEnwTMzxl1mO8IHOA/LZzRC/ZUjsuG7MuKLrhMgjAkos3vWnCfB+k
         oT8RwaGGEUYSQUwSqA7uqj8Hh1zwh9cZFbZLIgyIPqKfQKSBRtAguPWLmYoK2MCTEgGB
         LLn9+gUpc9lzC8uo1ry73NQlbBX3arSiYhCNPos0338nH0+G4c1jhLLmK4ud3yfhCciC
         GE+LzVUqbIBYdUVZu9b7ZZWVy8zklp/JxUmQyYm9yi72SrwE2UiVzvIKPFKIXj8RDl9g
         /iAcbzoQu1x9y6CJ7dKIueQiWTZKzJ7Q/Vv0bmFpsPGld6M2s+1Srq9H9W4NM+fOzGYd
         /p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092158; x=1690684158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07+jqxCP//rcA/Ti6/axORx1gne4LcmUZ3XmFoF/bHY=;
        b=OEmD9LtrCMKc1ypd6v6EDEz3vVPvIliKgv2auL85tVPFxgfZAvTr4ERw1v0oY3UndG
         2egInIA+h+3/TF5aPGNWLTUCidm/j10lvoRX8+alVto80aQ2fmrQzN+qlEj2yxDOzedi
         07JWcZZCsKHLzdUtLpAD/iHHMAglFod1jHVjHXjdKwbW9xn3EG4VqqB74S1uUVux+z8B
         Mf30xmoJdH5PWdm2BM71hd6rZuBD0tN4LBdtNkTtlfXxFZ7hHlqZKeHe03RihubBvX04
         DFKTI97ly8knuHP4d3Hp3kSeb7IO1th8uefvHz9h5zZ/Oe6aiiBgujstfHn3k44aNB4Q
         MW8w==
X-Gm-Message-State: AC+VfDxB/3KTbFd9LSTBCzy0mZ/Wjjp7hzDIDkT2bQ0s3g+K2wgbR5nL
	BDb27+JAvqfqkynyZf563JH0lv6ynugYT1UfQ0/S3A==
X-Google-Smtp-Source: ACHHUZ44Nz8YeizI4lWegwreK3CiJgSSe3DcS4CkjPaeFB6qioW+AldEH+Oj579AnoJRWyxTlFjYTw==
X-Received: by 2002:a05:6808:1781:b0:39e:b4d3:283f with SMTP id bg1-20020a056808178100b0039eb4d3283fmr1579403oib.7.1688092157948;
        Thu, 29 Jun 2023 19:29:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/30] gtk4: upgrade 4.10.3 -> 4.10.4
Date: Thu, 29 Jun 2023 16:28:39 -1000
Message-Id: <2630070374c75bf7d62ebb7fd7675fbf7d9e4951.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183643

From: Markus Volk <f_l_k@t-online.de>

Overview of Changes in 4.10.4, 05-06 2023
=========================================

* GtkFileChooser
 - Fix some memory leaks

* GtkUriLauncher
 - Validate the uri

* GtkStack
 - Fix a crash

* GtkGridView
 - Respect css border-spacing

* GtkScrolledWindow
 - Propagate child measure size whenever possible

* GtkPopoverMenu:
 - Avoid unnecessary left padding

* GtkSearchEntry:
 - Improve size allocation for the clear icon

* X11
 - Avoid black flickering with xwayland window decorations
 - Trap XRandr errors

* CSS
 - Various fixes to transitions

* Translation updates:
 Basque
 Catalan
 Chinese (China)
 French
 Galician
 Indonesian
 Lithuanian
 Persian
 Russian
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 479d3a841dcd078889dc83eceaaae0f0eabdf7b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb => gtk4_4.10.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb => gtk4_4.10.4.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
index 9aa33e6851..2d1e0e74a9 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4545441ad79e377eb6e0a705026dc7a46886e46a1b034db40912909da801cea9"
+SRC_URI[sha256sum] = "7725400482e0685e28265e226c62847f4e73cfca9e9b416ac5838207f5377a24"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


