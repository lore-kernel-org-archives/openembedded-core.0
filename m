Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C4BC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:38 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4766.1645478676991394993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ksneajka;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id i21so9957477pfd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+cjdoSwERQCpVVmEaS0efz+eQs3kvclDipRCR13BQGE=;
        b=ksneajkaLtlI36fWvdHQigZ2WGZUgu5UCt4r1RZR0Wa28eILkNBOJhrzf2xXriRBAh
         Xk2VIU2IFM/UA4Wpwt2thhIE3/MDDOjNL2XB/En5duzT1FAqei625gQtJC05iYMIweIx
         UIJzT4p/jvd3lqzdZykePDN+smUT++MFGw/Ks73KWr8ik/YgVeNznYaSIyjl/GWbTQBr
         ZLtbvLJ++Z+ivobEnotMmOJvZIVBleAFzeCJ2fYpshjyFaKNdz9AHF1Daf8C77laAjTS
         dmWdd1fAZhafTwnGzhhMMVHgcxJ2EH+LAASVtWv/tCd7mu7CaWRPpiPYbRLgGaozOPFZ
         +L9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cjdoSwERQCpVVmEaS0efz+eQs3kvclDipRCR13BQGE=;
        b=whSdWFy6J1IrGFinO3DtKsOjs3R6d4lHlBJgEfIqsnfRhqYIJUVg7M83z/3T2/Mj4Y
         KV+5Stq4NVEC0+n6HalV7VlddECOIsOiGUOU6i3UlBmJe2la8fMop3VVC5hxXMG8HLWD
         jigti0yOddl9IubCynpkpQdLFKa6B8Htfa8ebbPved8wChnjL+0Etn/PzMs2/15Ad9dq
         sa67RFGWKnkuuIsPN7GW0/YAJZ7vHClrFMgsUXce5xf4H9g/ANjSq5uShWGtPi9yDh3I
         Fw+icNCkFF/qw7ayKuXxiie3hj9K+1q6rOpFcB5D6/xBa8Pj7LrhZggR1RW69GO3fdam
         p9Ag==
X-Gm-Message-State: AOAM530I+uOoZSNBI3NGEpsaBvUAdIgDMICbUnAk6dSnw4it0T+68+Tt
	oOE1ai+VLHnpF+tjcSXHfbbzVKbcNpbSvQ==
X-Google-Smtp-Source: 
 ABdhPJztCxAa9envLAzeSuezX9YCe0RZ5Y6EJ4rv9NxoVD/s5uaZuauY3+PhutTbReC/IV4Px1Y0Tw==
X-Received: by 2002:a05:6a00:8ca:b0:4e0:2ed3:5630 with SMTP id
 s10-20020a056a0008ca00b004e02ed35630mr21900970pfu.3.1645478675999;
        Mon, 21 Feb 2022 13:24:35 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 21/32] python3-smartypants: patch hash bang to python3
Date: Mon, 21 Feb 2022 13:23:36 -0800
Message-Id: 
 <faff8772551b4d192e2f624db99707381e2204bb.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162097

Change hash bang in smartypants and smartypants.py to be /usr/bin/env
python3

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-Change-hash-bang-to-python3.patch    | 47 +++++++++++++++++++
 .../python/python3-smartypants_2.0.0.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch

diff --git a/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch b/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
new file mode 100644
index 00000000000..aab16eaab41
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
@@ -0,0 +1,47 @@
+From e299bcb05405ff49450307bf3002c1fac14a866c Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Sun, 20 Feb 2022 18:55:50 -0800
+Subject: [PATCH] Change hash bang to python3
+
+In setup.py, smartypants and smartypants.py set hash bang to python3.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
+---
+ setup.py       | 2 +-
+ smartypants    | 2 +-
+ smartypants.py | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index ff1ea76..96a8b73 100755
+--- a/setup.py
++++ b/setup.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # Copyright (C) 2013, 2014 by Yu-Jie Lin
+ # For detail license information, See COPYING
+ 
+diff --git a/smartypants b/smartypants
+index 189adf5..0cca568 100755
+--- a/smartypants
++++ b/smartypants
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # Copyright (c) 2013, 2014 Yu-Jie Lin
+ # Licensed under the BSD License, for detailed license information, see COPYING
+ 
+diff --git a/smartypants.py b/smartypants.py
+index a70575b..e53bd87 100755
+--- a/smartypants.py
++++ b/smartypants.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ # Copyright (c) 2013, 2014, 2016 Yu-Jie Lin
+ # Copyright (c) 2004, 2005, 2007, 2013 Chad Miller
diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
index ba3408247b7..05c94c390ff 100644
--- a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "smartypants"
+SRC_URI += "file://0001-Change-hash-bang-to-python3.patch"
 SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2


