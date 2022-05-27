Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17167C4332F
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:08:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5505.1653667709071056408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=REmgn74r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id k5so174458wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yxZ6uTqE9M1oqOGMljjFo58GbzTMfYVPd52q+pePgxw=;
        b=REmgn74rDMBgjd8pnzpToZc3SFG5RNYQs8UC85sJnfDKth6EGryjaTqkzUDgwiGQ7c
         tCNS2RA7sLjWe+0XfjBqmw5EnaqSqCGOuxKa/Xf04TC2wuqLiElztnyep3AjdG/V4qHO
         XiqU5D7ZIbSLMWh+eAjKKt2IzQJrS8lwXKYDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxZ6uTqE9M1oqOGMljjFo58GbzTMfYVPd52q+pePgxw=;
        b=HfLsGXSptMQygkOfd28fNtoQZL29HHxpun5XeNwAn2QFmSByDcFO2K23OihcPROLwM
         K+WxsxiBsPPjqm9eMiiSecxc6GwuvjTJGcIWogrP0HDCTxcs6iKJTZo3JlEr2daNIhOH
         zDFNAToXB0Cn8AJ0Xo/iTCWvLjSAxquYk0mfNAh6pNbvhpDzEhSWno9Lxr8x9LHWks6v
         bs4Ee6fIygOIRRe4y1PXH7y9gw7oG4MRS9xdTL4BKorY5rG5hs7DXzzkCPc321OASn/y
         NO7FM8EcvI3rdZFrsk+MwLPTt95NgU5VXBABpor0THL6zQ/ayWR7698hId2v4WGdP/gg
         YpaA==
X-Gm-Message-State: AOAM531ApgfB4R3MDLwbUV/+UdjeLzqdmfKS1jTEzp1j32YJf8X6hPei
	hdu1gLtxFoNse7++OXqxfLV+yoiSjesWZnc2
X-Google-Smtp-Source: 
 ABdhPJy1m8wosxH0eNoLbf7AjkzGa44mH3dvNycafWZZZNQ+LQuyzjEYGAWPsCCOlH/Ysf3uSVTM9w==
X-Received: by 2002:adf:cd87:0:b0:20f:e5fd:d265 with SMTP id
 q7-20020adfcd87000000b0020fe5fdd265mr19808530wrj.196.1653667707151;
        Fri, 27 May 2022 09:08:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm2089189wrz.64.2022.05.27.09.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 09:08:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3: Ensure stale empty python module directories
 don't break the build
Date: Fri, 27 May 2022 17:08:25 +0100
Message-Id: <20220527160825.461505-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527160825.461505-1-richard.purdie@linuxfoundation.org>
References: <20220527160825.461505-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 16:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166211

There are two issues inside importlib. Firstly, the modules are accessed in
on disk order. This means behaviour seen on one system might not reproduce
on another and is a real headache.

Secondly, empty directories left behind by previous modules might be looked
at. This has caused a long string of different issues for us.

As a result, patch this to a behaviour which works for us. Upstream discussion
can follow later, this is breaking builds for too many people to leave unpatched.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3/deterministic_imports.patch       | 29 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
new file mode 100644
index 00000000000..53cd9fac91b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -0,0 +1,29 @@
+There are two issues here. Firstly, the modules are accessed in on disk order. This
+means behaviour seen on one system might not reproduce on another and is a real headache.
+
+Secondly, empty directories left behind by previous modules might be looked at. This
+has caused a long string of different issues for us.
+
+As a result, patch this to a behaviour which works for us.
+
+Upstream-Status: Pending [need to talk to upstream to see if they'll take one or both fixes]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: Python-3.10.4/Lib/importlib/metadata/__init__.py
+===================================================================
+--- Python-3.10.4.orig/Lib/importlib/metadata/__init__.py
++++ Python-3.10.4/Lib/importlib/metadata/__init__.py
+@@ -819,7 +819,11 @@ class Lookup:
+         self.infos = FreezableDefaultDict(list)
+         self.eggs = FreezableDefaultDict(list)
+ 
+-        for child in path.children():
++        for child in sorted(path.children()):
++            childpath = pathlib.Path(path.root, child)
++            if childpath.is_dir() and not any(childpath.iterdir()):
++                # Empty directories aren't interesting
++                continue
+             low = child.lower()
+             if low.endswith((".dist-info", ".egg-info")):
+                 # rpartition is faster than splitext and suitable for this purpose.
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 9f1b96b5192..6bd3a6aba84 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
+           file://deterministic_imports.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


