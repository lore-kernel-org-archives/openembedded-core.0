Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81341C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 10:51:30 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.5664.1686048685218012743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 03:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Kfu9dG6u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso5373701f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686048683; x=1688640683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWA7GoaDUVhLzdmqOM/q+5Ae8nIYIkICs6ZWlF80im0=;
        b=Kfu9dG6uqIjyapPq6KsnwVBcTU9YVX4ltFYPj2eeO56pedbdE4/A3YELlC7cJUmmZn
         1peEnGTNZYoDozIIgd/PdWoZmekN+58CITN8tVsuvUPkCh4F+o4sJsFgyd9eEJwgPnM0
         SvH3sA4TaUf1o51UH7bBxKv8Bhs2HRH59rbho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048683; x=1688640683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWA7GoaDUVhLzdmqOM/q+5Ae8nIYIkICs6ZWlF80im0=;
        b=PoMWmAwlukY+AHvNqaTXYbWFwl3piAFg8/hZ2fbULfAjviLmoR+sWkWZMvJywJ1f7P
         LoFBhvehJa/0XS7A4n8aURtEZndjZ+43raOk6TqgFiUcqQY60pEKl0SRQ8OHL0i4IikH
         vksow7zcb667jD4iRAZ+QXIEAbNU9aFIhFGRne2EpEsDUDZtZHSQ7VVrYHeVmrG0wz2I
         LHbIEeo8ar5tkNZqlXMme6IWl3DzYkGoLxVN6sg0XOxed3AXYclrurICQvHNqO6rbrRh
         xTq/CbE4kDDCOp6/Qc9K5hbiU0B73Xdr0hm1y0N4CUUcL/k8NS91EmTXecYYbbPUbAHY
         TX8A==
X-Gm-Message-State: AC+VfDy0JUkia/ELSiMyP7Njt2eCeVtFF/kIAP7gIwbcwvs0+CR6gWsR
	f29DJcaXkdbMuVSoQeSDs/QoDVZyotoKPhMAtF0=
X-Google-Smtp-Source: ACHHUZ6XU/h9xiK8vrgMs/oiVWjBYYVuOuG/RpiJ/rEQBxmB+9PbQcePTNXcvW2/1jNmuI2qvKFgcA==
X-Received: by 2002:adf:f111:0:b0:30e:412a:45d3 with SMTP id r17-20020adff111000000b0030e412a45d3mr2049808wro.49.1686048683127;
        Tue, 06 Jun 2023 03:51:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d4d83000000b0030c4d8930b1sm12244694wru.91.2023.06.06.03.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:51:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] v86d: Improve kernel dependency
Date: Tue,  6 Jun 2023 11:51:22 +0100
Message-Id: <20230606105122.520421-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 10:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182421

Working with enabling SPDX, an issue was observerd where v86d wasn't rebuilding
when the kernel was changed from linux-yocto to linux-yocto-rt.

This is due to the code in sstatesig.py which was seeing the RRECOMMENDS on a
kernel module and ignoring the DEPENDS. The v86d is technically a kernel module
since it uses kernel header files.

There are two ways to address this, we could inherit the module-base class and
the dependency code does the correct thing. It appears the code doesn't look into
STAGING_KERNEL_DIR though and doesn't use the kernel sources. We can therefore drop
the DEPENDS and the code will the do the correct thing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 5f342b1120e..b4fe362f8e3 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,6 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-DEPENDS = "virtual/kernel"
 RRECOMMENDS:${PN} = "kernel-module-uvesafb"
 PR = "r2"
 
-- 
2.39.2


