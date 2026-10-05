Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA31BCA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 22:08:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32191.1791238097849005448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 15:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rmu5X1o8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso1847179f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791238096; x=1791842896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNJLwyD51NZjUZqza9w5PNgN6/wc/PoRKPlabooVeaY=;
        b=Rmu5X1o8KDhewF/G+pVe/uzMOGytizXQ3hMH1leSPykQ7g2TbYAIKlPn1DZH71voPx
         7bzqPGbuR4rsleNkrlAV5f+kpm7r/j0L4CYGXubl189ZYSLDpwiuCeHHjo1qxY0tyYSB
         Ry20UgDEm2H3Iw6Fo66npN5Wb+IhlOqhLFibA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238096; x=1791842896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CNJLwyD51NZjUZqza9w5PNgN6/wc/PoRKPlabooVeaY=;
        b=krxyKc3m02PsQP0MvdM/sCZmdhGDs8Vfg6axgzSqy2TXlN7eQpd3F2vAKuemgRGpoG
         K/ahLK73ii1N6KE9uy+SLvkT3TJKyvzOuufvAkXr4dHxGtNifFWWsL+LvVgVETOSXh1J
         gz3jyv/PxY5KTsX1Y1qz3Yrm/iWDf+UVaHIn4Ci3nNp2j7xCbeW4jLovXdVciQGxN7Bh
         RsE0nJ8ewdXNh6oCHy1Wfv1cfjBE77PlVbeplzRMkfEPiQ6xpd4OYsRe0ziwEesr7s4E
         pOq+R4LEcX3g+WJ/TqTsMZAWTKueYP0L/qbmn/ovz/89GpduN2NdS9qEfdCokmPmlaM1
         d2dQ==
X-Gm-Message-State: AFq9FYL03d1Xxs5ppbMQBDI39umKUk7xMWjVWUA/57NgQrxnPnv1m+e8
	JEyXl8mE5gC1EKM2Tp6zaPJjC+d2aeioHEEz2tDMCd3HB/iiQOk4CygkkXcW2+VyJ740yS1iZLK
	OEhSywDI=
X-Gm-Gg: AYBFou2QblT5+4jwNFcnE4HArvJzNaHIfE6kFd9kijrCHdx6uAPhTNVDl4sWDsW70kL
	yhE/Q7/xKkODFJpJplXW60ORD8ti4OALvKIzCEAo2tmt3jIBa4Fi9K0FzQn3UZPXI1Z4QKs5yLr
	ha1+AkpavZwLRS2F0R1ATQAxo2jHZkG2cZwFabKWYIboLLW+qCAvCUWj/XXFuM60yjTlf9ajSwb
	4fIww2EEqXBbbclD1iJGnnH+T9E973pt9gn6vu/RSEUoKfqFXuDJRZZ1KipSEW6k6RsNtXhE0yi
	ujJl9noUdEKBy9J3Zm3SqgT52F6+xkNA0/ALQSTjwmxVoeHQn52JGb5Vt5VQ7XAgDuGfI0u9Pbh
	Ups7jnA6P2q6Q/Ug5g158Kv4sO61zkvDWoua1HX7ug7tkifhv7RJgeUK/+N+UKg8lXsDK5cCCiE
	QZWDKi8/XVRtXL367SXXWEWj/VMxXD+yahyfZNlR0L/joRgOP78+tslnPUQ50rHHRvj4k51Bh0Q
	27vr3nCw5Pt8OLl1dzFHqJPTaB4
X-Received: by 2002:a5d:64e9:0:b0:487:999:7119 with SMTP id ffacd0b85a97d-48c47bdab55mr18779491f8f.0.1791238095804;
        Mon, 05 Oct 2026 15:08:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c007:fc8d:8a7f:1be5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6227fc19sm6249836f8f.17.2026.10.05.15.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:08:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.8.5 -> 2.9.0
Date: Mon,  5 Oct 2026 23:08:12 +0100
Message-ID: <20261005220812.2318014-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 22:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247262

