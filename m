Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7484C7EE23
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 04:10:59 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.11988.1685851858318749205
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 21:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=jLLnTno+;
 spf=pass (domain: underview.tech, ip: 209.85.160.43, mailfrom: vince@underview.tech)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-19f6211d4e1so3210106fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 21:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1685851857; x=1688443857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OK/l2PFL1FbR45z3SIm8SLhDbTGWdBWUqW4wBolAXcY=;
        b=jLLnTno+kZ2TPpVUVkL+83owLjc2pEoTQImA4Z5rd5YsatHZfWNpLNIoCD7jjN6nhG
         Ky5Z6sCXf6+mZ9W5iCVxQWVPSV1loh8s3jxLhOge9y5mGq9REiI9oLV7JErieihfhyYZ
         cvCzmbjL+cSEOA2K/6QOtvAB96bKenlvNV1Igslq4+TrlAh0q6l+1JpzY79Bk8I2Fwaf
         nsnRTRTIGggAWR/a0H+mLX9AGevb+WYv6+4O8pVfkgWvqoRsiecKhaLQHOsOJJjdeIdo
         TMsRammvt02NM96MtMn4f7PJAbc9JRr/V9+dva9gxY0S9eVlaZCM1boTapd3feRD/Pem
         2psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685851857; x=1688443857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK/l2PFL1FbR45z3SIm8SLhDbTGWdBWUqW4wBolAXcY=;
        b=X3+J8FuPSsnw8E9bkf2dY2CGgqlk+TBf+fwEHfBkJmMSP6D/UjtIIhKjdqVuUIcRO+
         I8X7O+DK1diUL3VMdz2A+VpBNQHxtsMwG6CIOLbPbRcO8Q2iY6KRpdHEeO5KBAyqYfeN
         AucVqI8g+Nc2uyPZiO6kLWPYebgJ4lwrm469aUUZjxmIhEKNT/y45nRWp96yTQbcqDao
         bTZ5ZC2sT/seOQDl/IfBFAqNqTjn3tjA3RTXmKEv2gck4gDR4Sg1xaFJcksY88/avm4I
         Xbxb4nDAYB/N4OhMyZv9+aktWgqPZgVFo9pnoQjRe6JlJBnvYDaDn2k5GS6S+v35kJlq
         PqJA==
X-Gm-Message-State: AC+VfDxPXYPpfkjpQojEFmEb3MHKOAyvpwQor6yYZj4OPHAW5oCRqIhh
	SJS2GoS6CIAgob4oow3bdF0cGIHz6HSJIS11kDI=
X-Google-Smtp-Source: ACHHUZ5HaKoyy7HnrxPARKjmvlQtOPvpoFYLw5rxqjjqcy1PW1DKDEEoN/YFEhMBg+gRuNoze8U4YA==
X-Received: by 2002:a05:6870:8685:b0:19f:5626:a98e with SMTP id p5-20020a056870868500b0019f5626a98emr4116519oam.6.1685851857215;
        Sat, 03 Jun 2023 21:10:57 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:dbdc:f63:d1bb:2dce])
        by smtp.gmail.com with ESMTPSA id g4-20020a056870a70400b001a15d342184sm2252329oam.36.2023.06.03.21.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 21:10:56 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] spirv-tools: fix SPIRV-ToolsTarget.cmake INTERFACE_LINK_LIBRARIES
Date: Sat,  3 Jun 2023 23:10:42 -0500
Message-Id: <20230604041042.35737-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 04:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182353

The output of spirv-tools specifically SPIRV-ToolsTarget.cmake gets
utilized in other recipes. If other recipe utilizes cmake and includes
SPIRV-Tools in target_link_libraries. With the current setup
do_install:append:class-target updates the cmake checked install
file to bellow

set_target_properties(SPIRV-Tools PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
    INTERFACE_LINK_LIBRARIES "${_IMPORT_PREFIX}/lib"
)

set_target_properties(SPIRV-Tools-shared PROPERTIES
    INTERFACE_COMPILE_DEFINITIONS "SPIRV_TOOLS_SHAREDLIB"
    INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
    INTERFACE_LINK_LIBRARIES "${_IMPORT_PREFIX}/lib"
)

If base_libdir isn't lib, but lib64 it leads to errors such as

error: '../recipe-sysroot/usr/lib',
needed by 'layers/libVkLayer_khronos_validation.so',
missing and no known rule to make it

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
index c57acc5a11..21f9dd9650 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -32,7 +32,7 @@ do_install:append:class-target() {
     # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
     # tools can find the right library
     sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
-        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}/lib":'
+        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}\${base_libdir}":'
 }
 
 # all the libraries are unversioned, so don't pack it on PN-dev
-- 
2.34.1


