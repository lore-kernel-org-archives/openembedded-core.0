Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97F5C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 12:38:02 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.13259.1717677477814328809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 05:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YuLpoOds;
 spf=pass (domain: baylibre.com, ip: 209.85.167.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d201f9a55dso472930b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717677477; x=1718282277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=izRWAD3RsMT9QTxB8KqBPKFHYNgXMcqyWeRxRZWAgKY=;
        b=YuLpoOdsy7LJs1dvxlAtoiQmtayp0iHknT/F+K2ihSGP1n0IodDxXzeLHaDeUXQLd1
         9nHCXYS+49BDCnrKU2VGqQcAHGEppn19jnWFgWMTeBsliCuy6kKl6ZHS6VGeY3MxW23H
         BtOyZt9/ScZF1XFj/Q7GpRMIFzS4ycPtSmPVX79xErbDtr4P/x5VSV9kybS4s0VZzvLe
         /Y82CsKH7CrvxrszUTwUv3CgwKVX9/YdCE0n6MVuDBbdLudEGmlEeldX9eZ67cBBHROj
         rh8e9n3gXcpecBjOyLB8T6DL862l5H3Bb21Eh/wyeWsETbrX8X/foIsz9swZ2TKbt3Z9
         3ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717677477; x=1718282277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izRWAD3RsMT9QTxB8KqBPKFHYNgXMcqyWeRxRZWAgKY=;
        b=T7EOHYMDr80bNH1lUbbbSUn0uzBXUi2Pf8QDhgwwZ+Moh6zSdIdN6jYaDQ7MXaeV1a
         V2vEAmsy5cAkfRw0aJyeDcqKhG4thQgr0Nkmt1rFNj4SibJZYtvDUfLQEdXG67onZS7Y
         bLjYVJP4tJLFEOcVMmzkHFuIl/b5pkjqgWpYbtvScUinpSzndTKIS9hyakZjdSSevrgt
         j1zrFxV14TymbpJcX5h7+Dm2X5PRNEfwRfV3jLWMiSEr8g12ZGhdSRpr0UZvyEF/ujpq
         133wkWtg3My1QOP2QsBSk2318TZfacWOw6ktGNSqJ25OLt8lCtrUn4NxrF4Bc1NEwnKy
         IuMQ==
X-Gm-Message-State: AOJu0YzcLKLG7Er37HFsqAzxI1zPXZxEojJiActymAOXwjvaSLyfxIIr
	z49qvgJdp304mh5pFgMIbfS6lQ2qYpG3eHIaVlyVBkrUENHQUMkGahInh3H5wRvoX9OYaKeznWi
	S
X-Google-Smtp-Source: AGHT+IHXnvhwdCzQRvRNvzNgM51VKpy4x/WYtAYj6InpPQXKr/R1H6iCzWyM9yr7hyGBCjtnreyPgA==
X-Received: by 2002:a05:6808:1786:b0:3c8:69b6:9b78 with SMTP id 5614622812f47-3d2043b0397mr7284912b6e.29.1717677476740;
        Thu, 06 Jun 2024 05:37:56 -0700 (PDT)
Received: from localhost.localdomain (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f988c20sm5750816d6.98.2024.06.06.05.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:37:56 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-docutils: upgrade 0.20.1 -> 0.21.2
Date: Thu,  6 Jun 2024 08:37:47 -0400
Message-ID: <20240606123747.2059390-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200401

License-Update: Change from PSF 2.x to ZPL-2.1, add CC0

A few notable things change with this upgrade:

- docutils now uses the Zope 2.1 license instead of PSF 2.1.1
- It now uses flit as the build backend
- The do_install append is no longer needed, as the rst2* endpoints
  lacking the .py extension are included
- python3-pprint is added to RDEPENDS

Changelog: https://docutils.sourceforge.io/RELEASE-NOTES.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 makes the CC0 (public domain) license specified in COPYING.txt
explicit in the LICENSE line.

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
index 0000000000..ac41ef6858
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "CC0-1.0 & ZPL-2.1 & BSD-2-Clause & GPL-3.0-only"
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


