Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6286.1614777091574990791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TWeMPYF4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ci14so23059250ejc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jty7wViFTSycLql4RAcFViik/IZPv3qNvL+QYii8dzY=;
        b=TWeMPYF4dFWyuJLkBS91YFQZ/X0CcIygKJL54ESMx7xV+i2ZfhH11JVAJXlU635kil
         dj2lNl0r5E1rNYn3yV/kqIprpTjmy2d2sfbUle4sUkcgpEJOGIy1iDyG70ZIwobcD9Wt
         WI7V+WPigv+PW/eWaiY8DXbITsA0VZ6ebT9FeXlG8bdasCkeW4Ln5vRtC9qHoh2KuiVN
         lcClwM5FctjOHgZmsFKLb1xtbs4g2oDy9JV4UPEJbn4kE5tkneHfEb8PXm/CwVfax7LQ
         NOSvaCTHuE4b1YGNWg3yDT6dbnMcRc2KT8llii5+Q/NkwMfrlFVrIapVnmMKArW5MAXk
         C5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jty7wViFTSycLql4RAcFViik/IZPv3qNvL+QYii8dzY=;
        b=YnW4t1bDztEDAPINid5kbKM5TT2KUCBgbcZS6yeF3vtVNWiMh1sHwcsPW1OLt69Mb5
         lQjE0k5A8bKAtzH5bGcQbukacObOzUNXg+qWi9nkrk5EGCIeEUviOf/mSeDS/dPnuDer
         dGfRQ4wrGTtLImXYs9a6LpFRMr1Ho5UFreRYlSYqatcQFqS6awwsXaIqILlpDotOJFb/
         65IkDjIxa9bx3CAwG5obcxNC8poGyKsaOl0jupcNPxQxqGTi0ZxDwNY2o3YxDx5Pji0T
         vA9bSIfJQJ4oflGGNQpYOGdAGLp7Cz4c/bxc2uFEbhPPJ55AVn/pkgf6boblUlcGfQEJ
         mg4Q==
X-Gm-Message-State: AOAM5329L2ObJ6umfR1/G1LydMWUZ6VuHNmuN+6Tei/kSX8MWRoweqtk
	yr4hvkkOjGL9277t8VlHg+G94WpHy+sCXA==
X-Google-Smtp-Source: ABdhPJzJW6ebKZZKK6FVhapoWEXbufMGK+F11iNtdJMi9htoPWEEN3k3exwxPGd0LLKrb//buz+QEg==
X-Received: by 2002:a17:907:7014:: with SMTP id wr20mr25897365ejb.179.1614777090138;
        Wed, 03 Mar 2021 05:11:30 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([5.28.91.120])
        by smtp.gmail.com with ESMTPSA id w18sm19472472ejn.23.2021.03.03.05.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:11:29 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] rootfs-postcommands: correctly set systemd target for weston images
Date: Wed,  3 Mar 2021 14:06:40 +0100
Message-Id: <20210303130641.604699-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210303130641.604699-1-alex.kanavin@gmail.com>
References: <20210303130641.604699-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, weston wouldn't actually start when systemd is in use.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 1f27a3d07a..e66ed5938b 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -34,7 +34,7 @@ ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
-SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
+SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
-- 
2.29.2

