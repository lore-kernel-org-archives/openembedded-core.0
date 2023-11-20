Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C5AC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:33 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.609.1700498367622878133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p7uOpbKO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5bd6ac9833fso2499852a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498366; x=1701103166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA7YdednANPv1zRKaT9FQhvM1osO5S6mEJINP/svuoI=;
        b=p7uOpbKO6Jq359E0n5MUpzuoKjozdBmuieVgdEaw+m5pbDH8KFnRxSzIjPVNCNMF+r
         CfomWmaipAOu0qbCz6qmnPh3QhEtNBscCz2vbscdGyufAszQuKuZSz+Y8PWyqfjEhU36
         u4bc+JrWToAEB8J3wCZ01w0IY4gi2uPfuwgdkPvLfFWkPqxsYIEFkgPRkzjykbxXBOYy
         gXO/Q6yKXfPammsPviKIr0ApK3v4QttwnW7XJT/tQyXVrsfkGr3W6NdbD3173HoJulQP
         EZeqysUb/7b6f1k8VBz0v+fvqy4qsP/7RbXUp7ZFCZC7660VY3BTEui3GqsU/fE0W4ab
         M9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498366; x=1701103166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA7YdednANPv1zRKaT9FQhvM1osO5S6mEJINP/svuoI=;
        b=jEXzQYaGXy0yU98/CRpYIkpQMdPQf32DqIETcPmUWhlIQ/Rk4M0wGNoVJX5b3/ZjzS
         iSendkCMhNOsngY1y8JXUbsrcnDoXAfJV9/6+dObnXK3f5wGsJ77OtBzNGiDTjE2Y/BG
         xN6MC59CAZZvG8i8sQ2SYUuCAtejdhrS0XFpau3wpQVpAQEMwvMrpmYhbDg/2eZPBIYl
         rPzyPNq/dn7kQPMeRFxSe9vLc0hrJkKXTw8Oqn+zgWLG5dkGE367IfQBx8OX7i+vguKr
         olvfsb/QGpXVRl/b8ZWLTJPV0OuTtugipvryOgzCkkmq/GDLPhRG9AFuMX6C4DlsvBFC
         SRTA==
X-Gm-Message-State: AOJu0YzvuINKfYwlGlZIZlvl6QJ8MRimRJ+52D3iHWKYGAFIc6csUVJs
	S9HnQqJU5+oGltozjrOoeMiIOCwPRitb4VHt6jDkhA==
X-Google-Smtp-Source: AGHT+IE3yAsbBp3c3yOHlh2/gzSBNsWaq4yKgUqsULjG27hr+CMzlTL/EQWN/l+UJ3xJeRCW8003rw==
X-Received: by 2002:a05:6a20:158b:b0:187:b9a6:61d4 with SMTP id h11-20020a056a20158b00b00187b9a661d4mr6289391pzj.47.1700498366472;
        Mon, 20 Nov 2023 08:39:26 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 16/33] baremetal-helloworld: Pull in fix for race condition on x86-64
Date: Mon, 20 Nov 2023 06:38:30 -1000
Message-Id: <fd187832cafff2adc34df04abdc9503dcf8ca594.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190905

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

It was previously discovered that there was a race condition during the Makefile
execution between the assemble and compile targets, the previous fix attempted
to serialize the build targets, but the fix was missing for x86-64.

Pull in latest commit from upstream to fix this issue on x86-64.

[YOCTO #15146]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7e1631a1efbcf421de801e94734f67f25668540)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index fde75ec2fd..6832ccc541 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "These are introductory examples to showcase the use of QEMU to ru
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
 
-SRCREV = "fc7c43d138185028b6ac14c83f6492fce26eca95"
+SRCREV = "db2bf750eaef7fc0832e13ada8291343bbcc3afe"
 PV = "0.1+git"
 
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
-- 
2.34.1


