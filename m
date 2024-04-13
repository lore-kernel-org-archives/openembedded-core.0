Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF471C04FF0
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 11:08:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.9886.1713006507452198577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 04:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CrCaOoSI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-418247057c8so1969765e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713006505; x=1713611305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkwv6VHo7jL1WtY772RpKfuqx27kqiEmu+96DgUgDs4=;
        b=CrCaOoSInlXCJRcUkVxePHWw74d0kvVrc5AstDj2Jff/HVf/qx/dVCoZL/YSC2VLtt
         lPpUIpNbcdDVShz52dYGAszaTHPESb6JVfbSE8rUtP9lHdaRE4Nki9tmoBXidtCMhDxV
         l5ntZAGiDd1SkX2t59qyDBo7Uzoo0YyP7zCyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713006505; x=1713611305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkwv6VHo7jL1WtY772RpKfuqx27kqiEmu+96DgUgDs4=;
        b=Qf5S1d3vpDJXDlrMCe0ZcYESezjpjeprQmPccVY4qh1AjmhxJVoKkNMv6R/Im5HxoO
         hRvYQ2Nn3xv4Yah5Q0f+z2wQa44hhsO6FCA0L4ULxmh1BcsQEybHWFEQYav6NE96Yccv
         5pxh851jvWMXg/G2asLi8Ja2DLXKVQ6E64YTZum4CZKA+LOCtU4IGFQVGbj4XcAOYVJP
         IobhY1dcyLEVVH6P2YP861j88DzamJ8/hG4W6RB1De4kCjP3h6T5jtTrn482SqbhldT/
         CCEPZ4z9bcAN71lc7TPEsFZ5tFCgz3jmjSR85xoPJgipBqvHqz50CEmRSYoEV0qCkQnJ
         SN/Q==
X-Gm-Message-State: AOJu0YzQBD7POf9xtxdslG6352lHOwYA4Snq5XG9WRXK5JB7QQlVJiwA
	siyAUAxfE/YbL9YDf/AiBw7F8EHF/L1bi5BInTRLVJhnx7AEV83OFOpdyeX9SXSc7rN5O6/qWWs
	+5KQ=
X-Google-Smtp-Source: AGHT+IFFPy8ZbXNnMsLuYsyj3iMKJvoF4Ai30qvkNjuvCcq9Q1Wp7URpKoTXhknpeZshl1MBcfSIeQ==
X-Received: by 2002:a05:600c:4f07:b0:414:726:87d9 with SMTP id l7-20020a05600c4f0700b00414072687d9mr4565311wmq.12.1713006505308;
        Sat, 13 Apr 2024 04:08:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5d2c:926b:df1b:3491])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm11785566wms.26.2024.04.13.04.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 04:08:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-testtools: Fix build problems from incorrect build backend
Date: Sat, 13 Apr 2024 12:08:21 +0100
Message-Id: <20240413110823.2433813-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198194

testtools uses the hatchling backend so:
  * merge the inc back into the recipe
  * drop setuptools
  * use the hatchling backend
  * add the needed vcs dependency
  * drop the now unneeded python3-pbr dependency

This means the submodules are included in packaging, fixing build failures
and the verison in the wheel is no longer 0.0.0

Prior to this fix, testtools in buildtools tarball was completely
broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python-testtools.inc               | 27 -------------------
 .../python/python3-testtools_2.7.1.bb         | 21 +++++++++++++--
 2 files changed, 19 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-testtools.inc

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
deleted file mode 100644
index e9dd97ec1c1..00000000000
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Extensions to the Python standard library unit testing framework"
-HOMEPAGE = "https://pypi.org/project/testtools/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
-
-inherit pypi
-
-SRC_URI[sha256sum] = "df6de96010e29ee21f637a147eabf30d50b25e3841dd1d68f93ee89ce77e366c"
-
-DEPENDS += " \
-    python3-pbr \
-    "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-    python3-pbr-native \
-    "
-
-RDEPENDS:${PN} += "\
-    python3-doctest \
-    python3-extras \
-    python3-pbr \
-    python3-six \
-    "
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-testtools_2.7.1.bb b/meta/recipes-devtools/python/python3-testtools_2.7.1.bb
index 79e46a02de7..cc7e0556326 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.7.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.7.1.bb
@@ -1,3 +1,20 @@
-inherit setuptools3
-require python-testtools.inc
+SUMMARY = "Extensions to the Python standard library unit testing framework"
+HOMEPAGE = "https://pypi.org/project/testtools/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
+
+DEPENDS += "python3-hatch-vcs-native"
+
+inherit pypi python_hatchling
+
+SRC_URI[sha256sum] = "df6de96010e29ee21f637a147eabf30d50b25e3841dd1d68f93ee89ce77e366c"
+
+RDEPENDS:${PN} += "\
+    python3-doctest \
+    python3-extras \
+    python3-six \
+    "
+
+BBCLASSEXTEND = "nativesdk"
 
-- 
2.40.1


