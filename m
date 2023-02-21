Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E846C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:09 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.53786.1677012308880608840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SKjsxqQy;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id s8so2212960ilv.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7MED7gFtmaGESHhUta/LQbigMrXWF2eKmyeZ/NrGSA=;
        b=SKjsxqQyHdnxAWBRiiUgZl5+jz7kM7Lv1mGiWajgV3teAYyufF9z6TWaTqoM8vlEHJ
         RzIeONoBkWVJq0vVF22lcfUmYENPEEpHdO4LfGgrXdixRWJgabmiCaLR498hZJ0fJ6ey
         ZbeoLkU+CmwWNJVqDUnEzv5Er2VNnD2fN3Ok/Pfu8GC5u7v/lQHqjn+78h/9scllhfGT
         8nKmI3y5AxlAgTTjd8TBYHkW4Vu5DAYe+FI3BhN9Av/sozUU1x6tDbjKbH3adsfJ16rx
         /aYVxtkd8tFw6whhfqcvPLVLG/kTn0rZpKqqFUidUaat4SuTz8flDYwTndp/H0T5C91U
         4O0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7MED7gFtmaGESHhUta/LQbigMrXWF2eKmyeZ/NrGSA=;
        b=8LFliYGWbnPXqqCj33n0WkMoKgm1Xap2aWUSWKYMfHpGlmX5A20b0ZuLPCKwOJf7sv
         SA9lyWLIW9ey5FgSVhbP01HoOgIL1TGNmthLXg2VoB9SNrz5qu/QyOP6drMhqGsf0Bz6
         xDdFoDOm7qosGQlsNoqOXzDNZ+kRTBLGwwGeXQkZ/dw5fwsoHblIyIcST+wZhAol6Gk/
         wZG0g4YFL1z2y5ZTTvGbZ1l6OO65uEY3qmGn4zQze0vrPqcD9j6jepFLwfGU73mFCKYf
         Ieejblm8+Bzmy+1L8sl84WDlu6nQTIjaFsE9Q9yr02u++h+CS3HxSiGO4X2PTdK3APTp
         YTAA==
X-Gm-Message-State: AO0yUKV4i8bprGJ8TG/8yvaPrtGElo20aLZGCgCrmGqvMxzcDSWtIU+W
	RMGRZrTIDPY0K3cUUnFu5NhcyEoVI50=
X-Google-Smtp-Source: AK7set9lOAiDnF6HEGHuuwy4Ocw2/1BppZYAU+Yy2sD/1vcY/dHBw+fQfPxiLmzieBn5zrO64Dhu1g==
X-Received: by 2002:a92:a04f:0:b0:314:5aa:94c6 with SMTP id b15-20020a92a04f000000b0031405aa94c6mr5028748ilm.17.1677012307859;
        Tue, 21 Feb 2023 12:45:07 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] build-appliance-image: set TERM
Date: Tue, 21 Feb 2023 15:44:38 -0500
Message-Id: <20230221204445.23931-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177542

Choose a nicer terminal for the build appliance so that build warnings and
errors show up in colour instead of:

	$<50>Setscene tasks: 2844 of 2844
	$<50>WARNING: mesa-2_22.3.3-r0 do_fetch: Failed to fetch URL https://mesa.freedesktop.org/archive/mesa-22.3.3.tar.xz, attempting MIRRORS if available
	$<50>WARNING: glslang-native-1_1.3.236.0-r0 do_fetch: Failed to fetch URL git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master, attempting MIRRORS if available

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index e28096758b9b..b000ea0c4d70 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -63,6 +63,7 @@ fakeroot do_populate_poky_src () {
 
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "export LC_ALL=en_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "export TERM=xterm-color" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
 	# Also save (for reference only) the actual SRCREV used to create this image
 	echo "export BA_SRCREV=${SRCREV}" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-- 
2.36.0.rc2.17.g4027e30c53


