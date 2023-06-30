Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA470EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 15:50:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16053.1688140201220115901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 08:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d9nwejLq;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51d9865b7bdso2067731a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688140199; x=1690732199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwOXbwB8LHjvXN0GO2pzZvuhWvL0WQC9XtM1k39dlCY=;
        b=d9nwejLqMt7h63VJyg87zxrhSheIt7WfnKKKDo/BEfSzNUejuhzKKTtIBwPjPHdHeh
         jXR0ptc+1/ffLwES2GT5PNyWSsjhm/wtGVvumC9lEInn0AmN0gnN7280tFf+MfInlWBg
         K5ozmSJKlO7Lq5fRR3CQ04zf+Qpqj2b9cttwqYfKLOi9hnuDWwCuDTojPLJT42TYqrQk
         KWgb4rLTA9ELZ2dkbjyOxeNTPjp0QScGRf5GwJwGudpHMSY7U3nsD4rSblw5ta4PsoHD
         PqL5GUmuUhK+RjiW+BRAkHkqMm6CqQaVP2LKjomzaAkh2jBgiaPtrDhqDvgtjnXSJyDz
         j5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688140199; x=1690732199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwOXbwB8LHjvXN0GO2pzZvuhWvL0WQC9XtM1k39dlCY=;
        b=dm886Kdi5OkTtUn6LmU9EivmArr5kBHF/5iCN86gSFdJHT/6Oph0+5rz8ODUB2BS1u
         QIggRJnhQS3xLbSkPClvIaH5DcVzacK65jnUJ1H/5GFcku55GeRPVSpYi9Y9y27BqWPG
         E1MsoT6psVR0TfgPpURBdo4yYRTJGEGUSHW5h5zDMAYR0HzApaVW7asPwa7MPa6OQvS8
         kiOX8ilmUHZXXgosbZ3eZ/ricE8zojdh+5x5WzWkBAa+CEp97wS2V0YcaQfS1F/vlmX9
         Imp+9KgV/S2y6AgUubWSHoEdWvtE7R2KuXCBReInn+/GEmzN5au5PjbArQLGPmtJrfC9
         bunQ==
X-Gm-Message-State: ABy/qLb8QvJPXA25mZYvZaNN7v9t/SzqYQFsBjIQez1scc4DwzCo3lgn
	aNTMI+84Qcn7mp18Z91CGr9sFjDVY4A=
X-Google-Smtp-Source: APBJJlF/uW1+VU836GZYKE8pR/7R0shZ/Pr/hEdjfmAk6PALWuaRbLWU+YcJKZfl0GrHd4wKdW9Kjw==
X-Received: by 2002:a17:907:76b3:b0:96a:2acf:61e1 with SMTP id jw19-20020a17090776b300b0096a2acf61e1mr2732034ejc.64.1688140198974;
        Fri, 30 Jun 2023 08:49:58 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090637cc00b00993017b64a9sm285121ejc.223.2023.06.30.08.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 08:49:58 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] kernel-module-split add systemd modulesloaddir and modprobedir config
Date: Fri, 30 Jun 2023 15:49:12 +0000
Message-Id: <20230630154912.3630297-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 15:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183704

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 0e4f9a6ec3..c1208d55e0 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,8 +30,8 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
-modulesloaddir ??= "${sysconfdir}/modules-load.d"
-modprobedir ??= "${sysconfdir}/modprobe.d"
+modulesloaddir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
+modprobedir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
 
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
-- 
2.34.1


