Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533F7C4167E
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.2676.1639608048672547289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khhjO7Xm;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id s1so6595377wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fk9FQwHE8XzUXE2Iojtg9+LJRrW70qiz1BLtbV+8EmQ=;
        b=khhjO7XmxbdayTwoC/V3urKpijWmomA9tCQYAMB+vxQeT9iW42LB07KJ7BsWA6396i
         G+8JOI3Mm8U15Mnu21vMjuJyC6ls02ucMNl78fYua+O13GRtwSPsDCp9UHYypZp5PAxo
         GG7h8w79JmoWHc13TwoGymC77QDpfqMmpXPsfE4epqP3de0gIp3vxPmOblnZeKHTa4mw
         HHUbWk2ZM/oekFg+18L3n65xEQoJuO9T8buXGQBJMLMv6xA7wBYLYqoU6Z75wn1mQpYH
         occAGfFIbS5XYmx9P0XTrLMyjnVkf1LDdUcFOMiHziNsRSfHeKvgTDG+j/cIXzeDXdcu
         Y1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fk9FQwHE8XzUXE2Iojtg9+LJRrW70qiz1BLtbV+8EmQ=;
        b=uo/vfogXas+cSHQ1aXVZCwCvyQGLXBxsEIkAauMqK21tUwFCkDFG/Bz/KSN/IQP4xp
         nDsCrS20o/05BzTtkbuReq0Fe0df5oB1badL0h/DS+wRlj0HU5SltJNXThEvSAWtlJmP
         g2OSZ9YQ3+NJ5kvOwNDi1rStqyIAmNdlUP7Zr/M/ITt/5ud8xcYi2QCsljDry4Ei9b8O
         D8PpfOunfndkK7ZG+PHNqqYxiWJl4cvsvcmF/JdRpNwnDEm/8JvQTfOYquj5bO0gyt3c
         YcVNDuMCbTXca6n7EXrV5N/SGOpVE2SlmeMp3CeBOXuRXdNs98cITj9YiUbvjt24gbr3
         WYtw==
X-Gm-Message-State: AOAM531x5G6YudtneOFkqxlSca70sRXILr/AoKZDpSFUfsZHnaGGwd4D
	pp2IfhhZUZgECK8qQNI16rylyhgrQxlEjQ==
X-Google-Smtp-Source: 
 ABdhPJwLazobj/snotmMDhtE7bAznmmuJ/o1Nl5EEsaLd82qotIKt6QITwDMnoI6ryCpn1X+lIvHKQ==
X-Received: by 2002:a5d:4d51:: with SMTP id a17mr6271810wru.384.1639608047350;
        Wed, 15 Dec 2021 14:40:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/26] piglit: upgrade to latest revision
Date: Wed, 15 Dec 2021 23:40:21 +0100
Message-Id: <20211215224034.1814148-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159755

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index c5f3ecea16..70c7529f91 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "efa64335e22f1af0277f4d4dd7629e8674875490"
+SRCREV = "f855ad1c8ab0a7b25437b1a48b9038f599f31691"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


