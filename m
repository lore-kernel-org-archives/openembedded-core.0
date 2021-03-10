Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.233.1615417475857481861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=r83gg8nb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id t4so18831710qkp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gix24hcgwQL91Wgx/CYkgNIq69A3+AlqKwds1WzqJ0E=;
        b=r83gg8nbcnKdmzfYrFcgK4TC85gb9YfOcRBhKqOiEd74OyRqjB/gEZKFciTSVnu1MD
         yVASCRy8wxYgYgVZMW4tHdfJsW5dl/PH8R+TwXgwVDd2Ri3nJN9sUkCIB1mn6+1Sdq6T
         Dfvp77BGBYHUfjKOQSGDTiE556yc96M75N1udwzB+n3t6/U3et6/2y/Leh8L3LGWQ4vh
         2GymR0PR/IGisKGcBcXfLqK2HXjmeHlK5OR+hNYbVrdobMjSmjl6IrsGHUxeQ6srGwAs
         1OXV3FB8AsTfEKbEHXHWqRoEGPEcH8fmlybv5ajHSi4mT1e5f3gKP3zhQvIQvoeT7Amo
         b0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gix24hcgwQL91Wgx/CYkgNIq69A3+AlqKwds1WzqJ0E=;
        b=fzW5Y0psq3Dv3OBZoiBF4yHHnGMrvNep7S+Y0UH/3NZjoGerFijq6H5H0uWNRz8nmh
         18N1JUCbBdX0Sw/Hn/sTQ5bIII/anjEJIlORGkWahF+VZV7FUEeqmf/PLAdEP2HLIWIj
         IJar+FccjMhD8hyiRNtvUmbwKtEGGD+pbOhUmju/T6FV3Yv1ZCaq7QIGSb97rH9zGjfn
         UeBAlZv5eR8DbOQHDtyzO7YsBdg+gIiiCE9TspTBxl3vulCTeZOXw23jQKPcH6Im8RTg
         Icy0BS6VYQKf9aTxcPxNTXbGAGYiv5gL/PZvVN9JhgapYUGM5537irzmIXhMoKW6h8hj
         tINQ==
X-Gm-Message-State: AOAM530/WUJ5s7kIBb65JHK3Pe+XI/PqtxyAPliapqS16MxG5SlTm7kl
	T4Z04fZrjO5m+moiZgJ/6NKiqZUTjpVaOQ==
X-Google-Smtp-Source: ABdhPJyDIIp7BiWBnn+z6tMoc0BE9OASd2AuvfNOZUIC/10ul0txEMwEBbnXp9mQxjK3ZlQcJ3wJ0w==
X-Received: by 2002:ae9:e50c:: with SMTP id w12mr5006777qkf.13.1615417474909;
        Wed, 10 Mar 2021 15:04:34 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:81d0:be77:cd9:faa8])
        by smtp.gmail.com with ESMTPSA id g14sm561772qkm.98.2021.03.10.15.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:04:34 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 2/2] core-image-sato: qemuarmv5 doesn't work with >256M RAM
Date: Wed, 10 Mar 2021 18:04:33 -0500
Message-Id: <20210310230433.29983-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310230433.29983-1-jdmason@kudzu.us>
References: <20210310230433.29983-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently seeing the following error when running runqemu on qemuarmv5:
runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB

This is due to the memory size being set to 512 instead of the max
allowable of 256.  Limit to this and everything is happy.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I3339e50a53464b95f52a987ed37868ebf0935b07
---
 meta/recipes-sato/images/core-image-sato.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e50b24a47691..8ed8f75e9f92 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -14,3 +14,4 @@ TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesd
 
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
 QB_MEM_qemumips = "-m 256"
+QB_MEM_qemuarmv5 = "-m 256"
-- 
2.20.1

