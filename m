Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11930E69173
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:55 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87651.1766434070769640393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACwGOxjh;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8018eba13cso550492566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434069; x=1767038869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1D9+1Flhrf5EfhCfWyVLgxxhUTt+o0vxEFmMDDpwxU=;
        b=ACwGOxjhB+jIid8cw2YpNaxhLAzZGHmwPalLJTaK4wkMrJFZaUDlO++RJmmq9IqVSp
         GXSb447eIOTqfT7bMxXeCyOZNOBt+9gUqzehhrbgSUhuxT2vXFAp5e30Wy4/Byw29Yzf
         QDEfSHcKPOWb9N4qKK0JVV5a1/Y8IBhQr9UVle0PKuHJrvFdaigRP9c1kSvF29APm3oa
         MZiMWU3qrcW3tNUir8xnN9Fo9/hMQUG0qMoulKE8HyJjKdCZKPcodDuq/Rt4/IKISLe2
         QU52spx79SDhuyj8AtWMpB6oH4PMFi2GiwYlhdSIUKPVB1xPC6p9v+aTp+L+k5e4Mm6B
         0gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434069; x=1767038869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1D9+1Flhrf5EfhCfWyVLgxxhUTt+o0vxEFmMDDpwxU=;
        b=FtZXwFEsdcsKNNk/45AMCos23ZbgaeKxISIIqz2ix/RXJX9tBM9l6lvzC2Cn5HK/OG
         I2RW0j6ZeiOOdv4dk51n6wz+LU2G7DjevSeXIxm2r7n/Re6LAdhMMf2m49ag1EY1ohRR
         tYZKmhLEVnfVeyYszJAUsvwo39svs7pjalLipGL2jQ9Mpf87CoeY5sjmIypVY7egxN2P
         n0UGEp0CAGbm3nPgKFCFgzfTSp5yba6YZFF5J1ommiaSmVJmt/gz8qZp7I3ivl/b5rOn
         srtALnoUDRgmFIFy9QzIOnly7N8TFunK6ifDorTUvKq1cgP+RJIYgHrmDakxSD2yIIeW
         QnVA==
X-Gm-Message-State: AOJu0Ywtdmn5SHk5mgwDjFq5mEKlAdl4CAlWOsO9yVJHAObwqrJRnV5M
	F/6nDmYctOYbnIVPBCeWQUSLChXDX9CPsoAGslYmASFjhkCSExfJs9zY30Ds1A==
X-Gm-Gg: AY/fxX7g+RbZ+85rCU6+KZkJJZfNPNvqi2LssdroDFRKE2N4aQcrqX2c/hIQv4f90M4
	x2xbvDQIqbA1r/w6e2yDRG5cHM9entJBeQfOA+Vd6jqWS4Mef21mJWzXzxDMWIAu6K73+Jolm3r
	4BE6xIy0avi9TS7ZSG60hvX4krGGqTp8Ty4bkMcJAMufK797oMuEUz55dmXrran7Cwlx2mB6CGI
	c8gfZgFjtEtHsO8UE8417w1CBohIDiSuMfpIn5VI5ou9iRr1di5ilfkqzLDbT/WcJirBXipo1NP
	59HdvOE0HhJXG9H9VY0aYblt+06XDOKdUZs5PRKrqem3hCbJrXNw6EZx/Xc1MBI9ReSiHAtlyQj
	3HYL/EI+0+Iv3estqFZOL4Dg49wlMy63rce5PjcEBMcB41HfHBeZ6u2jCj3M9Ab41lakt8bcQHW
	EzMFrTwmtXOPV8xDA7ZfBr7LNFHduLKqe6/Nldl9y8GE/m0k0=
X-Google-Smtp-Source: AGHT+IGngg26wHUARo9hxn9CJgbBC/VrcLynIKSADdl1ppI48447igkKZwBvu4uYn8Zc43jCIncrOw==
X-Received: by 2002:a17:907:3ccb:b0:b80:3101:cd13 with SMTP id a640c23a62f3a-b8036f0a480mr1309040866b.10.1766434068779;
        Mon, 22 Dec 2025 12:07:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 005/114] at-spi2-core: upgrade 2.56.4 -> 2.58.2
Date: Mon, 22 Dec 2025 21:05:47 +0100
Message-ID: <20251222200739.2278706-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228330

From: Alexander Kanavin <alex@linutronix.de>

Adjust packaging (and inhetir python target config)
to include $libdir/python3.13/site-packages/gi/overrides/Atspi.py

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.2.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.2.bb} (89%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes-support/atk/at-spi2-core_2.58.2.bb
similarity index 89%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.2.bb
index a1cbf4b455..8d674417bd 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
+SRC_URI[archive.sha256sum] = "a2823b962ed16cdd5cb1fc5365029fd218394d852acd4098b321854bd6692f6e"
 
 DEPENDS = " \
 	dbus \
@@ -23,7 +23,7 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
-inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobject-introspection
+inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobject-introspection python3targetconfig
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
                   -Ddbus_daemon=${bindir}/dbus-daemon"
@@ -42,5 +42,6 @@ FILES:${PN} += "${libdir}/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desk
                 ${datadir}/dbus-1/accessibility-services/*.service \
                 ${datadir}/defaults/at-spi2 \
                 ${systemd_user_unitdir}/at-spi-dbus-bus.service \
+                ${PYTHON_SITEPACKAGES_DIR} \
                 "
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


