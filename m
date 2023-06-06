Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402ABC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 15:14:20 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.1308.1686064459464849527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 08:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=G6XQMuS3;
 spf=pass (domain: underview.tech, ip: 209.85.128.182, mailfrom: vince@underview.tech)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565d354b59fso70485387b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686064458; x=1688656458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PIsm2cPQMNkiL8fe+6JvfFAkbvFHQvJbTkPvHM+Qjn8=;
        b=G6XQMuS3yZ1IlqBY7J+OYtiRE29iIKbrfNAgK7QuXL+6fyI7CmNkF/kl68EW0xrqFM
         4+e48hOvw/vZgHlpDsMXE7dmLnv0DzYFPxIPG3PTbSjrYmAxB+56DEtbJX+lnBDyQ3sS
         pmKfsJE3B093SvQgwtWA+rQiv4djVd3jHsYKPrFQafWiCKN4/dOlL3nw+9HC+H1phLr9
         3wHu736YiqTXGnFdtUQ+1Wj21/6RffBD/jXv20IukH5d0E2736pl1YaaD7EbmcUY5ari
         VgTnE+11ETlowJXHl19wVxnnyx47OigRxUdnlnMYRbfcr9uNhq9251+ZfiyAlgQAkjbg
         xP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064458; x=1688656458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIsm2cPQMNkiL8fe+6JvfFAkbvFHQvJbTkPvHM+Qjn8=;
        b=FwL9fD8kfMPmr9CTlqKAaOTuSFmntWgcoexjthFMJ7dOWVFg5O0Cg1Ey0c7HhzH6ej
         GlLdEqQyU1CCrmlziUfhmfwePqJTP8ha4mUrhowm9o9kykCQZfwFEizrmkVFw8IDMfWt
         R6el/DMP+EULcOHPwaO1owisC5WB4jHNOuo2WzuqE8hn8GZYXi9Dzsu9Jr6W0Hh2Vjt1
         fLM8LEvRtJdmV9ZuFolrEKjWXsJYkS3WhqUCSd8rMff4v9VSn41H3kveHzTz/Ji21vlh
         zps8YecU1JclfveNUO5HTfu0lhXwBNphEpFNNeIW8my6BQS+uhdQsTxlx0hDucoRtBbi
         n0NQ==
X-Gm-Message-State: AC+VfDxwChAQe64zc5ohFiYKlE3aJMJU1MRD4ZvD4yBTBQ0eDLvahYBr
	kNy8zS/gBEX0cV2eHofP+KXsbm+RUVITKEku3JE=
X-Google-Smtp-Source: ACHHUZ55W41iHkQUdnAhbT8OWsVIIT+awCj4jZ+/esJNMs5ht3VYpT7FIJ8qAiPPSgrKflStUns6QQ==
X-Received: by 2002:a81:a50f:0:b0:565:a081:a925 with SMTP id u15-20020a81a50f000000b00565a081a925mr2104071ywg.29.1686064458434;
        Tue, 06 Jun 2023 08:14:18 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:dddf:4c5a:5682:75fe])
        by smtp.gmail.com with ESMTPSA id v16-20020a814810000000b005688deeefc2sm4096786ywa.20.2023.06.06.08.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 08:14:18 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 1/2] spirv-tools: fix INTERFACE_LINK_LIBRARIES cmake prop
Date: Tue,  6 Jun 2023 10:13:35 -0500
Message-Id: <20230606151335.6019-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 15:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182445

The output of spirv-tools specifically SPIRV-ToolsTarget.cmake is
utilized in other recipes. If other recipe utilize cmake and include
SPIRV-Tools in target_link_libraries. I leads to errors such as

error: '../recipe-sysroot/usr/lib',
needed by 'layers/libVkLayer_khronos_validation.so',
missing and no known rule to make it

This is due to cmake pulling in the properties set in
SPIRV-ToolsTarget.cmake. Key property being
INTERFACE_LINK_LIBRARIES.

With the current setup do_install:append:class-target updates
SPIRV-ToolsTarget.cmake package installed file to bellow

set_target_properties(SPIRV-Tools PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
    INTERFACE_LINK_LIBRARIES "${_IMPORT_PREFIX}/lib"
)

set_target_properties(SPIRV-Tools-shared PROPERTIES
    INTERFACE_COMPILE_DEFINITIONS "SPIRV_TOOLS_SHAREDLIB"
    INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
    INTERFACE_LINK_LIBRARIES "${_IMPORT_PREFIX}/lib"
)

If base_libdir isn't lib, but lib64 you get the error
described at the being of commit message as lib directory
doesn't exists.

Solution replace hardcoded "lib" with "${base_libdir}".

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


