Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7514C7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 22:54:59 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.46840.1686524098095192822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 15:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=e9Yvdjl/;
 spf=pass (domain: underview.tech, ip: 209.85.222.171, mailfrom: vince@underview.tech)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-75efdacf490so151682985a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 15:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686524097; x=1689116097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lz+0Dcs6q9piIfuUBeyVcdn5I3wnqM074Jlaqy9HYp0=;
        b=e9Yvdjl/Zehh2Wq/p/b206DSTGVWS0ywM+N1JPcmmqG5jWrnP5ljD+VRVY5k6CoF8x
         eEIcnf6fzxwLFB3jjqmsvPztsleJjb+57uPuQf3fJepLs+9u7oYgcGGXwgrqkrgosxUo
         B9HSiJb1ajO4lcx8TdDBTSafT7337TXq2plwRmfnVdUhylR+y2C5udc4XWBhsJOquGPV
         zWicZcDjnC5CERcPbK7vA2tWt6+cwUNOL4f8/nJ/Vo3cJSDa8ZgiU5g4O73YIy+XjPan
         YUmgzF4/UaTSTZHgIqTcqMDyfhgyR5HT1NEQ5izdLMGlfSyz3dE++/I1WRJMM4MkwWJh
         gLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686524097; x=1689116097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lz+0Dcs6q9piIfuUBeyVcdn5I3wnqM074Jlaqy9HYp0=;
        b=GeLcz6sf6u3FQ3j4xrZt82bLepW7KKVNhJbLYATwFtC5V7Yxybnax19AUXk2mI6Zvo
         NhpPE2s3w3KnEIbrcUARGH0VH5Jjw2vIIJvJaNyM+e6HyJwBa6AyaJWp9C+wc9zg1Na8
         O5h5uKBrcrDr6fX+TO+gW6BSa/b8K9cV4tNOYLr9v2MMENHGQWXxUYrkcqfcCFwFj+JO
         Z/qSQi22Q7SyRYPgwTn3r3IOMrzlo81Tqecv157VJCPT8Dnq9p1EyIAzVs8v4UHxzlpR
         jUwM+NQEDrZDSLbFgiO/qa1/3nKCN5RrH5yCnpWhruw6vNUw3oGjiNA0l8zu3trk8fRE
         T1AA==
X-Gm-Message-State: AC+VfDxfySjs2BUqJ/K8p2E0qEDFNa026yGoVQqNcJs1xqy3JViWj7pU
	hrncT50FZSM8xO8bCRQRKtRkJfBKiJwIL3TDMm8=
X-Google-Smtp-Source: ACHHUZ7YIXuQj3SC+c9BlGoS65HfVi5X+Op+JI6N83nxQABMqKjv/XCJq1w2ND5cxikT7X1QqVb/jQ==
X-Received: by 2002:a05:620a:2628:b0:75b:31d9:3d67 with SMTP id z40-20020a05620a262800b0075b31d93d67mr8458010qko.29.1686524096836;
        Sun, 11 Jun 2023 15:54:56 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:f287:be73:6bd4:6065])
        by smtp.gmail.com with ESMTPSA id a21-20020a0dd815000000b0054f56baf3f2sm2156200ywe.122.2023.06.11.15.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 15:54:56 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] spirv-tools: fix base_libdir when usrmerge in DISTRO_FEATURES
Date: Sun, 11 Jun 2023 17:53:42 -0500
Message-Id: <20230611225342.1994556-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 22:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182641

if usrmerge included in DISTRO_FEATURES base_libdir is set to
"/usr/lib{64}" instead of "lib{64}". Build issues occur when
building vulkan-validation-layers or any recipe that
requires the output of spirv-tools (SPIRV-ToolsTarget.cmake).

As INTERFACE_LINK_LIBRARIES cmake property value is set incorrectly.
_IMPORT_PREFIX is already set to <recipes-sysroot>/usr
if usrmerge included INTERFACE_LINK_LIBRARIES value would be
<recipes-sysroot>/usr/usr/lib

Leading to bellow error

recipe-sysroot/usr/usr/lib', needed by 'layers/libVkLayer_khronos_validation.so',
missing and no known rule to make it

Solution:

Remove "/usr/" from base_libdir string if present as base_libdir
should only contain name of directory.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
index 21f9dd9650..dbfdbd4e0a 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -28,11 +28,22 @@ EXTRA_OECMAKE += "\
     -DSPIRV_SKIP_TESTS=ON \
 "
 
+# Removes "/usr/" from base_libdir if exist as
+# it's already define in _IMPORT_PREFIX string
+# leading to <recipes-sysroot>/usr/usr/lib not
+# found as it doesn't exist.
+def update_base_libdir(d):
+    base_libdir=d.getVar("base_libdir")
+    if '/usr/' in base_libdir:
+        return base_libdir.strip("/usr/")
+    return base_libdir
+
 do_install:append:class-target() {
+    baselibdir="${@update_base_libdir(d)}"
     # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
     # tools can find the right library
     sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
-        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}\${base_libdir}":'
+        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}\${baselibdir}":'
 }
 
 # all the libraries are unversioned, so don't pack it on PN-dev
-- 
2.34.1


