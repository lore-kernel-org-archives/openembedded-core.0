Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.334.1619279804010358046
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PErdr3Pc;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso2759572pjg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N0lJELjey7IcrQaec9Pb58wdRZFB1gDUvVETg7XHtA8=;
        b=PErdr3Pchxqo8Xzara8TvdX3dugUUj5w+yjSn/8zSR1K3Ejk3iCGYgwUnIbl6zUTLP
         z/tvnCwzI+sGyIlPbuin85vIykWHVgRDqHlR2JXbEDUE3fL0KZ+20ZjshLHZumDkpspC
         Y3LksSNyQRzLOSBGOXcl1hvnnGWt4Rb6V62R9NbynlS3eW48H/mvRR8sCFhnUVdzNdo3
         Yetrbn1vvtlsf0yjkY2gxRsBevm0CiNH2WOuRNVauJjibKkR1lpIsQLS9J8L+XcXup0l
         loJTaa8ZrCFG+tJTgsLGuX69bMaQSKnqGe/gd8eR6LUKAvFFFOMBesQUoNklbg03QubD
         C1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0lJELjey7IcrQaec9Pb58wdRZFB1gDUvVETg7XHtA8=;
        b=o6gIvTfdNf6/KtXeqlOemy7UYesLo6kam9DAXDuvA/0Swf7nJmWpgJYp2D0Sn7mPRN
         Dc9UqDrUsQNjLxduust1I3mnjV6As2ok2lfLArFsIHH5T1A7Zzd9dx/9I+NUQhuAgxxt
         EU9Q4XggK9JkA7ZszWEIvvJnM7gUKEWSR1yIFnzhEQIrx9sx0eyKTG7Ff+0+b1YoyvjU
         taeCvQHTAnKVdcaju1BCkt7ddntJ7lIpB3sHSlRYCQz8cVvilRKC7XG9ld460jKdhv7f
         ecgqlT92bh8fk9xVWX1TJSV3kSmRW1NuVcCn+igFCya0bmC/1ebcr4dZNy8qADBlJgWs
         MtTg==
X-Gm-Message-State: AOAM532WVR90L7LKZULZSQz1Nftxr6x3+olI59xG4lZsk6wdP0QMRBvu
	VZRuXloPIGpbnIcyesZXRpBJ3VdYtiZ8sA==
X-Google-Smtp-Source: ABdhPJwz91vXAGFLH1tqDen5GqPbgaYhIZs5YYk+u+M8b1r1NRqVfpFAOmcQBguFtgkKgXLQHvaqIA==
X-Received: by 2002:a17:90a:2e03:: with SMTP id q3mr6878243pjd.206.1619279803304;
        Sat, 24 Apr 2021 08:56:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] qemu: Enable seccomp if FEATURE is set
Date: Sat, 24 Apr 2021 15:56:35 +0000
Message-Id: <20210424155639.1131482-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424155639.1131482-1-akuster808@gmail.com>
References: <20210424155639.1131482-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_5.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu_5.2.0.bb b/meta/recipes-devtools/qemu/qemu_5.2.0.bb
index 7afa66e3960..f265204b105 100644
--- a/meta/recipes-devtools/qemu/qemu_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_5.2.0.bb
@@ -22,6 +22,7 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
-- 
2.25.1

