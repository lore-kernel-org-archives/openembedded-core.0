Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2E9FB5E97
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65248.1773705819330245170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c00/iJ+x;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b97d5b790cbso68782966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705818; x=1774310618; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dugZ2Sn8XhtqwG8js6QJJkEBeTyA9A4mQm/615Rr224=;
        b=c00/iJ+x3p8cOldIYc0HyJvYcJ3HzFQ+BVedj+0htxfbN5r2D2XP4/pdaX6OA86ybH
         LzJcgBM9ulkCYZI71T69jWrNUj2EclYsEUc4WlKR+aTBVZuoLfvpTIkWC3+0ESbzKW+y
         zpEuARFjVsg/J7vFDeSiIZzCbGVyXWDUo46wJlRDqLawEwklRH9C6aTAJhtjmg9uEnQ9
         MQ9LY1ZZxz8fyGoHBMyX2Wt2auh0p9ABK1NCAoNmqHQ2f+hFfU5Tppdg7rfb2qATmtm2
         O0Yge7BTsosZDFi0KY7WziK4IuVXSygErbIhi/SC+FoeH6k9wd43Xpm4RjfKAM6GyjlP
         A7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705818; x=1774310618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dugZ2Sn8XhtqwG8js6QJJkEBeTyA9A4mQm/615Rr224=;
        b=nO2ESCUIXaTaP7Fr9jdw7AYDIrawUR4q8Bfse3xUMhU+OcsGSK4pYy5gZnqJo0uSFw
         KHyPhExQMH4F9cdgQUifbYHLlVeAB8GIXsO7aSI6UhdjEGWlh5tWrjO/fIrQKp8o7GJH
         SWMflwm6yFOt/MOQutrjkKKROqTLltzOiDacJi8thdSd/qZdiIRYYeKIp047AIOR5gjk
         H4ZFTUrRUlyUx57chNajw+GDWOnM+jjVxvpBvPbYwkTu1oUULi5E30ae2ecqH8tppRes
         Z/tUsEyrlNDWDJMi8BjhhIGZHvDr04x8pxofEr+nzs82yWK/cLb6MehTJ7uPUrfvvu31
         JDpg==
X-Gm-Message-State: AOJu0Yxd8Axioac0BCtQZfpMHvfzFKrJhCkmLajX/K4rdhLn1XHUL5vU
	pYmdOPd+xuStiVA9DX1yK9+AtXw+P73iCdBcXqbTQBVL5b7k6l0P3H9f
X-Gm-Gg: ATEYQzzcivFGvPa9DgoKU5RMVR1f5Cuh3q9woc95HbwK3vHyohNMxJprNxJUUE3IUqQ
	+DzKEep9txqtkKkLKYlpIG06yg2pEStYX90xDuVeuGIFvgsbZ0rNuspjzE5vpHOecxByCgmr9rv
	xybPpLFVw6RpzzG3SIcXbMcmxw7CZQg47I2+kf9doX+1pbZCRxGyUrvR2cDPhvGNvyTSn63KhTt
	rpdP4+GLFo04FThwHg9oxxQxxEo6bYJZv3fbrJpw8FUOsuumLXHuVu+xbxxauQBoevj4NXitqZO
	IN2levBGjDAHsr0lCrfChRCNLqifFODygY9/i+5+gOFay7x3dGSMwEI6/DBkQLaurxa+Z/M2GnN
	aNK0OB7lafsUTMlFgbwZ+pM1mWoNfzZCQjKadRBQ2paUZyp55N5/Ifj1EgJmWUPR3BuIbD4Bjg7
	pRAVb4VnRTzqYKO3mu3OJFyRBeWKensGia3ReaS17ky0DCkUR2leUrwtc=
X-Received: by 2002:a17:906:f5a9:b0:b97:c801:2c29 with SMTP id a640c23a62f3a-b97c8013c05mr296066266b.7.1773705817486;
        Mon, 16 Mar 2026 17:03:37 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:37 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:10 +0100
Subject: [PATCH v2 06/12] bootchart2: Convert confusing appends to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-6-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233279

While in this case `RDEPENDS:${PN}:class-target +=` wouldn't result in
any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-target =` syntax here.

Also moving BBCLASSEXTEND to the bottom to conform to the style guide.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 922e665028..013a86bf78 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -106,9 +106,6 @@ ALTERNATIVE:${PN} = "bootchartd"
 ALTERNATIVE_LINK_NAME[bootchartd] = "${base_sbindir}/bootchartd"
 ALTERNATIVE_PRIORITY = "100"
 
-# The only reason to build bootchart2-native is for a native pybootchartgui.
-BBCLASSEXTEND = "native"
-
 SYSTEMD_SERVICE:${PN} = "bootchart2.service bootchart2-done.service bootchart2-done.timer"
 
 UPDATERCPN = "bootchartd-stop-initscript"
@@ -150,8 +147,8 @@ do_install () {
 PACKAGES =+ "pybootchartgui"
 FILES:pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
 RDEPENDS:pybootchartgui = "python3-pycairo python3-compression python3-image python3-math python3-shell python3-compression python3-codecs"
-RDEPENDS:${PN}:class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
-RDEPENDS:${PN}:class-target += "lsb-release"
+RDEPENDS:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
+RDEPENDS:${PN}:append:class-target = " lsb-release"
 DEPENDS:append:class-native = " python3-pycairo-native"
 
 PACKAGES =+ "bootchartd-stop-initscript"
@@ -164,3 +161,6 @@ FILES:${PN} += "${libdir}"
 FILES:${PN}-doc += "${datadir}/docs"
 
 RCONFLICTS:${PN} = "bootchart"
+
+# The only reason to build bootchart2-native is for a native pybootchartgui.
+BBCLASSEXTEND = "native"

-- 
2.53.0


