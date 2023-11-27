Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A718CC46CA7
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.91945.1701080284224075065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llkx8o9J;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a049d19b63bso551027766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080282; x=1701685082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9r94YKit91u/adUpCKYE6i5DphpwKkrFZrlQFJcr28=;
        b=llkx8o9JTevFU7MV8VQeSWg02jNErWYJW6qmo9yATJYSb5/xizkiwL1pxZ2WDIFM8+
         RstSAggxXNs6Kk/GfBSZ0WDkZQIlqL0U0qJBCj3gf7iTBUStsVfmGAsQ4t6R60IosRGH
         fObV+PHCIh1v3VrUozy+X/chASL0HWkQxRCoUQXSWPtzMCb/3bT5bQ9gKJso6APhexrx
         QhpMzdsuDSELK482fLcORaWv34CvHubdVfeUDUh1Lxy40Lf2AZquSilVLsR5VbEgzA53
         E1DymJyp+YpvQFToRB92pv/eaDDDhghF4QO+Z4YpDyIfSHb7cAFL5PakAC45I0IHc14q
         nVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080282; x=1701685082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9r94YKit91u/adUpCKYE6i5DphpwKkrFZrlQFJcr28=;
        b=HNvpnr1bX23cqRnEKfYlr9epTn3N73cwEbcUospoLF2rY9/LbA/gRJ9Jr5bk6ig21T
         qGW63KjVBxIkWntZIUD0urKCHBxawxx23ugkMLXgc+tpbvuGYstDM+E8E3v01As2zjUS
         s+jjERt4A0OMfhfHQNymYIOlbEsytDcDbd3RBN60hA/0qJbWDLNzVlFzGVwl6d/3+srT
         kjnCH6RLId02aJKdoGtj6i1+2a2M6p73HSJoq06jgwkyfJTuj76xePKvX+z+kBoP8bOq
         D+AInpUvXoDBDQJ9DIqV+2bDKq2lOLndSHyOvvYqXlPk02qJ0NSFeSEOs2SaOb0gLbW4
         ia5A==
X-Gm-Message-State: AOJu0Yw8zDAbiZlMObp3p3dp4j1S68Qlco9NiV2MXdN5wvLehDx+6hNJ
	dKWnV4bQM/qvnJa+oyPEZ6KEjim/cvc=
X-Google-Smtp-Source: AGHT+IF8fLnh1Tgwp+n1fup8YZjqdZ46ekgUFntDuPe2hmYLFZy8ljBeBf74auqN9SDkebnHYvi4Pw==
X-Received: by 2002:a17:906:6c88:b0:9c3:1d7e:f5b5 with SMTP id s8-20020a1709066c8800b009c31d7ef5b5mr8128770ejr.20.1701080282412;
        Mon, 27 Nov 2023 02:18:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/19] usbutils: upgrade 015 -> 017
Date: Mon, 27 Nov 2023 11:17:37 +0100
Message-Id: <20231127101751.3187950-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191272

Drop CFLAGS (containing host paths) from installed pkg-config file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../usbutils/{usbutils_015.bb => usbutils_017.bb}           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_015.bb => usbutils_017.bb} (86%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_015.bb b/meta/recipes-bsp/usbutils/usbutils_017.bb
similarity index 86%
rename from meta/recipes-bsp/usbutils/usbutils_015.bb
rename to meta/recipes-bsp/usbutils/usbutils_017.bb
index a30037b6938..c62c6256fc8 100644
--- a/meta/recipes-bsp/usbutils/usbutils_015.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_017.bb
@@ -13,7 +13,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "2b8140664578f39c3f6f0166a1b950f8655304e63e3d7f89899acb99bc5cb8e7"
+SRC_URI[sha256sum] = "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42936faaf00814ab00"
 
 inherit autotools pkgconfig update-alternatives
 
@@ -30,3 +30,7 @@ RRECOMMENDS:${PN} = "udev-hwdb"
 PACKAGE_BEFORE_PN =+ "${PN}-python"
 FILES:${PN}-python += "${bindir}/lsusb.py"
 RDEPENDS:${PN}-python = "python3-core"
+
+do_install:append() {
+    sed -i -e "s,${WORKDIR},,g" ${D}/${libdir}/pkgconfig/*.pc
+}
-- 
2.39.2


