Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61EAC7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 03:41:40 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.51232.1686541295417822288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 20:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=TusAn0e6;
 spf=pass (domain: underview.tech, ip: 209.85.128.173, mailfrom: vince@underview.tech)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-56d2ac0d990so7892197b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 20:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686541294; x=1689133294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ofU0fIGFAGyFp47ylrXo1f+rCBEjI3t1WvPmR+mbiY=;
        b=TusAn0e6uul8CohWVfwb0mxtGG1VJ2CfUnm+1sTiu3JksM3IOiUMY3aX8hDnyXlzz0
         uFzur+DMu2DdqpABrAYXmV1Ecr6zwZFh8HlNFo6PzvhDLcJYqkqdcheoO+qNNajrT2kG
         7PRpHN4QLILC9swNpProJdiXMLA6SFwOl5HG31UtwVyNHzSw7BnbgEh25z6ZY2NytBs3
         SGrzd6ruiMN+C3+MCECKiYlLNvkdVifnj+pBkaQEbmPFXK7hFgg/ZWWIK0WpaxUmyxGa
         SZKNXxfO7tQSh+d+EqKj7SCaqMBdMgokro0lqEvokaJ+vHn0DtMNtyxWlhu62Yg0GpyB
         bdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686541294; x=1689133294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ofU0fIGFAGyFp47ylrXo1f+rCBEjI3t1WvPmR+mbiY=;
        b=kEukkuZjfY3RC2hwJ2HHYQtQfbiArOyD0AXxvbXkOpdvR6HCLvrD8Uz33JOB4lWCWn
         WBsEJXKTwtzsC8dulWTg6HPvKL6CiDlH0+g8oPY1p0PWVCF01MswHm9dtqY2NpLCEoxf
         SGZC2oy3ZYLHfq1q4tRnBKCMfrYF5i6m8bVD8O17TeXGaQ3ZB/nOsFC4/DvVLd9AwtEm
         E+m0zziBid8rcdqwdIKaUBlPUtt9M0wlxcyoHVdjg8veqXlbtozUCKRVG7V2XF3PsTFo
         EZzGwECkL2/C+UzmTWuzzvN0iZY4vYo21yT9VdRgFIXaL1bMOzD6vj+XQy9s+k574wCy
         3Qvg==
X-Gm-Message-State: AC+VfDxOGeIElAjKIb2dcFGPN/HaSDMrOKZo7igPycNiuCK4dQImNOzw
	fzA4e067bUFgqb6IFSuRfQTPOr3s8HnvNu2ZxBw=
X-Google-Smtp-Source: ACHHUZ7xTQPHCgVacBWe+5Im91q55+yF1dJDBzuCQ9wlKZ7ca35a5Cvg0Tcdl2oeh69DzKf5b9GFpQ==
X-Received: by 2002:a81:4683:0:b0:55a:c779:d8c0 with SMTP id t125-20020a814683000000b0055ac779d8c0mr8717832ywa.22.1686541294477;
        Sun, 11 Jun 2023 20:41:34 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:f287:be73:6bd4:6065])
        by smtp.gmail.com with ESMTPSA id v3-20020a814803000000b0055a416529bbsm1300539ywa.24.2023.06.11.20.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 20:41:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3] spirv-tools: Use baselib instead of base_libdir
Date: Sun, 11 Jun 2023 22:41:10 -0500
Message-Id: <20230612034109.2007312-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 03:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182653

Its only the lib name and not absolute base
libpath thats needed here.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
index 21f9dd9650..ba89c35c09 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -32,7 +32,7 @@ do_install:append:class-target() {
     # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
     # tools can find the right library
     sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
-        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}\${base_libdir}":'
+        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}/${baselib}":'
 }
 
 # all the libraries are unversioned, so don't pack it on PN-dev
-- 
2.34.1


