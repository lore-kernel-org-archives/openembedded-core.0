Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5828DC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.1913.1645557458867313067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bzumEvvQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z2so7862926plg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+cjdoSwERQCpVVmEaS0efz+eQs3kvclDipRCR13BQGE=;
        b=bzumEvvQ3X7PVaQsCFiVZvGwh5aot7oArRMQJonaQRdDM8ZFL6bZyl7D0faF/w/R9Q
         2ANDYlGZsoiCTxcrrY/tnMBqYUfSaAPZyuk6V7MeLNiKGIyY9BbtixTjSsAcpCf7e3nq
         7TEJX8Hu2yRWBuMEotHQ9LhQgYYKdP4mZwVxlCibu/NYvCYik4XC5GLgxdV/zHsJjp1a
         y6oc/G3FYpXtFDHuoF8ujtVN0p0X/d919w4XqMr5EzHggftEdfTkH1KRLvCeUFXJQOa3
         IZy5eTEszBOqSVZzrrEQbKJLN1Rcj807B67dfBnceHUfLTna7vpcVegAukzB1NG7ZvWf
         KeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cjdoSwERQCpVVmEaS0efz+eQs3kvclDipRCR13BQGE=;
        b=h3ugZjdTrU9JkSC69LOQaPirO7un0ANnrIQZqlxDkRLpecxxyE1LnPfe1rG97qRQhK
         jI0CPb47aJvYHoZjrQtmWHgl9assN4RG8Y0l4RiMgmqb6ed49SUnP1lLFYwNeRvYt1My
         TDl6Dv3ZrpqVHqhw77r7n3+TMb3bB9gEHJoWC3/CHrYFPnPgmrGJ6AHrJALr+0mNePNm
         BIKa5SiETJTj7WzJQP5NqMeObeOE8J7aLxBovrb2ifRpjc7x8taBFly1NDmpMMi7C7s4
         l241HPCQulmYhhwV9GV16Y4/hQjQ4+YbniNTri9p5eYzd3LGZE67EoIil/CvvsOUyey5
         NXTw==
X-Gm-Message-State: AOAM532GqF8Zwiz/zJhAonFHmcpWEUG/F36JVswuIb9z4RXHh60c6C+F
	DwBucHe3LSCBcp6ZsgCEbLj2nte3u7wrQg==
X-Google-Smtp-Source: 
 ABdhPJyr/MoyrU+R+MEI1wzgLIhTuBljUA9yMgIgUeoZaAZX2L+HGvXFPSsuczI+xtfI1F0Stb5UhA==
X-Received: by 2002:a17:90a:e7ca:b0:1b9:66c8:982c with SMTP id
 kb10-20020a17090ae7ca00b001b966c8982cmr5620057pjb.30.1645557457970;
        Tue, 22 Feb 2022 11:17:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 21/32] python3-smartypants: patch hash bang to python3
Date: Tue, 22 Feb 2022 11:16:47 -0800
Message-Id: 
 <47c793db53b70ac4e44696fa178a7b0bd4b980e1.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162212

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