Release 2.9.0 Mon October 5 2026

Security fixes:
           #1392  CVE-2026-102633 -- Integer overflow in function
                    expat_realloc on 32bit platforms
           #1393  CVE-2026-77214 -- Validate parameter `len` against available
                    buffer capacity in XML_ParseBuffer

Bug fixes:
           #1387  lib: Handle OOM when copying encodingName in XML_ParserReset

New features:
           #1327  lib: Introduce new "Properties API" to get and set
                    scalar properties for a single parser instance.
                    There are six new functions:
                    - XML_GetPropertyBool
                    - XML_GetPropertyDouble
                    - XML_GetPropertyUInt64
                    - XML_SetPropertyBool
                    - XML_SetPropertyDouble
                    - XML_SetPropertyUInt64
                    And two new enums:
                    - XML_Prop_Error
                    - XML_Parser_Property
           #1323  lib: Introduce five new 64bit location API functions:
                    - XML_GetCurrentByteCount64
                    - XML_GetCurrentByteIndex64
                    - XML_GetCurrentColumnNumber64
                    - XML_GetCurrentLineNumber64
                    - XML_GetInputContext64
                    These five functions closely mirror their predecessors
                    but are not prone to 32bit integer wrap-around.

Other changes:
           #1391  docs: Document the scope of function XML_GetErrorCode
           #1395  docs: Document length expectations for XML_ParseBuffer
           #1394  lib: Call unknown encoding release before parser teardown
     #1370 #1373  lib: Drop (disabled-by-default) attribute info feature
                    These things are now gone:
                    - Public function XML_GetAttributeInfo
                    - Public struct XML_AttrInfo
                    - Macro XML_ATTR_INFO
                    These things are now causing build errors:
                    - Configure option --enable-xml-attr-info
                    - CMake option -DEXPAT_ATTR_INFO=ON
     #1379 #1382  lib: Drop (disabled-by-default) minimum size feature
                    These things are now gone:
                    - Macro XML_MIN_SIZE
                    These things are now causing build errors:
                    - Configuring with -DXML_MIN_SIZE for CPPFLAGS/CFLAGS
                    - CMake option -DEXPAT_MIN_SIZE=ON
     #1323 #1411  lib: Deprecate macro XML_LARGE_SIZE (use the new 64bit
                    location API functions instead please)
           #1323  lib: Deprecate five location API functions that are cursed
                    with integer wrap-around:
                    - XML_GetCurrentByteCount
                    - XML_GetCurrentByteIndex
                    - XML_GetCurrentColumnNumber
                    - XML_GetCurrentLineNumber
                    - XML_GetInputContext
           #1399  lib: Guard against out-of-handler use of XML_DefaultCurrent
           #1400  lib: Use size_t for bytesAllocated and peakBytesAllocated
  #1401 #1402 ..
     #1404 #1405  lib|xmlwf|tests: Unify use of xcslen, xcscmp and xcsncmp
           #1406  xmlwf: Add missing `#include "expat.h"`
     #1389 #1396  Version info bumped from 13:5:12 (libexpat*.so.1.12.5)
                    to 14:0:13 (libexpat*.so.1.13.0); see https://verbump.de/
                    for what these numbers do

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.8.5.bb => expat_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.5.bb => expat_2.9.0.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.5.bb b/meta/recipes-core/expat/expat_2.9.0.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.5.bb
rename to meta/recipes-core/expat/expat_2.9.0.bb
index c032e18c77a..e9bb21bd55c 100644
--- a/meta/recipes-core/expat/expat_2.8.5.bb
+++ b/meta/recipes-core/expat/expat_2.9.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "952c03c33a6b337f12dae7a9b0f9dee86f867550d35c994d6bdaaddd37dc8454"
+SRC_URI[sha256sum] = "775e8a68f81a748a401dc3168318d4a39484eb4f954726f21517c8f42c0ba984"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

