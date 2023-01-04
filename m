Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025CFC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9362.1672830357307718609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fc/Qsnti;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h16so32518034wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WotnTFhPLAaVjZY4lG7Srx81h2F6C2VvSDLQeZbnafc=;
        b=fc/Qsntit9lxbsylE3BOE5HV1JUkYZ0TYU0rS1KTz218/8QnvE6c69BDjmidFsahpD
         x9vSdBZoglwRnx+2cPkqjFz4Zuc+iUZwtUG6hr147w4Udu21RvP1sh2RQiTVqg4IWVl1
         19I+t2247IyeiLAEHqJQEd5F8HznRrZHUza+uV0mH0Z/Jw6W7omy82F5oDoIwUNI2aRc
         q51dyeZLgK5M++sKs2RvPaWJHQH28dEsjdmU6NFwbhPp5YPMiAe36HB+dQv3LGMzZ9Zv
         XIW0V/Nw0Tk+aFxtS72Cl7WjE4wZ2x+UJeo6Nm5uSEMmo2TbL6WaZHSTLi0WAgm2tczf
         zHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WotnTFhPLAaVjZY4lG7Srx81h2F6C2VvSDLQeZbnafc=;
        b=ulk+YCvD62OZCua0eY7m2zxBZLXtlQa2K7le45x0hkNIubVAEwTLv0WV2k69SIiPZX
         8stPGM6aqInDdrpa8Gdq8vXwc8xxSip6GyEV3burICqgJe/VY37vrUS/R3QqzOj24g2M
         ATo3J44nhsfvVAIF4bAuoNMMcIryjw99MyPR2KFTq/7gDbD/NY3zOjCh08syrWCktR35
         zT4PejaNMPW7+SLeXCxqSvqr+ztjGS4CvvsD7rs/OCqTFOIacryv6k9NuG6e55fnm6Rj
         WgdsPm/SR1pp5kKzdWscqEU5dqiyowykgRhMdSQoIus+4/0oTwblqsViAO1M6Sp4B79h
         udsQ==
X-Gm-Message-State: AFqh2kqt7htWQfjJcsnl/4YwQgE3aqe9DzWVXM6Fqemc1xIFEkmWY7IO
	RIVgsPhA/vOC362pHNmB/5SZxM7Hxp0=
X-Google-Smtp-Source: AMrXdXs11k/JKu7i48iIOv3gCNlfGOCcms61ruhToLXn/pjQX7l1EueAMFXhwiviaiJ3evAQUcACUw==
X-Received: by 2002:adf:f00c:0:b0:242:4d1a:aa36 with SMTP id j12-20020adff00c000000b002424d1aaa36mr28422638wro.56.1672830381410;
        Wed, 04 Jan 2023 03:06:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/77] vte: upgrade 0.70.1 -> 0.70.2
Date: Wed,  4 Jan 2023 12:05:09 +0100
Message-Id: <20230104110548.2537259-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175423

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vte/{vte_0.70.1.bb => vte_0.70.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.70.1.bb => vte_0.70.2.bb} (94%)

diff --git a/meta/recipes-support/vte/vte_0.70.1.bb b/meta/recipes-support/vte/vte_0.70.2.bb
similarity index 94%
rename from meta/recipes-support/vte/vte_0.70.1.bb
rename to meta/recipes-support/vte/vte_0.70.2.bb
index ee53fcd799..ec2fb1f522 100644
--- a/meta/recipes-support/vte/vte_0.70.1.bb
+++ b/meta/recipes-support/vte/vte_0.70.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "1f4601cbfea5302b96902208c8f185e5b18b259b5358bc93cf392bf59871c5b6"
+SRC_URI[archive.sha256sum] = "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2


