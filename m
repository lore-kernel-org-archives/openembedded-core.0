Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD5C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.20017.1637901377509602225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XY5+/qTG;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id m24so5863993pls.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d0r/J/jlsTQ4k+w4ggsWQy5Wy5EWvzGs5EcR7b+BIzY=;
        b=XY5+/qTGkn0n4WJboiDwwgOVblPUXLxwWIlIrAU2EHinzIQOXRKSlL6MF48ImXkQeE
         swGvyS73+5TdtwIsaUqONpVg+xXL05Xku7BF8HvEK6OWXl9sEC8gblQQFjNWedfErWLV
         XEM5lNrt8Lq9elu8fzvnCMVRFROLR52JycJEg3goA8pcu8VbkY0IK7Qg5KTgFq4orvrX
         LDimXCGtQSnzBvipp4Kzel/cyz520+4c4ifp62VXtzsxBqAYEYJ44ynVCoh6c395R+yv
         oRVC8ROwdLoIZOtEhawCi6phRFFJi6HLPXrChCHWrcyq5MMPn+yeylgjBgstTdMEUOd5
         csgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0r/J/jlsTQ4k+w4ggsWQy5Wy5EWvzGs5EcR7b+BIzY=;
        b=fatjbdAfRCrWbeNZA/V+Wj05JXKPOJAthUID4hci6pTOr4kvvBykI23Qf1yjOnCAAF
         9YBgvFRh2M9uYnoG/u2+ep4o0fJJpqtsaXUruQ0ClGqqzy4PzNdLU+Bftxi4IJj4zwNx
         4MK8+nxmWiWNigST2JCqPxHU4p3HBgRRtIjrHJbIQ3ChLZuAf/VjIoZ4/SLpxrlqpsxE
         +lRST6faFXj9IEkj9A3W+VCVfcyUX7xy5iooC/6gon1UrSUzNPRi2I3Avh3HH2CTg/Hm
         voweNXKRsSqumWwgk45w1YPN31plkDkGksv9+gK5qW24Xpx+jMxfOlshQmIvJ806dyTf
         2Vtg==
X-Gm-Message-State: AOAM5319f9dVfZv33G9GEFBM7VBaF/VMW2oHR9OJwx5AhkM9uJ7n7myz
	H0DhmH7EPhwFPWNjeelvv84blIciNWE=
X-Google-Smtp-Source: 
 ABdhPJyqm5LpMZJ5wRHqWGZhcbZq89TJCHZReiulUQ7tbAopVNOKJAuxky4yrShaIglCFYMAFyZLJA==
X-Received: by 2002:a17:90a:72c4:: with SMTP id
 l4mr12810929pjk.149.1637901376493;
        Thu, 25 Nov 2021 20:36:16 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 03/26] python3-cython: DISTUTILS_* -> SETUPTOOLS_*
Date: Thu, 25 Nov 2021 20:35:42 -0800
Message-Id: 
 <ec53c1c61784df7ed68d5143448c6c2f1e076833.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158799

Refactor to new SETUPTOOLS_* variables

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-cython_0.29.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.24.bb b/meta/recipes-devtools/python/python3-cython_0.29.24.bb
index b1d21bd15c0..26333cb2718 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.24.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.24.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} += "\
 # running build_ext a second time during install fails, because Python
 # would then attempt to import cythonized modules built for the target
 # architecture.
-DISTUTILS_INSTALL_ARGS += "--skip-build"
+SETUPTOOLS_INSTALL_ARGS += "--skip-build"
 
 do_install:append() {
     # rename scripts that would conflict with the Python 2 build of Cython
-- 
2.30.2


