Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06740FA3749
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.2182.1666901795036143946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zum7PGlU;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n12so7824756eja.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8Xnh8mLt1P8quuxJq719rJUIcQadGPmWfABMcmq+XE=;
        b=Zum7PGlUQ2stYCJAi85/4Xcl/o1QpBwG+n0faBxtF5davPAy/90gtWmVVvqb1ji/f0
         R570jk6JQjYh/KRDL4Vdce3W7xw2N8OOVHL1ha70d0NmJjacL5OKhGnyO896n7c+LHRM
         ayuDqshVUGaPeg0u3LSN31TUusaTeEyWdhLYFgeS0nOwqK3aDJV43cLh+HBjTe9tB8Lm
         4PyUkRcmPZ9TF68P2NKSioDMe754HPMFX03u+7MRmFE8BdPs3mpTsBFiocZw2UzLUcSd
         W19be+P11GRxaP7wdstg/0h7LWj1wACO7yfJLZ6+i0Ji2ISa5rwgGZ9ySHbGFebaf6WR
         xTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8Xnh8mLt1P8quuxJq719rJUIcQadGPmWfABMcmq+XE=;
        b=s80GJFQIou21wyUStJBFIed0B3wdGaco42BR+Mut46fwcrmfCTuuh2BH+s/nO7Xuee
         41GKvQBkHr33lFYSguHG2PNp/6h+UlZUAOD9fuloVmZEyStE5YjFYcgOs0YFBp3G5qaM
         VDjgqkDDrGknHAttmY+8wK/A9WgAvfX8Y3/kBRFpxsiSVByovOI7V6WXa/77mOO2dZ3Q
         TwaB+NdYt6nuLnbYRdQgVsyik6kdNzyAnBEeETVGTj3Cdp1++SYen3dvdv1jeMcrhpAk
         eJgHLqNnRDDZOppIhVjIvZBveSmsrTHILchwaJc2wzFq3ErOSLZs9ExhoIGUqgA+lz1G
         QaAg==
X-Gm-Message-State: ACrzQf2IAclVXJ3E+PLmzr3IjjlN6COkDOG0OWiF5gzaWo06XfJqQ4gM
	u/Mb5R3at8nfHrzRXHQ18OMXV19qqUk21g==
X-Google-Smtp-Source: AMsMyM4gWLhClCfBnK4fHVZeDDEw51nqUOhlOaLbimB5QljgBSyoZz50M8FRQlvr30n+0NDgqVQuCQ==
X-Received: by 2002:a17:906:ef8c:b0:78d:96b9:a0ad with SMTP id ze12-20020a170906ef8c00b0078d96b9a0admr44377909ejb.529.1666901793527;
        Thu, 27 Oct 2022 13:16:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/23] python3-dbus: upgrade 1.2.18 -> 1.3.2
Date: Thu, 27 Oct 2022 22:16:03 +0200
Message-Id: <20221027201611.3644334-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172219

Convert to meson.

License-Update: clarifications about https://reuse.software/ compliancy

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-dbus_1.2.18.bb => python3-dbus_1.3.2.bb} | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.18.bb => python3-dbus_1.3.2.bb} (56%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.18.bb b/meta/recipes-devtools/python/python3-dbus_1.3.2.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-dbus_1.2.18.bb
rename to meta/recipes-devtools/python/python3-dbus_1.3.2.bb
index c4687de13c..e0cf64c70e 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.3.2.bb
@@ -2,21 +2,19 @@ SUMMARY = "Python bindings for the DBus inter-process communication system"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=97f58951300aa52a9f9e3a62bd5c846c"
 DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260"
+SRC_URI[sha256sum] = "ad67819308618b5069537be237f8e68ca1c7fcc95ee4a121fe6845b1418248f8"
 
 S = "${WORKDIR}/dbus-python-${PV}"
 
-inherit setuptools3-base autotools pkgconfig
-
-# documentation needs python3-sphinx, which is not in oe-core or meta-python for now
-# change to use PACKAGECONFIG when python3-sphinx is added to oe-core
-EXTRA_OECONF += "--disable-documentation"
+inherit setuptools3-base meson pkgconfig
 
+# requires dbus-run-session
+EXTRA_OEMESON += "-Dtests=false"
 
 RDEPENDS:${PN} = "python3-io python3-logging python3-stringold python3-threading python3-xml"
 
-- 
2.30.2


