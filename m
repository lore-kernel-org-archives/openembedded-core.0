Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E53C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 14:00:01 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.22291.1717509593030742422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 06:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ogpAOsL4;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43fb094da40so49386341cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717509592; x=1718114392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdZM96I7Tp9f6gBfrd5RnTWvfef4R5JgVBdnlWIDI2w=;
        b=ogpAOsL4RTeL7IaVgLjjhCXwPYPV75BTV9LE4ZLQYLojjIMC+WJrNvMLU6YHUbjfcB
         ICIO2QtaB8QGvm+JKVK9JVA14yvaQEWSMAj6v4egoVi3FEtGO+AgKn5gZa4QHj7La+aT
         cIEIfSHi1wX8c8+jdGKZ8oCXacABwqROWAPqrER4EcrGvFtRLaeKUhxfRDICAUHb9yZa
         94v6WEypQKoDc2OIG3a2Xodenw95qZwYc14hpBS9HUKDxHNOIp8dpn2y+n74h4rPjqEe
         kaRg4/MEa+3agyewTgHCAFaRO5w0ilS3ZTPEBOqUjL4bbjElRxPJCX8EdYz88CbTJdWK
         SQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717509592; x=1718114392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdZM96I7Tp9f6gBfrd5RnTWvfef4R5JgVBdnlWIDI2w=;
        b=fc0fO4b6PCWFXRjtaYqr7fFgeQYNgiFvQm/Hcqto/UHtjrsXsqyCNA/QG2DVepCjGZ
         5yzD5VMT6ggWyBDGLaas2ayaC420cmQYGKsTwWLpEBM9xZQIVJcn3GwVaIojFIqvvFAw
         IIdfZOPEzexRZf4cZncglpcuItjFdqGS0Kyn8+6WAOut4uDG5oRDLMcUK9mEbSp1UcUw
         HolUV8XpxpDNB4WZjOUnYviFoU3K8Mugwl/VCRgbNIi7PYmGyccB1KK/qZjBpXYridtv
         HGnihX9nNe+maNB9PlLbB92h0f4WSwF9GJC327CzIIYdLShz42EB4Sa4PixuaZJHmtCW
         4KDw==
X-Gm-Message-State: AOJu0Yzhrby9yp01PdXoXlimElMjwqfHcRC4cX2MgUFAdU2n32MP8u3U
	OWKaP7WSQiRwhwFQsem8mrUm4/TCC7QP8SEXU/ovKydxoREcLCoGMoi3Urx0lP7hDZDcPRH03Qb
	B
X-Google-Smtp-Source: AGHT+IGuYt7qHOOCv4dJMrx9ZV7mVSFWEfkjP4MQb0zn8uMxoXveCLf/SV9UTmXWhsSJjmaiHqE5TQ==
X-Received: by 2002:ac8:5ac5:0:b0:440:f45:4f31 with SMTP id d75a77b69052e-44019ba2e24mr41160561cf.19.1717509591634;
        Tue, 04 Jun 2024 06:59:51 -0700 (PDT)
Received: from localhost.localdomain (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff23bfc10sm49435911cf.28.2024.06.04.06.59.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:59:51 -0700 (PDT)
From: tgamblin@baylibre.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-docutils: upgrade 0.20.1 -> 0.21.2
Date: Tue,  4 Jun 2024 09:59:42 -0400
Message-ID: <20240604135942.2721706-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 14:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200337

From: Trevor Gamblin <tgamblin@baylibre.com>

License-Update: Change from PSF 2.x to ZPL-2.1

A few notable things change with this upgrade:

- docutils now uses the Zope 2.1 license instead of PSF 2.1.1
- It now uses flit as the build backend
- The do_install append is no longer needed, as the rst2* endpoints
  lacking the .py extension are included
- python3-pprint is added to RDEPENDS

Changelog: https://docutils.sourceforge.io/RELEASE-NOTES.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-docutils_0.20.1.bb         | 20 -------------------
 .../python/python3-docutils_0.21.2.bb         | 14 +++++++++++++
 2 files changed, 14 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-docutils_0.20.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-docutils_0.21.2.bb

diff --git a/meta/recipes-devtools/python/python3-docutils_0.20.1.bb b/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
deleted file mode 100644
index 6038732cc4..0000000000
--- a/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=08f5f8aa6a1db2500c08a2bb558e45af"
-
-SRC_URI[sha256sum] = "f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b"
-
-inherit pypi setuptools3
-
-do_install:append() {
-    for f in rst2html rst2html4 rst2html5 rst2latex rst2man \
-	           rst2odt rst2odt_prepstyles rst2pseudoxml rst2s5 rst2xetex rst2xml \
-	           rstpep2html
-    do
-        mv ${D}${bindir}/$f.py ${D}${bindir}/$f;
-    done
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-docutils_0.21.2.bb b/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
new file mode 100644
index 0000000000..f4134f47c4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "ZPL-2.1 & BSD-2-Clause & GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=382430a09a4453818aa6618f2090491b"
+
+SRC_URI[sha256sum] = "3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+                   python3-pprint \
+"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.45.1


