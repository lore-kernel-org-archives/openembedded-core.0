Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE44EB64DC
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 15:32:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.15533.1688139172220868397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 08:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I/GUZnt+;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbc77e769cso8314015e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688139170; x=1690731170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mRhT7H4wl+nsH6wBceNVc4HdyIftapgrbtUYgDPMHE=;
        b=I/GUZnt+K8YbX1W1Fw+ijsM0dEEXFSEIAVfTFzL+HSPZScBn/Iz5Y85N72llBDc8og
         YVdMdO3awNb2Dy1OMA2UCxmPsycV15GFXsyfQkwe7OyEuyNSwLQPyIcoH+Dpvs+oVxs5
         P/+Lwr8dwhPz5R2B5okEaIw9doGgTUfW2FnIDuK45MG6MUwXawI1MrEOHvPzE3ItPUCc
         x13c3YLh+8HOtsrZ5iM8pnhQm5PWe6ntk8sQ6TwQnFDQbuOsD450zpmFfajgc0wgIE7E
         C5UTzDkZ9ZA3KiG82IpdYxsLgkdrQCmIKboHlecDC02h5h1AbedT1kzqt8+01cbt/crv
         ME1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688139170; x=1690731170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mRhT7H4wl+nsH6wBceNVc4HdyIftapgrbtUYgDPMHE=;
        b=f+2Xr14pliHpKi5CUvvDMeWv2fU4fJyrH8e17ZI4x0PjV2iHtRn1e6sf25kPSlSq1B
         MkHyffSe5Ry7Wy6mprktQgqW7hwpTjfddnI9SEETjxabNiEA90+7EHdJ+O1sr32QN1Ih
         zEFc3es0zs/RvJHf5Tm0t+yumAHeGiKW73MZ6rgKIH8D4t+PutVcE2GJwA40LimrLuqD
         4bcxln9ihTF8xO5tZ5FxLKIdwpKcPNEF2DbNs5LJd6OvX4njebmJFi0uLPqHe+jB/cUs
         dxhAHCSmyYCEyuIy5ybaDabtEh7b1bG7CC7l7EzQP+NKKYWxl0Kn/9uYTYhcO/2Ty8vD
         g4Vw==
X-Gm-Message-State: AC+VfDxCVXcwxpQN0cWHkafiTP576jx+H7G1OFDAEhK1LxuP6agOsZac
	69XjYmvfVIyhnL0J0TJIH1YIOLxDt2mi5w==
X-Google-Smtp-Source: ACHHUZ5abqOYaSh1B7xBtVmz+q9CwNJNODRTn3MPT2BrWIdxKIVpQfi5xsFHN2izIH1yiiaTEm0PsQ==
X-Received: by 2002:a05:600c:2283:b0:3f9:82f:bad1 with SMTP id 3-20020a05600c228300b003f9082fbad1mr2205935wmf.40.1688139170272;
        Fri, 30 Jun 2023 08:32:50 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id a20-20020a05600c225400b003fbb06af219sm7520912wmm.32.2023.06.30.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 08:32:50 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libssh2: disable rpath to fix curl-native build
Date: Fri, 30 Jun 2023 16:32:46 +0100
Message-Id: <20230630153246.5062-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 15:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183703

When curl is built with PACKAGECONFIG:append = " libssh2", the build fails
with the error:
gcc: error: unrecognized command-line option '-R'

It was trying to set the rpath for libssh2.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 meta/recipes-support/libssh2/libssh2_1.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
index 711bf937f5..edc25db1b1 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -18,6 +18,7 @@ inherit autotools pkgconfig ptest
 EXTRA_OECONF += "\
                  --with-libz \
                  --with-libz-prefix=${STAGING_LIBDIR} \
+                 --disable-rpath \
                 "
 DISABLE_STATIC = ""
 
-- 
2.30.2


