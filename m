Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49D9C3A59D
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.23096.1650838834280797164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Apr 2022 15:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DVpxMN54;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id b15so13198068pfm.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Apr 2022 15:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=toxSD8U2gBPTc5xouVf+oZfskW53KRxcMelVj20w7jM=;
        b=DVpxMN54RGQGeeF6vnPux2fUi7AhtF4XUph2zCk5Or8AqWYgoaoKLuskECf1JQ7mz9
         rDSeKqjNqUKJ7vHUtR0fIESY//T99sWrrqXJkKNrHNgsWVdt/VUIzfEa9vaK2Qqn1X3z
         kY9yHUwmhyulPgZm9vX3RLOYGrgs0ESy34CArS/9FKKvASK4pAyMaoViHqKWg/49rlSx
         AqMoYdz8vr3I2PnfNbvs8zSj9REkPilwrUa2glpeaKW74hJJfhUajNK5QMtG0uLCEXK+
         sxhloqWebgoNd/Tu4eXCabBS2/MAG9vlc0MYRbEkbnpqGRBp1JoUtbnWPmR3dBZMHxT7
         GA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=toxSD8U2gBPTc5xouVf+oZfskW53KRxcMelVj20w7jM=;
        b=zYp+8y3A10qQXF7IEdZWhb6YUf6EnAOH5TUqMIv0ChYMapCzCPDZRuy6ZnloAw90pu
         tgnsNQlSCWmm9P094ZrmJj722ursJ/ZhkjUNK5HFp56P82gTtvwUPrQnuvVNGBnFz0kN
         P28Fx8YCnJ4t0pePusNmFXI50uEUHss8QQ1x8lKEgVLLFLVj144SFYShZmMnfgBmMYAM
         4/fYnD/+g2SKwnFN/1LBkl5xp9ygsmJCuC8GsAzEp+snHtDSQ4MTp+UGpuv4uZNdaopH
         PIntECZFWDEnalRJWNfDtSNu6GDlgUd6mDS//mqwnQXAI8AdysF3lBOe3f0TmsVsIupc
         Z/uA==
X-Gm-Message-State: AOAM533jc2rvPHRMpY5Bo38J4oigLm2VE9mLEY5f53eAdoRWQnnjZm1c
	sdT30+57nyH3CP7fgkanfZ1/ZH4+MAXIqw==
X-Google-Smtp-Source: 
 ABdhPJz8rGuh+D60bY+jhfiMV9XnOosrxisPHl/wQ2uEhdVFjkD8jn9cX7ZwlfGJnkX13oxmTAy7ww==
X-Received: by 2002:a05:6a00:1506:b0:50a:754e:5d4c with SMTP id
 q6-20020a056a00150600b0050a754e5d4cmr15810918pfu.37.1650838833427;
        Sun, 24 Apr 2022 15:20:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 f36-20020a635124000000b003ab35b8bb03sm1329368pgb.59.2022.04.24.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 15:20:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Use base_bindir instead of hardcoding /bin path
Date: Sun, 24 Apr 2022 15:20:30 -0700
Message-Id: <20220424222030.2068375-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164808

This symlink is not valid when using usrmerge and ptest packaging would fail

Exception: FileExistsError: [Errno 17] File exists: '/usr/bin/busybox.suid' -> '/mnt/b/yoe/master/build/tmp/work/ppc64p9le-yoe-linux-musl/busybox/1.35.0-r0/package/usr/lib/busybox/ptest/bin/login'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 69fa4997375..5f1c473d5ea 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -347,7 +347,7 @@ do_install_ptest () {
         # These access the internet which is not guaranteed to work on machines running the tests
         rm -rf ${D}${PTEST_PATH}/testsuite/wget
 	sort ${B}/.config > ${D}${PTEST_PATH}/.config
-	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+	ln -s ${base_bindir}/busybox   ${D}${PTEST_PATH}/busybox
 }
 
 inherit update-alternatives
-- 
2.36.0


