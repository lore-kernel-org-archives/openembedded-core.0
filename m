Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F44C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 13:08:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14917.1717592900558947695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 06:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=H+8enQnZ;
 spf=pass (domain: snapchat.com, ip: 209.85.214.182, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f32a3b9491so49208105ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717592899; x=1718197699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDEbqKDu6bfcB/sT5647eFVV9qt3DUmqIeLVUYDsNNE=;
        b=H+8enQnZxX7L0YMOXQWNmgRiCc5Lv0jUfCKi0wYEoehAJjFR1syy4V0IUfHxZXOqYY
         0W1O6UgQn8ASjw4ZYtVz+GS7ZUSmT83cD7X0BWAEYUzvNxQtfpp4CuJIFhDN89Aio2EA
         0C8y0QbOYDNY/9SrNkVMobOeJDN1s8mu3FO7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717592899; x=1718197699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDEbqKDu6bfcB/sT5647eFVV9qt3DUmqIeLVUYDsNNE=;
        b=ejzRnAJ9lsoFgwz6Bz1NDDds5fbtIGdMHnRmSY6PpPl6XaA0JQfZFbqRx7UChAhZwY
         0BzjoCsxyovzGuJAXn8pkSrUSvI39y0haFN77OM93/0zbY1nd7LsEEh5x6Ov1ENBYjtu
         iTfljIK1rnMsxfD6eoKe6pfsWc9q1Jmx+NnMi/6Xu1PYZdX8LRhfK8lFXBgf4m2roPxb
         gs62vqm28gls0MvERK/wym/LH/FOCEgQmz38Ob3vGrEJ2hVl/frmQJospryF2JMxQup8
         QsdrQNk6Kz5tEiYzReNMBe3Po+GZI1yPch4Wp8KXJKr4P+NwuPqsLHaYjAUDBHi9iUDU
         Js0A==
X-Gm-Message-State: AOJu0Yy9HZvM//03FWmTeIZBNhoOr1iEyL9cx8SsRMwSvLESwAignr72
	MvhjBijKy3oF9N99Al0V5poZuxYQOk20NIvR4X5ZBrygREvPECFg2GIx7lvbPoyBaAu5DHWOadj
	YI7U=
X-Google-Smtp-Source: AGHT+IFYIukLPScUTb64oAReJbMOlXCrM9K9Pjn9n+lRtwwIvuM/P5usYGCkJpAQSZ1Vz3YPzQwQlg==
X-Received: by 2002:a17:902:ec83:b0:1f4:ac56:3d15 with SMTP id d9443c01a7336-1f6a5a0e83dmr33825225ad.15.1717592899496;
        Wed, 05 Jun 2024 06:08:19 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632355e0asm101697005ad.72.2024.06.05.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:08:19 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] build-appliance-image: Update to master head revision
Date: Wed,  5 Jun 2024 15:08:08 +0200
Message-Id: <20240605130808.2643140-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 13:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200364

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index e406968df2..520d4f1f5f 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -26,7 +26,7 @@ inherit core-image setuptools3 features_check
 
 REQUIRED_DISTRO_FEATURES += "xattr"
 
-SRCREV ?= "17723c6e34096a53fb186cc70cfc604bb30da8b9"
+SRCREV ?= "06cba9abc4dcb630142be7606f5272be8bcb2e36"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
2.36.1.vfs.0.0


