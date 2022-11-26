Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF99C4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:26 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.70824.1669472115921580770
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zxvfrsQ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so9999697pjs.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kS58cnk+4nzBjeob4orAcaQ4hJtc0c7VFXwA0Ifewso=;
        b=zxvfrsQ2paVVMEk5NrpEapKUeJG0i7ec5uPNUUDIreD0CBEnhVr29dmAlQzgup+as7
         GxoV6/sbMPicJyP7tPALe2NK1srx18h9Gtha5/lHZT6UOQRiYtlHVFwpYxe0jtTratGw
         Rf/ks/C1Ul11++EKJIhF/CGtKlqKfxnNi4huH99V/L1VrFA9Q5dwHx1kMQfJ4iDG9jIF
         Qq1m5p2raUtXc4sdW/EEtREBpoFmhl8EHSdqqv3k5Lo6zdLgPwHx+NsuBVWSxAWTbctI
         JTR7jQAdrRr0D0di2fyiGdWsXnjbiv87iS6CjI4ylyKY7d2S7LmBWRTmKrA5HFWTNFYU
         yTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS58cnk+4nzBjeob4orAcaQ4hJtc0c7VFXwA0Ifewso=;
        b=MGK/yPgnw0CUI++HMSS4lie8zDGNA+Kj72MBY7Zs95N7KfuhmimUsr/rV3OKmHKqU0
         R7i7kbD5aOmfnHhLKHUDEu0HSBlIo2UXyhp2DNExoEzKSw3gnPY/BNkje9MCxd1sD4Kw
         iDwAWtAsgdeZNHGxYC9Rot0pi7zO0f+b3XDJUSK22bwK7vx1rqNc2f2+5IS8tSVx1phl
         RA7jedn1G6uqPENLl5LDJ6iZgKssnS0/j4bvgU/TCJQCQrgiSJqB+FkRx22RZScc22lj
         8189zcDPyb/6dpQJhmCRgyhZFbY1kvoXP6EuvPw7KxNgSTVH6xC8FJ00Zsj5R5l5zkxZ
         fd6g==
X-Gm-Message-State: ANoB5plTVJnqAFEvd4K3zzpV8Go9JxicXhJLFevkVx5Eqe/VHZNQ9+3s
	FsVY6+VIcbnr4dWkRp2kgXB+TrHqA0su5Hjsnqg=
X-Google-Smtp-Source: AA0mqf7I7259m2b0hk9/HHpKKqVFwCOiRgOwxN1oqjfQOH22Cm++B7sFLKB36qWpGh8PWgdT8mtwWg==
X-Received: by 2002:a17:902:be01:b0:186:7db1:d2a4 with SMTP id r1-20020a170902be0100b001867db1d2a4mr26629900pls.84.1669472114978;
        Sat, 26 Nov 2022 06:15:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/37] gdk-pixbuf: upgrade 2.42.9 -> 2.42.10
Date: Sat, 26 Nov 2022 04:14:13 -1000
Message-Id: <53ed1f139b81649774a8a262bbca91ff5bb0bbe8.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173802

From: Alexander Kanavin <alex.kanavin@gmail.com>

2.42.10 (stable)
===

- Search for rst2man.py [!145, Matt Turner]
- Update the memory size limit for JPEG images [#216, #218]
- Translation updates

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01e1828f8e5bcb0ad88b89fe783c2973480695bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index d33718e3ea..aa44515fbb 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962"
+SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.25.1


