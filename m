Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.9651.1632132429341198215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 03:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HHADU2Go;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id t8so20951032wri.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMdHaNDqAZnShi0VRxytlpAXBtxMa3IgeQvqe1WP3n4=;
        b=HHADU2GohRGrXPtmYabxgt0l7vRse/4bbfY6141rblmsarj2A/iSL4kGlY+ezItozv
         /j6qhRDKX9NEtmbeizJFzhYuKGTTwrW/9/Bq/mZcYB+QcYmEhombahgWy9vud33RpZnV
         ThPk2a174i+FhRGY2zBm7MLNuhi8KAMRvOSF+4rfPkTZPVvnLec+Yh0n4sxmR5QH6ZN5
         UoQ2XWTnY918M2Aus583vFHF9Zvlhzzyf62NVqDX+fEAgQfD83yL4yuVsEFkOLtRnMNZ
         uZVIxHqiduLA6B/EAgLyQSJrtZ4qBUb9NxNqEBGKiLua29GOX48v/Bu0nep9UdBUZEs7
         HHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMdHaNDqAZnShi0VRxytlpAXBtxMa3IgeQvqe1WP3n4=;
        b=K3doRHIPytujBuILat3UyHASyHUFsY282hUPkGuD6nf1CMlw4uoNcKjWkYw2bK8OXN
         oeXBl0ag5OojGty0rcR9SXoSdVUitb7Mf0+o+d6AMoclKgKD8B6LhSGwRD3zKCksJXvw
         7QDJB7NUqTzxu1oExKm9pJse6vSRTW92oeARuiQYoL9mmsK7eyYTWenpXePUyYlyXSQq
         e1AIXsIAHuefCybo9T3sflx+Q8Nk2+0f7D81NCyeHkRsMFm6M9aFcMYN8ouQlOyJ6iUt
         5++lm0cz8sQ9yfmqvPFQxir+qQCZ00fSpG1c2ETftsGKGqgWWpZgYw1aerkJXn7RzScm
         TbCQ==
X-Gm-Message-State: AOAM5338XmSTN1cEBaFRqLLHsjsUY0p2SDJf2JxFlwV+or2gvyX6Mn60
	UOk/BYRx8QHO/lLhaPl3yvvRzerbYi0n6A==
X-Google-Smtp-Source: ABdhPJyZ0UvoCjBg68W7aamlsrGMba1y55o4YCStV9puaqtyfwrfj5n5ZCp3+cYDBkGMbx89sgPnvA==
X-Received: by 2002:a7b:c767:: with SMTP id x7mr28635011wmk.62.1632132427276;
        Mon, 20 Sep 2021 03:07:07 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o7sm19176682wro.45.2021.09.20.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 03:07:06 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [dunfell][PATCH] poky: fixes backwards compatible for the SDKPATHINSTALL
Date: Mon, 20 Sep 2021 11:07:04 +0100
Message-Id: <20210920100704.312573-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the SDKPATH can be used to custumize the path
of the SDK installation. Drop the SDKPATH and use SDKPATHINSTALL
without that brokes backwards compatible for any distro with
SDKPATH customized.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 5b54df874e..7dad7012ba 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -24,7 +24,7 @@ DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 PREFERRED_VERSION_linux-yocto ?= "5.4%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
-SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
+SDKPATHINSTALL = "${SDKPATH}"
 
 DISTRO_EXTRA_RDEPENDS += " ${POKY_DEFAULT_EXTRA_RDEPENDS}"
 DISTRO_EXTRA_RRECOMMENDS += " ${POKY_DEFAULT_EXTRA_RRECOMMENDS}"
-- 
2.33.0

